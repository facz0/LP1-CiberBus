<%@page import="java.util.List"%>
<%@page import="entidades.Viaje"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listado de Viajes - CiberBus</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="css/viaje.css">
</head>

<body class="d-flex flex-column min-vh-100">

    <%@ include file="/shared/navbar.jsp" %>

    <main class="flex-grow-1">
        <div class="container mt-5 mb-5">
        
           <h2 class="viaje fw-bold mb-4">Viajes disponibles</h2>
           
           <%
              List<Viaje> listaViajes = (List<Viaje>) request.getAttribute("listaViajes");
           %>
           
           <%
              if(listaViajes == null || listaViajes.size() == 0){
           %>
              <div class="alert alert-warning shadow-sm rounded-4 border-0 p-4">
                 <h5 class="alert-heading"><i class="bi bi-exclamation-triangle"></i> ¡Ups! No hay viajes programados</h5>
                 <p class="mb-0">No se encontraron viajes disponibles para la ruta y fecha seleccionadas. Intenta buscando en otro horario.</p>
              </div>
              
              <div class="mt-4">
                 <a href="inicio" class="btn btn-outline-secondary px-4"><i class="bi bi-arrow-left"></i> Volver a buscar</a>
              </div>
           <%
              }else{
                 for(Viaje v : listaViajes){
           %>
           
              <div class="card mb-3 shadow-sm border-0 rounded-4">
                 <div class="card-body p-4">
                    
                    <div class="row align-items-center">
                    
                       <div class="col-md-2 col-sm-6 mb-3 mb-md-0">
                          <p class="text-secondary mb-1 small">Código de Viaje</p>
                          <p class="mb-0 fs-5"><strong><%= v.getCodigoViaje() %></strong></p>
                       </div>
                       
                       <div class="col-md-2 col-sm-6 mb-3 mb-md-0">
                          <p class="text-secondary mb-1 small">Servicio / Asientos</p>
                          <p class="mb-0"><strong><%= v.getTipoBus() %></strong></p>
                          <p class="mb-0 small text-muted"><%= v.getNroAsientos() %> asientos totales</p>
                       </div>
                       
                       <div class="col-md-2 col-sm-6 mb-3 mb-md-0 text-center">
                          <p class="text-secondary mb-1 small">Salida</p>
                          <p class="mb-0 fw-bold"><%= v.getHoraSalida() %></p>
                          <p class="mb-0 small text-muted"><%= v.getFechaSalida() %></p>
                       </div>

                       <div class="col-md-1 d-none d-md-block text-center text-secondary fs-4">
                           <i class="bi bi-arrow-right"></i>
                       </div>
                       
                       <div class="col-md-2 col-sm-6 mb-3 mb-md-0 text-center">
                          <p class="text-secondary mb-1 small">Llegada</p>
                          <p class="mb-0 fw-bold"><%= v.getHoraLlegada() %></p>
                          <p class="mb-0 small text-muted"><%= v.getFechaLlegada() %></p>
                       </div>
                       
                       <div class="col-md-1 col-sm-6 mb-3 mb-md-0 text-center">
                          <p class="text-secondary mb-1 small">Tarifa</p>
                          <p class="mb-0 fs-5 text-success fw-bold">S/ <%= v.getTarifa() %></p>
                       </div>
                       
                       <div class="col-md-2 text-md-end text-center mt-3 mt-md-0">
                          <a href="viaje?opcion=listarAsientos&idViaje=<%= v.getIdViaje() %>" class="btn btn-warning px-4 fw-bold shadow-sm">
                             COMPRAR
                          </a>
                       </div>
                       
                    </div>
                    
                 </div>
              </div>
           
           <%
                 }
              }
           %>
           
        </div>
    </main>

    <%@ include file="/shared/footer.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>