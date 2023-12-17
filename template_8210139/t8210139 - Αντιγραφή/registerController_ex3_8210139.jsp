<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_ex3_8210139.jsp" %>
<%@ page import="exercise3_2023_2024_8210139.*" %>

<%
    String name = request.getParameter("name");
    String surname = request.getParameter("surname");
    String email = request.getParameter("email");
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String confirm = request.getParameter("confirm");
    String terms[] = request.getParameterValues("terms");

    boolean isNull = false;
/*
 * If page is called directly (from url) and not via lesson2_example2.jsp then all parameters will be null.
 * (In that case lesson2_example1_errorpage.jsp will respond)
 */
%>

<!DOCTYPE html>
<html>
    <head>
        <%@ include file="header_ex3_8210139.jsp" %>

        <!-- Adding some custom style to page -->
        <style type="text/css">
            form { max-width: 600px; }
            .main-label { font-size: 16px; }
        </style>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
    </head>
    <body>
        <!-- Fixed navbar -->
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span> <span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">8210139</a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav">
						<li><a class="about-us" href="about_us.jsp"><h4>About us</h4></a></li>
                        <li><a id="login-regiser" href="register.jsp"><h4>Register</h4></a></li>
                        <li><a href="login.jsp"><h4>Login</h4></a></li>				
					</ul>		
		
				</div>
				<!--/.nav-collapse -->
			</div>
		</nav>
        <div class="container theme-showcase" role="main">
			<!-- Main jumbotron for a primary marketing message or call to action -->
			<div class="jumbotron">
				<h1>2η Ατομική 'Ασκηση</h1>
			</div>
		</div>


      <div class="container">
        <%
        if (name == null || name.length() < 3 || surname == null || surname.length() < 3 || username == null || username.length() < 5 || password == null || password.length() < 6 || !confirm.equals(password) || confirm == null || terms == null) {
            isNull = true;
        }
        if (isNull == true) { 
            %>
            <h1>Registration form has errors</h1>
            <div class="alert alert-danger" role="alert">
                <ol>
                    <%
                    if (name == null || name.length() < 3) { %>
                        <li >Name must be at least 3 characters long</li>  
                    <%
                    }
                    if (surname == null || surname.length() < 3) { %>
                             <li >Surname must be at least 3 characters long</li>  
                    <%
                    }
                    if (username == null || username.length() < 5) { %>
                               <li >Username must be at least 5 characters long</li>  
                    <%
                    }      
                    if (password == null || password.length() < 6) { %>
                               <li >Password must be at least 6 characters long</li>  
                    <%
                    }
                    if (confirm != password ) { %>
                               <li >Password and confirm do not match</li>  
                    <%
                     }
                    if (terms == null || terms.length == 0) { %>
                         <li >You must agree to terms and conditions</li>
                    <%
                    } 
                    %>           

                </ol>
            </div>
            <div>
                <button type="button" class="btn btn-info" onclick="window.location.href='register_ex3_8210139.jsp'" >
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> Back to the form
                </button>                       
            </div>
                 
            <%
            }else {
                try{
                    UserDAO ud = new UserDAO();
                    User myuser = new User(name,surname,email,username,password);
                    ud.register(myuser);
                %>
                    <h1>Registration almost done!</h1>
                    <div class="alert alert-success">
                        <p><strong>Note:</strong> A verification link has been sent to the email: <%= email %></p>
                    </div>
                    <ul class="list-unstyled">
                        <li><strong>Name:</strong> <%= name %></li>
                        <li><strong>Surname:</strong> <%= surname %></li>
                        <li><strong>Email:</strong> <%= email %></li>
                        <li><strong>Username:</strong> <%= username %></li>
                    </ul>
                <%
                } catch (Exception e) {
                %>
                    <h1>Registration form has errors</h1>
                    <div class="alert alert-danger" role="alert">
                        <p >Sorry, username or email already registered</p>
                    </div>
                    <div>
                        <button type="button" class="btn btn-info" onclick="window.location.href='register_ex3_8210139.jsp'" >
                            <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> Back to the form
                        </button>                       
                    </div>
                <%
                }
            }
            %>	
            </div>
		</div> <!--end-container-->
        <%@ include file="footer_ex3_8210139.jsp" %>
      </body>
    </html>
    