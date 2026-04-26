<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Viaje"%>
<%@page import="entidades.Pasajero"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Resumen de Compra</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
</head>
<body>

	<%@ include file="/shared/navbar.jsp" %>

	<div class="container mt-4">
	
		<%
			Viaje viaje = (Viaje) request.getAttribute("viaje");
			String codigoReserva = "";
			int cantidadSeleccionados = 0;
			double totalPagar = 0;
			String asientosSeleccionados = "";
			ArrayList<Pasajero> listaPasajeros = (ArrayList<Pasajero>) request.getAttribute("listaPasajeros");
			
			if(request.getAttribute("codigoReserva") != null){
				codigoReserva = "" + request.getAttribute("codigoReserva");
			}
			
			if(request.getAttribute("cantidadSeleccionados") != null){
				cantidadSeleccionados = Integer.parseInt("" + request.getAttribute("cantidadSeleccionados"));
			}
			
			if(request.getAttribute("totalPagar") != null){
				totalPagar = Double.parseDouble("" + request.getAttribute("totalPagar"));
			}
			
			if(request.getAttribute("asientosSeleccionados") != null){
				asientosSeleccionados = "" + request.getAttribute("asientosSeleccionados");
			}
		%>
		
		<div class="card mb-4 border-success">
			<div class="card-body">
				<h1 class="text-success">¡Compra realizada con éxito!</h1>
				<p class="mb-0">
					Su reserva fue registrada correctamente.
				</p>
			</div>
		</div>
		
		<div class="row">
		
			<div class="col-md-8">
			
				<div class="card mb-4">
					<div class="card-body">
						<h4>Confirmación de la compra</h4>
						<hr>
						
						<p><strong>Código de reserva:</strong> <%= codigoReserva %></p>
						<p><strong>Estado:</strong> PAGADA</p>
						<p><strong>Cantidad de pasajes:</strong> <%= cantidadSeleccionados %></p>
						//agregué if para manejar la diferencia entre asietos y asiento
						<% 
							if(cantidadSeleccionados == 1){
						%>
							<p><strong>Asiento seleccionado:</strong> <%= asientosSeleccionados %></p>
						<%
							} else {
						%>
							<p><strong>Asientos seleccionados:</strong> <%= asientosSeleccionados %></p>
						<%
							}
						%>
						
						<p><strong>Total pagado:</strong> S/ <%= String.format("%.2f", totalPagar) %></p>
					</div>
				</div>
				
				<%
					if(viaje != null){
				%>
				<div class="card mb-4">
					<div class="card-body">
						<h4>Detalle del viaje</h4>
						<hr>
						
						<div class="row">
							<div class="col-md-4">
								<p><strong>Código de viaje:</strong><br><%= viaje.getCodigoViaje() %></p>
							</div>
							<div class="col-md-4">
								<p><strong>Bus:</strong><br><%= viaje.getTipoBus() %></p>
							</div>
							<div class="col-md-4">
								<p><strong>Precio por asiento:</strong><br>S/ <%= viaje.getTarifa() %></p>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
								<p><strong>Salida:</strong><br>
									<%= viaje.getFechaSalida() %> - <%= viaje.getHoraSalida() %>
								</p>
							</div>
							<div class="col-md-6">
								<p><strong>Llegada:</strong><br>
									<%= viaje.getFechaLlegada() %> - <%= viaje.getHoraLlegada() %>
								</p>
							</div>
						</div>
						
						<div class="row">
							<div class="col-md-6">
        						<p class="mb-0"><strong>Origen:</strong> <%= viaje.getCiudadOrigen() %></p>
    						</div>
    						<div class="col-md-6">
        						<p class="mb-0"><strong>Destino:</strong> <%= viaje.getCiudadDestino() %></p>
    						</div>
						</div>
					</div>
				</div>
				<%
					}
				%>
				
				<div class="card mb-4">
					<div class="card-body">
						<h4>Pasajeros registrados</h4>
						<hr>
						
						<table class="table table-bordered">
							<thead>
								<tr>
									<th>#</th>
									<th>Documento</th>
									<th>Nombre completo</th>
									<th>Correo</th>
									<th>Teléfono</th>
								</tr>
							</thead>
							<tbody>
								<%
									if(listaPasajeros != null && listaPasajeros.size() > 0){
										for(int i = 0; i < listaPasajeros.size(); i++){
											Pasajero p = listaPasajeros.get(i);
								%>
								<tr>
									<td><%= i + 1 %></td>
									<td><%= p.getTipoDocumento() %> - <%= p.getNroDocumento() %></td>
									<td><%= p.getNombre() %> <%= p.getApellido() %></td>
									<td><%= p.getCorreo() %></td>
									<td><%= p.getTelefono() %></td>
								</tr>
								<%
										}
									}else{
								%>
								<tr>
									<td colspan="5" class="text-center">No se encontraron pasajeros registrados.</td>
								</tr>
								<%
									}
								%>
							</tbody>
						</table>
					</div>
				</div>
				
			</div>
			
			<div class="col-md-4">
			
				<div class="card">
					<div class="card-body">
						<h4>Resumen</h4>
						<hr>
						
						<p><strong>Reserva:</strong><br><%= codigoReserva %></p>
						<p><strong>Pasajes:</strong><br><%= cantidadSeleccionados %></p>
						<p><strong>Asientos:</strong><br><%= asientosSeleccionados %></p>
						<p><strong>Total pagado:</strong><br>S/ <%= String.format("%.2f", totalPagar) %></p>
						
						<div class="d-grid gap-2 mt-3">
							<a href="inicio" class="btn btn-outline-primary">Volver al inicio</a>
							<a href="inicio" class="btn btn-outline-secondary">Buscar más viajes</a>
						</div>
					</div>
				</div>
				
			</div>
			
		</div>
		
	</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>