<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	 <form:form method="post" action="${pageContext.request.contextPath}/addUser" modelAttribute="createUser">
        <div>
            <form:label path="userName">Name</form:label>
            <form:input path="userName" />
        </div>
        <div>
            <form:label path="userEmail">Email</form:label>
            <form:input type="email" path="userEmail" />
        </div>
        <div>
            <form:label path="userPassword">Password</form:label>
            <form:password path="userPassword" />
        </div>
        <div>
            <input type="submit" value="Submit" />
        </div>
    </form:form>
</body>
</html>