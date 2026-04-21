<%@page import="entidades.Conductor"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					<h1 class="fw-bold">Página de mantenimiento de Conductores</h1>
				</div> 

				<%
				ArrayList<Conductor> lista = (ArrayList<Conductor>) request.getAttribute("lista");

				String texto = "";
				if (request.getParameter("texto") != null) {
					texto = request.getParameter("texto");
				}
				%>

				<div class="row">
					<div class="col">
						<a href="#" class="btn btn-sm btn-outline-success" data-bs-toggle="modal" data-bs-target="#modalConductor" onclick="crear()">
   							<i class="bi bi-person-plus"></i> Agregar
						</a>
					</div>
					<div style="width: 200px">
						<form id="formBuscar" action="Conductor" method="get">
							<input type="text" name="texto" class="form-control" placeholder="Buscar..." value="<%=texto%>">
						</form>
					</div>
				</div>
				
				<table class="table table-striped table-sm" >

					<thead>
						<th>Nombre</th>
						<th>N° Documento</th>
						<th>Licencia</th>
						<th>Correo</th>
						<th>Descanso</th>
						<th>estado</th>
						<th></th>
					</thead>
					
					<tbody>
						<% for (Conductor c : lista) { %>
							<tr>
								<td><%= c.getNombre() %> <%= c.getApellidos() %></td>
								<td><%= c.getNumeroDocumento() %></td>
								<td><%= c.getCategoriaLicencia() %></td>
								<td><%= c.getCorreo() %></td>
								<td><%= c.getDiaDescanso() %></td>
								<td>
									<% if(c.getEstado() == 1) { %>
										<span class="badge text-bg-success" >Habilitado</span>
									<% } else { %>
										<span class="badge text-bg-danger" >Deshabilitado</span>
									<% } %>
								</td>
								<td>
									<div class="btn-group">
										<a href="#" class="btn btn-sm btn-primary"  data-bs-toggle="modal" data-bs-target="#modalConductor" 
   											onclick="actualizar(<%=c.getConductorId()%>, 
   													'<%= c.getTipoDocumento() %>',
   													'<%= c.getNumeroDocumento() %>',
   													'<%= c.getNombre() %>', 
   													'<%= c.getApellidos() %>', 
   													'<%= c.getCorreo() %>',
   													<%= c.getTelefono() %>,
   													'<%= c.getCategoriaLicencia() %>',
   													'<%= c.getVencimientoLicencia() %>',
   													'<%= c.getDiaDescanso() %>',
   													<%= c.getEstado() %>
   													)">
   											<i class="bi bi-pencil-fill"></i> Editar
										</a>
										<a href="javascript:eliminar(<%=c.getConductorId()%>)" class="btn btn-sm btn-danger"><i class="bi bi-x-circle"></i>Eliminar</a>
									</div>
								</td>
							</tr>
						<% } %>
					</tbody>
				</table>
			</div>
			
		</div>
	</div>
	
	<form id="formEliminar" action="Conductor?opcion=eliminar" method="post">
		<input type="hidden" name="id" >
	</form>

	<div class="modal fade" id="modalConductor" tabindex="-1"
		aria-labelledby="modalConductorLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<div class="modal-header text-bg-primary">
					<h1 class="modal-title fs-5" id="modalConductorLabel">Registrar
						Nuevo Conductor</h1>
					<button type="button" class="btn-close btn-close-white"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>

				<form action="Conductor?opcion=registrar" method="POST">

					<div class="modal-body">
						<input type="hidden" id="conductorId" name="conductorId">

						<div class="row">
							<div class="col-md-6 mb-3">
								<label class="form-label fw-bold">Nombre</label> <input
									type="text" class="form-control" id="nombre"
									name="nombre" required>
							</div>
							<div class="col-md-6 mb-3">
								<label class="form-label fw-bold">Apellidos</label> <input
									type="text" class="form-control" id="Apellidos"
									name="Apellidos" required>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6 mb-3">
								<label class="form-label fw-bold">Tipo Documento</label> <select
									class="form-select" id="tipoDocumento" name="tipoDocumento">
									<option value="DNI">DNI</option>
									<option value="CE">Carnet de Extranjería</option>
								</select>
							</div>
							<div class="col-md-6 mb-3">
								<label class="form-label fw-bold">N° Documento</label> <input
									type="number" class="form-control" id="numDocumento"
									name="numDocumento" required>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6 mb-3">
								<label class="form-label fw-bold">Correo Electrónico</label> <input
									type="email" class="form-control" id="correo"
									name="correo">
							</div>
							<div class="col-md-6 mb-3">
								<label class="form-label fw-bold">Teléfono</label> <input
									type="number" class="form-control" id="telefono"
									name="telefono">
							</div>
						</div>

						<div class="row">
							<div class="col-md-4 mb-3">
								<label class="form-label fw-bold">Licencia</label> <input
									type="text" class="form-control" id="licencia"
									name="licencia" required>
							</div>
							<div class="col-md-4 mb-3">
								<label class="form-label fw-bold">Vencimiento</label> <input
									type="date" class="form-control" id="fechaVencimiento"
									name="fechaVencimiento" required>
							</div>
							<div class="col-md-4 mb-3">
								<label class="form-label fw-bold">Día Descanso</label> <select
									class="form-select" id="descanso" name="descanso">
									<option value="Lunes">Lunes</option>
									<option value="Martes">Martes</option>
									<option value="Miercoles">Miércoles</option>
									<option value="Jueves">Jueves</option>
									<option value="Viernes">Viernes</option>
									<option value="Sabado">Sábado</option>
									<option value="Domingo">Domingo</option>
								</select>
							</div>
						</div>

						<div class="mb-3">
							<label class="form-label fw-bold">Estado</label> <select
								class="form-select" id="estado" name="estado">
								<option value="1">Habilitado</option>
								<option value="0">Deshabilitado</option>
							</select>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Cancelar</button>
						<button type="submit" class="btn btn-primary">
							<i class="bi bi-floppy"></i> Guardar Conductor
						</button>
					</div>

				</form>
			</div>
		</div>
	</div>


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
	<script type="text/javascript">
		const eliminar = (id) => {
			const respuesta = confirm('¿Desea eliminar el curso?');
			if (respuesta) {
				document.querySelector('#formEliminar input[name=id]').value = id;
				document.getElementById('formEliminar').submit();
			}
		};
		
		const crear = () => {
			document.querySelector('#modalConductor .modal-title').innerText = 'Registrar Nuevo Conductor';
			document.querySelector('#conductorId').value = 0;
			document.querySelector('#tipoDocumento').value = ''; 
			document.querySelector('#numDocumento').value = '';
			document.querySelector('#nombre').value = '';
			document.querySelector('#Apellidos').value = '';
			document.querySelector('#correo').value = '';
			document.querySelector('#telefono').value = '';
			document.querySelector('#licencia').value = '';
			document.querySelector('#fechaVencimiento').value = '';
			document.querySelector('#descanso').value = '';
			document.querySelector('#estado').value = '1'; 
		};

		const actualizar = (id, tipoDoc, numDoc, nombre, apellidos, correo, telefono, licencia, vencimiento, descanso, estado) => {
			document.querySelector('#modalConductor .modal-title').innerText = 'Editar Conductor';
			document.querySelector('#conductorId').value = id;
			document.querySelector('#tipoDocumento').value = tipoDoc;
			document.querySelector('#numDocumento').value = numDoc;
			document.querySelector('#nombre').value = nombre;
			document.querySelector('#Apellidos').value = apellidos;
			document.querySelector('#correo').value = correo;
			document.querySelector('#telefono').value = telefono;
			document.querySelector('#licencia').value = licencia;
			document.querySelector('#fechaVencimiento').value = vencimiento;
			document.querySelector('#descanso').value = descanso;
			document.querySelector('#estado').value = estado;
		};
		
		
	</script>
</body>
</html>