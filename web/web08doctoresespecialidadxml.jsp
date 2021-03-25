<!DOCTYPE html>
<html>
  <head>
    <title>Doctores especialidad xml</title>
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

      function mostrarEspecialidades() {
        var especialidades = $(dataEspecialidades).find("string");
        especialidades.each(function () {
          var esp = $(this).text();
          var li = $('<li>');
          li.addClass('list-group-item');
          $('#especialidades').append(li);
          var btn = $('<button>');
          btn.addClass('btn btn-primary');
          btn.text(esp);
          btn.click(function () {
            var espe = $(this).text();
            mostrarDoctoresEspecialidad(espe);
          });
          li.append(btn);
        });
      }

      function mostrarDoctoresEspecialidad(especialidad) {
        var request = 'api/DoctoresEspecialidad/' + especialidad;
        var dataDoctoresEspecialidad = getFichero(url + request, 'get', 'xml');
        var doctores = $(dataDoctoresEspecialidad).find('Doctor');
        var html = '';
        doctores.each(function () {
          var ape = $(this).find('Apellido').text();
          html += '<li class="list-group-item list-group-item-warning">' + ape + '</li>';
        });
        $('#doctores').html(html);
      }

      var url = 'https://apihospitalesxml.azurewebsites.net/';
      $(document).ready(function () {
        dataEspecialidades = getFichero(url + 'api/especialidades', 'get', 'xml');
        mostrarEspecialidades();
      });
    </script>
  </head>
  <body>
    <jsp:include page="inc/menu.jsp" />    
    <main>
      <h1>Doctores especialidad xml</h1>
      <ul id="especialidades" class="list-group  list-group-flush">
      </ul>
      <hr/>
      <ul id="doctores" class="list-group">
      </ul>
    </main>
    <%@ include file="inc/footer.jsp" %>
  </body>
</html>
