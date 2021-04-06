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

      function cargaDoctores() {
        var request = 'api/doctores';
        $.ajax({
          url: url + request,
          type: 'GET',
          dataType: 'xml',
          success: function (data) {
            var doctores = $(data).find("doctor");
            var html = '';
            doctores.each(function () {
              html += '<tr>';
              html += '<td>' + $(this).find('apellido').text() + '</td>';
              html += '<td>' + $(this).find('especialidad').text() + '</td>';
              html += '<td>' + $(this).find('salario').text() + '</td>';
              html += '<td>' + $(this).find('hospitalCod').text() + '</td>';
              html += '</tr>';
            });
            $('#tabladoctores tbody').html(html);
          }
        });
      }

      var url = 'https://mikel-api-doctores.azurewebsites.net/';
      $(document).ready(function () {
        cargaDoctores();
        $('#frm').submit(function () {
          var request = 'api/doctores/buscarsalario/';
          var salario = $('#salario').val();
          $.ajax({
            url: url + request + salario,
            type: 'GET',
            dataType: 'xml',
            success: function (data) {
              var doctores = $(data).find('doctor');
              var html = '';
              doctores.each(function () {
                html += '<tr>';
                html += '<td>' + $(this).find('apellido').text() + '</td>';
                html += '<td>' + $(this).find('especialidad').text() + '</td>';
                html += '<td>' + $(this).find('salario').text() + '</td>';
                html += '<td>' + $(this).find('hospitalCod').text() + '</td>';
                html += '</tr>';
              });
              $('#tabladoctores tbody').html(html);
            }
          });
          cargaDoctores();
          return false;
        });
      });
    </script>
  </head>
  <body>
    <jsp:include page="inc/menu.jsp" />    
    <main>
      <h1>Consumo Api Doctores XML</h1>
      <a href="https://mikel-api-doctores.azurewebsites.net">Api doctores</a>
      <hr/>
      <form id="frm">
        <div class="row mb-3">
          <div class="col-auto">
            <label for="salario">Introduzca salario:</label>
          </div>
          <div class="col-auto">
            <input type="number" id="salario" class="form-control" />
          </div>
          <div class="col-auto">
            <button type="button" id="btnbuscar" class="btn btn-primary">Buscar doctores</button>
          </div>
        </div>
      </form>
      <hr/>
      <table id="tabladoctores" class="table table-hover table-striped">
        <thead>
          <tr>
            <th>Apellido</th>
            <th>Especialidad</th>
            <th>Salario</th>
            <th>Hospital</th>
          </tr>
        </thead>
        <tbody>
        </tbody>
      </table>
    </main>
    <jsp:include page="inc/footer.jsp" />
  </body>
</html>
