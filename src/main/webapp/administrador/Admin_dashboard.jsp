<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mantenimiento - CiberBus</title>
<link rel="stylesheet" href="CSS/Sidebar.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>

	<nav class="navbar navbar-dark bg-dark d-md-none px-3">
		<a class="navbar-brand" href="#">CiberBus Admin</a>
		<button class="navbar-toggler" type="button"
			data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
			aria-controls="offcanvasNavbar">
			<span class="navbar-toggler-icon"></span>
		</button>
	</nav>

	<div class="container-fluid">
		<div class="row flex-nowrap">

			<div
				class="col-auto col-md-3 col-xl-2 px-0 bg-body-tertiary border-end">
				<div class="offcanvas-md offcanvas-start min-vh-100" tabindex="-1"
					id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">

					<div class="offcanvas-header border-bottom">
						<h5 class="offcanvas-title" id="offcanvasNavbarLabel">Menú
							Principal</h5>
						<button type="button" class="btn-close"
							data-bs-dismiss="offcanvas" data-bs-target="#offcanvasNavbar"
							aria-label="Close"></button>
					</div>

					<div class="offcanvas-body d-flex flex-column p-3">

						<ul class="nav nav-pills flex-column mb-auto w-100">
							<li class="nav-item mb-1">
								<a class="nav-link active" aria-current="page" href="#">Página de inicio</a>
							</li>
							<li class="nav-item mb-1"><hr></li>
							<li class="nav-item mb-1">
								<spam class="nav-link active" aria-current="page">Manteniemiento</spam>
							</li>
							<li class="nav-item mb-1"><hr></li>
							<li class="nav-item mb-1">
								<a class="nav-link link-dark" href="#">Conductores</a>
							</li>
							<li class="nav-item mb-1">
								<a class="nav-link link-dark" href="#">Buses</a>
							</li>
							<li class="nav-item mb-1">
								<a class="nav-link link-dark" href="#">Rutas</a>
							</li>
							<li class="nav-item mb-1">
								<a class="nav-link link-dark" href="#">Viajes</a>
							</li>
							<li class="nav-item mb-1">
								<a class="nav-link link-dark" href="#">Reservas</a>
							</li>
							<li class="nav-item mb-1">
								<a class="nav-link link-dark" href="#">Clientes</a>
							</li>
							<li class="nav-item mb-1"><hr></li>
							<li class="nav-item mb-1">
								<spam class="nav-link active" aria-current="page" href="#">Reportes</spam>
							</li>
							<li class="nav-item mb-1"><hr></li>
						</ul>

					</div>
				</div>
			</div>

			<div class="col py-3 px-4" style="height: 100vh; overflow-y: auto;">
				<h1 class="mb-4">Panel de Mantenimiento</h1>
				<div class="alert alert-success">¡El sidebar ahora está pegado
					a la izquierda, es vertical y 100% responsivo!</div>
				<p>Achica la ventana del navegador para ver cómo aparece el
					botón de hamburguesa.</p>
			</div>

		</div>
	</div>

	<h1>Bienvenido a la página de mantenimiento</h1>
		    
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>