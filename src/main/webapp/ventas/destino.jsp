<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Destinos - CiberBus</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">

<link rel="stylesheet" href="CSS/destino.css">
</head>
<body class="d-flex flex-column min-vh-100">


		<%@ include file="/shared/navbar.jsp"%>

  
	<section class="m-0 p-0" >
		<img src="imagenes/bannerDestino.png" class="w-100 d-block banner-destino01">
	</section>

	<main class="flex-grow-1 ">
		<section class="py-5 bg-light">
			<div class="container">

				<div class="text-center mb-5">
					<h2 class="titulo-destino fw-bold text-uppercase">Destinos</h2>
					<p class="text-muted">Explora los destinos más populares</p>
					<hr class="espacio mx-auto">
				</div>

				<div class="row g-4">


					<div class="col-lg-3 col-md-4 col-sm-6">
						<div
							class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
							<img
								src="./imagenes/plazaLima.png"
								class="card-img-top"  alt="Lima">
							<div class="card-body text-center">
								<p class="destino-label mb-0 text-secondary">
									Viaja a <span class="text-dark fw-bold">Lima</span>
								</p>
								<a href="#"
									class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold"
									data-bs-toggle="modal" data-bs-target="#infoLima">Ver más</a>
							</div>
						</div>
					</div>

					<div class="modal fade" id="infoLima" tabindex="-1"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content  ">
								<div class="modal-header bg-primary text-white">
									<h5 class="modal-title">
										<i class="bi bi-geo-alt-fill me-2"></i> Lima
									</h5>
									<button type="button" class="btn-close btn-close-white"
										data-bs-dismiss="modal"></button>
								</div>
								<div class="modal-body text-center">
									<img
										src="./imagenesModal/limaModal.png"
										class="img-fluid rounded mb-3 shadow" alt="Lima">
									<p>Lima es la capital del Perú, reconocida por su centro
										histórico, la Costa Verde y su gastronomía de nivel mundial.</p>
								</div>
								<div class="modal-footer">
									<button type="button"
										class="btn btn-outline-primary rounded-pill"
										data-bs-dismiss="modal">Cerrar</button>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-3 col-md-4 col-sm-6">
						<div
							class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
							<img
								src="./imagenes/huacachinaIca.png"
								class="card-img-top" alt="Ica">
							<div class="card-body text-center">
								<p class="destino-label mb-0 text-secondary">
									Viaja a <span class="text-dark fw-bold">Ica</span>
								</p>
								<a href="#"
									class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold"
									data-bs-toggle="modal" data-bs-target="#infoIca">Ver más</a>
							</div>
						</div>
					</div>
					<div class="modal fade" id="infoIca" tabindex="-1"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header bg-primary text-white">
									<h5 class="modal-title">
										<i class="bi bi-geo-alt-fill me-2"></i> Ica
									</h5>
									<button type="button" class="btn-close btn-close-white"
										data-bs-dismiss="modal"></button>
								</div>
								<div class="modal-body text-center">
									<img
										src="./imagenesModal/icaModal.png"
										class="img-fluid rounded mb-3 shadow" alt="Ica">
									<p>Ica es famosa por su oasis de Huacachina, sus viñedos y
										las dunas del desierto que ofrecen experiencias únicas.</p>
								</div>
								<div class="modal-footer">
									<button type="button"
										class="btn btn-outline-primary rounded-pill"
										data-bs-dismiss="modal">Cerrar</button>
								</div>
							</div>
						</div>
					</div>





					<div class="col-lg-3 col-md-4 col-sm-6">
						<div
							class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
							<img
								src="./imagenes/plazaCusco.png"
								class="card-img-top" alt="Cusco">
							<div class="card-body text-center">
								<p class="destino-label mb-0 text-secondary">
									Viaja a <span class="text-dark fw-bold">Cusco</span>
								</p>
								<a href="#"
									class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold"
									data-bs-toggle="modal" data-bs-target="#infoCusco">Ver más</a>
							</div>
						</div>
					</div>
					<div class="modal fade" id="infoCusco" tabindex="-1"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header bg-primary text-white">
									<h5 class="modal-title">
										<i class="bi bi-geo-alt-fill me-2"></i> Cusco
									</h5>
									<button type="button" class="btn-close btn-close-white"
										data-bs-dismiss="modal"></button>
								</div>
								<div class="modal-body text-center">
									<img
										src="./imagenesModal/cuscoModal.png"
										class="img-fluid rounded mb-3 shadow" alt="Cusco">
									<p>Cusco es la capital histórica del Perú y puerta de
										entrada a Machu Picchu, con una mezcla única de cultura inca y
										colonial.</p>
								</div>
								<div class="modal-footer">
									<button type="button"
										class="btn btn-outline-primary rounded-pill"
										data-bs-dismiss="modal">Cerrar</button>
								</div>
							</div>
						</div>
					</div>


					<div class="col-lg-3 col-md-4 col-sm-6">
						<div
							class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
							<img
								src="./imagenes/Amazonas.png"
								class="card-img-top" alt="Amazonas">
							<div class="card-body text-center">
								<p class="destino-label mb-0 text-secondary">
									Viaja a <span class="text-dark fw-bold">Chachapoyas</span>
								</p>
								<a href="#"
									class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold"
									data-bs-toggle="modal" data-bs-target="#infoChachapoyas">Ver
									más</a>
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
									<img
										src="./imagenesModal/chachapoyasModal.png"
										class="img-fluid rounded mb-3 shadow" alt="Amazonas">
									<p>Chachapoyas es conocida por su naturaleza exuberante y
										sitios arqueológicos como la fortaleza de Kuélap.</p>
								</div>
								<div class="modal-footer">
									<button type="button"
										class="btn btn-outline-primary rounded-pill"
										data-bs-dismiss="modal">Cerrar</button>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-3 col-md-4 col-sm-6">
						<div
							class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
							<img src="./imagenes/huaraz.png"
								class="card-img-top" alt="Huaraz">
							<div class="card-body text-center">
								<p class="destino-label mb-0 text-secondary">
									Viaja a <span class="text-dark fw-bold">Huaraz</span>
								</p>
								<a href="#"
									class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold"
									data-bs-toggle="modal" data-bs-target="#infoHuaraz">Ver más</a>
							</div>
						</div>
					</div>

					<div class="modal fade" id="infoHuaraz" tabindex="-1"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header bg-primary text-white">
									<h5 class="modal-title">
										<i class="bi bi-geo-alt-fill me-2"></i> Huaraz
									</h5>
									<button type="button" class="btn-close btn-close-white"
										data-bs-dismiss="modal"></button>
								</div>
								<div class="modal-body text-center">
									<img
										src="./imagenesModal/huarazModal.png"
										class="img-fluid rounded mb-3 shadow" alt="Huaraz">
									<p>Huaraz es la capital del alpinismo peruano, ubicada en
										la Cordillera Blanca y famosa por sus paisajes nevados.</p>
								</div>
								<div class="modal-footer">
									<button type="button"
										class="btn btn-outline-primary rounded-pill"
										data-bs-dismiss="modal">Cerrar</button>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-3 col-md-4 col-sm-6">
						<div
							class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
							<img
								src="./imagenes/abancay.png"
								class="card-img-top" alt="Abancay">
							<div class="card-body text-center">
								<p class="destino-label mb-0 text-secondary">
									Viaja a <span class="text-dark fw-bold">Abancay</span>
								</p>
								<a href="#"
									class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold"
									data-bs-toggle="modal" data-bs-target="#infoAbancay">Ver
									más</a>

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
									<img
										src="./imagenesModal/abancayModal.png"
										class="img-fluid rounded mb-3 shadow" alt="Abancay">
									<p>Abancay, capital de Apurímac, es conocida como la
										“Ciudad de la Eterna Primavera” por su clima templado y sus
										paisajes andinos.</p>
								</div>
								<div class="modal-footer">
									<button type="button"
										class="btn btn-outline-primary rounded-pill"
										data-bs-dismiss="modal">Cerrar</button>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-3 col-md-4 col-sm-6">
						<div
							class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
							<img
								src="./imagenes/arequipa.png"
								class="card-img-top" alt="Arequipa">
							<div class="card-body text-center">
								<p class="destino-label mb-0 text-secondary">
									Viaja a <span class="text-dark fw-bold">Arequipa</span>
								</p>
								<a href="#"
									class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold"
									data-bs-toggle="modal" data-bs-target="#infoArequipa">Ver
									más</a>
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
									<img
										src="./imagenesModal/arequipaModal.png"
										class="img-fluid rounded mb-3 shadow" alt="Arequipa">
									<p>Arequipa, conocida como la “Ciudad Blanca”, destaca por
										su arquitectura colonial, el imponente volcán Misti y su
										variada gastronomía.</p>
								</div>
								<div class="modal-footer">
									<button type="button"
										class="btn btn-outline-primary rounded-pill"
										data-bs-dismiss="modal">Cerrar</button>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-3 col-md-4 col-sm-6">
						<div
							class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
							<img
								src="./imagenes/ayacucho.png"
								class="card-img-top" alt="Ayacucho">
							<div class="card-body text-center">
								<p class="destino-label mb-0 text-secondary">
									Viaja a <span class="text-dark fw-bold">Ayacucho</span>
								</p>
								<a href="#"
									class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold"
									data-bs-toggle="modal" data-bs-target="#infoAyacucho">Ver
									más</a>
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
									<img
										src="./imagenesModal/ayacuchoModal.png"
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

					<div class="col-lg-3 col-md-4 col-sm-6">
						<div
							class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
							<img
								src="./imagenes/cajamarca.jpg"
								class="card-img-top" alt="Cajamarca">
							<div class="card-body text-center">
								<p class="destino-label mb-0 text-secondary">
									Viaja a <span class="text-dark fw-bold">Cajamarca</span>
								</p>
								<a href="#"
									class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold"
									data-bs-toggle="modal" data-bs-target="#infoCajamarca">Ver
									más</a>
							</div>
						</div>
					</div>

					<div class="modal fade" id="infoCajamarca" tabindex="-1"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header bg-primary text-white">
									<h5 class="modal-title">
										<i class="bi bi-geo-alt-fill me-2"></i> Cajamarca
									</h5>
									<button type="button" class="btn-close btn-close-white"
										data-bs-dismiss="modal"></button>
								</div>
								<div class="modal-body text-center">
									<img
										src="./imagenesModal/cajamarcaModal.png"
										class="img-fluid rounded mb-3 shadow" alt="Cajamarca">
									<p>Cajamarca es célebre por sus carnavales, sus aguas
										termales y por ser escenario histórico del encuentro entre los
										incas y los españoles.</p>
								</div>
								<div class="modal-footer">
									<button type="button"
										class="btn btn-outline-primary rounded-pill"
										data-bs-dismiss="modal">Cerrar</button>
								</div>
							</div>
						</div>
					</div>


					<div class="col-lg-3 col-md-4 col-sm-6">
						<div
							class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
							<img
								src="./imagenes/huancavelica.jpg"
								class="card-img-top" alt="Huancavelica">
							<div class="card-body text-center">
								<p class="destino-label mb-0 text-secondary">
									Viaja a <span class="text-dark fw-bold">Huancavelica</span>
								</p>
								<a href="#"
									class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold"
									data-bs-toggle="modal" data-bs-target="#infoHuancavelica">Ver
									más</a>
							</div>
						</div>
					</div>

					<div class="modal fade" id="infoHuancavelica" tabindex="-1"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header bg-primary text-white">
									<h5 class="modal-title">
										<i class="bi bi-geo-alt-fill me-2"></i> Huancavelica
									</h5>
									<button type="button" class="btn-close btn-close-white"
										data-bs-dismiss="modal"></button>
								</div>
								<div class="modal-body text-center">
									<img
										src="./imagenesModal/huancavelicaModal.png"
										class="img-fluid rounded mb-3 shadow" alt="Huancavelica">
									<p>Huancavelica es conocida por sus paisajes andinos, su
										tradición minera y sus aguas termales que atraen a visitantes
										en busca de descanso.</p>
								</div>
								<div class="modal-footer">
									<button type="button"
										class="btn btn-outline-primary rounded-pill"
										data-bs-dismiss="modal">Cerrar</button>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-3 col-md-4 col-sm-6">
						<div
							class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
							<img
								src="./imagenes/huanuco.jpg"
								class="card-img-top" alt="Huanuco">
							<div class="card-body text-center">
								<p class="destino-label mb-0 text-secondary">
									Viaja a <span class="text-dark fw-bold">Huanuco</span>
								</p>
								<a href="#"
									class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold"
									data-bs-toggle="modal" data-bs-target="#infoHuanuco">Ver
									más</a>
							</div>
						</div>
					</div>

					<div class="modal fade" id="infoHuanuco" tabindex="-1"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header bg-primary text-white">
									<h5 class="modal-title">
										<i class="bi bi-geo-alt-fill me-2"></i> Huanuco
									</h5>
									<button type="button" class="btn-close btn-close-white"
										data-bs-dismiss="modal"></button>
								</div>
								<div class="modal-body text-center">
									<img
										src="./imagenesModal/huanucoModal.png"
										class="img-fluid rounded mb-3 shadow" alt="Ica">
									<p>Huánuco es conocida como la “Ciudad del Mejor Clima del
										Mundo”, rodeada de paisajes andinos y amazónicos que la
										convierten en un destino diverso y acogedor.</p>
								</div>
								<div class="modal-footer">
									<button type="button"
										class="btn btn-outline-primary rounded-pill"
										data-bs-dismiss="modal">Cerrar</button>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-3 col-md-4 col-sm-6">
						<div
							class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
							<img
								src="./imagenes/huancayo.jpg"
								class="card-img-top" alt="Huancayo">
							<div class="card-body text-center">
								<p class="destino-label mb-0 text-secondary">
									Viaja a <span class="text-dark fw-bold">Huancayo</span>
								</p>
								<a href="#"
									class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold"
									data-bs-toggle="modal" data-bs-target="#infoHuancayo">Ver
									más</a>
							</div>
						</div>
					</div>

					<div class="modal fade" id="infoHuancayo" tabindex="-1"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header bg-primary text-white">
									<h5 class="modal-title">
										<i class="bi bi-geo-alt-fill me-2"></i> Huancayo
									</h5>
									<button type="button" class="btn-close btn-close-white"
										data-bs-dismiss="modal"></button>
								</div>
								<div class="modal-body text-center">
									<img
										src="./imagenesModal/huancayoModal.png"
										class="img-fluid rounded mb-3 shadow" alt="Huancayo">
									<p>Huancayo es la capital del Valle del Mantaro, reconocida
										por su feria dominical, su riqueza cultural y su importancia
										en la sierra central del Perú.</p>
								</div>
								<div class="modal-footer">
									<button type="button"
										class="btn btn-outline-primary rounded-pill"
										data-bs-dismiss="modal">Cerrar</button>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-3 col-md-4 col-sm-6">
						<div
							class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
							<img
								src="./imagenes/trujillo.jpg"
								class="card-img-top" alt="Trujillo">
							<div class="card-body text-center">
								<p class="destino-label mb-0 text-secondary">
									Viaja a <span class="text-dark fw-bold">Trujillo</span>
								</p>
								<a href="#"
									class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold"
									data-bs-toggle="modal" data-bs-target="#infoTrujillo">Ver
									más</a>
							</div>
						</div>
					</div>

					<div class="modal fade" id="infoTrujillo" tabindex="-1"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header bg-primary text-white">
									<h5 class="modal-title">
										<i class="bi bi-geo-alt-fill me-2"></i> Trujillo
									</h5>
									<button type="button" class="btn-close btn-close-white"
										data-bs-dismiss="modal"></button>
								</div>
								<div class="modal-body text-center">
									<img
										src="./imagenesModal/trujilloModal.png"
										class="img-fluid rounded mb-3 shadow" alt="Trujillo">
									<p>Trujillo es conocida como la “Capital de la Primavera”,
										famosa por sus festivales, la marinera y las huacas del Sol y
										de la Luna.</p>
								</div>
								<div class="modal-footer">
									<button type="button"
										class="btn btn-outline-primary rounded-pill"
										data-bs-dismiss="modal">Cerrar</button>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-3 col-md-4 col-sm-6">
						<div
							class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
							<img
								src="./imagenes/chiclayo.jpg"
								class="card-img-top" alt="Chiclayo">
							<div class="card-body text-center">
								<p class="destino-label mb-0 text-secondary">
									Viaja a <span class="text-dark fw-bold">Chiclayo</span>
								</p>
								<a href="#"
									class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold"
									data-bs-toggle="modal" data-bs-target="#infoChiclayo">Ver
									más</a>
							</div>
						</div>
					</div>

					<div class="modal fade" id="infoChiclayo" tabindex="-1"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header bg-primary text-white">
									<h5 class="modal-title">
										<i class="bi bi-geo-alt-fill me-2"></i> Chiclayo
									</h5>
									<button type="button" class="btn-close btn-close-white"
										data-bs-dismiss="modal"></button>
								</div>
								<div class="modal-body text-center">
									<img
										src="./imagenesModal/chiclayoModal.png"
										class="img-fluid rounded mb-3 shadow" alt="Chiclayo">
									<p>Chiclayo es conocida como la “Capital de la Amistad”,
										destacando por su hospitalidad, su gastronomía norteña y
										sitios arqueológicos como Túcume y Sipán.</p>
								</div>
								<div class="modal-footer">
									<button type="button"
										class="btn btn-outline-primary rounded-pill"
										data-bs-dismiss="modal">Cerrar</button>
								</div>
							</div>
						</div>
					</div>


					<div class="col-lg-3 col-md-4 col-sm-6">
						<div
							class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
							<img src="./imagenes/pasco.jpg"
								class="card-img-top" alt="Cerro de Pasco">
							<div class="card-body text-center">
								<p class="destino-label mb-0 text-secondary">
									Viaja a <span class="text-dark fw-bold">Cerro de Pasco</span>
								</p>
								<a href="#"
									class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold"
									data-bs-toggle="modal" data-bs-target="#infoPasco">Ver más</a>
							</div>
						</div>
					</div>

					<div class="modal fade" id="infoPasco" tabindex="-1"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header bg-primary text-white">
									<h5 class="modal-title">
										<i class="bi bi-geo-alt-fill me-2"></i> Cerro de Pasco
									</h5>
									<button type="button" class="btn-close btn-close-white"
										data-bs-dismiss="modal"></button>
								</div>
								<div class="modal-body text-center">
									<img
										src="./imagenesModal/pascoModal.png"
										class="img-fluid rounded mb-3 shadow" alt="Cerro de Pasco">
									<p>Cerro de Pasco es una ciudad minera ubicada en la sierra
										central, reconocida por su altitud y su importancia histórica
										en la explotación de minerales.</p>
								</div>
								<div class="modal-footer">
									<button type="button"
										class="btn btn-outline-primary rounded-pill"
										data-bs-dismiss="modal">Cerrar</button>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-3 col-md-4 col-sm-6">
						<div
							class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
							<img src="./imagenes/piura.png"
								class="card-img-top" alt="Piura">
							<div class="card-body text-center">
								<p class="destino-label mb-0 text-secondary">
									Viaja a <span class="text-dark fw-bold">Piura</span>
								</p>
								<a href="#"
									class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold"
									data-bs-toggle="modal" data-bs-target="#infoPiura">Ver más</a>
							</div>
						</div>
					</div>

					<div class="modal fade" id="infoPiura" tabindex="-1"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header bg-primary text-white">
									<h5 class="modal-title">
										<i class="bi bi-geo-alt-fill me-2"></i> Piura
									</h5>
									<button type="button" class="btn-close btn-close-white"
										data-bs-dismiss="modal"></button>
								</div>
								<div class="modal-body text-center">
									<img
										src="./imagenesModal/piuraModal.png"
										class="img-fluid rounded mb-3 shadow" alt="Piura">
									<p>Piura es famosa por sus playas cálidas como Máncora, su
										tradición artesanal y su deliciosa gastronomía norteña.</p>
								</div>
								<div class="modal-footer">
									<button type="button"
										class="btn btn-outline-primary rounded-pill"
										data-bs-dismiss="modal">Cerrar</button>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-3 col-md-4 col-sm-6">
						<div
							class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
							<img src="./imagenes/puno.jpg"
								class="card-img-top" alt="Puno">
							<div class="card-body text-center">
								<p class="destino-label mb-0 text-secondary">
									Viaja a <span class="text-dark fw-bold">Puno</span>
								</p>
								<a href="#"
									class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold"
									data-bs-toggle="modal" data-bs-target="#infoPuno">Ver más</a>
							</div>
						</div>
					</div>

					<div class="modal fade" id="infoPuno" tabindex="-1"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header bg-primary text-white">
									<h5 class="modal-title">
										<i class="bi bi-geo-alt-fill me-2"></i> Puno
									</h5>
									<button type="button" class="btn-close btn-close-white"
										data-bs-dismiss="modal"></button>
								</div>
								<div class="modal-body text-center">
									<img
										src="./imagenesModal/punoModal.png"
										class="img-fluid rounded mb-3 shadow" alt="Puno">
									<p>Puno es la capital del folclore peruano, famosa por la
										Fiesta de la Candelaria y por sus paisajes a orillas del lago
										Titicaca.</p>
								</div>
								<div class="modal-footer">
									<button type="button"
										class="btn btn-outline-primary rounded-pill"
										data-bs-dismiss="modal">Cerrar</button>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-3 col-md-4 col-sm-6">
						<div
							class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
							<img
								src="./imagenes/moyobamba.png"
								class="card-img-top" alt="Moyobamba">
							<div class="card-body text-center">
								<p class="destino-label mb-0 text-secondary">
									Viaja a <span class="text-dark fw-bold">Moyobamba</span>
								</p>
								<a href="#"
									class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold"
									data-bs-toggle="modal" data-bs-target="#infoMoyobamba">Ver
									más</a>
							</div>
						</div>
					</div>

					<div class="modal fade" id="infoMoyobamba" tabindex="-1"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header bg-primary text-white">
									<h5 class="modal-title">
										<i class="bi bi-geo-alt-fill me-2"></i> Moyobamba
									</h5>
									<button type="button" class="btn-close btn-close-white"
										data-bs-dismiss="modal"></button>
								</div>
								<div class="modal-body text-center">
									<img
										src="./imagenesModal/moyobambaModal.png"
										class="img-fluid rounded mb-3 shadow" alt="Moyobamba">
									<p>Moyobamba es la “Ciudad de las Orquídeas”, reconocida
										por su biodiversidad amazónica, sus miradores naturales y sus
										aguas termales.</p>
								</div>
								<div class="modal-footer">
									<button type="button"
										class="btn btn-outline-primary rounded-pill"
										data-bs-dismiss="modal">Cerrar</button>
								</div>
							</div>
						</div>
					</div>



					<div class="col-lg-3 col-md-4 col-sm-6">
						<div
							class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
							<img src="./imagenes/tumbes.jpg"
								class="card-img-top" alt="Tumbes">
							<div class="card-body text-center">
								<p class="destino-label mb-0 text-secondary">
									Viaja a <span class="text-dark fw-bold">Tumbes</span>
								</p>
								<a href="#"
									class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold"
									data-bs-toggle="modal" data-bs-target="#infoTumbes">Ver más</a>
							</div>
						</div>
					</div>

					<div class="modal fade" id="infoTumbes" tabindex="-1"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header bg-primary text-white">
									<h5 class="modal-title">
										<i class="bi bi-geo-alt-fill me-2"></i> Tumbes
									</h5>
									<button type="button" class="btn-close btn-close-white"
										data-bs-dismiss="modal"></button>
								</div>
								<div class="modal-body text-center">
									<img
										src="./imagenesModal/tumbesModal.png"
										class="img-fluid rounded mb-3 shadow" alt="Tumbes">
									<p>Tumbes es un destino costero destacado por sus playas
										cálidas, manglares y su biodiversidad tropical.</p>
								</div>
								<div class="modal-footer">
									<button type="button"
										class="btn btn-outline-primary rounded-pill"
										data-bs-dismiss="modal">Cerrar</button>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-3 col-md-4 col-sm-6">
						<div
							class="card h-100 shadow-sm border-0 rounded-4 overflow-hidden">
							<img
								src="./imagenes/pucallpa.jpg"
								class="card-img-top" alt="Pucallpa">
							<div class="card-body text-center">
								<p class="destino-label mb-0 text-secondary">
									Viaja a <span class="text-dark fw-bold">Pucallpa</span>
								</p>
								<a href="#"
									class="btn btn-outline-primary btn-sm px-4 mt-3 rounded-pill fw-bold"
									data-bs-toggle="modal" data-bs-target="#infoPucallpa">Ver
									más</a>
							</div>
						</div>
					</div>

					<div class="modal fade" id="infoPucallpa" tabindex="-1"
						aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
								<div class="modal-header bg-primary text-white">
									<h5 class="modal-title">
										<i class="bi bi-geo-alt-fill me-2"></i> Pucallpa
									</h5>
									<button type="button" class="btn-close btn-close-white"
										data-bs-dismiss="modal"></button>
								</div>
								<div class="modal-body text-center">
									<img
										src="./imagenesModal/pucallpaModal.png"
										class="img-fluid rounded mb-3 shadow" alt="Pucallpa">
									<p>Pucallpa es la “Ciudad del Color y del Calor”, ubicada
										en la Amazonía peruana y reconocida por su cultura
										shipibo-conibo y sus paisajes selváticos.</p>
								</div>
								<div class="modal-footer">
									<button type="button"
										class="btn btn-outline-primary rounded-pill"
										data-bs-dismiss="modal">Cerrar</button>
								</div>
							</div>
						</div>
					</div>

					

				</div>
			</div>
		</section>
	</main>

	<%@ include file="/shared/footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI"
		crossorigin="anonymous"></script>
</body>
</html>