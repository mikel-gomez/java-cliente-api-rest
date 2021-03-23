<!DOCTYPE html>
<html>
  <head>
    <title>Carga y búsqueda en documentos XML - Coches básicos</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="inc/header.jsp" />    
    <script>
      function mensaje(cadena) {
        console.log(cadena);
      }
      $(document).ready(function () {
        mensaje('Ready');
        $('#btnget').click(function () {
          mensaje('btnget');
          $.get('doc/coches_basicos.xml', function (data) {
            mensaje('cargado');
            var marcas = $(data).find('MARCA');
            var html = '';
            mensaje(marcas.length);
            marcas.each(function () {
              html += '<li class="list-group-item">' + $(this).text() + '</li>';
            });
            $('#mensaje').html('Carga Get');
            $('#lista').html(html);
          });
        });
        $('#btnajax').click(function () {
          mensaje('btnajax');
          $.ajax({
            url: 'doc/coches_basicos.xml',
            method: 'GET',
            dataType: 'xml',
            success: function (data) {
              mensaje('cargado');
              var marcas = $(data).find('MARCA');
              var html = '';
              mensaje(marcas.length);
              marcas.each(function () {
                html += '<li class="list-group-item">' + $(this).text() + '</li>';
              });
              $('#mensaje').html('Carga Ajax');
              $('#lista').html(html);
            }
          });
        });
        $('#frm').submit(function () {
          mensaje('btnbuscar');
          $.ajax({
            url: 'doc/coches_basicos.xml',
            method: 'GET',
            dataType: 'xml',
            success: function (data) {
              mensaje('cargado');
              var marca = $('#marca').val().toUpperCase();
              var filtro = (marca.trim().length==0) ? 'MARCA' : 'MARCA:contains(' + marca + ')';
              mensaje(marca);
              mensaje(filtro);
              mensaje(data);
              var marcas = $(data).find(filtro);
              var html = '';
              mensaje(marcas.length);
              marcas.each(function () {
                html += '<li class="list-group-item">' + $(this).text() + '</li>';
              });
              $('#mensaje').html('Búsqueda: ' + marca);
              $('#lista').html(html);
            }
          });
          return false;
        });
        $('#btnlimpiar').click(function () {
          mensaje('btnlimpiar');
          $('#lista').html('');
          $('#mensaje').html('');
        });
      });
    </script>
  </head>
  <body>
    <jsp:include page="inc/menu.jsp" />    
    <main>
      <h1>Carga y búsqueda en documentos XML - Coches básicos</h1>
      <form id="frm">
        <div class="row mb-3">
          <div class="col-auto">
            <label for="marca">Buscar marca:</label>
          </div>
          <div class="col-auto">
            <input type="text" id="marca" class="form-control">
          </div>
          <div class="col-auto">
            <button type="submit" class="btn btn-primary" id="btnbuscar">
              Buscar marca
            </button>
            <button type="button" class="btn btn-primary" id="btnget">
              Carga Get
            </button>
            <button type="button" class="btn btn-primary" id="btnajax">
              Carga Ajax
            </button>
            <button type="button" class="btn btn-primary" id="btnlimpiar">
              Limpiar
            </button>
          </div>
        </div>
      </form>
      <hr/>
      <h3 id="mensaje"></h3>
      <ul id="lista" class="list-group"></ul>
    </main>
    <%@ include file="inc/footer.jsp" %>
  </body>
</html>
