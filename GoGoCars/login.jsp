<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device=width, initial-scale=1.0">
        <title>Login Page</title>
        <link rel = "stylesheet" href="style.css">
    </head>
    <body class="register-body">
        <header>
            <nav class="header-nav">
                <ul>
                    <li><a class="about-us" href="about_us.jsp"><h4>About us</h4></a></li>
                    <li><a href="register.jsp"><h4>Register</h4></a></li>
                    <li><a href="login.jsp"><h4>Login</h4></a></li>
                </ul>
            </nav>
        </header>

        
        
<% 
if(request.getAttribute("message") != null) { 
%>		
        <div class="container mt-4">
            <div class="danger-button"><%=(String)request.getAttribute("message") %></div>
        </div>
<% 
} else {
%>
        <h2 class="log-h1"> WELCOME BACK!</h2>
<%
}
%>
        <form method="POST" action="loginController.jsp">
            <div class="data-inputs">
                <div>
                    <label for="username">USERNAME</label>
                </div>
                <div>
                    <input type="text" id="username" name="username">
                </div>
                <br>
                <div>
                    <label for="password">PASSWORD</label>
                </div>
                <div>
                    <input type="password" id="password" name="password" required>
                    <div class="toggle-password" onclick="togglePasswordVisibility()">
                        <label for="myCheckbox">Show password</label>
                        <input type="checkbox" id="toggle-icon" name="myCheckbox">
                    </div>
                    <div class="btn-continue">
                        <button class="my-login" type="submit" onclick="return checkFieldsLogin()"><strong>Login</strong></button>
                    </div>
                </div>
                <br>
            </div>

        </form>
        <!--<img class="our-logo-login" src="images/fianil_logo2_slogan.png" alt="">-->
        <!--<div class="quote-log">
            <h2>The world of fast and easy car rentals!</h1>
        </div>-->




        <div class="reg-log-footer" style="padding-top: 10px;">
            <label>GoGoCars</label>
            <div class="b-example-divider"></div>
        
            <div class="container">
                <footer>
                    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
                        <li class="nav-item"><a href="search.jsp" class="nav-link px-2 text-body-secondary">Home</a></li>
                        <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Features</a></li>
                        <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Pricing</a></li>
                        <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">FAQs</a></li>
                        <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">About</a></li>
                    </ul>
                    <p>&copy; 2023 Company, Inc</p>
                </footer>
            </div>
                
            </div>
        </div>
        <script src="script.js"></script>
    </body>
</html>