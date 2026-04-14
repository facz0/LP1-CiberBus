<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<style>
  .card-img-top {
    height: 220px;       /* altura fija para todas las imágenes */
    object-fit: cover;   /* recorta manteniendo proporción */
    width: 100%;         /* ocupa todo el ancho del card */
  }
</style>
</head>
	<body>
		<header>
		<%@ include file="/shared/navbar.jsp"%>
		</header>

	<section class="py-5 bg-light">

	<div class="container">

		<!-- TITULO -->
		<div class="text-center mb-5">
			<h2 class="fw-bold text-uppercase">Destinos</h2>
			<p class="text-muted">Explora los destinos más populares</p>
			<hr class="mx-auto" style="width:80px; border:3px solid #001242;">
		</div>

		<div class="row g-4">

			<!-- CARD -->
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="card h-100 shadow border-0 rounded-3 overflow-hidden">
					<img src="../imagenes/plazaLima.png"
						class="card-img-top">
					<div class="card-body text-center">
						<p class="destino-label mb-0">Viaja a <span class="text-dark fw-bold">Lima</span></p>
						<a href="#" class="btn btn-warning btn-sm px-4 mt-2">
							Ver más
						</a>

					</div>

				</div>
			</div>

			<!-- DUPLICA PARA LOS DEMÁS -->

			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="card h-100 shadow border-0 rounded-3 overflow-hidden">
					<img src="../imagenes/huacachinaIca.png" class="card-img-top">
					<div class="card-body text-center">
						<p class="destino-label mb-0">Viaja a <span class="text-dark fw-bold">Ica</span></p>
						<a href="#" class="btn btn-warning btn-sm px-4 mt-2">Ver más</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="card h-100 shadow border-0 rounded-3 overflow-hidden">
					<img src="../imagenes/plazaCusco.png" class="card-img-top">
					<div class="card-body text-center">
						<p class="destino-label mb-0">Viaja a <span class="text-dark fw-bold">Cusco</span></p>
						<a href="#" class="btn btn-warning btn-sm px-4 mt-2">Ver más</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="card h-100 shadow border-0 rounded-3 overflow-hidden">
					<img src="../imagenes/Amazonas.png" class="card-img-top">
					<div class="card-body text-center">
						<p class="destino-label mb-0">Viaja a <span class="text-dark fw-bold">Amazonas</span></p>
						
						<a href="#" class="btn btn-warning btn-sm px-4 mt-2">Ver más</a>
					</div>
				</div>
			</div>

			<!-- CARD -->
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="card h-100 shadow border-0 rounded-3 overflow-hidden">

					<img src="../imagenes/huaraz.png"
						class="card-img-top">
					<div class="card-body text-center">
						<p class="destino-label mb-0">Viaja a <span class="text-dark fw-bold">Huaraz</span></p>
						<a href="#" class="btn btn-warning btn-sm px-4 mt-2">
							Ver más
						</a>

					</div>

				</div>
			</div>


			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="card h-100 shadow border-0 rounded-3 overflow-hidden">
					<img src="../imagenes/abancay.png" class="card-img-top">
					<div class="card-body text-center">
						<p class="destino-label mb-0">Viaja a <span class="text-dark fw-bold">Abancay</span></p>
						<a href="#" class="btn btn-warning btn-sm px-4 mt-2">Ver más</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="card h-100 shadow border-0 rounded-3 overflow-hidden">
					<img src="../imagenes/arequipa.png" class="card-img-top">
					<div class="card-body text-center">
						<p class="destino-label mb-0">Viaja a <span class="text-dark fw-bold">Arequipa</span></p>
						<a href="#" class="btn btn-warning btn-sm px-4 mt-2">Ver más</a>
					</div>
				</div>
			</div>

			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="card h-100 shadow border-0 rounded-3 overflow-hidden">
					<img src="../imagenes/ayacucho.png" class="card-img-top">
					<div class="card-body text-center">
						<p class="destino-label mb-0">Viaja a <span class="text-dark fw-bold">Ayacucho</span></p>
						<a href="#" class="btn btn-warning btn-sm px-4 mt-2">Ver más</a>
					</div>
				</div>
			</div>
			
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="card h-100 shadow border-0 rounded-3 overflow-hidden">
					<img src="../imagenes/cajamarca.jpg" class="card-img-top">
					<div class="card-body text-center">
						<p class="destino-label mb-0">Viaja a <span class="text-dark fw-bold">Cajamarca</span></p>
						<a href="#" class="btn btn-warning btn-sm px-4 mt-2">Ver más</a>
					</div>
				</div>
			</div>
			
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="card h-100 shadow border-0 rounded-3 overflow-hidden">
					<img src="../imagenes/huancavelica.jpg" class="card-img-top">
					<div class="card-body text-center">
						<p class="destino-label mb-0">Viaja a <span class="text-dark fw-bold">Huancavelica</span></p>
						<a href="#" class="btn btn-warning btn-sm px-4 mt-2">Ver más</a>
					</div>
				</div>
			</div>
			
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="card h-100 shadow border-0 rounded-3 overflow-hidden">
					<img src="../imagenes/huanuco.jpg" class="card-img-top">
					<div class="card-body text-center">
						<p class="destino-label mb-0">Viaja a <span class="text-dark fw-bold">Huanuco</span></p>
						<a href="#" class="btn btn-warning btn-sm px-4 mt-2">Ver más</a>
					</div>
				</div>
			</div>
			
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="card h-100 shadow border-0 rounded-3 overflow-hidden">
					<img src="../imagenes/huancayo.jpg" class="card-img-top">
					<div class="card-body text-center">
						<p class="destino-label mb-0">Viaja a <span class="text-dark fw-bold">Huancayo</span></p>
						<a href="#" class="btn btn-warning btn-sm px-4 mt-2">Ver más</a>
					</div>
				</div>
			</div>
			
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="card h-100 shadow border-0 rounded-3 overflow-hidden">
					<img src="../imagenes/trujillo.jpg" class="card-img-top">
					<div class="card-body text-center">
						<p class="destino-label mb-0">Viaja a <span class="text-dark fw-bold">Trujillo</span></p>
						<a href="#" class="btn btn-warning btn-sm px-4 mt-2">Ver más</a>
					</div>
				</div>
			</div>
			
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="card h-100 shadow border-0 rounded-3 overflow-hidden">
					<img src="../imagenes/chiclayo.jpg" class="card-img-top">
					<div class="card-body text-center">
						<p class="destino-label mb-0">Viaja a <span class="text-dark fw-bold">Chiclayo</span></p>
						<a href="#" class="btn btn-warning btn-sm px-4 mt-2">Ver más</a>
					</div>
				</div>
			</div>
			
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="card h-100 shadow border-0 rounded-3 overflow-hidden">
					<img src="../imagenes/puertoMaldonado.jpg" class="card-img-top">
					<div class="card-body text-center">
						<p class="destino-label mb-0">Viaja a <span class="text-dark fw-bold">Puerto Maldonado</span></p>
						<a href="#" class="btn btn-warning btn-sm px-4 mt-2">Ver más</a>
					</div>
				</div>
			</div>
			
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="card h-100 shadow border-0 rounded-3 overflow-hidden">
					<img src="../imagenes/moquegua.jpg" class="card-img-top">
					<div class="card-body text-center">
						<p class="destino-label mb-0">Viaja a <span class="text-dark fw-bold">Moquegua</span></p>
						<a href="#" class="btn btn-warning btn-sm px-4 mt-2">Ver más</a>
					</div>
				</div>
			</div>
			
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="card h-100 shadow border-0 rounded-3 overflow-hidden">
					<img src="../imagenes/pasco.jpg" class="card-img-top">
					<div class="card-body text-center">
						<p class="destino-label mb-0">Viaja a <span class="text-dark fw-bold">Cerro de Pasco</span></p>
						<a href="#" class="btn btn-warning btn-sm px-4 mt-2">Ver más</a>
					</div>
				</div>
			</div>
			
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="card h-100 shadow border-0 rounded-3 overflow-hidden">
					<img src="../imagenes/piura.png" class="card-img-top">
					<div class="card-body text-center">
						<p class="destino-label mb-0">Viaja a <span class="text-dark fw-bold">Piura</span></p>
						<a href="#" class="btn btn-warning btn-sm px-4 mt-2">Ver más</a>
					</div>
				</div>
			</div>
			
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="card h-100 shadow border-0 rounded-3 overflow-hidden">
					<img src="../imagenes/puno.jpg" class="card-img-top">
					<div class="card-body text-center">
						<p class="destino-label mb-0">Viaja a <span class="text-dark fw-bold">Puno</span></p>
						<a href="#" class="btn btn-warning btn-sm px-4 mt-2">Ver más</a>
					</div>
				</div>
			</div>
			
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="card h-100 shadow border-0 rounded-3 overflow-hidden">
					<img src="../imagenes/moyobamba.png" class="card-img-top">
					<div class="card-body text-center">
						<p class="destino-label mb-0">Viaja a <span class="text-dark fw-bold">Moyobamba</span></p>
						<a href="#" class="btn btn-warning btn-sm px-4 mt-2">Ver más</a>
					</div>
				</div>
			</div>
			
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="card h-100 shadow border-0 rounded-3 overflow-hidden">
					<img src="../imagenes/tacna.jpg" class="card-img-top">
					<div class="card-body text-center">
						<p class="destino-label mb-0">Viaja a <span class="text-dark fw-bold">Tacna</span></p>
						<a href="#" class="btn btn-warning btn-sm px-4 mt-2">Ver más</a>
					</div>
				</div>
			</div>
			
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="card h-100 shadow border-0 rounded-3 overflow-hidden">
					<img src="../imagenes/tumbes.jpg" class="card-img-top">
					<div class="card-body text-center">
						<p class="destino-label mb-0">Viaja a <span class="text-dark fw-bold">Tumbes</span></p>
						<a href="#" class="btn btn-warning btn-sm px-4 mt-2">Ver más</a>
					</div>
				</div>
			</div>
			
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="card h-100 shadow border-0 rounded-3 overflow-hidden">
					<img src="../imagenes/pucallpa.jpg" class="card-img-top">
					<div class="card-body text-center">
						<p class="destino-label mb-0">Viaja a <span class="text-dark fw-bold">Pucallpa</span></p>
						<a href="#" class="btn btn-warning btn-sm px-4 mt-2">Ver más</a>
					</div>
				</div>
			</div>
			
			<div class="col-lg-3 col-md-4 col-sm-6">
				<div class="card h-100 shadow border-0 rounded-3 overflow-hidden bg-dark text-white">
				<div class="card-img-overlay d-flex flex-column justify-content-end text-center">
					<img src="../imagenes/mixCiudades.jpg" class="card-img-top">
					<div class="card-body text-center">
						<h4 class="fw-semibold">CiberBus</h4>
					
				
						
					</div>
				</div>
			</div>
			
		
			
			
			
			
			
			
			
			
		</div>

	</div>

</section>













	<%@ include file="/shared/footer.jsp"%>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>	
	</body>
</html>