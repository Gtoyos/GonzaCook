
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg navbar-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="<%=request.getContextPath()%>/">
          <img src="<%=request.getContextPath()%>/assets/logo.png">
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link nav-item-kart" href="javascript:seeKart()"><b>Mi carrito 🛒</b></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/#misp">Catálogo Web</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/assets/carta.jpg">Carta</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="<%=request.getContextPath()%>/#sobremi">Sobre mi</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

        <div class="modal fade" id="confirmAddCart" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="mb-0">Agregar a Carrito 🛒</h2>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p class="resumee" id="slx">Su selección:</p>
                        <form action="#">
                            <div class="form-floating mb-2">
                                <input id="cant" pattern="^((0\.5)|([1-9][0-9]*(\.5){0,1}))$" class="form-control rounded-4" name="cant">
                                <label id="cantlbl" for="cant">Cantidad de docenas</label>     
                                <i id="mediadocenaindi">(escriba .5 para indicar media)</i>
                            </div>
                        </form>
                        <a href="javascript:toKart()" >
                        <button class="btn-sabores btn btn-primary" type="submit" >
                            Agregar
                        </button>
                        </a>
                    </div>
                    <div class="modal-footer">
                        <hr class="my-6">
                        <div>
                            <i>Al confirmar el encargo del carrito, se generará un mensaje el cual se enviará por WhatsApp® a GonzaCook. Para ello debe tener WhatsApp® instalado en su dispositivo.</i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="buyme" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="mb-0">Realizar Compra 🛒</h2>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p class="resumee" id="slxb">Su selección:</p>
                        <form action="#">
                            <div class="form-floating mb-2">
                                <input id="cantB" pattern="^((0\.5)|([1-9][0-9]*(\.5){0,1}))$" class="form-control rounded-4" name="cantB">
                                <label id="cantBlbl" for="cantB">Cantidad de docenas</label>     
                                <i id="mediadocenaindiB">(escriba .5 para indicar media)</i>
                            </div>
                        </form>
                        <a href="javascript:toKartBuy()" >
                        <button class="btn-sabores btn btn-primary" type="submit" >
                            Encargar
                        </button>
                        </a>
                    </div>
                    <div class="modal-footer">
                        <hr class="my-6">
                        <div>
                            <i>Al confirmar el encargo del carrito, se generará un mensaje el cual se enviará por WhatsApp® a GonzaCook. Para ello debe tener WhatsApp® instalado en su dispositivo.</i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="msgNoOpt" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="mb-0">Agregar a Carrito 🛒</h2>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>Antes de encargar o agregar al carrito debe seleccionar las opciones para el producto.</p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="ty" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="mb-0">Agregar a Carrito 🛒</h2>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>Se ha agregado su selección al carrito. 😄<a href="javascript:seeKart()">Click aquí para verlo.</a></p>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal fade" id="carrito" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h2 class="mb-0">Mi Carrito 🛒</h2>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="table-responsive">
                            <table class="table table-striped table-hover">
                                <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Producto</th>
                                        <th scope="col">Cantidad</th>
                                        <th scope="col">Precio</th>
                                        <th scope="col"></th>
                                    </tr>
                                </thead>
                                <tbody id="karttable">
                                </tbody>
                            </table>
                        </div>
                        <h6 id="karttotal">Total: </h6>  
                        <button onclick="buyKart()" id="kartbuybtn" class="btn-sabores btn btn-primary" type="submit" >
                            Encargar
                        </button>
                    </div>
                    <div class="modal-footer">
                        <hr class="my-6">
                        <div>
                            <i>Al confirmar el encargo del carrito, se generará un mensaje el cual se enviará por WhatsApp® a GonzaCook. Para ello debe tener WhatsApp® instalado en su dispositivo.</i>
                        </div>
                    </div>
                </div>
            </div>
        </div>