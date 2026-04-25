<%@page import="entidades.Viaje"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reserva de Pasajes - CiberBus</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
</head>

<body class="d-flex flex-column min-vh-100">

    <%@ include file="/shared/navbar.jsp" %>

    <main class="flex-grow-1 bg-light py-5">
        <div class="container">
        
           <%
              Viaje viaje = (Viaje) request.getAttribute("viaje");
              
              int cantidadSeleccionados = 0;
              double totalPagar = 0;
              String asientosSeleccionados = "";
              
              if(request.getAttribute("cantidadSeleccionados") != null){
                 cantidadSeleccionados = Integer.parseInt("" + request.getAttribute("cantidadSeleccionados"));
              }
              
              if(request.getAttribute("totalPagar") != null){
                 totalPagar = Double.parseDouble("" + request.getAttribute("totalPagar"));
              }
              
              if(request.getAttribute("asientosSeleccionados") != null){
                 asientosSeleccionados = "" + request.getAttribute("asientosSeleccionados");
              }
              
              String[] listaAsientos = new String[0];
              if(asientosSeleccionados != null && !asientosSeleccionados.trim().isEmpty()){
                 listaAsientos = asientosSeleccionados.split(",");
              }
           %>
           
           <h2 class="fw-bold mb-4" style="color: #4f699c;">Detalles de los pasajeros</h2>
           <%
			   ArrayList<String> errores = (ArrayList<String>) request.getAttribute("errores");
			   if (errores != null && !errores.isEmpty()) {
			%>
			   <div class="alert alert-danger shadow-sm rounded-4 border-0">
			      <h6 class="fw-bold mb-2">Se encontraron errores:</h6>
			      <ul class="mb-0">
			         <%
			            for (String error : errores) {
			         %>
			            <li><%= error %></li>
			         <%
			            }
			         %>
			      </ul>
			   </div>
			<%
			   }
			%>
           
           <%
              if(viaje == null){
           %>
              <div class="alert alert-danger shadow-sm rounded-4 border-0 p-4">
                 <h5 class="alert-heading"><i class="bi bi-x-circle"></i> Error de sesión</h5>
                 <p class="mb-0">No se encontró la información del viaje. Por favor, reinicia tu proceso de compra.</p>
                 <a href="inicio" class="btn btn-outline-danger mt-3 px-4">Volver al inicio</a>
              </div>
           <%
              }else{
           %>
           
           <form action="reserva?opcion=pagar" method="post" id="formReserva" class="needs-validation" novalidate>
              
              <input type="hidden" name="idViaje" value="<%= viaje.getIdViaje() %>">
              <input type="hidden" name="cantidadSeleccionados" value="<%= cantidadSeleccionados %>">
              <input type="hidden" name="totalPagar" value="<%= totalPagar %>">
              <input type="hidden" name="asientosSeleccionados" value="<%= asientosSeleccionados %>">
              
              <div class="row g-4">
                 
                 <div class="col-lg-8">
                    
                    <div class="alert alert-primary bg-white shadow-sm border-0 rounded-4 p-4 mb-4">
                       <h5 class="fw-bold text-primary mb-2"><i class="bi bi-person-lines-fill me-2"></i> Información obligatoria</h5>
                       <p class="mb-0 text-secondary">
                          Complete los datos de los pasajeros según el documento de identidad. Estos datos son necesarios para el abordaje.
                       </p>
                    </div>
                    
                    <%
                       for(int i = 0; i < cantidadSeleccionados; i++){
                          String nroAsiento = "";
                          if(i < listaAsientos.length){
                             nroAsiento = listaAsientos[i];
                          }
                    %>
                    
                    <div class="card shadow-sm border-0 rounded-4 mb-4">
                       <div class="card-header bg-white border-bottom-0 pt-4 pb-0 px-4">
                          <h5 class="fw-bold text-dark">Pasajero <%= i + 1 %> <span class="badge bg-primary ms-2">Asiento <%= nroAsiento %></span></h5>
                       </div>
                       <div class="card-body p-4">
                          
                          <input type="hidden" name="asiento_<%= i %>" value="<%= nroAsiento %>">
                          
                          <div class="row g-3 mb-3">
                             <div class="col-md-3">
                                <label class="form-label text-secondary small fw-bold">Tipo Documento</label>
                                <select class="form-select" name="tipoDocumento_<%= i %>" required>
                                   <option value="DNI">DNI</option>
                                   <option value="CE">CE</option>
                                   <option value="Pasaporte">Pasaporte</option>
                                </select>
                             </div>
                             <div class="col-md-4">
                                <label class="form-label text-secondary small fw-bold">N° Documento</label>
                                <input type="text" class="form-control" name="nroDocumento_<%= i %>" required maxlength="12">
                                <div class="invalid-feedback">Ingrese un documento válido.</div>
                             </div>
                             <div class="col-md-5">
                                <label class="form-label text-secondary small fw-bold">Nombres completos</label>
                                <input type="text" class="form-control" name="nombre_<%= i %>" required pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ ]{2,100}"> 
                                <!-- pattern: expresión regular que limita caracteres específicos -->
                                
								<div class="invalid-feedback">Ingrese nombres válidos.</div>
                             </div>
                          </div>
                          
                          <div class="row g-3 mb-3">
                             <div class="col-md-5">
                                <label class="form-label text-secondary small fw-bold">Apellidos</label>
                                <input type="text" class="form-control" name="apellido_<%= i %>" required pattern="[A-Za-zÁÉÍÓÚáéíóúÑñ ]{2,100}">
								<div class="invalid-feedback">Ingrese Apellido válido.</div>
                             </div>
                             <div class="col-md-4">
                                <label class="form-label text-secondary small fw-bold">Correo electrónico</label>
                                <input type="email" class="form-control" name="correo_<%= i %>" required>
                                <div class="invalid-feedback">Correo no válido.</div>
                             </div>
                             <div class="col-md-3">
                                <label class="form-label text-secondary small fw-bold">Teléfono</label>
                                <input type="text" class="form-control" name="telefono_<%= i %>" required maxlength="9" pattern="[0-9]{9}">
								<div class="invalid-feedback">Ingrese un teléfono válido de 9 dígitos.</div>
                             </div>
                          </div>
                          
                          <div class="row g-3">
                             <div class="col-md-4">
                                <label class="form-label text-secondary small fw-bold">Fecha Nacimiento</label>
                                <input type="date" class="form-control" name="fechaNacimiento_<%= i %>" required>
                             </div>
                             <div class="col-md-4">
                                <label class="form-label text-secondary small fw-bold">Nacionalidad</label>
                                <input type="text" class="form-control" name="nacionalidad_<%= i %>" value="Peruana" required>
                             </div>
                             <div class="col-md-4">
                                <label class="form-label text-secondary small fw-bold">Género</label>
                                <select class="form-select" name="genero_<%= i %>" required>
                                   <option value="">Seleccione...</option>
                                   <option value="Femenino">Femenino</option>
                                   <option value="Masculino">Masculino</option>
                                </select>
                             </div>
                          </div>
                          
                       </div>
                    </div>
                    
                    <%
                       }
                    %>
                    
                 </div>
                 
                 <div class="col-lg-4">
                    <div class="card shadow-sm border-0 rounded-4" style="position: sticky; top: 20px;">
                       <div class="card-body p-4">
                          <h5 class="fw-bold text-dark mb-4"><i class="bi bi-cart-check me-2"></i> Resumen de compra</h5>
                          
                          <div class="d-flex justify-content-between mb-2">
                             <span class="text-secondary">Código de viaje</span>
                             <span class="fw-bold"><%= viaje.getCodigoViaje() %></span>
                          </div>
                          <div class="d-flex justify-content-between mb-2">
                             <span class="text-secondary">Servicio</span>
                             <span class="fw-bold"><%= viaje.getTipoBus() %></span>
                          </div>
                          
                          <hr class="text-muted opacity-25">
                          
                          <div class="mb-3">
                             <small class="text-secondary d-block">Salida</small>
                             <span class="fw-bold"><%= viaje.getFechaSalida() %></span> - <span><%= viaje.getHoraSalida() %></span>
                          </div>
                          <div class="mb-3">
                             <small class="text-secondary d-block">Llegada estimada</small>
                             <span class="fw-bold"><%= viaje.getFechaLlegada() %></span> - <span><%= viaje.getHoraLlegada() %></span>
                          </div>
                          
                          <hr class="text-muted opacity-25">
                          
                          <div class="d-flex justify-content-between mb-2">
                             <span class="text-secondary">Asientos (<%= cantidadSeleccionados %>)</span>
                             <span class="fw-bold"><%= asientosSeleccionados %></span>
                          </div>
                          <div class="d-flex justify-content-between mb-3">
                             <span class="text-secondary">Tarifa unitaria</span>
                             <span class="fw-bold">S/ <%= viaje.getTarifa() %></span>
                          </div>
                          
                          <div class="p-3 bg-light rounded-3 mb-4">
                             <div class="d-flex justify-content-between align-items-center">
                                <span class="fw-bold fs-5">TOTAL</span>
                                <span class="fw-bold fs-4 text-success">S/ <%= String.format("%.2f", totalPagar) %></span>
                             </div>
                          </div>
                          
                          <button type="submit" class="btn btn-warning btn-lg w-100 fw-bold shadow-sm">
                             Pagar y Reservar <i class="bi bi-credit-card ms-2"></i>
                          </button>
                          
                       </div>
                    </div>
                 </div>
                 
              </div>
           </form>
           
           <%
              }
           %>
           
        </div>
    </main>

    <%@ include file="/shared/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

