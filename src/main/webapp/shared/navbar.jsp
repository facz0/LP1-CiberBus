<nav class="navbar navbar-expand-lg py-3" style="background-color: #002147;">

  <div class="container ">

    <!-- Logo -->
  <a class="navbar-brand" href="#">
  <img src="${pageContext.request.contextPath}/imagenes/ciberbus.png" width="120" alt="Logo CiberBus"> 
</a>
    <!-- Botón responsive -->
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
      data-bs-target="#menu">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="menu">

      <!-- Menú centrado -->
      <ul class="navbar-nav mx-auto ">
        <li class="nav-item mx-5"><a class="nav-link fw-bold text-light fs-5 " href="${pageContext.request.contextPath}/inicio.jsp">Inicio</a></li>
        <li class="nav-item mx-5"><a class="nav-link fw-bold text-light fs-5 " href="${pageContext.request.contextPath}/destinos/destino.jsp">Destinos</a></li>
        <li class="nav-item mx-5"><a class="nav-link fw-bold text-light fs-5 " href="${pageContext.request.contextPath}/autogestion/autogestion.jsp">Autogestión</a></li>
        <li class="nav-item mx-5"><a class="nav-link fw-bold text-light fs-5 " href="${pageContext.request.contextPath}/contacto/contactoEnviar.jsp">Contacto</a></li>
      </ul>

      <!-- Icono cuenta -->
      <a href="#" class="ms-auto">
        <img src="user.png" width="30">
      </a>

    </div>
  </div>
  
</nav>