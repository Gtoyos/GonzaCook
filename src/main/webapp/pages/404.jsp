<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/template/head.jsp"/>
	<style>
	    #ohno {
	    background-image: url(<%=request.getContextPath()%>/assets/cookie2.png);
	    background-size: contain;
	    height: 39rem;
	    }
    </style>
</head>
<body>
	
		<div id="ohno" class="page-wrap d-flex flex-row align-items-center">
		    <div class="container">
		        <div class="row justify-content-center">
		            <div class="col-md-12 text-center">
		                <span class="display-1 d-block">404</span>
		                <div class="mb-4 lead">La pagina que usted ha tratado de acceder no existe</div>
		                 <a href="<%=request.getContextPath()%>/home" class="link-dark">Volver al inicio</a>
		            </div>
		        </div>
		    </div>
		</div>
		
		

	<jsp:include page="/template/footer.jsp"/>
</body>
</html>