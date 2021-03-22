<!DOCTYPE html>
<html>
  <head>
    <title>ELectura de etiquetas de fichero XML Empleados</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <jsp:include page="inc/header.jsp" />    
    <script>
      $(document).ready(function () {
        $("#botoncargar").click(function () {
          $.get("doc/empleados.xml", function (data) {
            var apellidos = $(data).find("APELLIDO");
            var html = "";
            apellidos.each(function () {
              var apellido = $(this).text();
              html += "<li class=\"list-group-item\">" + apellido + "</li>";
            });
            $("#listaempleados").html(html);
          });
        });
      });
    </script>
  </head>
  <body>
    <jsp:include page="inc/menu.jsp" />    
    <main>
      <h1>Lectura de etiquetas de fichero XML Empleados</h1>
      <button type="button" class="btn btn-primary" id="botoncargar">
        Cargar empleados XML
      </button>
      <ul class="list-group mt-3" id="listaempleados">
      </ul>
    </main>
    <%@ include file="inc/footer.jsp" %>
  </body>
</html>
