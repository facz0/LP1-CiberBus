<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Autogestión - CiberBus</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
</head>

<body class="d-flex flex-column min-vh-100 bg-light">

    <header>
       <%@ include file="/shared/navbar.jsp"%>
    </header>

    <main class="flex-grow-1 d-flex align-items-center py-5">
       
       <div class="container">
          <div class="row justify-content-center">
             <div class="col-lg-8">
                
                <div class="card shadow-lg border-0 rounded-4">
                   <div class="card-body p-5 bg-white rounded-4">

                      <h3 class="fw-bold mb-3" style="color: #4f699c;">Mis viajes</h3>

                      <p class="text-secondary">
                         En esta sección podrás gestionar tus viajes de forma rápida,
                         sencilla y en cualquier momento teniendo en cuenta los plazos
                         establecidos en nuestros <a href="#" class="text-decoration-none fw-bold">términos y condiciones</a>.
                      </p>

                      <hr class="my-4 text-muted opacity-25">

                      <p class="fw-bold">Ingresa los datos de tu compra:</p>

                      <form class="mt-4">

                         <div class="row g-4">
                            <div class="col-md-6">
                               <label class="form-label text-secondary small fw-bold">Código de reserva</label>
                               <input type="text" class="form-control form-control-lg shadow-sm" placeholder="Ej: CB-1045">
                            </div>

                            <div class="col-md-6">
                               <label class="form-label text-secondary small fw-bold">Correo electrónico</label>
                               <input type="email" class="form-control form-control-lg shadow-sm" placeholder="tu@correo.com">
                            </div>
                         </div>

                         <div class="text-end mt-5">
                            <button class="btn btn-warning fw-bold px-5 py-2 rounded-pill shadow-sm">
                               Consultar <i class="bi bi-search ms-2"></i>
                            </button>
                         </div>

                      </form>

                   </div>
                </div>
                
             </div>
          </div>
       </div>
       
    </main>
    
    <%@ include file="/shared/footer.jsp"%>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>
</body>
</html>