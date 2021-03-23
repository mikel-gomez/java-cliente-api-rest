<!DOCTYPE html>
<html>
  <head>
    <title>Lectura de atributos de fichero XML Hospitales</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="inc/header.jsp" />    
    <script>
      $(document).ready(function () {
        $("#botoncargar").click(function () {
          $.get("doc/hospital_atributos.xml", function (data) {
            var hospitales = $(data).find("HOSPITAL");
            var html = "";
            hospitales.each(function () {
              html += "<tr>";
              html += "<td>" + $(this).attr("NOMBRE") + "</td>";
              html += "<td>" + $(this).attr("DIRECCION") + "</td>";
              html += "<td>" + $(this).attr("TELEFONO") + "</td>";
              html += "<td>" + $(this).attr("NUM_CAMA") + "</td>";
              html += "</tr>";
            });
            $("#tablahospitales > tbody").html(html);
          });
        });
      });
    </script>
  </head>
  <body>
    <jsp:include page="inc/menu.jsp" />    
    <main>
      <h1>Lectura de atributos de fichero XML Hospitales</h1>
      <button type="button" class="btn btn-primary" id="botoncargar">
        Cargar hospitales XML
      </button>
      <ul class="list-group mt-3" id="listahospitales">
      </ul>
      <table id="tablahospitales" class="table table-hover table-striped">
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
