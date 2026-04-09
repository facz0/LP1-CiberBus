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
			
				<h1 class="mb-4">Panel de Mantenimiento</h1>
				<div class="alert alert-success">¡El sidebar ahora está pegado
					a la izquierda, es vertical y 100% responsivo!
				</div>
				<p>Achica la ventana del navegador para ver cómo aparece el
					botón de hamburguesa.
				</p>
			</div>

		</div>
	</div>
	
	
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>