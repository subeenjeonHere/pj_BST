<%--
  Created by IntelliJ IDEA.
  User: jeonsubeen
  Date: 1/23/24
  Time: 8:31 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Community message</title>
</head>
<body>
<c:if test="${not empty message}">
    <div class="alter alter-success" role="alert">
        <c:out value="${message}"/>
    </div>

</c:if>

</body>
</html>
