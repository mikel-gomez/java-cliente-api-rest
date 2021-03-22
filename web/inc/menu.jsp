<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-dark bg-secondary">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.jsp">Cliente API Rest</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            Opciones
          </a>
          <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
            <li><a class="dropdown-item" href="web01empleadossimplexml.jsp">Lectura de etiquetas de fichero XML Empleados</a></li>
            <li><a class="dropdown-item" href="web02hospitalatributosxml.jsp">Lectura de atributos de fichero XML Hospitales</a></li>
            <li><hr class="dropdown-divider"></li>
          </ul>
        </li>        
        <li class="nav-item"><a class="nav-link" href="web01empleadossimplexml.jsp">Etq.XML</a></li>
        <li class="nav-item"><a class="nav-link" href="web02hospitalatributosxml.jsp">Atr.XML</a></li>
      </ul>
    </div>
  </div>
</nav>