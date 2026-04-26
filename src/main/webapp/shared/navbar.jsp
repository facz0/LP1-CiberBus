<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>CiberBus - Viaja Seguro</title>


<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">


<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.min.css">


<link rel="stylesheet" href="CSS/nav.css">
</head>

<body >

	<nav class="navbar navbar-expand-lg navbar-dark sticky-top py-2">
		<div class="container">

			<a class="navbar-brand py-0" href="inicio"> <img
				src="./imagenes/CiberUltimo.png" style="height: 70px;"
				alt="Logo CiberBus">
			</a>

			<button class="navbar-toggler border-0" type="button"
				data-bs-toggle="collapse" data-bs-target="#menu">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse text-center" id="menu">

				<ul class="navbar-nav mx-auto mb-2 mb-lg-0">

					<li class="nav-item px-lg-3"><a class="nav-link fw-bold small"
						href="inicio">Inicio</a></li>

					<li class="nav-item px-lg-3"><a class="nav-link fw-bold small"
						href="destino">Destinos</a></li>

					<li class="nav-item px-lg-3"><a class="nav-link fw-bold small"
						href="autogestion">Autogestión</a></li>

					<li class="nav-item px-lg-3"><a class="nav-link fw-bold small"
						href="contacto">Contacto</a></li>
				</ul>

				<div class="d-flex justify-content-center mt-3 mt-lg-0">
					<a href="iniciar_seccion" class="btn-profile text-light"> <i
						class="bi bi-person-circle fs-4"></i>
					</a>
				</div>

			</div>
		</div>
	</nav>

		
	<script>
		document.addEventListener("DOMContentLoaded", function () {
		    const current = window.location.pathname;
		
		    document.querySelectorAll('.nav-link').forEach(link => {
		        const href = link.getAttribute('href');
		
		        if (current.includes(href)) {
		            link.classList.add('active');
		        }
		    });
		});
	</script>



</body>
</html>