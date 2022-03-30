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
	                    <img src="<%=request.getContextPath()%>/assets/pan-hamburguesa.jpg" class="jimg d-block w-100" alt="...">
	                    <div class="carousel-caption d-block">
	                        <h5 class="carrousel-item-title" >Pan para Hamburguesas Con Semillas</h5>
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
            <h1>Panes Para Hamburguesas</h1>
        </div>
        <p id="prod-code" style="display:none;">panh</p>

        <div id="prices">
            <p>1 docena $120
                ½ docena $80
            </p>
        </div>

        <h4 class="prod-name">Toppings</h4>
        <div class="d-flex justify-content-center flex-wrap">
            <button id="top-sesamo" onclick="gustoSel(this)" type="button" class="btn btn-light btn-sabores">Sésamo</button>
            <button id="top-chia" onclick="gustoSel(this)" type="button" class="btn btn-light btn-sabores">Chía</button>
            <button id="top-lino" onclick="gustoSel(this)" type="button" class="btn btn-light btn-sabores">Lino</button>
            <button id="top-mixsemillas" onclick="gustoSel(this)" type="button" class="btn btn-light btn-sabores">Mix de Semillas</button>
        </div>

        <div class="block-compras d-grid gap-2">
           <button id="btn-carrito" class="btn btn-light" type="button" onclick="addToCarrito(this)" required>Agregar al carrito</button>
            <button id="btn-comprar" class="btn btn-light" type="button" onclick="buybuy(this)" required>Encargar</button>
        </div>
        
        <div id="presentation">
            <p> Al cocinar unas buenas hamburguesas o sándwiches, es tan importante el contenido como el pan que lo contiene. Estos panes esponjosos de corteza ligeramente crujiente,
             son sabrosos y aromáticos, es un excelente pan para vuestras hamburguesas caseras.</p>

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
                        Se puede consumir caliente o frío. Para lo primero, precalentar el horno a 180°C y calentar durante 10 minutos.
                         Alternativamente, se puede calentar en la tostadora o grill. Consumir preferentemente no más de siete dias tras haber recibido el producto.
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
                        Harina, levadura, aceita, sal, yema de huevo y semillas a elección.
                    </div>
                </div>
            </div>
			<jsp:include page="/template/envios.jsp"/>
        </div>
		<a id="btca" href="<%=request.getContextPath()%>/#misp"><h3 id="backtocatalog"><i class="fas fa-undo"></i> Regresar al catálogo</h3></a>
        <jsp:include page="/template/footer.jsp"/>
    </body>
</html>
