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
        var hospitales = $(dataHospitales).find('Hospital');
        var html = "";
        hospitales.each(function () {
          html += '<tr>';
          html += '<td>' + $(this).find('IdHospital').text() + '</td>';
          html += '<td>' + $(this).find('Nombre').text() + '</td>';
          html += '<td>' + $(this).find('Direccion').text() + '</td>';
          html += '<td>' + $(this).find('Telefono').text() + '</td>';
          html += '<td>' + $(this).find('Camas').text() + '</td>';
          html += '<td>';
          html += '<button name="btnDoctores" value="' + $(this).find('IdHospital').text() + '" class="btn btn-primary">Doctores</button>';
          html += '</td>';
          html += '</tr>';
          var btn = $('<button>');
          btn.addClass('btn btn-primary');
          btn.text('Doctores');
          btn.val($(this).find('IdHospital').text());
          btn.click(function () {
            var idhospital = $(this).val();
            alert(idhospital);
            doctoresBuscar(idhospital);
          });
          $('#divbotones').append(btn);
        });
        return html;
      }

      function hospitalBuscar() {
        var idhospital = $('#idhospital').val().trim().toLowerCase();
        if (idhospital.length > 0) {
          var request = 'api/hospitales/' + idhospital;
          var ficheroHospital = getFichero(url + request, 'get', 'xml');
          var hospital = $(ficheroHospital).find('Hospital').first();
          var html = '<hr/><h6>Hospital: ' + $(hospital).find('Nombre').text() + ', ' + $(hospital).find('Direccion').text() + '</h6><hr/>';
          $('#hospital').html(html);
          doctoresBuscar(idhospital);
        }
        return false;
      }

      function doctoresBuscar(idhospital) {
        if (idhospital.length > 0) {
          var request = 'api/DoctoresHospital/' + idhospital;
          var dataDoctores = getFichero(url + request, 'get', 'xml');
          var doctores = $(dataDoctores).find('Doctor');
          html = '<ul>';
          doctores.each(function () {
            html += '<li>' + $(this).find('Apellido').text() + '</li>';
          });
          html += '</ul><hr/>';
          $('#doctores').html(html);
        }
        return false;
      }

      url = 'https://apihospitalesxml.azurewebsites.net/';
      $(document).ready(function () {
        dataHospitales = getFichero(url + 'api/hospitales', 'get', 'xml');
        $('#hospitalestabla tbody').append(hospitalesTabla());
        $('#frm').submit(hospitalBuscar);
        $('button[name="btnDoctores"').click(function () {
          doctoresBuscar($(this).val());
        });
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
            <button id="btnhos" type="submit" class="btn btn-primary">Buscar hospital</button>
          </div>
        </div>
      </form>
      <div id="hospital"></div>
      <div id="doctores"></div>      
      <div id="divbotones"></div>      
      <table id="hospitalestabla" class="table table-hover table-striped">
        <thead>
          <tr>
            <th>Código</th>
            <th>Nombre</th>
            <th>Dirección</th>
            <th>Teléfono</th>
            <th>Camas</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
        </tbody>
      </table>
    </main>
    <%@ include file="inc/footer.jsp" %>
  </body>
</html>
