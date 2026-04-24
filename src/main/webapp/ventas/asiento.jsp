<%@page import="java.util.ArrayList"%>
<%@page import="entidades.Viaje"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Selección de Asientos - CiberBus</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-sRIl4kxILFvY47J16cr9ZwB07vP4J8+LH7qKQnuqkuIAvNWLzeN8tE5YBujZqJLB" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.1/font/bootstrap-icons.min.css">
<link rel="stylesheet" href="css/inicio.css">
<style>
    .asiento-btn {
       width: 70px;
       height: 50px;
       font-weight: bold;
       border-radius: 10px;
       transition: all 0.2s ease-in-out;
    }
    .asiento-btn:hover:not(:disabled) {
        transform: scale(1.05);
    }
</style>
</head>

<body class="d-flex flex-column min-vh-100">

    <%@ include file="/shared/navbar.jsp" %>

    <main class="flex-grow-1 bg-light py-5">
        <div class="container">
        
           <%
              Viaje viaje = (Viaje) request.getAttribute("viaje");
           ArrayList<Integer> asientosVendidos = (ArrayList<Integer>) request.getAttribute("asientosVendidos");
              
              if(asientosVendidos == null){
                 asientosVendidos = new java.util.ArrayList<Integer>();
              }
              
              int totalAsientos = 0;
              double tarifa = 0;
              
              if(viaje != null){
                 totalAsientos = viaje.getNroAsientos();
                 tarifa = viaje.getTarifa();
              }
           %>
           
           <h2 class="fw-bold mb-4" style="color: #4f699c;">Selección de asientos</h2>
           
           <%
              if(viaje == null){
           %>
              <div class="alert alert-danger shadow-sm rounded-4 border-0 p-4">
                 <h5 class="alert-heading"><i class="bi bi-x-circle"></i> Error de información</h5>
                 <p class="mb-0">No se encontró información del viaje seleccionado. Por favor, regresa al inicio e intenta nuevamente.</p>
                 <a href="inicio" class="btn btn-outline-danger mt-3 px-4">Volver al inicio</a>
              </div>
           <%
              }else{
           %>
           
           <div class="card shadow-sm border-0 rounded-4 mb-4">
              <div class="card-body p-4 bg-white rounded-4">
                 <div class="row align-items-center text-center text-md-start g-3">
                    <div class="col-md-2">
                       <small class="text-secondary d-block">Código</small>
                       <strong><%= viaje.getCodigoViaje() %></strong>
                    </div>
                    <div class="col-md-2">
                       <small class="text-secondary d-block">Servicio</small>
                       <strong><%= viaje.getTipoBus() %></strong>
                    </div>
                    <div class="col-md-3">
                       <small class="text-secondary d-block">Salida</small>
                       <span class="fw-bold"><%= viaje.getHoraSalida() %></span> - <small><%= viaje.getFechaSalida() %></small>
                    </div>
                    <div class="col-md-3">
                       <small class="text-secondary d-block">Llegada</small>
                       <span class="fw-bold"><%= viaje.getHoraLlegada() %></span> - <small><%= viaje.getFechaLlegada() %></small>
                    </div>
                    <div class="col-md-2 text-md-end">
                       <small class="text-secondary d-block">Tarifa</small>
                       <span class="fs-5 text-success fw-bold">S/ <%= viaje.getTarifa() %></span>
                    </div>
                 </div>
              </div>
           </div>
           
           <div class="mb-4 text-center text-md-start">
              <span class="badge bg-white text-dark border px-3 py-2 me-2 shadow-sm">Disponible</span>
              <span class="badge bg-primary px-3 py-2 me-2 shadow-sm">Seleccionado</span>
              <span class="badge bg-secondary px-3 py-2 shadow-sm">Vendido</span>
           </div>
           
           <form id="formAsientos" action="reserva?opcion=listarPasajeros" method="post">
              
              <input type="hidden" name="idViaje" value="<%= viaje.getIdViaje() %>">
              <input type="hidden" name="asientosSeleccionados" id="asientosSeleccionados">
              <input type="hidden" name="cantidadSeleccionados" id="cantidadSeleccionados">
              <input type="hidden" name="totalPagar" id="totalPagar">
              
              <div class="card shadow-sm border-0 rounded-4 mb-4">
                 <div class="card-body p-4">
                    <div class="row g-3 justify-content-center">
                       <%
                          for(int i = 1; i <= totalAsientos; i++){
                             boolean vendido = asientosVendidos.contains(i);
                       %>
                          <div class="col-auto">
                             <%
                                if(vendido){
                             %>
                                <button type="button" class="btn btn-secondary asiento-btn shadow-sm" disabled>
                                   <%= i %>
                                </button>
                             <%
                                }else{
                             %>
                                <button type="button" 
                                      class="btn btn-outline-primary asiento-btn asiento-disponible shadow-sm"
                                      data-numero="<%= i %>"
                                      data-precio="<%= tarifa %>">
                                   <%= i %>
                                </button>
                             <%
                                }
                             %>
                          </div>
                       <%
                          }
                       %>
                    </div>
                 </div>
              </div>
              
              <div class="card shadow-lg border-0 rounded-4" style="position: sticky; bottom: 20px; z-index: 1000;">
                 <div class="card-body p-4">
                    <div class="row align-items-center">
                       <div class="col-md-4 mb-3 mb-md-0">
                          <small class="text-secondary d-block">Asientos seleccionados:</small>
                          <span id="textoAsientos" class="fw-bold fs-5 text-primary">Ninguno</span>
                       </div>
                       <div class="col-md-2 mb-3 mb-md-0 text-center text-md-start">
                          <small class="text-secondary d-block">Cantidad:</small>
                          <span id="textoCantidad" class="fw-bold fs-5">0</span>
                       </div>
                       <div class="col-md-3 mb-3 mb-md-0 text-center text-md-start">
                          <small class="text-secondary d-block">Total a pagar:</small>
                          <span class="fw-bold fs-4 text-success">S/ <span id="textoTotal">0.00</span></span>
                       </div>
                       <div class="col-md-3 text-center text-md-end">
                          <button type="submit" class="btn btn-warning btn-lg px-4 fw-bold w-100 shadow-sm">
                             Continuar <i class="bi bi-arrow-right-circle ms-2"></i>
                          </button>
                       </div>
                    </div>
                 </div>
              </div>
              
           </form>
           
           <%
              }
           %>
           
        </div>
    </main>

    <%@ include file="/shared/footer.jsp" %>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js" integrity="sha384-FKyoEForCGlyvwx9Hj09JcYn3nv7wiPVlz7YYwJrWVcXK/BmnVDxM+D2scQbITxI" crossorigin="anonymous"></script>

