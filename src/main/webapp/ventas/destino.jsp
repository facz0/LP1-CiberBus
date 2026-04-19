<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Destinos - CiberBus</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
    <style>
        .card-img-top {
            height: 220px;       
            object-fit: cover;  
            width: 100%;      
        }
        .destino-label {
            font-size: 1.1rem;
        }
    </style>
</head>

<body class="d-flex flex-column min-vh-100">

    <header>
        <%@ include file="/shared/navbar.jsp"%>
    </header>

    <main class="flex-grow-1">
        <section class="py-5 bg-light">
            <div class="container">

                <div class="text-center mb-5">
                    <h2 class="fw-bold text-uppercase" style="color: #4f699c;">Destinos</h2>
                    <p class="text-muted">Explora los destinos más populares</p>
                    <hr class="mx-auto" style="width:80px; border:3px solid #001242;">
                </div>

                <div class="row g-4">

                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                            <img src="${pageContext.request.contextPath}/imagenes/plazaLima.png" class="card-img-top" alt="Lima">
                            <div class="card-body text-center">
                                <p class="destino-label mb-0 text-secondary">Viaja a <span class="text-dark fw-bold">Lima</span></p>
                                <a href="#" class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold">Ver más</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                            <img src="${pageContext.request.contextPath}/imagenes/huacachinaIca.png" class="card-img-top" alt="Ica">
                            <div class="card-body text-center">
                                <p class="destino-label mb-0 text-secondary">Viaja a <span class="text-dark fw-bold">Ica</span></p>
                                <a href="#" class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold">Ver más</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                            <img src="${pageContext.request.contextPath}/imagenes/plazaCusco.png" class="card-img-top" alt="Cusco">
                            <div class="card-body text-center">
                                <p class="destino-label mb-0 text-secondary">Viaja a <span class="text-dark fw-bold">Cusco</span></p>
                                <a href="#" class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold">Ver más</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                            <img src="${pageContext.request.contextPath}/imagenes/Amazonas.png" class="card-img-top" alt="Amazonas">
                            <div class="card-body text-center">
                                <p class="destino-label mb-0 text-secondary">Viaja a <span class="text-dark fw-bold">Amazonas</span></p>
                                <a href="#" class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold">Ver más</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                            <img src="${pageContext.request.contextPath}/imagenes/huaraz.png" class="card-img-top" alt="Huaraz">
                            <div class="card-body text-center">
                                <p class="destino-label mb-0 text-secondary">Viaja a <span class="text-dark fw-bold">Huaraz</span></p>
                                <a href="#" class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold">Ver más</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                            <img src="${pageContext.request.contextPath}/imagenes/abancay.png" class="card-img-top" alt="Abancay">
                            <div class="card-body text-center">
                                <p class="destino-label mb-0 text-secondary">Viaja a <span class="text-dark fw-bold">Abancay</span></p>
                                <a href="#" class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold">Ver más</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                            <img src="${pageContext.request.contextPath}/imagenes/arequipa.png" class="card-img-top" alt="Arequipa">
                            <div class="card-body text-center">
                                <p class="destino-label mb-0 text-secondary">Viaja a <span class="text-dark fw-bold">Arequipa</span></p>
                                <a href="#" class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold">Ver más</a>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                            <img src="${pageContext.request.contextPath}/imagenes/ayacucho.png" class="card-img-top" alt="Ayacucho">
                            <div class="card-body text-center">
                                <p class="destino-label mb-0 text-secondary">Viaja a <span class="text-dark fw-bold">Ayacucho</span></p>
                                <a href="#" class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold">Ver más</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                            <img src="${pageContext.request.contextPath}/imagenes/cajamarca.jpg" class="card-img-top" alt="Cajamarca">
                            <div class="card-body text-center">
                                <p class="destino-label mb-0 text-secondary">Viaja a <span class="text-dark fw-bold">Cajamarca</span></p>
                                <a href="#" class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold">Ver más</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                            <img src="${pageContext.request.contextPath}/imagenes/huancavelica.jpg" class="card-img-top" alt="Huancavelica">
                            <div class="card-body text-center">
                                <p class="destino-label mb-0 text-secondary">Viaja a <span class="text-dark fw-bold">Huancavelica</span></p>
                                <a href="#" class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold">Ver más</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                            <img src="${pageContext.request.contextPath}/imagenes/huanuco.jpg" class="card-img-top" alt="Huanuco">
                            <div class="card-body text-center">
                                <p class="destino-label mb-0 text-secondary">Viaja a <span class="text-dark fw-bold">Huanuco</span></p>
                                <a href="#" class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold">Ver más</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                            <img src="${pageContext.request.contextPath}/imagenes/huancayo.jpg" class="card-img-top" alt="Huancayo">
                            <div class="card-body text-center">
                                <p class="destino-label mb-0 text-secondary">Viaja a <span class="text-dark fw-bold">Huancayo</span></p>
                                <a href="#" class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold">Ver más</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                            <img src="${pageContext.request.contextPath}/imagenes/trujillo.jpg" class="card-img-top" alt="Trujillo">
                            <div class="card-body text-center">
                                <p class="destino-label mb-0 text-secondary">Viaja a <span class="text-dark fw-bold">Trujillo</span></p>
                                <a href="#" class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold">Ver más</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                            <img src="${pageContext.request.contextPath}/imagenes/chiclayo.jpg" class="card-img-top" alt="Chiclayo">
                            <div class="card-body text-center">
                                <p class="destino-label mb-0 text-secondary">Viaja a <span class="text-dark fw-bold">Chiclayo</span></p>
                                <a href="#" class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold">Ver más</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                            <img src="${pageContext.request.contextPath}/imagenes/puertoMaldonado.jpg" class="card-img-top" alt="Puerto Maldonado">
                            <div class="card-body text-center">
                                <p class="destino-label mb-0 text-secondary">Viaja a <span class="text-dark fw-bold">Puerto Maldonado</span></p>
                                <a href="#" class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold">Ver más</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                            <img src="${pageContext.request.contextPath}/imagenes/moquegua.jpg" class="card-img-top" alt="Moquegua">
                            <div class="card-body text-center">
                                <p class="destino-label mb-0 text-secondary">Viaja a <span class="text-dark fw-bold">Moquegua</span></p>
                                <a href="#" class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold">Ver más</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                            <img src="${pageContext.request.contextPath}/imagenes/pasco.jpg" class="card-img-top" alt="Cerro de Pasco">
                            <div class="card-body text-center">
                                <p class="destino-label mb-0 text-secondary">Viaja a <span class="text-dark fw-bold">Cerro de Pasco</span></p>
                                <a href="#" class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold">Ver más</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                            <img src="${pageContext.request.contextPath}/imagenes/piura.png" class="card-img-top" alt="Piura">
                            <div class="card-body text-center">
                                <p class="destino-label mb-0 text-secondary">Viaja a <span class="text-dark fw-bold">Piura</span></p>
                                <a href="#" class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold">Ver más</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                            <img src="${pageContext.request.contextPath}/imagenes/puno.jpg" class="card-img-top" alt="Puno">
                            <div class="card-body text-center">
                                <p class="destino-label mb-0 text-secondary">Viaja a <span class="text-dark fw-bold">Puno</span></p>
                                <a href="#" class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold">Ver más</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                            <img src="${pageContext.request.contextPath}/imagenes/moyobamba.png" class="card-img-top" alt="Moyobamba">
                            <div class="card-body text-center">
                                <p class="destino-label mb-0 text-secondary">Viaja a <span class="text-dark fw-bold">Moyobamba</span></p>
                                <a href="#" class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold">Ver más</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                            <img src="${pageContext.request.contextPath}/imagenes/tacna.jpg" class="card-img-top" alt="Tacna">
                            <div class="card-body text-center">
                                <p class="destino-label mb-0 text-secondary">Viaja a <span class="text-dark fw-bold">Tacna</span></p>
                                <a href="#" class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold">Ver más</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                            <img src="${pageContext.request.contextPath}/imagenes/tumbes.jpg" class="card-img-top" alt="Tumbes">
                            <div class="card-body text-center">
                                <p class="destino-label mb-0 text-secondary">Viaja a <span class="text-dark fw-bold">Tumbes</span></p>
                                <a href="#" class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold">Ver más</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                            <img src="${pageContext.request.contextPath}/imagenes/pucallpa.jpg" class="card-img-top" alt="Pucallpa">
                            <div class="card-body text-center">
                                <p class="destino-label mb-0 text-secondary">Viaja a <span class="text-dark fw-bold">Pucallpa</span></p>
                                <a href="#" class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold">Ver más</a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden bg-dark text-white">
                            <img src="${pageContext.request.contextPath}/imagenes/mixCiudades.jpg" class="card-img h-100 w-100" style="object-fit: cover; opacity: 0.5;" alt="Mix Ciudades">
                            <div class="card-img-overlay d-flex flex-column justify-content-center align-items-center">
                                <h4 class="fw-bold fs-3 text-uppercase shadow-sm">CiberBus</h4>
                                <p class="mb-0 small text-light">Tu mejor opción</p>
                            </div>
                        </div>
                    </div>

                </div> </div> </section>
    </main>

    <%@ include file="/shared/footer.jsp"%>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>   
</body>
</html>