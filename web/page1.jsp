<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Page 1</title>
</head>
<body>
<%@ include file="loginCheck.jsp"%>
<p>Welcome to page 1, <c:out value='<%=request.getParameter("name") %>'/></p>
</body>
</html>
