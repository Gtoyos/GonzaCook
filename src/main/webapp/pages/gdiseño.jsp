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
	                    <img src="<%=request.getContextPath()%>/assets/cookies-diseño.png" class="jimg d-block w-100" alt="...">
	                    <div class="carousel-caption d-block">
	                        <h5 class="carrousel-item-title" >Galletas de Manteca con decoración de girasol</h5>
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
            <h1>Cookies con Diseño</h1>
        </div>
        <p id="prod-code" style="display:none;">gdiseño</p>

        <div style="display:none;" id="prices">
            <p>1 docena $0
                ½ docena $0
            </p>
        </div>
        
        <div id="presentation">
            <p> 
            Las galletas con diseño son una opción perfecta para tus cumpleaños y eventos. Puedes pedir el tipo y forma de galleta que usted desee. Si desea conocer más de mi propuesta de galletas
            con diseño, te invito a que me escribas directamente en mis redes sociales.
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
			<jsp:include page="/template/envios.jsp"/>
        </div>
        
		<a id="btca" href="<%=request.getContextPath()%>/#misp"><h3 id="backtocatalog"><i class="fas fa-undo"></i> Regresar al catálogo</h3></a>
		
        <jsp:include page="/template/footer.jsp"/>
    </body>
</html>