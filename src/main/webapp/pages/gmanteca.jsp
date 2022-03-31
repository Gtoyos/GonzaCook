<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    	<jsp:include page="/template/head.jsp"/>
    	<link href="<%=request.getContextPath()%>/assets/styles/products.css" rel="stylesheet">
    </head>
    <body>
    	<jsp:include page="/template/header.jsp"/>
		<div class="carouselHolder">
	        <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
	            <div class="carousel-indicators">
	                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
	            </div>
	            <div class="carousel-inner">
	                <div class="carousel-item active" data-bs-interval="10000">
	                    <img src="<%=request.getContextPath()%>/assets/galletas-manteca.jpg" class="jimg d-block w-100" alt="...">
	                    <div class="carousel-caption d-block">
	                        <h5 class="carrousel-item-title" >Galletas de manteca (Ilustración)</h5>
	                    </div>
	                </div>
	            </div>
	            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
	                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
	                <span class="visually-hidden">Siguiente</span>
	            </button>
	            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
	                <span class="carousel-control-next-icon" aria-hidden="true"></span>
	                <span class="visually-hidden">Anterior</span>
	            </button>
	        </div>
		</div>
        <div class="prod-name">
            <h1>Galletitas de Manteca</h1>
        </div>
        <p id="prod-code" style="display:none;">gmanteca</p>

        <div id="prices">
            <p>1 docena $100
                ½ docena $60
            </p>
        </div>

        <h4 class="prod-name" >Base</h4>
        <div class="d-flex justify-content-center flex-wrap">
        	<button id="base-chocolate" onclick="gustoSel(this)" type="button" class="btn btn-light btn-sabores">Chocolate</button>
            <button id="base-vainilla" onclick="gustoSel(this)" type="button" class="btn btn-light btn-sabores">Vainilla</button>
        </div>
        <h4 class="prod-name">Toppings</h4>
        <div class="d-flex justify-content-center flex-wrap">
            <button id="top-choco" onclick="gustoSel(this)" type="button" class="btn btn-light btn-sabores">Chocolate Negro</button>
            <button id="top-chocob" onclick="gustoSel(this)" type="button" class="btn btn-light btn-sabores">Chocolate Blanco</button>
            <button id="top-coco" onclick="gustoSel(this)" type="button" class="btn btn-light btn-sabores">Coco Rallado</button>
        </div>

        <div class="block-compras d-grid gap-2">
           <button id="btn-carrito" class="btn btn-light" type="button" onclick="addToCarrito(this)" required>Agregar al carrito</button>
            <button id="btn-comprar" class="btn btn-light" type="button" onclick="buybuy(this)" required>Encargar</button>
        </div>
        
        <div id="presentation">
            <p> 
			Hay pocos manjares mejores que unas dulces y suaves galletitas de manteca. Si bien a muchas personas les asusta la palabra manteca, unas ricas galletitas de manteca caseras
			 es una alternativa mucho más saludable que esas que terminás siempre comprando por apuro en el supermercado y que, esas sí, están llenas de aditivos y forman parte de los alimentos restringidos en las guías alimentarias. 
            Hechas con ingredientes frescos, las galletas de manteca son un éxito garantizado para la hora del té o una merienda con amigos. 
             </p>
        </div>

        <div class="accordion" id="accordionExample">
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingOne">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        👨‍🍳 Preparación
                    </button>
                </h2>
                <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        Prontas para consumir! Consumir preferentemente no más de siete dias tras haber recibido el producto.
                    </div>
                </div>
            </div>
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingTwo">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                        🥚 Ingredientes
                    </button>
                </h2>
                <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        Las galletas de manteca contienen harina, manteca, azucar, vainilla y polvo de hornear. Adicionalmente puede incluir cacao y los distintos ingredientes para el topping seleccionado.
                    </div>
                </div>
            </div>
			<jsp:include page="/template/envios.jsp"/>
        </div>
        
		<a id="btca" href="<%=request.getContextPath()%>/#misp"><h3 id="backtocatalog"><i class="fas fa-undo"></i> Regresar al catálogo</h3></a>
		
        <jsp:include page="/template/footer.jsp"/>
    </body>
</html>