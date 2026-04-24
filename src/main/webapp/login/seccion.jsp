<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Iniciar Sesión - CiberBus</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body class="bg-light d-flex flex-column min-vh-100">
    <%@ include file="/shared/navbar.jsp"%>

    <main class="container flex-grow-1 d-flex align-items-center py-5">
        <div class="row justify-content-center w-100 g-0">
            <div class="col-12 col-md-8 col-lg-5 col-xl-4">
                
                <div class="card border-0 shadow-sm rounded-4">
                    <div class="card-body p-4 p-sm-5">
                        
                        <div class="text-center mb-4">
                            <div class="mb-2">
                                <i class="bi bi-bus-front text-warning display-3"></i>
                            </div>
                            <h2 class="fw-bold" style="color: #002147; letter-spacing: -1px;">CiberBus</h2>
                            <p class="text-muted small">Ingresa a tu cuenta para gestionar tus viajes</p>
                        </div>

                        <form action="LoginServlet" method="POST">
                            
                            <div class="mb-3">
                                <label class="form-label fw-semibold small text-secondary">Correo Electrónico</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light border-end-0 text-muted">
                                        <i class="bi bi-envelope"></i>
                                    </span>
                                    <input type="email" name="txtEmail" class="form-control bg-light border-start-0" 
                                           placeholder="correo@ejemplo.com" required style="font-size: 0.9rem;">
                                </div>
                            </div>

                            <div class="mb-4">
                                <label class="form-label fw-semibold small text-secondary">Contraseña</label>
                                <div class="input-group">
                                    <span class="input-group-text bg-light border-end-0 text-muted">
                                        <i class="bi bi-lock"></i>
                                    </span>
                                    <input type="password" name="txtPassword" class="form-control bg-light border-start-0" 
                                           placeholder="••••••••" required style="font-size: 0.9rem;">
                                </div>
                            </div>

                            <div class="d-flex justify-content-between align-items-center mb-4 small">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="remember">
                                    <label class="form-check-label text-muted" for="remember">Recordarme</label>
                                </div>
                                <a href="#" class="text-decoration-none fw-bold" style="color: #002147;">¿Olvidaste tu clave?</a>
                            </div>

                            <div class="d-grid">
                                <button type="submit" class="btn btn-warning py-2 fw-bold text-uppercase shadow-sm">
                                    Iniciar Sesión <i class="bi bi-arrow-right-short ms-1"></i>
                                </button>
                            </div>

                        </form>

                        <div class="text-center mt-4">
                            <p class="text-muted small mb-0">¿Aún no eres parte? 
                                <a href="crear_cuenta" class="fw-bold text-decoration-none" style="color: #002147;">Crea tu cuenta</a>
                            </p>
                        </div>

                    </div>
                </div>

				<div class="text-center mt-4">
					<a href="inicio"
						class="btn btn-outline-secondary btn-sm rounded-pill px-4"> <i
						class="bi bi-house-door me-2"></i> Volver a la página principal
					</a>
				</div>

			</div>
        </div>
    </main>

    <%@ include file="/shared/footer.jsp"%>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>