<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device=width, initial-scale=1.0">
        <title>Register Page</title>
        <link rel = "stylesheet" href="style.css">
    </head>
    <body class="register-body">
        <header>
            <nav class="header-nav">
                <ul>
                    <li><a class="about-us" href="about_us.html"><h4>About us</h4></a></li>
                    <li><a id="login-regiser" href="register.jsp"><h4>Register</h4></a></li>
                    <li><a href="login.jsp"><h4>Login</h4></a></li>
                </ul>
            </nav>
        </header>

        <h1 class="reg-h1"><strong>CREATE YOUR ACCOUNT</strong></h1>

        <form method="POST" action="registerController.jsp">
            <div class="data-inputs">
                <div>
                    <label>USERNAME</label>
                </div>
                <div>
                    <input type="text" id="username" name="username">
                </div>
                <br>
                <div>
                    <label for="email">MAIL</label>
                </div>
                <div>
                    <input type="email" id="mail" name="email">
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
                        <a class="as-host" href="registerController.jsp" onclick="registerAs('host')"><strong>Register As Host</strong></a>
                        <a class="as-guest" href="registerController.jsp" onclick="registerAs('guest')"><strong>Register As Guest</strong></a>
                    </div>
                </div>
                <br>
            </div>

        </form>

        <div class="reg-log-footer">
            <label>GoGoCars</label>
            <div class="b-example-divider"></div>
        
            <div class="container">
                <footer>
                    <ul class="nav justify-content-center border-bottom pb-3 mb-3">
                        <li class="nav-item"><a href="search.jsp" class="nav-link px-2 text-body-secondary">Home</a></li>
                        <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">About Us</a></li>
                        <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Contact</a></li>
                        <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">FAQs</a></li>
                    </ul>
                    <p>&copy; 2023 Company, Inc</p>
                </footer>
            </div>
                
            </div>
        </div>
        <script src="script.js"></script>
    </body>
</html>