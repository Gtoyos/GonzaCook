//Variables para los modals
carritoModal=null;
kartmodal=null;

//Perfil de usuario (localStorage)
const profileKey = "gonzacookProfile"
const orderHistoryKey = "gonzacookOrderHistory"

function getProfile(){
    try { return JSON.parse(localStorage.getItem(profileKey)) || null; } catch(e) { return null; }
}
function setProfile(name, phone){
    localStorage.setItem(profileKey, JSON.stringify({name, phone}));
}
function getOrderHistory(){
    try { return JSON.parse(localStorage.getItem(orderHistoryKey)) || []; } catch(e) { return []; }
}
function addOrderToHistory(order){
    const h = getOrderHistory();
    h.unshift(order);
    localStorage.setItem(orderHistoryKey, JSON.stringify(h));
}
function calcOrderTotal(items){
    let total = 0;
    for(const item of items){
        if(!item.prixes) continue;
        const cantidad = parseInt(item.cantidad) * parseInt(item.presentacion);
        const pricekeys = Object.keys(item.prixes).map(Number).sort((a,b) => b-a);
        let cr = cantidad;
        while(cr > 0){
            for(const p of pricekeys){
                total += Math.trunc(cr/p) * item.prixes[p];
                cr = cr % p;
            }
        }
    }
    return total;
}
function showOrderDetail(orderId){
    const history = getOrderHistory();
    const o = history.find(x => x.id === orderId);
    if(!o) return;
    const items = o.items || [];
    const total = calcOrderTotal(items);
    let rows = items.map(item => {
        const cantidad = parseInt(item.cantidad) * parseInt(item.presentacion);
        const opts = Object.entries(item)
            .filter(([k]) => !['ts','presentacion','cantidad','prixes'].includes(k))
            .map(([k,v]) => `<span class="text-muted">${k.replaceAll('_',' ')}: </span>${String(v).replaceAll('_',' ')}`)
            .join('<br>');
        return `<tr><td>${opts}</td><td>${cantidad} u.</td></tr>`;
    }).join('');
    document.getElementById('orderDetailTitle').textContent = `Pedido #${orderId}`;
    document.getElementById('orderDetailDate').textContent = new Date(o.timestamp).toLocaleString('es-UY');
    document.getElementById('orderDetailBody').innerHTML = rows;
    document.getElementById('orderDetailTotal').textContent = total > 0 ? `Total: $${total}` : '';
    bootstrap.Modal.getOrCreateInstance(document.getElementById('profileModal')).hide();
    bootstrap.Modal.getOrCreateInstance(document.getElementById('orderDetailModal')).show();
}
function updateProfileNav(){
    const p = getProfile();
    const text = p ? "Hola, " + p.name : "Iniciar sesión";
    ["profileNavLink","profileNavLinkMobile"].forEach(id => {
        const el = document.getElementById(id);
        if(el) el.textContent = text;
    });
}
function showProfileModal(){
    const p = getProfile();
    const history = getOrderHistory();
    if(p){
        document.getElementById("profileViewName").textContent = p.name;
        document.getElementById("profileViewPhone").textContent = p.phone;
        document.getElementById("profileFormSection").style.display = "none";
        document.getElementById("profileViewSection").style.display = "block";
        const histEl = document.getElementById("profileOrderHistory");
        if(history.length === 0){
            histEl.innerHTML = "<p class='text-muted small'>No tenés pedidos registrados.</p>";
        } else {
            histEl.innerHTML = history.map(o => {
                const total = calcOrderTotal(o.items || []);
                const totalStr = total > 0 ? ` — $${total}` : '';
                return `<div class="border rounded p-2 mb-2 small d-flex justify-content-between align-items-center" style="cursor:pointer" onclick="showOrderDetail(${o.id})">
                    <span><b>Pedido #${o.id}</b> — ${new Date(o.timestamp).toLocaleDateString('es-UY')}${totalStr}</span>
                    <span class="text-muted" style="font-size:.8rem">Ver detalle &rsaquo;</span>
                </div>`;
            }).join("");
        }
    } else {
        document.getElementById("profileFormSection").style.display = "block";
        document.getElementById("profileViewSection").style.display = "none";
        document.getElementById("profileNameInput").value = "";
        document.getElementById("profilePhoneInput").value = "";
    }
    bootstrap.Modal.getOrCreateInstance(document.getElementById("profileModal")).show();
}
function saveProfile(){
    const name = document.getElementById("profileNameInput").value.trim();
    const phone = document.getElementById("profilePhoneInput").value.trim();
    if(!name || !phone) return;
    setProfile(name, phone);
    updateProfileNav();
    bootstrap.Modal.getOrCreateInstance(document.getElementById("profileModal")).hide();
}
function editProfile(){
    const p = getProfile();
    document.getElementById("profileNameInput").value = p ? p.name : "";
    document.getElementById("profilePhoneInput").value = p ? p.phone : "";
    document.getElementById("profileFormSection").style.display = "block";
    document.getElementById("profileViewSection").style.display = "none";
}
function logoutProfile(){
    localStorage.removeItem(profileKey);
    updateProfileNav();
    bootstrap.Modal.getOrCreateInstance(document.getElementById("profileModal")).hide();
}
document.addEventListener("DOMContentLoaded", () => {
    updateProfileNav();
    // Auto-select presentacion when only one option exists
    const presbtn = document.getElementById("presbtn");
    if(presbtn && parseInt(presbtn.dataset['opts']) === 1){
        presentacionSel(0);
    }
});

