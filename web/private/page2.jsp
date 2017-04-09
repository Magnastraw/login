<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Page 2</title>
</head>
<body>

<p>Welcome to page 2, <c:out value='<%=session.getAttribute("username") %>'/></p>
</body>
</html>
