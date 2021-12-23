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
            "Muchas gracias por visitar mi pagina. En 2021 decidí comenzar mi pequeño emprendimiento de cocina, y aqui Gonza tiene que pensar cosas inteligentes para escribir... 😂🤣🤣.
            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vehicula laoreet nisl eu auctor.
             Aliquam viverra nunc vitae nunc convallis, interdum commodo nisi volutpat. Curabitur odio felis, convallis et nisi eget,
              pellentesque porta leo. Integer varius sem vel interdum maximus. Suspendisse elementum placerat egestas. Morbi ornare est diam, 
              sed pretium lacus ultrices ac."
        </div>

        <jsp:include page="/template/footer.jsp"/>
    </body>
</html>