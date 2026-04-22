<%@page import="entidades.Viaje"%>
<%@page import="entidades.Ruta"%>
<%@page import="entidades.Bus"%>
<%@page import="entidades.Conductor"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mantenimiento de Viajes - CiberBus</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
</head>
<body>

	<%@ include file="/shared/nav_mant_responsive.jsp" %>

	<div class="container-fluid">
		<div class="row flex-nowrap">

			<%@ include file="/shared/sideBar.jsp" %>

			<div class="col py-3 px-4" style="height: 100vh; overflow-y: auto;">
			
				<div class="text_center mb-5 mt-3">
					<h1 class="fw-bold">Página de mantenimiento de Viajes</h1>
				</div> 

				<%
				// Recibimos la lista principal y las listas para los combos del modal
				ArrayList<Viaje> lista = (ArrayList<Viaje>) request.getAttribute("lista");
				ArrayList<Ruta> listaRutas = (ArrayList<Ruta>) request.getAttribute("listaRutas");
				ArrayList<Bus> listaBuses = (ArrayList<Bus>) request.getAttribute("listaBuses");
				ArrayList<Conductor> listaConductores = (ArrayList<Conductor>) request.getAttribute("listaConductores");

				String texto = "";
				if (request.getParameter("texto") != null) {
					texto = request.getParameter("texto");
				}
				%>

				<div class="row">
					<div class="col">
						<a href="#" class="btn btn-sm btn-outline-success" data-bs-toggle="modal" data-bs-target="#modalViaje" onclick="crear()">
   							<i class="bi bi-plus-circle"></i> Programar Viaje
						</a>
					</div>
					<div style="width: 250px">
						<form id="formBuscar" action="ViajeMant" method="get">
							<input type="text" name="texto" class="form-control" placeholder="Buscar código o ruta..." value="<%=texto%>">
						</form>
					</div>
				</div>
				
				<table class="table table-striped table-sm mt-3" >

					<thead>
						<th>Cód. Viaje</th>
						<th>Ruta</th>
						<th>Conductor</th>
						<th>Copiloto</th>
						<th>Origen</th>
						<th>Destino</th>
						<th>H. Salida</th>
						<th>H. Llegada</th>
						<th>Acciones</th>
					</thead>
					
					<tbody>
						<% if(lista != null) { 
							for (Viaje v : lista) { %>
							<tr>
								<td class="fw-bold"><%= v.getCodigoViaje() %></td>
								<td><span class="badge text-bg-secondary"><%= v.getCodigoRuta() %></span></td>
								<td><%= v.getNombreConductor() %></td>
								<td>
									<% if(v.getIdCopiloto() > 0) { %>
										Asignado (ID: <%= v.getIdCopiloto() %>)
									<% } else { %>
										<span class="text-muted">Ninguno</span>
									<% } %>
								</td>
								<td><%= v.getCiudadOrigen() %></td>
								<td><%= v.getCiudadDestino() %></td>
								<td><%= v.getHoraSalida() %></td>
								<td><%= v.getHoraLlegada() %></td>
								<td>
									<div class="btn-group">
										<a href="#" class="btn btn-sm btn-primary"  data-bs-toggle="modal" data-bs-target="#modalViaje" 
   											onclick="actualizar(
   													<%=v.getIdViaje()%>, 
   													'<%=v.getCodigoViaje()%>',
   													<%=v.getIdRuta()%>,
   													<%=v.getIdBus()%>,
   													<%=v.getIdConductor()%>,
   													<%=v.getIdCopiloto()%>,
   													'<%=v.getFechaSalida()%>',
   													'<%=v.getHoraSalida()%>',
   													'<%=v.getFechaLlegada()%>',
   													'<%=v.getHoraLlegada()%>',
   													<%=v.getTarifa()%>,
   													<%=v.getEstado()%>
   													)">
   											<i class="bi bi-pencil-fill"></i>
										</a>
										<a href="javascript:eliminar(<%=v.getIdViaje()%>)" class="btn btn-sm btn-danger"><i class="bi bi-trash"></i></a>
									</div>
								</td>
							</tr>
						<% 	} 
						} %>
					</tbody>
				</table>
			</div>
			
		</div>
	</div>
	
	<form id="formEliminar" action="ViajeMant?opcion=eliminar" method="post">
		<input type="hidden" name="id" >
	</form>

	<div class="modal fade" id="modalViaje" tabindex="-1" aria-labelledby="modalViajeLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl">
			<div class="modal-content">

				<div class="modal-header text-bg-primary">
					<h1 class="modal-title fs-5" id="modalViajeLabel">Programar Nuevo Viaje</h1>
					<button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>

				<form action="ViajeMant?opcion=registrar" method="POST">

					<div class="modal-body">
						<input type="hidden" id="idViaje" name="idViaje" value="0">

						<div class="row">
							<div class="col-md-4 mb-3">
								<label class="form-label fw-bold">Código del Viaje</label> 
								<input type="text" class="form-control" id="codigoViaje" name="codigoViaje" required placeholder="Ej: 2026-LI001">
							</div>
							<div class="col-md-4 mb-3">
								<label class="form-label fw-bold">Ruta Asignada</label> 
								<select class="form-select" id="idRuta" name="idRuta" required>
									<option value="">Seleccione ruta...</option>
									<% if(listaRutas != null) { for(Ruta r : listaRutas) { %>
										<option value="<%= r.getIdRuta() %>"><%= r.getCodigoRuta() %> (<%= r.getCiudadOrigen() %> - <%= r.getCiudadDestino() %>)</option>
									<% } } %>
								</select>
							</div>
							<div class="col-md-4 mb-3">
								<label class="form-label fw-bold">Bus Asignado</label> 
								<select class="form-select" id="idBus" name="idBus" required>
									<option value="">Seleccione bus...</option>
									<% if(listaBuses != null) { for(Bus b : listaBuses) { %>
										<option value="<%= b.getIdBus() %>">Placa: <%= b.getNroPlaca() %> - <%= b.getTipoBus() %></option>
									<% } } %>
								</select>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6 mb-3">
								<label class="form-label fw-bold">Conductor Principal</label> 
								<select class="form-select" id="idConductor" name="idConductor" required>
									<option value="">Seleccione conductor...</option>
									<% if(listaConductores != null) { for(Conductor c : listaConductores) { %>
										<option value="<%= c.getConductorId() %>"><%= c.getNombre() %> <%= c.getApellidos() %></option>
									<% } } %>
								</select>
							</div>
							<div class="col-md-6 mb-3">
								<label class="form-label fw-bold">Copiloto (Opcional)</label> 
								<select class="form-select" id="idCopiloto" name="idCopiloto">
									<option value="0">Sin copiloto / Viaje corto</option>
									<% if(listaConductores != null) { for(Conductor c : listaConductores) { %>
										<option value="<%= c.getConductorId() %>"><%= c.getNombre() %> <%= c.getApellidos() %></option>
									<% } } %>
								</select>
							</div>
						</div>

						<div class="row">
							<div class="col-md-3 mb-3">
								<label class="form-label fw-bold">Fecha Salida</label> 
								<input type="date" class="form-control" id="fechaSalida" name="fechaSalida" required>
							</div>
							<div class="col-md-3 mb-3">
								<label class="form-label fw-bold">Hora Salida</label> 
								<input type="time" class="form-control" id="horaSalida" name="horaSalida" required>
							</div>
							<div class="col-md-3 mb-3">
								<label class="form-label fw-bold">Fecha Llegada</label> 
								<input type="date" class="form-control" id="fechaLlegada" name="fechaLlegada" required>
							</div>
							<div class="col-md-3 mb-3">
								<label class="form-label fw-bold">Hora Llegada</label> 
								<input type="time" class="form-control" id="horaLlegada" name="horaLlegada" required>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6 mb-3">
								<label class="form-label fw-bold">Tarifa (S/.)</label> 
								<input type="number" class="form-control" id="tarifa" name="tarifa" step="0.01" min="1" required>
							</div>
							<div class="col-md-6 mb-3">
								<label class="form-label fw-bold">Estado</label> 
								<select class="form-select" id="estado" name="estado">
									<option value="1">Habilitado (A la venta)</option>
									<option value="0">Cancelado / Oculto</option>
								</select>
							</div>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
						<button type="submit" class="btn btn-primary">
							<i class="bi bi-floppy"></i> Guardar Viaje
						</button>
					</div>

				</form>
			</div>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
	
	<script type="text/javascript">
		const eliminar = (id) => {
			const respuesta = confirm('¿Desea eliminar este viaje? Esta acción no se puede deshacer.');
			if (respuesta) {
				document.querySelector('#formEliminar input[name=id]').value = id;
				document.getElementById('formEliminar').submit();
			}
		};
		
		const crear = () => {
			document.querySelector('#modalViaje .modal-title').innerText = 'Programar Nuevo Viaje';
			document.querySelector('#idViaje').value = 0;
			document.querySelector('#codigoViaje').value = '';
			document.querySelector('#idRuta').value = ''; 
			document.querySelector('#idBus').value = '';
			document.querySelector('#idConductor').value = '';
			document.querySelector('#idCopiloto').value = '0';
			document.querySelector('#fechaSalida').value = '';
			document.querySelector('#horaSalida').value = '';
			document.querySelector('#fechaLlegada').value = '';
			document.querySelector('#horaLlegada').value = '';
			document.querySelector('#tarifa').value = '';
			document.querySelector('#estado').value = '1'; 
		};

		const actualizar = (idViaje, codViaje, idRuta, idBus, idConductor, idCopiloto, fecSal, horSal, fecLleg, horLleg, tarifa, estado) => {
			document.querySelector('#modalViaje .modal-title').innerText = 'Editar Viaje Programado';
			document.querySelector('#idViaje').value = idViaje;
			document.querySelector('#codigoViaje').value = codViaje;
			document.querySelector('#idRuta').value = idRuta;
			document.querySelector('#idBus').value = idBus;
			document.querySelector('#idConductor').value = idConductor;
			document.querySelector('#idCopiloto').value = (idCopiloto > 0) ? idCopiloto : '0';
			document.querySelector('#fechaSalida').value = fecSal;
			document.querySelector('#horaSalida').value = horSal;
			document.querySelector('#fechaLlegada').value = fecLleg;
			document.querySelector('#horaLlegada').value = horLleg;
			document.querySelector('#tarifa').value = tarifa;
			document.querySelector('#estado').value = estado;
		};
	</script>
</body>
</html>