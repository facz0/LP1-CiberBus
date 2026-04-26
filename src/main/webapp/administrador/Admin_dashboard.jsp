<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mantenimiento - CiberBus</title>
<link rel="stylesheet" href="CSS/Sidebar.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
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

			<div class="col-auto col-md-3 col-xl-2 px-0 bg-body-tertiary border-end">
				<div class="offcanvas-md offcanvas-start min-vh-100" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
					<div class="offcanvas-header border-bottom">
						<h5 class="offcanvas-title" id="offcanvasNavbarLabel">Menú Principal</h5>
						<button type="button" class="btn-close" data-bs-dismiss="offcanvas" data-bs-target="#offcanvasNavbar" aria-label="Close"></button>
					</div>
					<div class="offcanvas-body d-flex flex-column p-3">
						<ul class="nav nav-pills flex-column mb-auto w-100">
							<li class="nav-item mb-1"><a class="nav-link active"
								aria-current="page" href="inicio">Página de inicio</a></li>
							<li class="nav-item mb-1"><hr></li>
							<li class="nav-item mb-1"><spam class="nav-link active"
									aria-current="page" href="#">Reportes</spam></li>
							<li class="nav-item mb-1"><hr></li>
						</ul>

					</div>
				</div>
			</div>

			<div class="col py-3 px-4" style="height: 100vh; overflow-y: auto;">
			
				<div class="text_center mb-5 mt-3">
					<h1 class="fw-bold">Portal de Administración</h1>
					
        			<h2 class="h4 text-muted">Menú de mantenimiento</h2>
				</div>
			
				<div class="row g-4">

					<div class="col-12 col-md-6">
						<div class="card h-100">
							<h5 class="card-header">CONDUCTORES</h5>
							<div class="card-body">
								<h5 class="card-title">Tabla de conductores</h5>
								<p class="card-text">Apartado para registrar, editar, visualizar y eliminar conductores.</p>
								<a href="Conductor" class="btn btn-primary">Ir a Conductores</a>
							</div>
						</div>
					</div>

					<div class="col-12 col-md-6">
						<div class="card h-100">
							<h5 class="card-header">BUSES</h5>
							<div class="card-body">
								<h5 class="card-title">Tabla de buses</h5>
								<p class="card-text">Apartado para registrar, editar, visualizar y eliminar buses.</p>
								<a href="bus" class="btn btn-primary">Ir a Buses</a>
							</div>
						</div>
					</div>

					<div class="col-12 col-md-6">
						<div class="card h-100">
							<h5 class="card-header">RUTAS</h5>
							<div class="card-body">
								<h5 class="card-title">Tabla de rutas</h5>
								<p class="card-text">Apartado para registrar, editar, visualizar y eliminar Rutas.</p>
								<a href="ruta" class="btn btn-primary">Ir a Rutas</a>
							</div>
						</div>
					</div>

					<div class="col-12 col-md-6">
						<div class="card h-100">
							<h5 class="card-header">VIAJES</h5>
							<div class="card-body">
								<h5 class="card-title">Tabla de viajes</h5>
								<p class="card-text">Apartado para registrar, editar, visualizar y eliminar Viajes.</p>
								<a href="ViajeMant" class="btn btn-primary">Ir a Viajes</a>
							</div>
						</div>
					</div>

					<div class="col-12 col-md-6">
						<div class="card h-100">
							<h5 class="card-header">RESERVAS</h5>
							<div class="card-body">
								<h5 class="card-title">Tabla de reservas</h5>
								<p class="card-text">Apartado para registrar, editar, visualizar y eliminar Reservas.</p>
								<a href="#" class="btn btn-primary">Ir a Reservas</a>
							</div>
						</div>
					</div>

					<div class="col-12 col-md-6">
						<div class="card h-100">
							<h5 class="card-header">USUARIOS</h5>
							<div class="card-body">
								<h5 class="card-title">Tabla de Usuarios</h5>
								<p class="card-text">Apartado para registrar, editar, visualizar y eliminar cuentas de Usuario.</p>
								<a href="#" class="btn btn-primary">Ir a Usuarios</a>
							</div>
						</div>
					</div>

				</div>
				
				
			</div>

		</div>
	</div>
	
	
	
	
	
	



	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>