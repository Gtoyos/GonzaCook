<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    	<jsp:include page="/template/head.jsp"/>
    </head>
    <body>
    	<jsp:include page="/template/header.jsp"/>

        <div style='background-image: url("<%=request.getContextPath()%>/assets/cover2.png")' id="main-banner">
            <h1 id="banner-h1" >GonzaCook</h1>
            <h2 id="banner-h2">Home cooking with ♥</h2>
        </div>

        <div id="presentation">
            Bienvenido al sitio web de GonzaCook. Desde aquí podrás acceder a toda la información de mis productos, conocer mi propuesta, hacer encargos y muchas cosas más.
            Gonzacook.com cuenta con un carrito virtual para armar tu pedido, selecciona los productos del catálogo para agregarlos a tu carrito. El mismo puede accederse desde el menú superior.
            Al confirmar la compra se generará un mensaje el cual podrás enviar a Gonzacook.

        </div>
		<p id="prod-code" style="display:none;">none</p>
        <div id="misp">
            <h1>Mis productos</h1>
        </div>

        <div id="catalog" class="card-columns">
            <div class="card">
                <a class="prodlink" href="<%=request.getContextPath()%>/productos/galletas-americanas">
                    <img src="<%=request.getContextPath()%>/assets/americanas-choco3.jpg" class="card-img-top" alt="Galletas Americanas">
                    <div class="card-body">
                        <h5 class="card-title">Cookies Americanas</h5>
                    </div>
                </a>
            </div>
            <div class="card">
                <a class="prodlink" href="<%=request.getContextPath()%>/productos/galletas-avena">
                    <img src="<%=request.getContextPath()%>/assets/avena-pasas2.jpg" class="card-img-top" alt="Galletas de avena">
                    <div class="card-body">
                        <h5 class="card-title">Cookies de Avena</h5>
                    </div>
                </a>
            </div>
            <div class="card">
                <a class="prodlink" href="<%=request.getContextPath()%>/productos/galletas-manteca">
                    <img src="<%=request.getContextPath()%>/assets/galletas-manteca.jpg" class="card-img-top" alt="Galletas de manteca">
                    <div class="card-body">
                        <h5 class="card-title">Galletitas de Manteca</h5>
                    </div>
                </a>
            </div>
            <div class="card">
                <a class="prodlink" href="<%=request.getContextPath()%>/productos/galletas-diseño">
                    <img src="<%=request.getContextPath()%>/assets/cookies-diseño.png" class="card-img-top" alt="Galletas especiales">
                    <div class="card-body">
                        <h5 class="card-title">Cookies con Diseño</h5>
                    </div>
                </a>
            </div>     
            <div class="card">
                <a class="prodlink" href="<%=request.getContextPath()%>/productos/pan-relleno">
                    <img src="<%=request.getContextPath()%>/assets/panrelleno.jpg" class="card-img-top" alt="Panes rellenos">
                    <div class="card-body">
                        <h5 class="card-title">Panes Rellenos</h5>
                    </div>
                </a>
            </div>
            <div class="card">
                <a class="prodlink" href="<%=request.getContextPath()%>/productos/pan-hamburguesas">
                    <img src="<%=request.getContextPath()%>/assets/pan-hamburguesa.jpg" class="card-img-top" alt="Pan Hamburguesa">
                    <div class="card-body">
                        <h5 class="card-title">Panes para Hamburguesa</h5>
                    </div>
                </a>
            </div>
        </div>

        <div id="sobremi">
            <h1>Sobre Mi</h1>
        </div>

        <div id="presentation">
           Muchas gracias por visitar mi página. En 2021 decidí iniciar mi pequeño emprendimiento de cocina, comencé vendiendo galletas de avena con gran éxito y a
            lo largo de los meses he ido ampliando mis productos siempre teniendo en cuenta la calidad de la materia prima y la opinión de mis clientes.
            
            Te invito a que me dejes tus comentarios, consultas o cualquier inquietud que tengas en mis redes sociales. Me será un gran gusto poder responderte.

        </div>

        <jsp:include page="/template/footer.jsp"/>
    </body>
</html>