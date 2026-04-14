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
	<style>
.carousel-item img {
	height: 650px;
	object-fit: cover;
	object-position: center;
	width: 100%;
}
</style>

	<%@ include file="/shared/navbar.jsp"%>

	<div class="container mt-3">
		<div class="card">
			<div class="card-body">

				<div class="container position-relative" style="z-index: 10;">
					<div class="row justify-content-center">
						<div
							class="col-11 col-lg-10 bg-white shadow-lg rounded-4 p-3 mt-n5">

							<!-- FORMULARIO -->

							<form id="formDatos" action="inicio" method="get">
								<div class="row g-2 align-items-center">

									<!-- Origen / Destino -->
									<div class="col-lg-5">
										<div class="row g-2">

											<!-- ORIGEN -->
											<div class="col-6">
												<div class="input-group border rounded-3">
													<span class="input-group-text bg-transparent border-0">
														<i class="bi bi-geo-alt"></i>
													</span> <select name="origen"
														class="form-select border-0 shadow-none py-3">
														<option value="">Origen</option>
														<c:forEach var="o" items="${listaOrigen}">
															<option value="${o}">${o}</option>
														</c:forEach>
													</select>
												</div>
											</div>

											<!-- DESTINO -->
											<div class="col-6">
												<div class="input-group border rounded-3">
													<select name="destino"
														class="form-select border-0 shadow-none py-3">
														<option value="">Destino</option>
													<c:forEach var="d" items="${listaDestino}">
															<option value="${d}">${d}</option>
														</c:forEach>
													</select>
												</div>
											</div>

										</div>
									</div>

									<!-- Fecha -->
									<div class="col-lg-4">
										<div class="input-group border rounded-3 h-100">
											<span class="input-group-text bg-transparent border-0">
												<i class="bi bi-calendar3"></i>
											</span> <select name="fecha"
												class="form-select border-0 shadow-none py-3">
												<option value="" selected disabled>¿Cuándo viajas?</option>
												<option value="hoy">Hoy</option>
												<option value="mañana">Mañana</option>
											</select>
										</div>
									</div>

									<!-- BOTÓN -->
									<div class="col-lg-3">
									<a href="${pageContext.request.contextPath}/pasajes/busquedaPasajes.jsp"
										class="btn btn-warning w-100 py-3 fw-bold rounded-3 shadow-sm">
										<i class="bi bi-search me-2"></i> BUSCAR
									</a>
								</div>

								</div>
							</form>

						</div>
					</div>
				</div>



			</div>
		</div>
	</div>

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
					<div class="carousel-caption d-none d-md-block"></div>
				</div>

				<div class="carousel-item">
					<img src="imagenes/banner_inicio_02.png" class="d-block w-100"
						alt="Destino 2">
					<div class="carousel-caption d-none d-md-block"></div>
				</div>

				<div class="carousel-item">
					<img src="imagenes/banner_inicio_03.png" class="d-block w-100"
						alt="Destino 3">
					<div class="carousel-caption d-none d-md-block"></div>
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


	<style>
/* TRUCO config de img destino */
.card-img-top {
	height: 200px;
	object-fit: cover;
}

.destino-label {
	color: #6c757d; /* Gris para "Viaja a" */
	font-size: 0.9rem;
}
</style>

	<div class="container mt-5">
		<h1 class="text-center py-4 fw-bold">¡Te llevamos a diferentes
			destinos!</h1>
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
							<a href="#" class="btn btn-warning px-3">Ver más</a>
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
							<a href="#" class="btn btn-warning px-3">Ver más</a>
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
							<a href="#" class="btn btn-warning px-3">Ver más</a>
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
							<a href="#" class="btn btn-warning px-3">Ver más</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<div class="container mt-5" style="margin-bottom: 120px;">
		<div class="row">
			<div class="col-12 text-center">
				<a href="${pageContext.request.contextPath}/destinos/destino.jsp"
					class="btn px-5 py-3 fw-bold shadow-sm"
					style="background-color: #4f699c; color: white; border-radius: 10px; border: none; display: inline-block; text-decoration: none;">
					VER TODOS LOS DESTINOS </a>
			</div>
		</div>
	</div>

	<%@ include file="/shared/footer.jsp"%>


	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>

	<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>


	<script type="text/javascript">
    $(() => {
        $("#formDatos").validate({
            rules: {
                origen: {
                    required: true
                },
                destino: {
                    required: true
                },
                fecha: {
                    required: true
                }
            },
            messages: {
                origen: {
                    required: 'El campo origen es requerido'
                },
                destino: {
                    required: 'El campo destino es requerido'
                },
                fecha: {
                    required: 'El campo fecha es requerido'
                }
            },
            // Esta parte es para que el mensaje no descuadre tus iconos de Bootstrap
            errorElement: "div",
            errorClass: "text-danger small",
            errorPlacement: function(error, element) {
                error.insertAfter(element.closest('.input-group'));
            }
        });
    });
</script>

</body>
</html>