//Variables de seleccion
if(document.getElementById("prod-title") != null){
    nombre = document.getElementById("prod-title").textContent
    presentacion = null //Docena, unidad...
    customizations= {}; //Base, topping...
}

//Carrito virtual
kartkey = "gonzacookKart09834567811"
kart = window.sessionStorage;
function getKart(){
    if(window.sessionStorage.getItem(kartkey))
        return JSON.parse(window.sessionStorage.getItem(kartkey));
    else return []   
}
function setKart(x){
    kart.setItem(kartkey,JSON.stringify(x));
}

//Remueve el CSS de un botón seleccionado
function remstyle(x){
    x.style.cssText += ';box-shadow: none !important;';
    x.style.cssText += ';background-color: #f5f2ee !important;';
    x.style.cssText += ';color: #1a1a1a !important;';  
}

//Seleccion de una caracterstica del producto
//Guarda la seleccion, elemina la seleccion anterior.
function gustoSel(elem){
    function update_prix(elem,extra_price=0){
        precios = document.getElementById("x").dataset["prix"].slice(1,-1).split(" ")
        precios = "{"+precios[0]+" "+(parseInt(precios[1])+extra_price)+"}" 
        document.getElementById("x").dataset["prix"] = precios
    }
    cat = elem.id.split("-")[0]
    var children = document.getElementById(cat).children
    for (var i = 0; i < children.length; i++) {
        var x = children[i];
        if(x.id!=elem.id){
            remstyle(x)
            if(x.dataset["selected"] == "true"){
                x.dataset["selected"]=false
                update_prix(x,parseInt(x.textContent.split("+")[1].split("$")[0])*-1)
            }  
        }
    }
    if(cat in customizations && customizations[cat]==elem.id.split("-")[1]){
        customizations[cat]=null;
        remstyle(elem)
        elem.dataset["selected"]=false
        update_prix(elem,parseInt(elem.textContent.split("+")[1].split("$")[0])*-1)
    } else {
        customizations[cat]=elem.id.split("-")[1]
        elem.style.cssText += ';background-color: #c0392b !important;';
        elem.style.cssText += ';color: #fff !important;';
        elem.style.cssText += ';box-shadow: 0 0 0 .15rem #c0392b !important;';
        elem.dataset["selected"]=true
        if(elem.textContent.includes("+")){
            update_prix(elem,parseInt(elem.textContent.split("+")[1].split("$")[0]))
        }
    }
    return;

}

//Selecciona la presentacion del producto (legacy, kept for clearsel compatibility)
function presentacionSel(j){
    e = document.getElementById("pres-opt-"+j)
    presentacion = e.dataset['nump']
}

