<%@page import="java.util.List"%>
<%@page import="entidades.Ruta"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inicio - CiberBus</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="css/inicio.css">
</head>
<body>

    <%@ include file="/shared/navbar.jsp"%>

    <%
        List<Ruta> listaOrigen = (List<Ruta>) request.getAttribute("listaOrigen");
        List<Ruta> listaDestino = (List<Ruta>) request.getAttribute("listaDestino");
        
        int ciudadOrigenId = 0;
        int rutaId = 0;
        String fechaViaje = "";
        
        if (request.getAttribute("origenId") != null)
           ciudadOrigenId = Integer.parseInt("" + request.getAttribute("origenId"));
        
        if (request.getAttribute("rutaId") != null)
           rutaId = Integer.parseInt("" + request.getAttribute("rutaId"));
        
        if (request.getAttribute("fechaViaje") != null)
           fechaViaje = "" + request.getAttribute("fechaViaje");
    %>
    
    <section>
       <div id="miCarrusel" class="carousel slide mt-3" data-bs-ride="carousel">
          <div class="carousel-indicators">
             <button type="button" data-bs-target="#miCarrusel" data-bs-slide-to="0" class="active"></button>
             <button type="button" data-bs-target="#miCarrusel" data-bs-slide-to="1"></button>
             <button type="button" data-bs-target="#miCarrusel" data-bs-slide-to="2"></button>
          </div>
          <div class="carousel-inner rounded-4">
             <div class="carousel-item active">
                <img src="imagenes/banner_inicio_01.png" class="d-block w-100" alt="Destino 1">
             </div>
             <div class="carousel-item">
                <img src="imagenes/banner_inicio_02.png" class="d-block w-100" alt="Destino 2">
             </div>
             <div class="carousel-item">
                <img src="imagenes/banner_inicio_03.png" class="d-block w-100" alt="Destino 3">
             </div>
          </div>
          <button class="carousel-control-prev" type="button" data-bs-target="#miCarrusel" data-bs-slide="prev">
             <span class="carousel-control-prev-icon"></span>
          </button>
          <button class="carousel-control-next" type="button" data-bs-target="#miCarrusel" data-bs-slide="next">
             <span class="carousel-control-next-icon"></span>
          </button>
       </div>
    </section>

    <div class="container mb-4">
        <div class="card buscador-card border-0">
            <div class="card-body p-4 bg-white rounded-4">
                <h4 class="fw-bold mb-4 text-center" style="color: #4f699c;"><i class="bi bi-search"></i> Busca tu próximo viaje</h4>
                
                <form id="formBusqueda" action="inicio?opcion=buscarDestinos" method="post">
                    <div class="row g-3 align-items-center">
                        
                        <div class="col-md-3">
                            <label class="form-label fw-bold">Origen</label>
                            <select class="form-select form-select-lg" name="origenId" onchange="buscarDestinos();">
                                <option value="">Seleccione origen</option>
                                <%
                                   if(listaOrigen != null){
                                      for(Ruta r : listaOrigen){
                                         String selected = (ciudadOrigenId == r.getIdCiudadOrigen()) ? "selected" : "";
                                %>
                                   <option value="<%= r.getIdCiudadOrigen() %>" <%= selected %>>
                                      <%= r.getCiudadOrigen() %>
                                   </option>
                                <%
                                      }
                                   }
                                %>
                            </select>
                        </div>
                        
                        <div class="col-md-3">
                            <label class="form-label fw-bold">Destino</label>
                            <select class="form-select form-select-lg" name="rutaId">
                                <option value="">Seleccione destino</option>
                                <%
                                   if(listaDestino != null){
                                      for(Ruta r : listaDestino){
                                         String selected = (rutaId == r.getIdRuta()) ? "selected" : "";
                                %>
                                   <option value="<%= r.getIdRuta() %>" <%= selected %>>
                                      <%= r.getCiudadDestino() %>
                                   </option>
                                <%
                                      }
                                   }
                                %>
                            </select>
                        </div>
                        
                        <div class="col-md-3">
                            <label class="form-label fw-bold">Fecha de viaje</label>
                            <input type="date" class="form-control form-control-lg" name="fechaViaje" value="<%= fechaViaje %>">
                        </div>
                        
                        <div class="col-md-3 mt-auto">
                            <button type="button" class="btn btn-warning btn-lg w-100 fw-bold" onclick="buscarRutas();">
                                <i class="bi bi-bus-front-fill"></i> Buscar Pasajes
                            </button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    

    <div class="container mt-5">
       <h2 class="text-center py-4 fw-bold" style="color: #4f699c;">¡Te llevamos a diferentes destinos!</h2>
       <div class="row">
          <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
             <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                <img src="imagenes/abancay.png" class="card-img-top">
                <div class="card-body">
                   <p class="destino-label mb-0">Viaja a <span class="text-dark fw-bold">Abancay</span></p>
                   <small class="text-secondary">Saliendo de Lima</small>
                   <div class="d-flex justify-content-end mt-3">
                      <a href="#" class="btn btn-outline-primary px-3">Ver más</a>
                   </div>
                </div>
             </div>
          </div>

          <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
             <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                <img src="imagenes/arequipa.png" class="card-img-top">
                <div class="card-body">
                   <p class="destino-label mb-0">Viaja a <span class="text-dark fw-bold">Arequipa</span></p>
                   <small class="text-secondary">Saliendo de Lima</small>
                   <div class="d-flex justify-content-end mt-3">
                      <a href="#" class="btn btn-outline-primary px-3">Ver más</a>
                   </div>
                </div>
             </div>
          </div>

          <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
             <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                <img src="imagenes/ayacucho.png" class="card-img-top">
                <div class="card-body">
                   <p class="destino-label mb-0">Viaja a <span class="text-dark fw-bold">Ayacucho</span></p>
                   <small class="text-secondary">Saliendo de Lima</small>
                   <div class="d-flex justify-content-end mt-3">
                      <a href="#" class="btn btn-outline-primary px-3">Ver más</a>
                   </div>
                </div>
             </div>
          </div>

          <div class="col-lg-3 col-md-4 col-sm-6 mb-4">
             <div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
                <img src="imagenes/Amazonas.png" class="card-img-top">
                <div class="card-body">
                   <p class="destino-label mb-0">Viaja a <span class="text-dark fw-bold">Amazonas</span></p>
                   <small class="text-secondary">Saliendo de Lima</small>
                   <div class="d-flex justify-content-end mt-3">
                      <a href="#" class="btn btn-outline-primary px-3">Ver más</a>
                   </div>
                </div>
             </div>
          </div>
       </div>
    </div>

    <div class="container mt-4" style="margin-bottom: 120px;">
       <div class="row">
          <div class="col-12 text-center">
             <a href="${pageContext.request.contextPath}/destinos/destino.jsp"
                class="btn px-5 py-3 fw-bold shadow-sm"
                style="background-color: #4f699c; color: white; border-radius: 10px; border: none; display: inline-block; text-decoration: none;">
                VER TODOS LOS DESTINOS 
             </a>
          </div>
       </div>
    </div>

    <%@ include file="/shared/footer.jsp"%>

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>

    <script type="text/javascript">
        function buscarDestinos() {
           document.getElementById("formBusqueda").action = "inicio?opcion=buscarDestinos";
           document.getElementById("formBusqueda").submit();
        }
        
        function buscarRutas() {
           if ($("#formBusqueda").valid()) {
              document.getElementById("formBusqueda").action = "viaje?opcion=listarViajes";
              document.getElementById("formBusqueda").submit();
           }
        }

        $(() => {
           $('#formBusqueda').validate({
              rules: {
                 origenId: { required: true },
                 rutaId: { required: true },
                 fechaViaje: { required: true }
              },
              messages: {
                 origenId: { required: 'Debe seleccionar el origen' },
                 rutaId: { required: 'Debe seleccionar el destino' },
                 fechaViaje: { required: 'Debe seleccionar la fecha de viaje' }
              },
              errorElement: "div",
              errorClass: "text-danger small mt-1",
              errorPlacement: function(error, element) {
                  error.insertAfter(element);
              }
           });
        });
    </script>
</body>
</html>