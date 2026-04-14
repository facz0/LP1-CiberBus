<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
    crossorigin="anonymous">
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
</head>
<body>

<%@ include file="/shared/navbar.jsp"%>
    <div class="container mt-3">
        <div class="card">
            <div class="card-body ">

                <div class="container position-relative" style="z-index: 10;">
                    <div class="row justify-content-center">
                        <div
                            class="col-11 col-lg-10 bg-white shadow-lg rounded-4 p-3 mt-n5">

                            <div class="row g-2 align-items-center">

                                <div class="col-lg-5">
                                    <div class="input-group border rounded-3">
                                        <span class="input-group-text bg-transparent border-0"><i
                                            class="bi bi-geo-alt"></i></span> <input type="text"
                                            class="form-control border-0 shadow-none py-3"
                                            placeholder="Origen">

                                        <button class="btn btn-light border-0 px-2" type="button">
                                            <i class="bi bi-arrow-left-right text-primary"></i>
                                        </button>

                                        <input type="text"
                                            class="form-control border-0 shadow-none py-3"
                                            placeholder="Destino">
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="input-group border rounded-3 h-100">
                                        <span class="input-group-text bg-transparent border-0"><i
                                            class="bi bi-calendar3"></i></span> <select
                                            class="form-select border-0 shadow-none py-3">
                                            <option selected>¿Cuándo viajas?</option>
                                            <option>Hoy</option>
                                            <option>Mañana</option>
                                            <option>Elegir fecha...</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="col-lg-3 mb-4">
                                    <a href= "${pageContext.request.contextPath}/pasajes/busquedaPasajes.jsp"
                                        class="btn btn-warning w-100 py-3 fw-bold rounded-3 shadow-sm">
                                        <i class="bi bi-search me-2"></i> BUSCAR
                                    </a>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- Card 1 -->
    <div class="card mb-3 shadow-sm">
        <div class="card-body p-3 ">
            <div class="row align-items-center">
                <div class="col-2">
                    <h6 class="fw-bold mb-1">Ica Express</h6>
                    <small class="text-muted">Directo</small>
                </div>
                <div class="col-4">
                    <span class="fw-bold">02:00</span> → <span class="fw-bold">05:55</span><br>
                    <small class="text-muted">Duración: 3h 55m</small><br>
                    <small>Lima [Javier Prado] → Ica</small>
                </div>
                <div class="col-2 text-center">
                    <span class="fw-bold text-success">S/ 55</span>
                </div>
                <div class="col-4 text-end">
                    <a href="#" class="btn btn-warning btn-sm">Ver asientos</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Card 2 -->
    <div class="card mb-3 shadow-sm">
        <div class="card-body p-3 ">
            <div class="row align-items-center">
                <div class="col-2">
                    <h6 class="fw-bold mb-1">Evolution</h6>
                    <small class="text-muted">1 escala</small>
                </div>
                <div class="col-4">
                    <span class="fw-bold">04:00</span> → <span class="fw-bold">08:55</span><br>
                    <small class="text-muted">Duración: 4h 55m</small><br>
                    <small>Lima [Javier Prado] → Ica</small>
                </div>
                <div class="col-2 text-center">
                    <span class="fw-bold text-success">S/ 50</span>
                </div>
                <div class="col-4 text-end">
                    <a href="#" class="btn btn-warning btn-sm">Ver asientos</a>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="/shared/footer.jsp"%>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
        crossorigin="anonymous"></script>

</body>
</html>
