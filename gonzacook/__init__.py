import json
import os
import datetime
import urllib.request
import time
from collections import defaultdict
from functools import wraps

from flask import Flask, render_template, g, request, jsonify, session, redirect, url_for, flash
from werkzeug.security import generate_password_hash, check_password_hash
from . import productos

app = Flask(__name__)
app.secret_key = os.environ.get('SECRET_KEY', os.urandom(32))

prod = productos.crearProductos()

ORDERS_FILE = os.path.join(os.path.dirname(__file__), '..', 'orders.json')
PRICES_FILE = os.path.join(os.path.dirname(__file__), '..', 'prices.json')
TELEGRAM_BOT_TOKEN = os.environ.get('TELEGRAM_BOT_TOKEN', '')
TELEGRAM_CHAT_IDS = [cid.strip() for cid in os.environ.get('TELEGRAM_CHAT_IDS', '').split(',') if cid.strip()]

ADMIN_USERNAME = os.environ.get('ADMIN_USERNAME', 'admin')
ADMIN_PASSWORD_HASH = os.environ.get('ADMIN_PASSWORD_HASH', '')

# Brute force: {ip: [(timestamp, success), ...]}
_login_attempts = defaultdict(list)
MAX_ATTEMPTS = 5
LOCKOUT_SECONDS = 15 * 60  # 15 minutes


def _clean_old_attempts(ip):
    cutoff = time.time() - LOCKOUT_SECONDS
    _login_attempts[ip] = [t for t in _login_attempts[ip] if t > cutoff]


def _is_locked_out(ip):
    _clean_old_attempts(ip)
    return len(_login_attempts[ip]) >= MAX_ATTEMPTS


def _load_prices():
    with open(PRICES_FILE, encoding='utf-8') as f:
        return json.load(f)


def _save_prices(prices):
    with open(PRICES_FILE, 'w', encoding='utf-8') as f:
        json.dump(prices, f, ensure_ascii=False, indent=2)


def _apply_prices():
    """Overlay prices.json onto the in-memory product list."""
    prices = _load_prices()
    for p in prod:
        if p.code in prices and hasattr(p, 'precio'):
            p.precio = {int(k): v for k, v in prices[p.code].items()}


_apply_prices()


def login_required(f):
    @wraps(f)
    def decorated(*args, **kwargs):
        if not session.get('admin_logged_in'):
            return redirect(url_for('chef_login'))
        return f(*args, **kwargs)
    return decorated


with app.app_context():
    g.rootpath = app.instance_path


@app.route("/")
def index():
    return render_template('index.html', title="GonzaCook :: Inicio", productos=prod)


@app.route('/productos/<pcode>')
def productpage(pcode):
    x = None
    for p in prod:
        if p.code == pcode:
            x = p
    if x:
        return render_template('product.html', title="GonzaCook :: " + x.nombre, p=x)
    else:
        return "404: Not found.", 404


@app.route('/api/order', methods=['POST'])
def create_order():
    data = request.get_json(force=True)
    items = data.get('items', [])

    if os.path.exists(ORDERS_FILE):
        with open(ORDERS_FILE, encoding='utf-8') as f:
            orders = json.load(f)
    else:
        orders = []

    order_id = len(orders) + 1
    order = {
        'id': order_id,
        'timestamp': datetime.datetime.now().isoformat(),
        'customer_name': data.get('customer_name', ''),
        'customer_phone': data.get('customer_phone', ''),
        'items': items,
    }
    orders.append(order)

    with open(ORDERS_FILE, 'w', encoding='utf-8') as f:
        json.dump(orders, f, ensure_ascii=False, indent=2)

    if TELEGRAM_BOT_TOKEN and TELEGRAM_CHAT_IDS:
        _send_telegram(order)

    return jsonify({'order_id': order_id, 'status': 'ok'})


