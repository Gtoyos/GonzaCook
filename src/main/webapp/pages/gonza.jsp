<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    	<jsp:include page="/template/head.jsp"/>
    	<link href="<%=request.getContextPath()%>/assets/styles/gonza.css" rel="stylesheet">
    </head>
    <body>
    	<jsp:include page="/template/header.jsp"/>

        <img id="sobremi-img", src="assets/cover.png">

        <div id="misp">
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