<script type="text/javascript">
    const botones = document.querySelectorAll('.asiento-disponible');
    const seleccionados = [];
    
    botones.forEach(btn => {
       btn.addEventListener('click', function() {
          const numero = this.getAttribute('data-numero');
          const precio = parseFloat(this.getAttribute('data-precio'));
          
          if(this.classList.contains('btn-primary')){
             this.classList.remove('btn-primary');
             this.classList.remove('text-white');
             this.classList.add('btn-outline-primary');
             
             const index = seleccionados.findIndex(a => a.numero == numero);
             if(index !== -1){
                seleccionados.splice(index, 1);
             }
          }else{
        	   // 🚫 VALIDACIÓN: máximo 5 asientos
        	   if(seleccionados.length >= 5){
        	      alert('Solo puede seleccionar un máximo de 5 asientos.');
        	      return;
        	   }

        	   this.classList.remove('btn-outline-primary');
        	   this.classList.add('btn-primary');
        	   this.classList.add('text-white');
        	   
        	   seleccionados.push({
        	      numero: numero,
        	      precio: precio
        	   });
        	}
          
          actualizarResumen();
       });
    });
    
    function actualizarResumen(){
       const numeros = seleccionados.map(a => a.numero);
       const total = seleccionados.reduce((acum, a) => acum + a.precio, 0);
       
       document.getElementById('textoAsientos').innerText = numeros.length > 0 ? numeros.join(', ') : 'Ninguno';
       document.getElementById('textoCantidad').innerText = seleccionados.length;
       document.getElementById('textoTotal').innerText = total.toFixed(2);
       
       document.getElementById('asientosSeleccionados').value = numeros.join(',');
       document.getElementById('cantidadSeleccionados').value = seleccionados.length;
       document.getElementById('totalPagar').value = total.toFixed(2);
    }
    
    	document.getElementById('formAsientos').addEventListener('submit', function(e){
    	   if(seleccionados.length === 0){
    	      e.preventDefault();
    	      alert('Debe seleccionar al menos un asiento para continuar con la compra.');
    	      return;
    	   }

    	   if(seleccionados.length > 5){
    	      e.preventDefault();
    	      alert('No puede seleccionar más de 5 asientos.');
    	   }
    	});
</script>

</body>
</html>