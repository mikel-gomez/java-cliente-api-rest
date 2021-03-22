<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
      <c:if test="${mensaje != null}">
        <div class="alert alert-primary" role="alert" style="position: fixed; bottom: 1rem;">
          <c:out value="${mensaje}" />
        </div>      
      </c:if>