<script type="text/javascript">

(function () {
    'use strict';

    const form = document.getElementById('formReserva');
    if (!form) return;

    form.addEventListener('submit', function (event) {

        let documentos = new Set();
        let cantidad = <%= cantidadSeleccionados %>;
        let camposCompletos = true;

        // 1. VALIDAR CAMPOS VACÍOS PRIMERO
        for (let i = 0; i < cantidad; i++) {
            let tipo = document.getElementsByName('tipoDocumento_' + i)[0].value.trim();
            let nro = document.getElementsByName('nroDocumento_' + i)[0].value.trim();
            let nombre = document.getElementsByName('nombre_' + i)[0].value.trim();
            let apellido = document.getElementsByName('apellido_' + i)[0].value.trim();
            let correo = document.getElementsByName('correo_' + i)[0].value.trim();
            let telefono = document.getElementsByName('telefono_' + i)[0].value.trim();
            let fechaNacimiento = document.getElementsByName('fechaNacimiento_' + i)[0].value.trim();
            let nacionalidad = document.getElementsByName('nacionalidad_' + i)[0].value.trim();
            let genero = document.getElementsByName('genero_' + i)[0].value.trim();

            if (!tipo || !nro || !nombre || !apellido || !correo || !telefono || !fechaNacimiento || !nacionalidad || !genero) {
                camposCompletos = false;
                break;
            }
        }

        // Si hay campos vacíos → parar aquí
        if (!form.checkValidity() || !camposCompletos) {
            event.preventDefault();
            event.stopPropagation();
            form.classList.add('was-validated');
            return; // CLAVE: no seguir validando
        }

        // 2. VALIDAR DUPLICADOS (ya con datos completos)
        for (let i = 0; i < cantidad; i++) {
            let tipo = document.getElementsByName('tipoDocumento_' + i)[0].value.trim();
            let nro = document.getElementsByName('nroDocumento_' + i)[0].value.trim();

            let claveDocumento = tipo + "-" + nro;

            if (documentos.has(claveDocumento)) {
                alert("No se puede registrar el mismo pasajero dos veces en la misma reserva.");
                event.preventDefault();
                return;
            } else {
                documentos.add(claveDocumento);
            }
        }

    }, false);
})();
</script>


</body>
</html>