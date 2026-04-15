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
						<a href="Conductor?opcion=editar" class="btn btn-sm btn-outline-success"><i class="bi bi-person-plus"></i> Agregar</a>
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
							</tr>
						<% } %>
					</tbody>
				</table>

			</div>

		</div>
	</div>
	
	
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>