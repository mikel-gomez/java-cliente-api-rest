<!DOCTYPE html>
<html>
  <head>
    <title>Funciones</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="inc/header.jsp" />    
    <script>
      function mensaje(msg) {
        console.log(msg);
      }

      function getFichero(url, metodo, tipo) {
        var resultado = null;
        $.ajax({
          url: url,
          type: metodo,
          dataType: tipo,
          async: false,
          success: function (data) {
            resultado = data;
          }
        });
        return resultado;
      }

      function mostrarFunciones() {
        var funciones = $(dataFunciones).find("string");
        funciones.each(function () {
          var funcion = $(this).text();
          var li = $('<li>');
          li.addClass('list-inline-item');
          $('#funciones').append(li);
          var btn = $('<button>');
          btn.addClass('btn btn-primary');
          btn.text(funcion);
          btn.click(function () {
            var fun = $(this).text();
            mostrarPlantillaFuncion(fun);
          });
          li.append(btn);
        });
      }

      function mostrarPlantillaFuncion(funcion) {
        var request = 'api/PlantillaFuncion/' + funcion;
        var dataPlantillaFuncion = getFichero(url + request, 'get', 'xml');
        var plantilla = $(dataPlantillaFuncion).find('Plantilla');
        $('#funcion').removeClass('d-none');
        $('#funciontit').html(funcion + 's');
        $('#plantilla').html('');
        $('#empleado').html('');
        plantilla.each(function () {
          var ape = $(this).find('Apellido').text();
          var idp = $(this).find('IdPlantilla').text();
          var li = $('<li>');
          li.addClass('list-group-item list-group-item-action');
          li.text(ape);
          li.val(idp);
          li.css('cursor', 'pointer');
          li.click(function () {
            mostrarPlantillaId($(this).val());
          });
          $('#plantilla').append(li);
        });
      }

      function mostrarPlantillaId(id) {
        var request = 'api/Plantilla/' + id;
        var dataPlantilla = getFichero(url + request, 'get', 'xml');
        var plantilla = $(dataPlantilla).find('Plantilla').first();
        var html = '<div class="card mt-4">';
        html += '<h5 class="card-header">Empleado ' + plantilla.find('IdPlantilla').text() + '</h5>';
        html += '<div class="card-body">';
        html += '<h6 class="card-title mb-3">' + plantilla.find('Apellido').text() + '</h6>';
        html += '<p>';
        html += 'Función: ' + plantilla.find('Funcion').text() + '<br/>';
        html += 'Turno: ' + plantilla.find('Turno').text() + '<br/>';
        html += 'Salario: ' + plantilla.find('Salario').text() + '<br/>';
        html += 'Id Hospital: ' + plantilla.find('IdHospital').text();
        html += '</p>';
        html += '</div>';
        html += '</div>';
        $('#empleado').html(html);
      }

      var url = 'https://apihospitalesxml.azurewebsites.net/';
      $(document).ready(function () {
        dataFunciones = getFichero(url + 'api/funciones', 'get', 'xml');
        mostrarFunciones();
      });
    </script>
  </head>
  <body>
    <jsp:include page="inc/menu.jsp" />    
    <main>
      <h1>Funciones</h1>
      <ul id="funciones" class="list-inline">
      </ul>
      <div id="funcion" class="card d-none">
        <h5 id="funciontit" class="card-header">
        </h5>
        <ul id="plantilla" class="list-group">
        </ul>
      </div>
      <div id="empleado">
      </div>
    </main>
    <%@ include file="inc/footer.jsp" %>
  </body>
</html>
