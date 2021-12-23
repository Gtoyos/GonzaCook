<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <footer class="d-flex flex-wrap justify-content-between align-items-center py-3 my-4 border-top">
        <div class="col-md-4 d-flex align-items-center">
            <a href="<%=request.getContextPath()%>" class="mb-3 me-2 mb-md-0 text-muted text-decoration-none lh-1">
                <img src="<%=request.getContextPath()%>/assets/logo.png">
            </a>
            <span class="text-muted">© 2021 GonzaCook</span>
        </div>
        <ul class="nav col-md-4 justify-content-end list-unstyled d-flex social-list">
            <li class="ms-3"><a class="text-muted" href="https://wa.me/598092452842"><i class="fab fa-whatsapp"></i></a></li>
            <li class="ms-3"><a class="text-muted" href="https://www.instagram.com/gonza_cook/"><i class="fab fa-instagram"></i></a></li>
        </ul>
    </footer>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <script src="<%=request.getContextPath()%>/assets/scripts/products.js"></script>