//Pill button selection
function presPillSel(btn, j){
    document.querySelectorAll('.pres-pill').forEach(b => {
        b.classList.remove('active');
        b.style.cssText = '';
    });
    btn.classList.add('active');
    btn.style.cssText = 'background-color:#c0392b !important;color:#fff !important;border-color:#c0392b !important;';
    presentacion = btn.dataset['nump'];
    // Update quantity label to reflect what the user is counting
    const n = parseInt(presentacion);
    const labelMap = {1: 'unidades', 5: 'grupos de 5', 6: 'medias docenas', 12: 'docenas'};
    const unit = labelMap[n] || ('grupos de ' + n);
    const lbl = document.getElementById('cantlbl');
    if(lbl) lbl.textContent = '¿Cuántas ' + unit + '?';
}

//Limpia la seleccion actual
function clearsel(){
    document.getElementById("cant").value = ""
    const opts = parseInt(document.getElementById("presbtn").dataset['opts']);
    if(opts > 1){
        document.querySelectorAll('.pres-pill').forEach(b => {
            b.classList.remove('active');
            b.style.cssText = '';
        });
        presentacion = null;
        const lbl = document.getElementById('cantlbl');
        if(lbl) lbl.textContent = 'Cantidad';
    }
    // single-option products keep presentacion pre-set

    for(key in customizations){
        var children = document.getElementById(key).children
        for (let i = 0; i < children.length; i++) {
            remstyle(children[i])
        }
    }
    customizations= {};
}

//Modal para agregar la selección al carrito.
//El mode indica si se raliza compra directa o no (0)
function addToCarrito(mode=0){
    if(mode==0){
        document.getElementById("addkrttitle").textContent ="Agregar a Carrito 🛒"
        document.getElementById("addkrtconf").textContent ="Agregar"
        document.getElementById("addkrtconfa").href = 'javascript:toKart(0)'
    }else{
        document.getElementById("addkrttitle").textContent ="Comprar producto 🛒"
        document.getElementById("addkrtconf").textContent ="Comprar"
        document.getElementById("addkrtconfa").href = 'javascript:toKart(1)'
    }

    //try get element, if fail get length 0
    try {
        var options = document.getElementById("custom_categories").children
    }
    catch(err) {
        var options = []
    }
    
    var clist = []
    for(let i=0; i < options.length; i++){
        var x = options[i];
        if(x.nodeName=="H4"){
            clist.push(x.textContent.replaceAll(" ","_"))
        }
    }
    for(let i=0; i<clist.length;i++){
        if(!(clist[i] in customizations && customizations[clist[i]]!=null)){
            carritoModal = new bootstrap.Modal(document.getElementById("msgBadOpt"))
            carritoModal.toggle()
            return 1;
        }
    }
    //La seleccion es valida
    carritoModal = new bootstrap.Modal(document.getElementById("confirmAddCart"))
    slxtxt = "Producto: "+nombre+"\n"
    for(var key in customizations){
        slxtxt += key.replaceAll("_"," ")+": "+customizations[key].replaceAll("_"," ")+"\n";
    }
    document.getElementById("slx").textContent = slxtxt
    carritoModal.toggle();
    return 0
}

//Agerga la selección al carrito virtual
function toKart(mode=0){
    function parsetable(x){
        t = {}
        x=x.slice(1,-1).split(" ")
        for(let i=0;i<x.length;i+=2){
            if(i<x.length-2){
                t[x[i].slice(0,-1)]=parseInt(x[i+1].slice(0,-1))
            }else{
                t[x[i].slice(0,-1)]=parseInt(x[i+1])
            }
        }
        return t
    }
    c = document.getElementById("cant").value;
    if(presentacion!=null && document.getElementById("cant").checkValidity()){
        var dt = (new Date()).getTime()
        pkg = {"ts":dt,"Nombre":nombre,"presentacion":presentacion,"cantidad":c,"prixes":parsetable(document.getElementById("x").dataset["prix"])}
        for(let key in customizations){
            pkg[key] = customizations[key]
        }
        krt = getKart()
        krt.push(pkg)
        setKart(krt)
        carritoModal.toggle();
        if(mode==0){
            var myModal2 = bootstrap.Modal.getOrCreateInstance(document.getElementById("ty"));
            document.getElementById("tytitle").textContent = "Agregar a Carrito 🛒"
            document.getElementById("tymsg").innerHTML = 'Se ha agregado su selección al carrito. 😄 <a style="color:black" href="javascript:seeKart(0)">Click aquí para verlo.</a>'
            myModal2.show();
        }
        clearsel()
        if(mode==1){
            buyKart(dt)
        }
    }
    //return 1
}

