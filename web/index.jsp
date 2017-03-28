<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Login</title>
</head>
<body>
<form action="#">
    <p>Enter Name :
        <input type="text" name="name" /></p>
    <p>Enter Password :
        <input type="password" name="password" /></p>
    <p><input type="submit" value="submit"/></p>
</form>
<%
    String name = request.getParameter("name");
    String password = request.getParameter("password");
%>
<c:set var="name" value="<%=name %>"/>
<c:set var="pass" value="<%=password %>"/>
<c:if test="${(name == 'denis') && (pass == '12345')}">
    <jsp:forward page="success.jsp">
        <jsp:param name="successName" value="<%=name %>"/>
    </jsp:forward>
</c:if>
<c:if test="${(name != null) && (pass != null)}">
    <jsp:forward page="error.jsp"/>
</c:if>


</body>
</html>