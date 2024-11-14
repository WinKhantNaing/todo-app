<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Form</title>
    <link rel="stylesheet" href="resources/css/login.css">
</head>
<body>
	
    <section class="loginForm login d-block">
    <form:form class="loginFirst form d-flex flex-column flex-between" modelAttribute="user" action="login" method="post">
        <div class="firstDiv">
            <h3 class="header text-center">Login</h3>
            <div style="text-align:center; color: red; margin-top:10px; margin-buttom: 10px;">${msg}</div>
            <div class="email input-box">
                <i class="fas fa-envelope"></i>
                <form:input id="email" path="userEmail" type="email" required="required" class="" autocomplete="new-email"/>
                <label>
                    <small>Email</small>
                </label>
            </div>
            <div class="password input-box">
                <i class="fas fa-lock"></i>
                <form:password required="required" class="" path="userPassword" id="password" autocomplete="new-password"/>
                <label>
                    <small>Password</small>
                </label>
            </div>
            <div class="loginButton">
                <button type="submit" class="">Login</button>
            </div>
            <div class="noAccount">
                <p>Don't have an account?
                    <a href="#" class="register-button">Register</a>
                </p>
            </div>
        </div>
    </form:form>
	
    <form:form method="post" action="addUser" modelAttribute="createUser" class="register form d-flex flex-column flex-between" >
    
        <div class="firstDiv">
            <h3 class="header text-center">Registration</h3>
            <div class="name input-box">
                <i class="fas fa-user"></i>
                <form:input path="userName" type="text" required="required" class="" autocomplete="new-name"/>
                <label>
                    <small>Username</small>
                </label>
            </div>
            <div class="email input-box">
                <i class="fas fa-envelope"></i>
                <form:input type="email" required="required" class="" path="userEmail" />
                <label>
                    <small>Email</small>
                </label>
            </div>
            <div class="password input-box">
                <i class="fas fa-lock"></i>
                <form:password path="userPassword" required="required" class="" autocomplete="new-password"/>
                <label>
                    <small>Password</small>
                </label>
            </div>
            <div class="loginButton">
                <button type="submit" class="">Register</button>
            </div>
            <div class="noAccount">
                <p>Already have an account?
                    <a href="#" class="login-button">Login</a>
                </p>
            </div>
        </div>
    </form:form>
</section>

    <script>
    const loginButton = document.querySelector(".login-button");
    const registerFirst = document.querySelector(".register-button");
    const login = document.querySelector(".login");
    const register = document.querySelector(".register");
    const loginFirst = document.querySelector(".loginFirst");

    loginButton.addEventListener("click", ()=>{
        login.classList.remove("active");
        loginFirst.classList.remove("moveOne");
        register.classList.remove("move");
    })

    registerFirst.addEventListener("click", ()=>{
        loginFirst.classList.add("moveOne");
        login.classList.add("active");
        register.classList.add("move");
    })

    </script>
	<script src="resources/js/fontawesome.js"></script>
    
</body>
</html>