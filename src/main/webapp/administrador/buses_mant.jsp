<%@page import="entidades.Bus"%>
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
					<h1 class="fw-bold">Página de mantenimiento de Buses</h1>
				</div>
				
				<%
				ArrayList<Bus> lista = (ArrayList<Bus>) request.getAttribute("lista");

				String texto = "";
				if (request.getParameter("texto") != null) {
					texto = request.getParameter("texto");
				}
				%>
				
				<div class="row">
					<div class="col">
						<a href="#" class="btn btn-sm btn-outline-success" data-bs-toggle="modal" data-bs-target="#modalBus" onclick="crear()">
   							<i class="bi bi-person-plus"></i> Agregar
						</a>
					</div>
					<div style="width: 200px">
						<form id="formBuscar" action="bus" method="get">
							<input type="text" name="texto" class="form-control" placeholder="Buscar..." value="<%=texto%>">
						</form>
					</div>
				</div>
				
				<table class="table table-striped table-sm" >
					
					<thead>
						<th>Placa</th>
						<th>Marca</th>
						<th>Tipo</th>
						<th>Pisos</th>
						<th>Asientos</th>
						<th>Estado</th>
						<th></th>
					</thead>
					
					<tbody>
						<% for (Bus b : lista) { %>
							<tr>
								<td><%= b.getNroPlaca() %></td>
								<td><%= b.getMarca() %></td>
								<td><%= b.getTipoBus() %></td>
								<td><%= b.getCantidadPisos() %></td>
								<td><%= b.getNroAsientos() %></td>
								<td>
									<% if(b.getEstado() == 1) { %>
										<span class="badge text-bg-success" >Habilitado</span>
									<% } else { %>
										<span class="badge text-bg-danger" >Deshabilitado</span>
									<% } %>
								</td>
								<td>
									<div class="btn-group">
										<a href="#" class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#modalBus" 
   											onclick="actualizar(<%= b.getIdBus() %>, 
   													'<%= b.getNroPlaca() %>',
   													'<%= b.getMarca() %>',
   													'<%= b.getTipoBus() %>',
   													<%= b.getCantidadPisos() %>,
   													<%= b.getNroAsientos() %>,
   													<%= b.getEstado() %>
   													)">
   											<i class="bi bi-pencil-fill"></i> Editar
										</a>
										<a href="javascript:eliminar(<%= b.getIdBus() %>)" class="btn btn-sm btn-danger">
											<i class="bi bi-x-circle"></i> Eliminar
										</a>
									</div>
								</td>
							</tr>
						<% } %>
						
					</tbody>
				</table>			
			</div>
			
		</div>
	</div>
	
	<form id="formEliminar" action="bus?opcion=eliminar" method="post">
		<input type="hidden" name="id" id="idEliminar">
	</form>

	<div class="modal fade" id="modalBus" tabindex="-1"
		aria-labelledby="modalBusLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<div class="modal-header text-bg-primary">
					<h1 class="modal-title fs-5" id="modalBusLabel">Registrar
						Nuevo Bus</h1>
					<button type="button" class="btn-close btn-close-white"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>

				<form action="bus?opcion=registrar" method="POST">

					<div class="modal-body">
						<input type="hidden" id="IdBus" name="IdBus" value="0">

						<div class="row">
							<div class="col-md-6 mb-3">
								<label class="form-label fw-bold">N° Placa</label> 
								<input type="text" class="form-control" id="NroPlaca" name="NroPlaca" maxlength="15" required>
							</div>
							<div class="col-md-6 mb-3">
								<label class="form-label fw-bold">Marca</label> 
								<input type="text" class="form-control" id="Marca" name="Marca" maxlength="50" required>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6 mb-3">
								<label class="form-label fw-bold">Tipo de Bus</label> 
								<select class="form-select" id="TipoBus" name="TipoBus">
    								<option value="VIP">VIP</option>
    								<option value="Plus 180">Plus 180</option>
    								<option value="Clasico 140">Clasico 140</option>
								</select>
							</div>
							<div class="col-md-6 mb-3">
								<label class="form-label fw-bold">Cantidad de Pisos</label> 
								<input type="number" class="form-control" id="CantidadPisos" name="CantidadPisos" min="1" max="2" value="1" required>
							</div>
						</div>

						<div class="row">
							<div class="col-md-6 mb-3">
								<label class="form-label fw-bold">N° Asientos</label> 
								<input type="number" class="form-control" id="NroAsientos" name="NroAsientos" min="10" max="100" required>
							</div>
							<div class="col-md-6 mb-3">
								<label class="form-label fw-bold">Estado</label> 
								<select class="form-select" id="Estado" name="Estado">
									<option value="1">Habilitado</option>
									<option value="0">Deshabilitado</option>
								</select>
							</div>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">Cancelar</button>
						<button type="submit" class="btn btn-primary">
							<i class="bi bi-floppy"></i> Guardar Bus
						</button>
					</div>

				</form>
			</div>
		</div>
	</div>


	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
	<script type="text/javascript">
	const eliminar = (id) => {
	    const respuesta = confirm('¿Desea eliminar este bus?');
	    if (respuesta) {
	        document.querySelector('#formEliminar input[name=id]').value = id;
	        document.getElementById('formEliminar').submit();
	    }
	};

	const crear = () => {
	    document.querySelector('#modalBus .modal-title').innerText = 'Registrar Nuevo Bus';
	    document.querySelector('#IdBus').value = 0;
	    document.querySelector('#NroPlaca').value = ''; 
	    document.querySelector('#Marca').value = '';	    
	    document.querySelector('#TipoBus').value = 'VIP'; 
	    document.querySelector('#CantidadPisos').value = '1';
	    document.querySelector('#NroAsientos').value = '';
	    document.querySelector('#Estado').value = '1'; 
	};

	const actualizar = (id, placa, marca, tipo, pisos, asientos, estado) => {
	    document.querySelector('#modalBus .modal-title').innerText = 'Editar Bus';
	    document.querySelector('#IdBus').value = id;
	    document.querySelector('#NroPlaca').value = placa;
	    document.querySelector('#Marca').value = marca;
	    document.querySelector('#TipoBus').value = tipo;
	    document.querySelector('#CantidadPisos').value = pisos;
	    document.querySelector('#NroAsientos').value = asientos;
	    document.querySelector('#Estado').value = estado;
	};
	</script>
</body>
</html>