//Envía el pedido al servidor y muestra confirmación.
async function buyKart(dt=0){
    const profile = getProfile();
    if(!profile){
        if(kartmodal) kartmodal.hide();
        showProfileModal();
        return;
    }
    let itemsToSend = getKart()
    if(dt!=0){
        itemsToSend = itemsToSend.filter(item => item.ts == dt)
    }
    if(document.getElementById("prod-title")!=null){
        clearsel()
    }
    if(dt==0){
        kartmodal.toggle()
        setKart([])
    } else{
        remItem(dt)
    }
    var myModal2 = bootstrap.Modal.getOrCreateInstance(document.getElementById("ty"));
    document.getElementById("tytitle").textContent = "Enviando pedido..."
    document.getElementById("tymsg").textContent = "Por favor espere."
    myModal2.show();
    try {
        const resp = await fetch('/api/order', {
            method: 'POST',
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({items: itemsToSend, customer_name: profile.name, customer_phone: profile.phone})
        });
        const result = await resp.json();
        addOrderToHistory({id: result.order_id, timestamp: new Date().toISOString(), items: itemsToSend});
        document.getElementById("tytitle").textContent = "Pedido recibido ✅"
        document.getElementById("tymsg").textContent = "¡Tu pedido #"+result.order_id+" fue recibido! Te responderemos a la brevedad."
    } catch(e) {
        document.getElementById("tytitle").textContent = "Error"
        document.getElementById("tymsg").textContent = "Hubo un problema al enviar el pedido. Por favor intente nuevamente."
    }
}

//Visualiza el carrito
//El modo indica si se quiere volver a crear el modal del carrito.
function seeKart(mode){
    if(mode==0){
        kartmodal = new bootstrap.Modal(document.getElementById("carrito"));
    }
	mykart = getKart()
    var totalp = 0;
    document.getElementById("karttable").innerHTML = "";
    for(let i=0; i<mykart.length; i++){
        item = mykart[i]
        var price = 0;
        var pricekeys = Object.keys(item.prixes).reverse()
        cantidad = parseInt(item.cantidad)*parseInt(item.presentacion);
        cr=cantidad
        while(cr>0){
            for(let k=0;k<pricekeys.length;k++){
                p = pricekeys[k]
                price += Math.trunc(cr/p)*item.prixes[p]
                cr = cr%p
            }    
        }
        totalp += price;
        rww = "<tr>"
        rww += '<th scope="row">'+i+'</th>';
        rww += "<td>"
        for(key in item){
            if(key=="ts" || key=="presentacion" || key=="cantidad" || key=="prixes")
                continue;
            rww+=key.replaceAll("_"," ")+": "+item[key].replaceAll("_"," ")+". "
        }
        rww += "</td>"
        rww += "<td>"+cantidad+"</td>";
        rww += "<td>$"+price+"</td>";
        rww += '<td><button type="button" onclick="remItem('+item["ts"]+')" class="btn-close"></button></td>'
        rww += "</tr>"
        document.getElementById("karttable").innerHTML += rww
    }
    document.getElementById("karttotal").textContent = "Total: $"+totalp;
	if(totalp>0){
		document.getElementById("kartbuybtn").disabled = false;
	} else{
		document.getElementById("kartbuybtn").disabled = true;
	}
    if(mode==0){
        kartmodal.show();
    }
}

//Borra un item del carrito
function remItem(itemId){
    mykart = getKart()
    mykart = mykart.filter(item => item.ts != itemId)
    setKart(mykart)
    seeKart(1)
}