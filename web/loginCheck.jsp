<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String name =  session.getAttribute("name").toString();
    String password =  session.getAttribute("password").toString();
%>
<c:set var="name" scope="session" value="<%=name %>"/>
<c:set var="password" scope="session" value="<%=password %>"/>
<c:if test="${(name!= 'denis') && (password != '12345')}">
    <jsp:forward page="error.jsp"/>
</c:if>

