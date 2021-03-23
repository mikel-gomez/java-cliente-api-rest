<!DOCTYPE html>
<html>
  <head>
    <title>Búsqueda en documentos XML</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="inc/header.jsp" />    
    <script>
      $(document).ready(function () {
        
        $('#btnhospitales').click(function () {
          $.get('doc/hospital_atributos.xml', function (data) {
            var hospital_cod = $("#hospital_cod").val();
            var filtro = 'HOSPITAL[HOSPITAL_COD=' + hospital_cod + ']';
            var hospitales = $(data).find(filtro);
            if (hospitales.length == 0) {
              $('#hospital').html('<h6>No se ha encontrado hospital.</h6>');
            } else {
              var hospital = hospitales.first();
              var html = '<h6>Hospital: ' + hospital.attr('NOMBRE') + ' - Dirección: ' + hospital.attr('DIRECCION') + '</h6>';
              $('#hospital').html(html);
            }
          });
        });

        $('#btnempleados').click(function () {
          console.log('Botón pulsado');
          $.ajax({
            url: 'doc/empleados.xml',
            method: 'GET',
            dataType: 'xml',
            success: function (data) {
              console.log('Fichero cargado');
              var apellido = $('#apellido').val().toUpperCase();
              var filtro = 'APELLIDO:contains(' + apellido + ')';
              console.log(filtro);
              var empleados = $(data).find(filtro);
              var html = '';
              empleados.each(function () {
                html += '<h6>' + $(this).text() + '</h6>';
              });
              $('#empleados').html(html);
            }
          });
        });

      });
    </script>
  </head>
  <body>
    <jsp:include page="inc/menu.jsp" />    
    <main>
      <h1>Búsqueda en documentos XML</h1>
      <form>
        <div class="row mb-3">
          <div class="col-auto">
            <label for="hospital_cod">Introduzca código de hospital: </label>
          </div>
          <div class="col-auto">
            <input type="text" id="hospital_cod" class="form-control">
          </div>
          <div class="col-auto">
            <button type="button" class="btn btn-primary" id="btnhospitales">
              Buscar hospital atributo
            </button>
          </div>
        </div>
        <div id="hospital"></div>
        <hr/>
        <div class="row mb-3">
          <div class="col-auto">
            <label for="apellido">Introduzca apellido: </label>
          </div>
          <div class="col-auto">
            <input type="text" id="apellido" class="form-control">
          </div>
          <div class="col-auto">
            <button type="button" class="btn btn-primary" id="btnempleados">
              Buscar empleados tag
            </button>
          </div>
        </div>        
      </form>
      <div id="empleados"></div>
    </main>
    <%@ include file="inc/footer.jsp" %>
  </body>
</html>
