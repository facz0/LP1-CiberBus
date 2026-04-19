<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<nav class="navbar navbar-expand-lg py-3" style="background-color: #002147;">
  <div class="container ">
  	<a class="navbar-brand" href="#">
  		<img src="<%= request.getContextPath() %>/imagenes/ciberbus.png" width="120" alt="Logo CiberBus">
	</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
      data-bs-target="#menu">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="menu">
      <ul class="navbar-nav mx-auto ">
        <li class="nav-item mx-5"><a class="nav-link fw-bold text-light fs-5 " href="inicio">Inicio</a></li>
        <li class="nav-item mx-5"><a class="nav-link fw-bold text-light fs-5 " href="destino">Destinos</a></li>
        <li class="nav-item mx-5"><a class="nav-link fw-bold text-light fs-5 " href="autogestion">Autogestión</a></li>
        <li class="nav-item mx-5"><a class="nav-link fw-bold text-light fs-5 " href="contacto">Contacto</a></li>
      </ul>
			<div class="ms-auto">
				<a href="Admin_dashboard" class="text-light fs-4"> <i
					class="bi bi-person-circle"></i>
				</a>
			</div>
		</div>
  </div>
</nav>