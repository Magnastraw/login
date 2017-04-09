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
<form action="private/success.jsp">
    <p>Enter Name :
        <input type="text" name="username" /></p>
    <p>Enter Password :
        <input type="password" name="password" /></p>
    <p><input type="submit"  value="submit"/></p>
</form>
</body>
</html>