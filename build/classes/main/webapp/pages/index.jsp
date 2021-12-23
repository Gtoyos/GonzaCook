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
            <h2 id="banner-h2">Cocina casera hecha con cariño</h2>
        </div>

        <div id="presentation">
            "Aqui va un texto muy inteligente sobre la cocina de gonzacook. Se lo dejo a gonza para que lo piense 😊. vehicula tempor. Proin nec orci sit amet dolor interdum porta. Donec in molestie mauris. Nulla facilisi. Quisque id massa semper"
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
                        <h5 class="card-title">Galletas Americanas</h5>
                    </div>
                </a>
            </div>
            <div class="card">
                <a class="prodlink" href="<%=request.getContextPath()%>/productos/galletas-avena">
                    <img src="<%=request.getContextPath()%>/assets/avena-pasas2.jpg" class="card-img-top" alt="Galletas de avena">
                    <div class="card-body">
                        <h5 class="card-title">Galletas de Avena</h5>
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

        <jsp:include page="/template/footer.jsp"/>
    </body>
</html>