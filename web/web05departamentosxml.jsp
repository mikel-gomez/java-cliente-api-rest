<!DOCTYPE html>
<html>
  <head>
    <title>Departamentos</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="inc/header.jsp" />    
    <script>
      function mensaje(cadena) {
        console.log(cadena);
      }

      function cargaDepSelect() {
        $.ajax({
          url: 'doc/departamentosatributos.xml',
          method: 'GET',
          dataType: 'xml',
          success: function (data) {
            mensaje('Documento cargado');
            var html = '';
            var departamentos = $(data).find("DEPT");
            departamentos.each(function () {
              var dept_no = $(this).attr('DEPT_NO');
              var dnombre = $(this).find('DNOMBRE').text();
              var loc = $(this).find('LOC').text();
              html += '<option value=' + dept_no + '>' + dept_no + ' - ' + dnombre + '</option>';
            });
            $('#depsel').html(html);
          }
        });
        return false;
      }

      function cargaDep() {
        mensaje('cargaDep');
        var dept_no = $('#depsel').val();
        var filtro = 'DEPT[DEPT_NO=' + dept_no + ']';
        $.ajax({
          url: 'doc/departamentosatributos.xml',
          method: 'GET', 
          dataType: 'xml',
          success: function(data) {
            var departamento = $(data).find(filtro).first();
            var dept_no = $(departamento).attr('DEPT_NO');
            var dnombre = $(departamento).find('DNOMBRE').text();
            var loc = $(departamento).find('LOC').text();
            var html = 'Departamento: ' + dept_no + '</br>Nombre: ' + dnombre + '</br>Lugar: ' + loc;
            $('#departamento').html(html);
          }
        });
        return false;
      }

      $(document).ready(function () {
        cargaDepSelect();
        $('#frm').submit(cargaDep);
      });
    </script>
  </head>
  <body>
    <jsp:include page="inc/menu.jsp" />    
    <main>
      <h1>Departamentos</h1>
      <form id="frm">
        <div class="row mb-3">
          <div class="col-auto">
            <select id="depsel" class="form-control">
            </select>
          </div>
          <div class="col-auto">
            <button type="submit" class="btn btn-primary">Buscar departamento</button>
          </div>
        </div>
      </form>
      <p id="departamento"></p>
    </main>
    <%@ include file="inc/footer.jsp" %>
  </body>
</html>
