import json
import os
import datetime
import urllib.request

from flask import Flask, render_template, g, request, jsonify
from . import productos

app = Flask(__name__)
prod = productos.crearProductos()

ORDERS_FILE = os.path.join(os.path.dirname(__file__), '..', 'orders.json')
TELEGRAM_BOT_TOKEN = os.environ.get('TELEGRAM_BOT_TOKEN', '')
TELEGRAM_CHAT_IDS = [cid.strip() for cid in os.environ.get('TELEGRAM_CHAT_IDS', os.environ.get('TELEGRAM_CHAT_ID', '')).split(',') if cid.strip()]

with app.app_context():
    g.rootpath = app.instance_path

@app.route("/")
def index():
    return render_template('index.html',title="GonzaCook :: Inicio",productos=prod)

@app.route('/productos/<pcode>')
def productpage(pcode):
    x = None
    for p in prod:
        if p.code == pcode:
            x = p
    if x:
        return render_template('product.html',title="GonzaCook :: "+x.nombre,p=x)
    else:
        return "404: Not found.",404

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