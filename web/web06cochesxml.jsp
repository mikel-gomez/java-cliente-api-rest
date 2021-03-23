<!DOCTYPE html>
<html>
  <head>
    <title>Coches</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="inc/header.jsp" />    
    <script>
      function mensaje(msg) {
        console.log(msg);
      }

      function cargaCochesSelect() {
        $.ajax({
          url: 'doc/coches.xml',
          method: 'GET',
          dataType: 'xml',
          success: function (data) {
            mensaje('Documento cargado');
            var html = '<option value="">Seleccione coche</option>';
            var coches = $(data).find("coche");
            coches.each(function () {
              var idcoche = $(this).find('idcoche').text();
              var marca = $(this).find('marca').text();
              var modelo = $(this).find('modelo').text();
              html += '<option value=' + idcoche + '>' + idcoche + ' - ' + marca + ' - ' + modelo + '</option>';
            });
            $('#sel').html(html);
          }
        });
        return false;
      }

      function cargaCochesSelect2() {
        var html = '<option value="">Seleccione coche</option>';
        var coches = $(data).find("coche");
        coches.each(function () {
          var idcoche = $(this).find('idcoche').text();
          var marca = $(this).find('marca').text();
          var modelo = $(this).find('modelo').text();
          html += '<option value=' + idcoche + '>' + idcoche + ' - ' + marca + ' - ' + modelo + '</option>';
        });
        $('#sel').html(html);
      }

      function mostrarCoche() {
        $('#sel option:first').attr('disabled', 'disabled');
        $.ajax({
          url: 'doc/coches.xml',
          method: 'GET',
          dataType: 'xml',
          success: function (data) {
            mensaje('Documento cargado');
            var idcoche = $('#sel').val();
            mensaje(idcoche);
            var filtro = 'idcoche:contains(' + idcoche + ')';
            var idcocheelm = $(data).find(filtro).first();
            var coche = $(idcocheelm).parent();
            mensaje(filtro);
            mensaje(coche);
            var idcoche = $(coche).find('idcoche').text();
            var marca = $(coche).find('marca').text();
            var modelo = $(coche).find('modelo').text();
            var imagen = $(coche).find('imagen').text();
            var html = 'Id coche: ' + idcoche + '<br/>Marca: ' + marca + '<br>Modelo: ' + modelo
                    + '<br/><br/><img src="' + imagen + '" title="' + modelo + '" style="max-height: 50vh;"/>';
            $('#coche').html(html);
          }
        });
        return false;
      }

      function mostrarCoche2() {
        $('#sel option:first').attr('disabled', 'disabled');
        var idcoche = $('#sel').val();
        var filtro = 'idcoche:contains(' + idcoche + ')';
        var idcocheelm = $(data).find(filtro).first();
        var coche = $(idcocheelm).parent();
        var idcoche = $(coche).find('idcoche').text();
        var marca = $(coche).find('marca').text();
        var modelo = $(coche).find('modelo').text();
        var imagen = $(coche).find('imagen').text();
        var html = 'Id coche: ' + idcoche + '<br/>Marca: ' + marca + '<br>Modelo: ' + modelo
                + '<br/><br/><img src="' + imagen + '" title="' + modelo + '" style="max-height: 50vh;"/>';
        $('#coche').html(html);
      }

      function getXML2(url) {
        var resultado = null;
        $.ajax({
          url: url,
          type: 'get',
          dataType: 'xml',
          async: false,
          success: function (data) {
            resultado = data;
          }
        });
        return resultado;
      }

      /** getXML
       * Recuperación fichero una primera vez.
       */
      jQuery.extend({
        getXML: function (url) {
          var resultado = null;
          $.ajax({
            url: url,
            type: 'get',
            dataType: 'xml',
            async: false,
            success: function (data) {
              resultado = data;
            }
          });
          return resultado;
        }
      });

      $(document).ready(function () {
        // data = $.getXML('doc/coches.xml');
        data = getXML2('doc/coches.xml');
        cargaCochesSelect2();
        $('#sel').change(mostrarCoche2);
      });
    </script>
  </head>
  <body>
    <jsp:include page="inc/menu.jsp" />    
    <main>
      <h1>Coches</h1>
      <form id="frm">
        <div class="row mb-3">
          <div class="col-auto">
            <select id="sel" class="form-control">
            </select>
          </div>
        </div>
      </form>
      <p id="coche"></p>
    </main>
    <%@ include file="inc/footer.jsp" %>
  </body>
</html>
