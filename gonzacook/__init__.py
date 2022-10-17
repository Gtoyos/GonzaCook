from flask import Flask
from flask import render_template
from flask import g
from . import productos

app = Flask(__name__)
prod = productos.crearProductos()

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