def _send_telegram(order):
    lines = [f"\U0001f6d2 *Nuevo Pedido #{order['id']}*"]
    if order.get('customer_name'):
        lines.append(f"\U0001f464 {order['customer_name']}")
    if order.get('customer_phone'):
        lines.append(f"\U0001f4f1 {order['customer_phone']}")
    for i, item in enumerate(order['items']):
        parts = []
        for key, val in item.items():
            if key in ('ts', 'presentacion', 'cantidad', 'prixes'):
                continue
            parts.append(f"{key.replace('_', ' ')}: {str(val).replace('_', ' ')}")
        qty = int(item.get('cantidad', 1)) * int(item.get('presentacion', 1))
        parts.append(f"Cantidad: {qty} unidades")
        lines.append(f"{i+1}. " + ". ".join(parts))
    msg = "\n".join(lines)

    for chat_id in TELEGRAM_CHAT_IDS:
        payload = json.dumps({'chat_id': chat_id, 'text': msg, 'parse_mode': 'Markdown'}).encode()
        req = urllib.request.Request(
            f"https://api.telegram.org/bot{TELEGRAM_BOT_TOKEN}/sendMessage",
            data=payload,
            headers={'Content-Type': 'application/json'},
        )
        try:
            urllib.request.urlopen(req, timeout=5)
        except Exception:
            pass


# --- Admin ---

@app.route('/chef', methods=['GET'])
def chef_login():
    if session.get('admin_logged_in'):
        return redirect(url_for('chef_dashboard'))
    return render_template('admin/login.html', title="Chef Login")


@app.route('/chef/login', methods=['POST'])
def chef_login_post():
    ip = request.remote_addr

    if _is_locked_out(ip):
        flash('Demasiados intentos fallidos. Intente de nuevo en 15 minutos.', 'error')
        return render_template('admin/login.html', title="Chef Login"), 429

    username = request.form.get('username', '').strip()
    password = request.form.get('password', '')

    valid = (
        username == ADMIN_USERNAME
        and ADMIN_PASSWORD_HASH
        and check_password_hash(ADMIN_PASSWORD_HASH, password)
    )

    if not valid:
        _login_attempts[ip].append(time.time())
        remaining = MAX_ATTEMPTS - len(_login_attempts[ip])
        if remaining <= 0:
            flash('Cuenta bloqueada por 15 minutos por demasiados intentos.', 'error')
        else:
            flash(f'Credenciales incorrectas. Intentos restantes: {remaining}', 'error')
        return render_template('admin/login.html', title="Chef Login"), 401

    _login_attempts[ip] = []
    session.permanent = False
    session['admin_logged_in'] = True
    return redirect(url_for('chef_dashboard'))


@app.route('/chef/logout')
def chef_logout():
    session.pop('admin_logged_in', None)
    return redirect(url_for('chef_login'))


@app.route('/chef/dashboard')
@login_required
def chef_dashboard():
    orders = []
    if os.path.exists(ORDERS_FILE):
        with open(ORDERS_FILE, encoding='utf-8') as f:
            orders = json.load(f)
    orders_sorted = sorted(orders, key=lambda o: o.get('timestamp', ''), reverse=True)

    products_with_prices = [p for p in prod if hasattr(p, 'precio') and p.precio]
    return render_template(
        'admin/dashboard.html',
        title="GonzaCook :: Admin",
        orders=orders_sorted,
        products=products_with_prices,
    )


@app.route('/chef/orders/delete/<int:order_id>', methods=['POST'])
@login_required
def chef_delete_order(order_id):
    if not os.path.exists(ORDERS_FILE):
        return jsonify({'status': 'error', 'msg': 'No orders file'}), 404

    with open(ORDERS_FILE, encoding='utf-8') as f:
        orders = json.load(f)

    orders = [o for o in orders if o.get('id') != order_id]

    with open(ORDERS_FILE, 'w', encoding='utf-8') as f:
        json.dump(orders, f, ensure_ascii=False, indent=2)

    return jsonify({'status': 'ok'})


@app.route('/chef/prices/update', methods=['POST'])
@login_required
def chef_update_price():
    data = request.get_json(force=True)
    code = data.get('code')
    qty = data.get('qty')
    price = data.get('price')

    if not code or qty is None or price is None:
        return jsonify({'status': 'error', 'msg': 'Missing fields'}), 400

    try:
        qty = int(qty)
        price = float(price)
    except (ValueError, TypeError):
        return jsonify({'status': 'error', 'msg': 'Invalid values'}), 400

    if price < 0:
        return jsonify({'status': 'error', 'msg': 'Price must be positive'}), 400

    prices = _load_prices()
    if code not in prices:
        prices[code] = {}
    prices[code][str(qty)] = price
    _save_prices(prices)
    _apply_prices()

    return jsonify({'status': 'ok', 'code': code, 'qty': qty, 'price': price})
