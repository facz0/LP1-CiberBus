<%@page import="entidades.Ruta"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mantenimiento de Rutas - CiberBus</title>
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
					<h1 class="fw-bold">Página de mantenimiento de Rutas</h1>
				</div> 

				<%
				ArrayList<Ruta> lista = (ArrayList<Ruta>) request.getAttribute("lista");

				String texto = "";
				if (request.getParameter("texto") != null) {
					texto = request.getParameter("texto");
				}
				%>

				<div class="row">
					<div class="col">
						<a href="#" class="btn btn-sm btn-outline-success" data-bs-toggle="modal" data-bs-target="#modalRuta" onclick="crear()">
   							<i class="bi bi-plus-circle"></i> Agregar Ruta
						</a>
					</div>
					<div style="width: 200px">
						<form id="formBuscar" action="ruta" method="get">
							<input type="text" name="texto" class="form-control" placeholder="Buscar ciudad..." value="<%=texto%>">
						</form>
					</div>
				</div>
				
				<table class="table table-striped table-sm mt-3" >

					<thead>
						<th>Origen</th>
						<th>Destino</th>
						<th>Horas Estimadas</th>
						<th>Estado</th>
						<th>Acciones</th>
					</thead>
					
					<tbody>
						<% if(lista != null) { 
							for (Ruta r : lista) { %>
							<tr>
								<td><%= r.getCiudadOrigen() %></td>
								<td><%= r.getCiudadDestino() %></td>
								<td><%= r.getHorasEstimadas() %> hrs</td>
								<td>
									<% if(r.getEstado() == 1) { %>
										<span class="badge text-bg-success" >Habilitado</span>
									<% } else { %>
										<span class="badge text-bg-danger" >Deshabilitado</span>
									<% } %>
								</td>
								<td>
									<div class="btn-group">
										<a href="#" class="btn btn-sm btn-primary"  data-bs-toggle="modal" data-bs-target="#modalRuta" 
   											onclick="actualizar(<%=r.getIdRuta()%>, 
   													<%= r.getIdCiudadOrigen() %>,
   													<%= r.getIdCiudadDestino() %>,
   													<%= r.getHorasEstimadas() %>,
   													<%= r.getEstado() %>
   													)">
   											<i class="bi bi-pencil-fill"></i> Editar
										</a>
										<a href="javascript:eliminar(<%=r.getIdRuta()%>)" class="btn btn-sm btn-danger"><i class="bi bi-x-circle"></i> Eliminar</a>
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
	
	<form id="formEliminar" action="ruta?opcion=eliminar" method="post">
		<input type="hidden" name="id" >
	</form>

	<div class="modal fade" id="modalRuta" tabindex="-1"
		aria-labelledby="modalRutaLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<div class="modal-header text-bg-primary">
					<h1 class="modal-title fs-5" id="modalRutaLabel">Registrar Nueva Ruta</h1>
					<button type="button" class="btn-close btn-close-white"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>

				<form action="ruta?opcion=registrar" method="POST">

					<div class="modal-body">
						<input type="hidden" id="idRuta" name="idRuta" value="0">

						<div class="row">
							<div class="col-md-6 mb-3">
								<label class="form-label fw-bold">Ciudad Origen</label> 
								<select class="form-select" id="idCiudadOrigen" name="idCiudadOrigen" required>
									<option value="">Seleccione un origen...</option>
									<option value="1">Lima</option>
									<option value="2">Arequipa</option>
									<option value="3">Cusco</option>
									<option value="4">Piura</option>
								</select>
							</div>
							<div class="col-md-6 mb-3">
								<label class="form-label fw-bold">Ciudad Destino</label> 
								<select class="form-select" id="idCiudadDestino" name="idCiudadDestino" required>
									<option value="">Seleccione un destino...</option>
									<option value="1">Lima</option>
									<option value="2">Arequipa</option>
									<option value="3">Cusco</option>
									<option value="4">Piura</option>
								</select>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6 mb-3">
								<label class="form-label fw-bold">Horas Estimadas de Viaje</label> 
								<input type="number" class="form-control" id="horasEstimadas" name="horasEstimadas" step="0.01" min="0.5" required placeholder="Ej: 14.5">
							</div>
							<div class="col-md-6 mb-3">
								<label class="form-label fw-bold">Estado</label> 
								<select class="form-select" id="estado" name="estado">
									<option value="1">Habilitado</option>
									<option value="0">Deshabilitado</option>
								</select>
							</div>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
						<button type="submit" class="btn btn-primary">
							<i class="bi bi-floppy"></i> Guardar Ruta
						</button>
					</div>

				</form>
			</div>
		</div>
	</div>

	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
	
	<script type="text/javascript">
		const eliminar = (id) => {
			const respuesta = confirm('¿Desea eliminar la ruta de forma permanente?');
			if (respuesta) {
				document.querySelector('#formEliminar input[name=id]').value = id;
				document.getElementById('formEliminar').submit();
			}
		};
		
		const crear = () => {
			document.querySelector('#modalRuta .modal-title').innerText = 'Registrar Nueva Ruta';
			document.querySelector('#idRuta').value = 0;
			document.querySelector('#idCiudadOrigen').value = ''; 
			document.querySelector('#idCiudadDestino').value = '';
			document.querySelector('#horasEstimadas').value = '';
			document.querySelector('#estado').value = '1'; 
		};

		const actualizar = (id, origen, destino, horas, estado) => {
			document.querySelector('#modalRuta .modal-title').innerText = 'Editar Ruta';
			document.querySelector('#idRuta').value = id;
			document.querySelector('#idCiudadOrigen').value = origen;
			document.querySelector('#idCiudadDestino').value = destino;
			document.querySelector('#horasEstimadas').value = horas;
			document.querySelector('#estado').value = estado;
		};
	</script>
</body>
</html>