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
	                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1" aria-label="Slide 2"></button>
	                <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2" aria-label="Slide 3"></button>
	            </div>
	            <div class="carousel-inner">
	                <div class="carousel-item active" data-bs-interval="10000">
	                    <img src="<%=request.getContextPath()%>/assets/americanas-coco.jpg" class="jimg d-block w-100" alt="...">
	                    <div class="carousel-caption d-block">
	                        <h5 class="carrousel-item-title" >Galletas Americanas de Vainilla con Coco Rallado</h5>
	                    </div>
	                </div>
	                <div class="carousel-item" data-bs-interval="2000">
	                    <img src="<%=request.getContextPath()%>/assets/americanas-choco.jpg" class="jimg d-block w-100" alt="...">
	                    <div class="carousel-caption d-block">
	                        <h5 class="carrousel-item-title" >Galletas Americanas de Chocolate con Chips de Chocolate Blanco</h5>
	                    </div>
	                </div>
	                <div class="carousel-item" data-bs-interval="2000">
	                    <img src="<%=request.getContextPath()%>/assets/americanas-choco3.jpg" class="jimg d-block w-100" alt="...">
	                    <div class="carousel-caption d-block">
	                        <h5 class="carrousel-item-title" >Galletas Americanas de Vainilla con Chips de Chocolate Negro</h5>
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
            <h1>Galletas Americanas</h1>
        </div>
        <p id="prod-code" style="display:none;">gamericanas</p>

        <div id="prices">
            <p>1 docena $180
                ½ docena $120
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
            <button id="btn-carrito" class="btn btn-light" type="button" onclick="addToCarrito(this)" >Agregar al carrito</button>
            <button id="btn-comprar" class="btn btn-light" type="button" onclick="buybuy(this)"">Encargar</button>
        </div>
        
        <div id="presentation">
            <p> Aquí va una descripcion de las galletas americanas. Que ricas que son!!! Lorem ipisum dolor sit amet. Qual nostra un movitum avec son dominus ameno tranta dominum</p>
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
                        Prontas para consumir! Se recomienda consumir antes de una semana de recibido el producto.
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
                        Las galletas americanas contienen harina, huevos, manteca, vainilla, ... escribir todos los ingredientes!
                    </div>
                </div>
            </div>
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingThree">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                        🚚 Envíos
                    </button>
                </h2>
                <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                    <div class="accordion-body">
                        <strong>Política de envíos.</strong> Envío gratuito a todo montevideo para pedidos mayores a $400.
                    </div>
                </div>
            </div>
        </div>
        
		<a id="btca" href="<%=request.getContextPath()%>/#misp"><h3 id="backtocatalog"><i class="fas fa-undo"></i> Regresar al catálogo</h3></a>
		
        <jsp:include page="/template/footer.jsp"/>
    </body>
</html>