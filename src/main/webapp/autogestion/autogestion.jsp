<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
</head>
<body>

	<header>
		<%@ include file="/shared/navbar.jsp"%>
	</header>

	<!-- CONTENIDO -->
	<section class="py-5 ">

		<div class="container card shadow-lg border-0 rounded-4">

			<div class=" p-5 bg-white">

				<h3 class="fw-bold mb-3">Mis viajes</h3>

				<p>
					En esta sección podrás gestionar tus viajes de forma rápida,
					sencilla y en cualquier momento teniendo en cuenta los plazos
					establecidos en nuestros <a href="#">términos y condiciones</a>.
				</p>

				<p class="mt-4">Ingresa los datos de tu compra:</p>

				<ul>
					<li>Código de reserva</li>
					<li>Correo electrónico</li>
				</ul>


				<!-- FORMULARIO -->
				<form class="mt-4">

					<div class="row g-4">

						<div class="col-md-6">
							<input type="text" class="form-control form-control-lg shadow-sm"
								placeholder="Código de reserva">
						</div>

						<div class="col-md-6">
							<input type="email"
								class="form-control form-control-lg shadow-sm"
								placeholder="Correo electrónico">
						</div>

					</div>


					<div class="text-end mt-4">

						<button class="btn btn-primary px-4 py-2 rounded-pill">
							Ingresar</button>

					</div>

				</form>

			</div>

		</div>

	</section>
	
	<%@ include file="/shared/footer.jsp"%>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>