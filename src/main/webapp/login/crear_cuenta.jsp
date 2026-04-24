<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>


<body class="bg-light">
<%@ include file="/shared/navbar.jsp"%>
<div class="container d-flex justify-content-center align-items-center vh-100">

    <div class="card shadow p-4 text-center" style="max-width: 420px; width: 100%;">

      
        <div class="mb-3">
            <i class="bi bi-bus-front text-warning display-1" width="70"></i> 
        </div>

       
        <h3 class="fw-bold">CiberBus</h3>
        <p class="text-muted">Crea tu cuenta para viajar</p>

      
        <form>

            <div class="mb-3 text-start">
                <label class="form-label">Nombre completo</label>
                <input type="text" class="form-control" placeholder="Ej: Juan Pérez">
            </div>

            <div class="mb-3 text-start">
                <label class="form-label">Correo electrónico</label>
                <input type="email" class="form-control" placeholder="correo@ejemplo.com">
            </div>

            <div class="mb-3 text-start">
                <label class="form-label">Contraseña</label>
                <input type="password" class="form-control" placeholder="••••••••">
            </div>

            <div class="mb-3 text-start">
                <label class="form-label">Confirmar contraseña</label>
                <input type="password" class="form-control" placeholder="••••••••">
            </div>

            <div class="form-check mb-3 text-start">
                <input class="form-check-input" type="checkbox" id="terms">
                <label class="form-check-label" for="terms">
                    Acepto los términos y condiciones
                </label>
            </div>

            <button type="submit" class="btn btn-warning w-100 fw-bold">
                CREAR CUENTA
            </button>

        </form>

        <div class="mt-3">
            <small>
                ¿Ya tienes cuenta?
                <a href="iniciar_seccion" class="fw-bold text-decoration-none">Inicia sesión</a>
            </small>
        </div>

    </div>

</div>
<%@ include file="/shared/footer.jsp"%>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>