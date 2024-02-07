//Variables para los modals
carritoModal=null;
kartmodal=null;

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
    x.style.cssText += ';box-shadow: black 0px 0px 0px 0px !important;';
    x.style.cssText += ';background-color: #F3E5AB !important;';  
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
        if(x.id!=elem.id && x.style.cssText.includes(";box-shadow: 0 0 0 .1rem black")){
            remstyle(x)        
        }
    }
    if(cat in customizations && customizations[cat]==elem.id.split("-")[1]){
        customizations[cat]=null;
        remstyle(elem)
        update_prix(elem,parseInt(elem.textContent.split("+")[1].split("$")[0])*-1)
    } else {
        customizations[cat]=elem.id.split("-")[1]
        elem.style.cssText += ';background-color: #fffcba !important;';
        elem.style.cssText += ';box-shadow: 0 0 0 .1rem black !important;';
        if(elem.textContent.includes("+")){
            update_prix(elem,parseInt(elem.textContent.split("+")[1].split("$")[0]))
        }
    }
    return;

}

//Selecciona la presentacion del producto
function presentacionSel(j){
    bntpres = document.getElementById("presbtn")
    for(let i=0;i<parseInt(bntpres.dataset['opts']);i++){
        document.getElementById("pres-opt-"+i).classList.remove("active")
    }
    e = document.getElementById("pres-opt-"+j)
    e.classList.add("active")
    bntpres.textContent = e.textContent
    presentacion = e.dataset['nump']
}

//Limpia la seleccion actual
function clearsel(){
    document.getElementById("cant").value = ""
    bntpres = document.getElementById("presbtn")
    for(let i=0;i<parseInt(bntpres.dataset['opts']);i++){
        document.getElementById("pres-opt-"+i).classList.remove("active")
    }
    document.getElementById("presbtn").textContent = "Presentación"
    presentacion = null //Docena, unidad...

    for(key in customizations){
        var children = document.getElementById(key).children
        for (let i = 0; i < children.length; i++) {
            remstyle(children[i])        
        }
    }
    customizations= {}; //Base, topping...
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
            var myModal2 = new bootstrap.Modal(document.getElementById("ty"));
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

//Genera el mensaje de compra y lo envía a partir del carrito.
function buyKart(dt=0){
    txt="https://api.whatsapp.com/send?text=Hola GonzaCook, quisiera hacer el siguiente encargo:";
    mykart = getKart()
    if(dt!=0){
        mykart = mykart.filter(item => item.ts == dt)
    }
    for(let i=0; i<mykart.length; i++){
        txt+="%0A"+i+". "
        var v = mykart[i]
        for(key in v){
            if(key=="ts" || key=="presentacion" || key=="cantidad" || key=="prixes")
                continue;
            txt+="%0A"+key.replaceAll("_"," ")+": "+v[key].replaceAll("_"," ")+". "
        }
        txt += "Cantidad: "+parseInt(v.cantidad)*parseInt(v.presentacion)+" unidades.";
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
    var myModal2 = new bootstrap.Modal(document.getElementById("ty"));
    document.getElementById("tytitle").textContent = "Pedido confirmado"
    document.getElementById("tymsg").textContent = "Muchas gracias por su compra! Ahora solo hace falta enviar el mensaje generado en WhatsApp. Una vez que lo envíes, te responderé a la brevedad."
    myModal2.show();
    //window.location.href = txt;
	window.open(txt+"&phone=598092452842", '_blank').focus();
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