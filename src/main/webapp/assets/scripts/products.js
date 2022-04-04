p={"choco":"Chips de Chocolate Negro", "chocob":"Chips de Chocolate Blanco", "coco":"Chips de Coco", "chocolate":"Chocolate", "vainilla":"Vainilla",
    "nueces":"Nueces","pasas":"Pasas de Uva","cran":"Cranberries","capresse":"Capresse","qyl":"Queso y Longaniza","qycb":"Queso y Cebolla", "cyp":"Cheddar y Panceta",
	"qaym":"Queso y Aceitunas","jyq":"Jamón y Queso","sesamo":"Sésamo","chia":"Chía","lino":"Lino","mixsemillas":"Mix de Semillas",
    "gamericanas":"Galletas Americanas", "panrelleno": "Pan Relleno", "panh":"Pan para Hamburguesas","gavena":"Galletas de Avena","gmanteca":"Galletas de manteca"};

pr={"gamericanas12":250,"gamericanas6":140,"gavena6":110,"gavena12":190,"panh6":80,"panh12":120,"panrelleno":400,"gmanteca6":100,"gmanteca12":60}
kart = window.localStorage;

item=document.getElementById("prod-code").textContent;
base = (item==="gavena" || item==="panh" || item=="gmanteca") ? "DISABLED" : "none";
topping = (item==="panrelleno" || item=="gmanteca") ? "DISABLED":"none";

carritoModal=null;
kartmodal=null;

function gustoSel(elem){
    elem.style.cssText += ';background-color: #fffcba !important;';
    elem.style.cssText += ';box-shadow: 0 0 0 .1rem black !important;';
    ids = elem.id.split("-");
    if(ids[0]==="base"){
        if(base !== "none"){
            document.getElementById("base-"+base).style.cssText += ';box-shadow: black 0px 0px 0px 0px !important;';
            document.getElementById("base-"+base).style.cssText += ';background-color: #F3E5AB !important;';
        }
        if(ids[1]===base){
            document.getElementById("base-"+base).style.cssText += ';box-shadow: black 0px 0px 0px 0px !important;';
            document.getElementById("base-"+base).style.cssText += ';background-color: #F3E5AB !important;';
            base="none"   
        } else{
            base = ids[1];
        }
    } else{
        if(topping !== "none"){
            document.getElementById("top-"+topping).style.cssText += ';box-shadow: black 0px 0px 0px 0px !important;';
            document.getElementById("top-"+topping).style.cssText += ';background-color: #F3E5AB !important;';
        }
        if(ids[1]===topping){
            document.getElementById("top-"+topping).style.cssText += ';box-shadow: black 0px 0px 0px 0px !important;';
            document.getElementById("top-"+topping).style.cssText += ';background-color: #F3E5AB !important;';
            topping="none"   
        } else{
            topping = ids[1];
        }
    }
    return;
}

function addToCarrito(elem){
    x = ""
    if(base==="none" || topping==="none"){
        x="msgNoOpt";
    }else{
        x="confirmAddCart";
    }
    carritoModal = new bootstrap.Modal(document.getElementById(x))
    document.getElementById("slx").textContent = "Su selección:\nItem: "+p[item]+
        ((base!=="DISABLED" && item!=="panrelleno") ? "\nBase: "+p[base] :"")+
		((base!=="DISABLED" && item==="panrelleno") ? "\nRelleno: "+p[base] :"")+
        ((topping!=="DISABLED") ? "\nTopping: "+p[topping] :"");
	if(item==="panrelleno"){
		document.getElementById("cantlbl").textContent = "Cantidad de Unidades";
		document.getElementById("cant").pattern = "^[1-9][0-9]*$"
		document.getElementById("mediadocenaindi").style.display = "none";
	}else{
		document.getElementById("cantlbl").textContent = "Cantidad de Docenas";
		document.getElementById("cant").pattern = "^((0\.5)|([1-9][0-9]*(\.5){0,1}))$"
		document.getElementById("mediadocenaindi").style.display = "block";
	}
    carritoModal.toggle();
}
function buybuy(elem){
    x = ""
    if(base==="none" || topping==="none"){
        x="msgNoOpt";
    }else{
        x="buyme";
    }
    var myModal = new bootstrap.Modal(document.getElementById(x))
    document.getElementById("slxb").textContent = "Su selección:\nItem: "+p[item]+
        ((base!=="DISABLED" && item!=="panrelleno") ? "\nBase: "+p[base] :"")+
		((base!=="DISABLED" && item==="panrelleno") ? "\nRelleno: "+p[base] :"")+
        ((topping!=="DISABLED") ? "\nTopping: "+p[topping] :"")
	if(item==="panrelleno"){
		document.getElementById("cantBlbl").textContent = "Cantidad de Unidades";
		document.getElementById("mediadocenaindiB").style.display = "none";
		document.getElementById("cantB").pattern = "^[1-9][0-9]*$";
	}else{
		document.getElementById("cantBlbl").textContent = "Cantidad de Docenas";
		document.getElementById("mediadocenaindiB").style.display = "block";
		document.getElementById("cantB").pattern = "^((0\.5)|([1-9][0-9]*(\.5){0,1}))$"
	}
    myModal.toggle();
}

function toKart(){
    c = document.getElementById("cant").value;
    if(c===".5"){
        c="0.5"
    }
    k = "";
    if(localStorage.getItem('gonzacookKart'))
        k = localStorage.getItem('gonzacookKart');
    if(document.getElementById("cant").checkValidity()){
        var d = new Date();
        k+="|"+d.getTime()+";"+item+";"+base+";"+topping+";"+c; // epoch second accuracy for unique id order.
        kart.setItem("gonzacookKart",k);
        carritoModal.toggle();
        var myModal2 = new bootstrap.Modal(document.getElementById("ty"));
        myModal2.show();
    }
}

