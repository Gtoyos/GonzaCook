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
	                    <img src="<%=request.getContextPath()%>/assets/panrelleno.jpg" class="jimg d-block w-100" alt="...">
	                    <div class="carousel-caption d-block">
	                        <h5 class="carrousel-item-title" >Pan Relleno de Jamón y Queso</h5>
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
            <h1>Panes Rellenos</h1>
        </div>
        <p id="prod-code" style="display:none;">panrelleno</p>

        <div id="prices">
            <p>1 unidad $400
            </p>
        </div>

        <h4 class="prod-name">Rellenos</h4>
        <div class="d-flex justify-content-center flex-wrap">
            <button id="base-capresse" onclick="gustoSel(this)" type="button" class="btn btn-light btn-sabores">Capresse</button>
            <button id="base-qyl" onclick="gustoSel(this)" type="button" class="btn btn-light btn-sabores">Queso y Longaniza</button>
            <button id="base-qycb" onclick="gustoSel(this)" type="button" class="btn btn-light btn-sabores">Queso y Cebolla</button>
            <button id="base-qaym" onclick="gustoSel(this)" type="button" class="btn btn-light btn-sabores">Queso, Aceitunas y Morrón</button>
            <button id="base-jyq" onclick="gustoSel(this)" type="button" class="btn btn-light btn-sabores">Jamón y Queso</button>
            <button id="base-cyp" onclick="gustoSel(this)" type="button" class="btn btn-light btn-sabores">Cheddar y Panceta</button>
        </div>

        <div class="block-compras d-grid gap-2">
            <button id="btn-carrito" class="btn btn-light" type="button" onclick="addToCarrito(this)" >Agregar al carrito</button>
            <button id="btn-comprar" class="btn btn-light" type="button" onclick="buybuy(this)" >Encargar</button>
        </div>
        
        <div id="presentation">
            <p> De textura crocante por arriba, suave por dentro y rebozado con distintas semillas, los panes rellenos son un aperitivo sumamente delicioso para acompañar las comidas o degustar en una merienda o desayuno.
           Te invito a probar mi versión clásica de jamón y queso u otras variantes más modernas como queso cheddar y panceta.
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
                        Precalentar el horno a 180°C y calentar durante 10 minutos. Consumir preferentemente no más de siete dias tras haber recibido el producto.
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
                        Las panes rellenos contienen manteca, aceite, levadura, sal, semillas y el relleno a elección.
                    </div>
                </div>
            </div>
			<jsp:include page="/template/envios.jsp"/>
        </div>
		<a id="btca" href="<%=request.getContextPath()%>/#misp"><h3 id="backtocatalog"><i class="fas fa-undo"></i> Regresar al catálogo</h3></a>
        <jsp:include page="/template/footer.jsp"/>
    </body>
</html>
