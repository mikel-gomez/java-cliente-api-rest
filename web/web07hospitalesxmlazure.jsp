<!DOCTYPE html>
<html>
  <head>
    <title>API Hospitales</title>
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

      function hospitalesTabla() {
        var hospitales = $(data).find('Hospital');
        var html = "";
        hospitales.each(function () {
          html += '<tr>';
          html += '<td>' + $(this).find('Nombre').text() + '</td>';
          html += '<td>' + $(this).find('Direccion').text() + '</td>';
          html += '<td>' + $(this).find('Telefono').text() + '</td>';
          html += '<td>' + $(this).find('Camas').text() + '</td>';
          html += '</tr>';
        });
        return html;
      }

      function hospitalBuscar() {
        var idhospital = $('#idhospital').val().trim().toLowerCase();
        if (idhospital.length > 0) {
          var request = 'api/hospitales/' + idhospital;
          var ficheroHospital = getFichero(url + request, 'get', 'xml');
          var hospital = $(ficheroHospital).find('Hospital').first();
          var html = "<h6>" + $(hospital).find('Nombre').text() + ', ' + $(hospital).find('Direccion').text() + '</h6>';
          $('#hospital').html(html);
        }
        return false;
      }

      url = 'https://apihospitalesxml.azurewebsites.net/';
      $(document).ready(function () {
        data = getFichero(url + 'api/hospitales', 'get', 'xml');
        $('#hospitalestabla tbody').html(hospitalesTabla());
        $('#frm').submit(hospitalBuscar);
      });
    </script>
  </head>
  <body>
    <jsp:include page="inc/menu.jsp" />    
    <main>
      <h1>API Hospitales</h1>
      <form id="frm">
        <div class="row mb-3">
          <div class="col-auto">
            <input id="idhospital" type="number" class="form-control" />
            </select>
          </div>
          <div class="col-auto">
            <button type="submit" class="btn btn-primary">Buscar hospital</button>
          </div>
        </div>
      </form>
      <hr/>
      <div id="hospital"></div>
      <table id="hospitalestabla" class="table table-hover table-striped">
        <thead>
          <tr>
            <th>Nombre</th>
            <th>Dirección</th>
            <th>Teléfono</th>
            <th>Camas</th>
          </tr>
        </thead>
        <tbody>
        </tbody>
      </table>
    </main>
    <%@ include file="inc/footer.jsp" %>
  </body>
</html>
