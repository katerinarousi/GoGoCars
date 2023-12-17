<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_ex3_8210139.jsp"%>
<%@ page import="exercise3_2023_2024_8210139.*" %>
<%@ page import="java.util.List" %>

<%
User user = (User)session.getAttribute("UserObj2023");
%>
<%
if (user == null) {
	request.setAttribute("message","You are not authorized to access this resource.Please login.");
%>
    <jsp:forward page="login_ex3_8210139.jsp" />
<% 
}
String username =user.getUsername();
%>

<!DOCTYPE html>
<html lang="en">
	<head>        
		<%@ include file="header_ex3_8210139.jsp" %>
	</head>
	
	<body>
        <% 
		String usernameprofile = request.getParameter("uname");
		UserDAO ud = new UserDAO();
		User myuser = ud.findUser(usernameprofile);
		String textSignIn = "Signed in as " + username;
        %>
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
								<li><a href="index_ex3_8210139.jsp">Home</a></li>										
								<li><a href="about_ex3_8210139.jsp">About</a></li>				
								<li class="active"><a href="dashboard_ex3_8210139.jsp">Dashboard</a></li>
												
							</ul>
							<ul class="nav navbar-nav navbar-right">
								<li>
									<p class="navbar-text"> <%=textSignIn%></p>
								</li>
								<li>
									<a href="logout_ex3_8210139.jsp"><span class="glyphicon glyphicon-log-out"></span> Sign out</a>
								</li>								        	
							</ul>		
				
						</div>
						<!--/.nav-collapse -->
					</div>
				</nav>
		
				<div class="container theme-showcase" role="main">
		
					<!-- Main jumbotron for a primary marketing message or call to action -->
					<div class="jumbotron">
						<h1>3η Ατομική Άσκηση</h1>
					</div>
		<%
		if (myuser == null) {
			%>
				<div class="container theme-showcase" role="main">
					<div class="alert alert-danger text-center" role="alert">
						User not found!
					</div>
				</div>
		<%
		} else {

			String firstname = myuser.getFirstname();
			String lastname = myuser.getLastname();
			String email = myuser.getEmail();
		%>
   

            

            <!-- Page Title ερωτημα γ -->
			<div class="page-header">
				<h1>Profile of: <a class="text-danger"><%=firstname%> <%=lastname%></a></h1>
			</div>
			<!-- Profile Information -->
			<ul class="list-unstyled">
				<li><strong>First Name:</strong> <%=firstname%></li>
				<li><strong>Last Name:</strong> <%=lastname%></li>
				<li><strong>Email:</strong> <%=email%></li>
				<li><strong>Username:</strong> <%=usernameprofile%></li>
			</ul>
	
	<%
		}
	%>


        <!-- /container -->
        <%@ include file="footer_ex3_8210139.jsp" %>
	</body>
</html>