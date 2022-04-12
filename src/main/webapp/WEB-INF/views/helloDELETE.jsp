<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1><spring:message code="app.title"/> </h1>

<a href="${pageContext.request.contextPath}/user/list"><spring:message code="app.userlist"/></a> <br>
<a href="${pageContext.request.contextPath}/user/guitars/list">GUITARS</a> <br>
<a href="${pageContext.request.contextPath}/user/songs/list">SONGS</a> <br>


</body>
</html>
