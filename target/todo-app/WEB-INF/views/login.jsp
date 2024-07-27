<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form:form  modelAttribute="user" action="login" method="post" >
	<div>${msg}</div>
          <form:input placeholder="User Email" path="userEmail" />
          <form:password placeholder="Password" path="userPassword" />
          <button type="submit">login</button>
          <p class="message">Not registered? <a href="userRegister">Create an account</a></p>
        </form:form>
		
</body>
</html>