function toKartBuy(){
    c = document.getElementById("cantB").value;
    if(c===".5"){
        c="0.5"
    }
    nl="%0A"
    txt="https://api.whatsapp.com/send?text=Hola GonzaCook, quisiera hacer el siguiente encargo:%0A%0AItem: "+p[item]+
    	((base!=="DISABLED" && base!=="panrelleno") ? "%0ABase: "+p[base]:"")+
		((base!=="DISABLED" && base==="panrelleno") ? "%0ARelleno: "+p[base]:"")+
        ((topping!=="DISABLED") ?"%0ATopping: "+p[topping]:"")+
        "%0ACantidad: "+c+
        ((item==="panrelleno") ? "":" docenas")+
        ".&phone=598092452842";
    if(document.getElementById("cant").checkValidity()){
        //window.location.href = txt;
		window.open(txt, '_blank').focus();
    }
}

function buyKart(){
    txt="https://api.whatsapp.com/send?text=Hola GonzaCook, quisiera hacer el siguiente encargo:";
    mykart = kart.getItem("gonzacookKart").split("|");
    for(let i=1; i<mykart.length; i++){
        var v = mykart[i].split(";");
        txt += "%0A%0AItem:"+p[v[1]]+
    	((v[2]!=="DISABLED" && v[2]!=="panrelleno") ? "%0ABase: "+p[v[2]]:"")+
		((v[2]!=="DISABLED" && v[2]==="panrelleno") ? "%0ARelleno: "+p[v[2]]:"")+
        ((v[3]!=="DISABLED") ?"%0ATopping: "+p[v[3]]:"")+
        "%0ACantidad: "+v[4]+
        ((v[1]==="panrelleno") ? "":" docenas")+
        ".";
    }
    //window.location.href = txt;
	window.open(txt+"&phone=598092452842", '_blank').focus();
}

function seeKart(){
    kartmodal = new bootstrap.Modal(document.getElementById("carrito"));
    t = document.getElementById("karttable");
	mykart = "";
    if(localStorage.getItem('gonzacookKart'))
        mykart = localStorage.getItem('gonzacookKart');
    mykart = mykart.split("|");
    var totalp = 0;
    t.innerHTML = "";
    for(let i=1; i<mykart.length; i++){
        var v = mykart[i].split(";");
        var price = 0;
        if(v[1]==="panrelleno"){
            price = parseFloat(v[4])*pr[v[1]];
        } else{
            price = Math.trunc(parseFloat(v[4]))*pr[v[1]+"12"]+(parseFloat(v[4]) - Math.trunc(parseFloat(v[4])))*2*pr[v[1]+"6"];
        }
        totalp += price;
        rww= "<tr>"
        rww += '<th scope="row">'+i+'</th>';
        rww += "<td>"+p[v[1]]+". "+
        	((v[2]!=="DISABLED" && v[2]!=="panrelleno") ? "Base: "+p[v[2]]+". ":"")+
			((v[2]!=="DISABLED" && v[2]==="panrelleno") ? "Relleno: "+p[v[2]]+". ":"")+
            ((v[3]!=="DISABLED") ?"Topping: "+p[v[3]]+". ":"")+
            "</td>";
        rww += "<td>"+v[4]+"</td>";
        rww += "<td>$"+price+"</td>";
        rww += '<td><button type="button" onclick="remItem('+v[0]+')" class="btn-close"></button></td>'
        rww += "</tr>"
        t.innerHTML += rww
    }
    document.getElementById("karttotal").textContent = "Total: $"+totalp;
	if(totalp>0){
		document.getElementById("kartbuybtn").disabled = false;
	} else{
		document.getElementById("kartbuybtn").disabled = true;
	}
    kartmodal.show();
}

function remItem(itemId){
    mykart = kart.getItem("gonzacookKart").split("|");
    kn = "";
    for(let i=1; i<mykart.length; i++){
        var v = mykart[i].split(";");
        console.info(v[0]+"-"+itemId)
        if(v[0]!=itemId){
            kn+="|"+v[0]+";"+v[1]+";"+v[2]+";"+v[3]+";"+v[4]; 
        }
    }
    kart.setItem("gonzacookKart",kn);
    t = document.getElementById("karttable");
    mykart = kart.getItem("gonzacookKart").split("|");
    var totalp = 0;
    t.innerHTML = "";
    for(let i=1; i<mykart.length; i++){
        var v = mykart[i].split(";");
        if(v[1]==="panrelleno"){
            price = parseFloat(v[4])*pr[v[1]];
        } else{
            price = Math.trunc(parseFloat(v[4]))*pr[v[1]+"12"]+(parseFloat(v[4]) - Math.trunc(parseFloat(v[4])))*2*pr[v[1]+"6"];
        }
        totalp += price;
        rww= "<tr>"
        rww += '<th scope="row">'+i+'</th>';
        rww += "<td>"+p[v[1]]+". "+
        	((v[2]!=="DISABLED" && v[2]!=="panrelleno") ? "Base: "+p[v[2]]+". ":"")+
			((v[2]!=="DISABLED" && v[2]==="panrelleno") ? "Relleno: "+p[v[2]]+". ":"")+
            ((v[3]!=="DISABLED") ?"Topping: "+p[v[3]]+". ":"")+
            "</td>";
        rww += "<td>"+v[4]+"</td>";
        rww += "<td>$"+price+"</td>";
        rww += '<td><button type="button" onclick="remItem('+v[0]+')" class="btn-close"></button></td>'
        rww += "</tr>"
        t.innerHTML += rww
    }
    document.getElementById("karttotal").textContent = "Total: $"+totalp;
    if(kn.length===0){
        document.getElementById("kartbuybtn").disabled = true;
    }
}