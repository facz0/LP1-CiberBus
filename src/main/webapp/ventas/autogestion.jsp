<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Autogestión - CiberBus</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB"
    crossorigin="anonymous">
<link rel="stylesheet"
    href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
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
                                Ingresa tu código de reserva y correo electrónico para consultar tu compra.
                            </p>

                            <hr class="my-4 text-muted opacity-25">

                            <form id="formMisViajes" class="mt-4" novalidate>

                                <div class="row g-4">
                                    <div class="col-md-6">
                                        <label class="form-label text-secondary small fw-bold">Código de reserva</label>
                                        <input type="text" name="codigoReserva" id="codigoReserva"
                                            class="form-control form-control-lg shadow-sm"
                                            placeholder="26841">
                                    </div>

                                    <div class="col-md-6">
                                        <label class="form-label text-secondary small fw-bold">Correo electrónico</label>
                                        <input type="email" name="correo" id="correo"
                                            class="form-control form-control-lg shadow-sm"
                                            placeholder="tu@correo.com">
                                    </div>
                                </div>

                                <div class="text-end mt-5">
                                    <button class="btn btn-warning fw-bold px-5 py-2 rounded-pill shadow-sm"
                                        type="button" onclick="consultarCompra()">
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

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>

    <script type="text/javascript">
       function consultarCompra() {
          if ($("#formMisViajes").valid()) {
             document.getElementById("formMisViajes").action = "viaje?opcion=consultarCompra";
             document.getElementById("formMisViajes").submit();
          }
       }

       $(() => {
          $('#formMisViajes').validate({
             rules: {
                codigoReserva: {
                   required: true,
                   digits: true,
                   minlength: 5,
                   maxlength: 5
                },
                correo: {
                   required: true,
                   email: true
                }
             },
             messages: {
                codigoReserva: {
                   required: 'Debe ingresar el código de reserva',
                   digits: 'El código debe contener solo números',
                   minlength: 'El código debe tener exactamente 5 dígitos',
                   maxlength: 'El código debe tener exactamente 5 dígitos'
                },
                correo: {
                   required: 'Debe ingresar un correo electrónico',
                   email: 'Ingrese un correo válido'
                }
             },
             errorElement: "div",
             errorClass: "text-danger small mt-1",
             errorPlacement: function(error, element) {
                error.insertAfter(element);
             }
          });
       });
    </script>

</body>
</html>
