<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Ruta"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Inicio - CiberBus</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="CSS/inicio.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body class="d-flex flex-column min-vh-100">

	<%@ include file="/shared/navbar.jsp"%>

    <%
    	ArrayList<Ruta> listaOrigen = (ArrayList<Ruta>) request.getAttribute("listaOrigen");
    	ArrayList<Ruta> listaDestino = (ArrayList<Ruta>) request.getAttribute("listaDestino");
        
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

	<section>
		<div id="miCarrusel" class="carousel slide" data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#miCarrusel"
					data-bs-slide-to="0" class="active"></button>
				<button type="button" data-bs-target="#miCarrusel"
					data-bs-slide-to="1"></button>
				<button type="button" data-bs-target="#miCarrusel"
					data-bs-slide-to="2"></button>
			</div>

			<div class="carousel-inner">
				<div class="carousel-item active">
					<img src="imagenes/banner_inicio_01.png" class="d-block w-100"
						alt="Destino 1">
					<div
						class="carousel-caption d-none d-md-flex flex-column justify-content-center h-100 top-0">
						<h2 class="display-5 fw-bold">Explora nuevos horizontes</h2>
						<p class="fs-4">Viaja con la comodidad que te mereces.</p>
					</div>
				</div>

				<div class="carousel-item">
					<img src="imagenes/banner_inicio_02.png" class="d-block w-100"
						alt="Destino 2">

				</div>

				<div class="carousel-item">
					<img src="imagenes/banner_inicio_03.png" class="d-block w-100"
						alt="Destino 3">
				</div>
			</div>

			<button class="carousel-control-prev" type="button"
				data-bs-target="#miCarrusel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon"></span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#miCarrusel" data-bs-slide="next">
				<span class="carousel-control-next-icon"></span>
			</button>
		</div>
	</section>

	<br>

	<div class="container mb-4">
		<div class="card buscador-card border-0">
			<div class="card-body p-4 bg-white rounded-4">
				<h4 class="boton-pasaje fw-bold mb-4 text-center">
					<i class="bi bi-search"></i> Busca tu próximo viaje
				</h4>

				<form id="formBusqueda" action="inicio?opcion=buscarDestinos"
					method="post">
					<div class="row g-3 ">

						<div class="col-md-3">
							<label class="form-label fw-bold">Origen</label> <select
								class="form-select form-select-lg" name="origenId"
								onchange="buscarDestinos();">
								<option value="">Seleccione origen</option>
								<%
								if (listaOrigen != null) {
									for (Ruta r : listaOrigen) {
										String selected = (ciudadOrigenId == r.getIdCiudadOrigen()) ? "selected" : "";
								%>
								<option value="<%=r.getIdCiudadOrigen()%>" <%=selected%>>
									<%=r.getCiudadOrigen()%>
								</option>
								<%
								}
								}
								%>
							</select>
						</div>

						<div class="col-md-3">
							<label class="form-label fw-bold">Destino</label> <select
								class="form-select form-select-lg" name="rutaId">
								<option value="">Seleccione destino</option>
								<%
								if (listaDestino != null) {
									for (Ruta r : listaDestino) {
										String selected = (rutaId == r.getIdRuta()) ? "selected" : "";
								%>
								<option value="<%=r.getIdRuta()%>" <%=selected%>>
									<%=r.getCiudadDestino()%>
								</option>
								<%
								}
								}
								%>
							</select>
						</div>

						<div class="col-md-2 ">
							<label class="form-label fw-bold">Fecha de Partida</label> <input
								type="date" class="form-control form-control-lg"
								name="fechaViaje" value="<%=fechaViaje%>">
						</div>

						<div class="col-md-2 ">
							<label class="form-label fw-bold">Fecha de Retorno</label> <input
								type="date" class="form-control form-control-lg"
								name="fechaViaje" value="<%=fechaViaje%>">
						</div>

						<div class="col-md-2 d-flex align-items-end">
							<button type="button"
								class="btn btn-warning btn-lg w-100 fw-bold"
								onclick="buscarRutas();">
								<i class="bi bi-bus-front-fill"></i> Buscar Pasajes
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>



	<div class="container mt-5">
		<h2 class="titulo-destinos text-center py-4 fw-bold">¡Te llevamos
			a diferentes destinos!</h2>
		<div class="row">
			<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
				<div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
					<img src="imagenes/abancay.png" class="card-img-top">
					<div class="card-body">
						<p class="destino-label mb-0">
							Viaja a <span class="text-dark fw-bold">Abancay</span>
						</p>
						<small class="text-secondary">Saliendo de Lima</small>
						<div class="d-flex justify-content-end mt-3">
							<a href="#" class="btn btn-outline-primary px-3"
								data-bs-toggle="modal" data-bs-target="#infoAbancay">Ver más</a>
						</div>
					</div>
				</div>
			</div>

			<div class="modal fade" id="infoAbancay" tabindex="-1"
				aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header bg-primary text-white">
							<h5 class="modal-title">
								<i class="bi bi-geo-alt-fill me-2"></i> Abancay
							</h5>
							<button type="button" class="btn-close btn-close-white"
								data-bs-dismiss="modal"></button>
						</div>
						<div class="modal-body text-center">
							<img src="./imagenesModal/abancayModal.png"
								class="img-fluid rounded mb-3 shadow" alt="Abancay">
							<p>Abancay, capital de Apurímac, es conocida como la “Ciudad
								de la Eterna Primavera” por su clima templado y sus paisajes
								andinos.</p>
						</div>
						<div class="modal-footer">
							<button type="button"
								class="btn btn-outline-primary rounded-pill"
								data-bs-dismiss="modal">Cerrar</button>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
				<div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
					<img src="imagenes/arequipa.png" class="card-img-top">
					<div class="card-body">
						<p class="destino-label mb-0">
							Viaja a <span class="text-dark fw-bold">Arequipa</span>
						</p>
						<small class="text-secondary">Saliendo de Lima</small>
						<div class="d-flex justify-content-end mt-3">
							<a href="#" class="btn btn-outline-primary px-3"
								data-bs-toggle="modal" data-bs-target="#infoArequipa">Ver
								más</a>
						</div>
					</div>
				</div>
			</div>

			<div class="modal fade" id="infoArequipa" tabindex="-1"
				aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header bg-primary text-white">
							<h5 class="modal-title">
								<i class="bi bi-geo-alt-fill me-2"></i> Arequipa
							</h5>
							<button type="button" class="btn-close btn-close-white"
								data-bs-dismiss="modal"></button>
						</div>
						<div class="modal-body text-center">
							<img src="./imagenesModal/arequipaModal.png"
								class="img-fluid rounded mb-3 shadow" alt="Arequipa">
							<p>Arequipa, conocida como la “Ciudad Blanca”, destaca por su
								arquitectura colonial, el imponente volcán Misti y su variada
								gastronomía.</p>
						</div>
						<div class="modal-footer">
							<button type="button"
								class="btn btn-outline-primary rounded-pill"
								data-bs-dismiss="modal">Cerrar</button>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
				<div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
					<img src="imagenes/ayacucho.png" class="card-img-top">
					<div class="card-body">
						<p class="destino-label mb-0">
							Viaja a <span class="text-dark fw-bold">Ayacucho</span>
						</p>
						<small class="text-secondary">Saliendo de Lima</small>
						<div class="d-flex justify-content-end mt-3">
							<a href="#" class="btn btn-outline-primary px-3"
								data-bs-toggle="modal" data-bs-target="#infoAyacucho">Ver
								más</a>
						</div>
					</div>
				</div>
			</div>

			<div class="modal fade" id="infoAyacucho" tabindex="-1"
				aria-hidden="true">
				<div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
						<div class="modal-header bg-primary text-white">
							<h5 class="modal-title">
								<i class="bi bi-geo-alt-fill me-2"></i> Ayacucho
							</h5>
							<button type="button" class="btn-close btn-close-white"
								data-bs-dismiss="modal"></button>
						</div>
						<div class="modal-body text-center">
							<img src="./imagenesModal/ayacuchoModal.png"
								class="img-fluid rounded mb-3 shadow" alt="Ayacucho">
							<p>Ayacucho es conocida como la “Ciudad de las Iglesias”,
								destacando por su arquitectura colonial, su historia y sus
								celebraciones religiosas.</p>
						</div>
						<div class="modal-footer">
							<button type="button"
								class="btn btn-outline-primary rounded-pill"
								data-bs-dismiss="modal">Cerrar</button>
						</div>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-4 col-sm-6 mb-4">
				<div class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
					<img src="imagenes/Amazonas.png" class="card-img-top">
					<div class="card-body">
						<p class="destino-label mb-0">
							Viaja a <span class="text-dark fw-bold">Amazonas</span>
						</p>
						<small class="text-secondary">Saliendo de Lima</small>
						<div class="d-flex justify-content-end mt-3">
							<a href="#" class="btn btn-outline-primary px-3"
								data-bs-toggle="modal" data-bs-target="#infoChachapoyas">Ver
								más</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="infoChachapoyas" tabindex="-1"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header bg-primary text-white">
					<h5 class="modal-title">
						<i class="bi bi-geo-alt-fill me-2"></i> Chachapoyas
					</h5>
					<button type="button" class="btn-close btn-close-white"
						data-bs-dismiss="modal"></button>
				</div>
				<div class="modal-body text-center">
					<img src="./imagenesModal/chachapoyasModal.png"
						class="img-fluid rounded mb-3 shadow" alt="Amazonas">
					<p>Chachapoyas es conocida por su naturaleza exuberante y
						sitios arqueológicos como la fortaleza de Kuélap.</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-outline-primary rounded-pill"
						data-bs-dismiss="modal">Cerrar</button>
				</div>
			</div>
		</div>
	</div>

	<div class="container mt-5 mb-5 text-center">
		<a href="destino"
			class="btn px-5 py-3 fw-bold shadow rounded-3 text-white"
			style="background-color: #4f699c;"> VER TODOS LOS DESTINOS </a>
	</div>

	<div class="container w-75 my-4 px-5">
		<img src="./imagenes/bannerCiberbusInicio.png"
			class="img-fluid w-100 banner-ciberbus" alt="Banner CiberBus">
	</div>





	<section class="py-5 bg-transparent">
		<div class="container py-5">

			<div class="text-center mb-5">
				<h2 class="text-dark fw-bold">¿Por qué escogernos?</h2>
				<div class="mx-auto border-top border-3 border-dark opacity-25 w-25"></div>
			</div>

			<div class="row g-4 justify-content-center align-items-center">

				<div
					class="col-6 col-md-4 col-lg-2 text-center d-flex flex-column align-items-center">
					<div class="mb-3 w-50">
						<div
							class="ratio ratio-1x1 border border-2 border-dark rounded-circle bg-dark bg-opacity-10 d-flex align-items-center justify-content-center">
							<div class="d-flex align-items-center justify-content-center">
								<i class="fas fa-map-marked-alt fs-5 text-dark"></i>
							</div>
						</div>
					</div>
					<h6 class="text-dark fw-bold mb-0 small">Empresa</h6>
					<p class="text-muted small">100% Peruana</p>
				</div>

				<div
					class="col-6 col-md-4 col-lg-2 text-center d-flex flex-column align-items-center">
					<div class="mb-3 w-50">
						<div
							class="ratio ratio-1x1 border border-2 border-dark rounded-circle bg-dark bg-opacity-10 d-flex align-items-center justify-content-center">
							<div class="d-flex align-items-center justify-content-center">
								<i class="fas fa-award fs-5 text-dark"></i>
							</div>
						</div>
					</div>
					<h6 class="text-dark fw-bold mb-0 small">63 Años</h6>
					<p class="text-muted small">de experiencia</p>
				</div>

				<div
					class="col-6 col-md-4 col-lg-2 text-center d-flex flex-column align-items-center">
					<div class="mb-3 w-50">
						<div
							class="ratio ratio-1x1 border border-2 border-dark rounded-circle bg-dark bg-opacity-10 d-flex align-items-center justify-content-center">
							<div class="d-flex align-items-center justify-content-center">
								<i class="fas fa-route fs-5 text-dark"></i>
							</div>
						</div>
					</div>
					<h6 class="text-dark fw-bold mb-0 small">24 Destinos</h6>
					<p class="text-muted small">nacionales</p>
				</div>

				<div
					class="col-6 col-md-4 col-lg-2 text-center d-flex flex-column align-items-center">
					<div class="mb-3 w-50">
						<div
							class="ratio ratio-1x1 border border-2 border-dark rounded-circle bg-dark bg-opacity-10 d-flex align-items-center justify-content-center">
							<div class="d-flex align-items-center justify-content-center">
								<i class="fas fa-user-check fs-5 text-dark"></i>
							</div>
						</div>
					</div>
					<h6 class="text-dark fw-bold mb-0 small">+5 Millones</h6>
					<p class="text-muted small">de clientes</p>
				</div>

				<div
					class="col-6 col-md-4 col-lg-2 text-center d-flex flex-column align-items-center">
					<div class="mb-3 w-50">
						<div
							class="ratio ratio-1x1 border border-2 border-dark rounded-circle bg-dark bg-opacity-10 d-flex align-items-center justify-content-center">
							<div class="d-flex align-items-center justify-content-center">
								<i class="fas fa-shield-alt fs-5 text-dark"></i>
							</div>
						</div>
					</div>
					<h6 class="text-dark fw-bold mb-0 small">Transporte</h6>
					<p class="text-muted small">seguro</p>
				</div>

				<div
					class="col-6 col-md-4 col-lg-2 text-center d-flex flex-column align-items-center">
					<div class="mb-3 w-50">
						<div
							class="ratio ratio-1x1 border border-2 border-dark rounded-circle bg-dark bg-opacity-10 d-flex align-items-center justify-content-center">
							<div class="d-flex align-items-center justify-content-center">
								<i class="fas fa-couch fs-5 text-dark"></i>
							</div>
						</div>
					</div>
					<h6 class="text-dark fw-bold mb-0 small">Asientos</h6>
					<p class="text-muted small">cómodos</p>
				</div>

			</div>
		</div>
	</section>

	<%@ include file="/shared/footer.jsp"%>

	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>

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