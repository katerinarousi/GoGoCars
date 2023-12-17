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
%>

<!DOCTYPE html>
<html lang="en">
	<head>        
		<%@ include file="header_ex3_8210139.jsp" %>
	</head>
	
	<body>
        <% 
		String username = user.getUsername();
   		String firstname =user.getFirstname();
   		String lastname =user.getLastname();
   		String textSignIn = "Signed in as " + username;
   
   		UserDAO uDAO = new UserDAO();
   		List<User> userList = uDAO.getUsers(); %>
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

			<!-- Page Title -->
			<div class="page-header">
				<h1>Welcome <a class="text-danger"><%=firstname%> <%=lastname%></a></h1>
			</div>
            
            <div class="row">

                <div class="col-xs-12">
                    <h2>Available Users <span class="badge"><%=userList.size()%></span></h2>
                </div>
				<table class="table table-bordered">
					<thead>
						<tr class="p-3 mb-2 bg-info text-dark">
							<th>A/A</th>
							<th>Last Name</th>
							<th>First Name</th>
							<th>Email</th>
						</tr>
					</thead>
					<tbody>
					<%
						int countUsers = 0;
						for (User u : userList) {
    						countUsers++;
   							String userUsername = u.getUsername();
    						if (userUsername.equals(username)) {
                    %>
        					<tr class="p-3 mb-2 bg-success text-dark">
								<td><%= countUsers %></td>
    							<td><%= u.getLastname() %></td>
   								<td><%= u.getFirstname() %></td>
								<td><a href="profile_ex3_8210139.jsp?uname=<%= u.getUsername()%>"><%= u.getEmail() %></a></td>

    						</tr>
    				<%
   							 } else {
    				%>
							<tr>
								<td><%= countUsers %></td>
								<td><%= u.getLastname() %></td>
						   		<td><%= u.getFirstname() %></td>
								<td><a href="profile_ex3_8210139.jsp?uname=<%= u.getUsername()%>"><%= u.getEmail() %></a></td>
							</tr>
					<%
							}
						}	
					%>

					
					</tbody>
				</table>

            </div>
			
		</div>
		<!-- /container -->
        <%@ include file="footer_ex3_8210139.jsp" %>
	</body>
</html>