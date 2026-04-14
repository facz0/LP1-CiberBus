<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body class="d-flex flex-column min-vh-100"><!-- agregado para sticky footer -->

    <main class="flex-grow-1"><!-- agregado para empujar el footer abajo -->
        <!-- Aquí va el contenido de cada vista -->
    </main>

    <footer style="background-color: #002147;" class="text-light mt-auto"><!-- agregado mt-auto -->

        <div class="container py-5">

            <div class="row gy-4">

                <!-- LOGO + CONTACTO -->
                <div class="col-lg-3 col-md-6 text-center text-md-start"><!-- agregado text-center text-md-start -->
                    <img src="${pageContext.request.contextPath}/imagenes/ciber.png" alt="logo" width="150" class="mb-3"><!-- corregido mb-6 a mb-3 -->
                    <h6 class="fw-bold text-uppercase mb-3">Ayuda o contacto</h6>
                    <p class="mb-2"><i class="bi bi-telephone me-2"></i> 999 999 999</p>
                    <p class="mb-0"><i class="bi bi-geo-alt me-2"></i> Ubicación</p>
                </div>

                <!-- RUTAS -->
                <div class="col-lg-3 col-md-6 text-center text-md-start"><!-- agregado -->
                    <h6 class="fw-bold text-uppercase mb-3">Rutas principales</h6>
                    <ul class="list-unstyled">
                        <li class="mb-1">Lima - Arequipa</li>
                        <li class="mb-1">Lima - Huancayo</li>
                        <li class="mb-1">Lima - Piura</li>
                        <li class="mb-1">Lima - Ica</li>
                        <li class="mb-1">Lima - Oxapampa</li>
                        <li class="mb-1">Lima - Cusco</li>
                    </ul>
                </div>

                <!-- DESTINO -->
                <div class="col-lg-2 col-md-6 text-center text-md-start"><!-- agregado -->
                    <h6 class="fw-bold text-uppercase mb-3">Destino</h6>
                    <ul class="list-unstyled">
                        <li class="mb-1">Pasajero frecuente</li>
                        <li class="mb-1">Centro de ayuda</li>
                        <li class="mb-1">Protección de datos</li>
                    </ul>
                </div>

                <!-- RESTRICCIONES -->
                <div class="col-lg-2 col-md-6 text-center text-md-start"><!-- agregado -->
                    <h6 class="fw-bold text-uppercase mb-3">Restricciones</h6>
                    <ul class="list-unstyled">
                        <li class="mb-2">Términos y condiciones</li>
                    </ul>
                    <h6 class="fw-bold text-uppercase mt-4 mb-2">Proveedor</h6>
                    <ul class="list-unstyled">
                        <li>Libro de reclamaciones</li>
                    </ul>
                </div>

                <!-- REDES -->
                <div class="col-lg-2 col-md-12 text-center text-md-start"><!-- agregado -->
                    <h6 class="fw-bold text-uppercase mb-3">Síguenos</h6>
                    <div class="d-flex gap-3 justify-content-center justify-content-md-start"><!-- agregado justify-content-center justify-content-md-start -->
                        <a href="#" class="text-light fs-5"><i class="bi bi-facebook"></i></a>
                        <a href="#" class="text-light fs-5"><i class="bi bi-instagram"></i></a>
                        <a href="#" class="text-light fs-5"><i class="bi bi-twitter"></i></a>
                        <a href="#" class="text-light fs-5"><i class="bi bi-youtube"></i></a>
                    </div>
                </div>

            </div>

            <!-- LINEA INFERIOR -->
            <hr class="mt-5 border-light">
            <div class="text-center small">© 2026 Empresa de Transportes — Todos los derechos reservados</div>
        </div>

    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>
