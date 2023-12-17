<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_ex2_8210139.jsp" %>
<%@ page import="exercise2_2023_2024_8210139.*" %>
<% 
User user = (User)session.getAttribute("UserObj2023");
%>

<!DOCTYPE html>
<html>
    <head>
        <%@ include file="header_ex2_8210139.jsp" %>
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
						<li class="active"><a href="index_ex2_8210139.jsp">Home</a></li>
						<li><a href="about_ex2_8210139.jsp">About</a></li>
					<% 
					if (user != null) { 
						String username = (String) session.getAttribute("user");
						String textSignIn = "Signed in as" + username;
						%>
							<li class="active"><a href="dashboard_ex2_8210139.jsp">Dashboard</a></li>
										
					</ul>
					<ul class="nav navbar-nav navbar-right">
                        <li>
							<p class="navbar-text"> <%=textSignIn%></p>
						</li>
						<li>
							<a href="logout_ex2_8210139.jsp"><span class="glyphicon glyphicon-log-out"></span> Sign out</a>
						</li>								        	
			        </ul>		
				</div>
					<% } else { 
					%>					
					</ul>
					<ul class="nav navbar-nav navbar-right">
                        <li>
							<a href="register_ex2_8210139.jsp">Register</a>
						</li>
						<li>
							<a href="login_ex2_8210139.jsp"> Sign in</a>
						</li>								        	
			        </ul>		
				</div>
				<%
					}
				%>
				<!--/.nav-collapse -->
			</div>
		</nav>

        <div class="container theme-showcase" role="main">

			<!-- Main jumbotron for a primary marketing message or call to action -->
			<div class="jumbotron">
				<h1>GoGoCars</h1>
			</div>

			<!-- Page Title -->
			<div class="page-header">
				<h1>Group Members</h1>
			</div>
			
		</div>
		<!-- /container -->
		<div class="container">
			<div class="media">
				<div class="media-left">
				  <a href="#">
					<img class="media-object img-thumbnail" src="images/member1.png">
				  </a>
				</div>
				<div class="media-body" style="vertical-align: middle;">
				  <h1 class="media-heading">Spyridi Zoi <span style="color: grey; font-size: 24px;"> 8210139</span></h1>
				  <span class="glyphicon glyphicon-envelope"></span> t8210139@aueb.gr
				</div>
			</div>
            <div class="media">
				<div class="media-left">
				  <a href="#">
					<img class="media-object img-thumbnail" src="images/member1.png">
				  </a>
				</div>
				<div class="media-body" style="vertical-align: middle;">
				  <h1 class="media-heading">Aikaterini Rousi <span style="color: grey; font-size: 24px;"> 8210130</span></h1>
				  <span class="glyphicon glyphicon-envelope"></span> t8210130@aueb.gr
				</div>
			</div>
            <div class="media">
				<div class="media-left">
				  <a href="#">
					<img class="media-object img-thumbnail" src="images/member1.png">
				  </a>
				</div>
				<div class="media-body" style="vertical-align: middle;">
				  <h1 class="media-heading">Iasonas Nerantzakis <span style="color: grey; font-size: 24px;"> 8210103</span></h1>
				  <span class="glyphicon glyphicon-envelope"></span> t8210103@aueb.gr
				</div>
			</div>
            <div class="media">
				<div class="media-left">
				  <a href="#">
					<img class="media-object img-thumbnail" src="images/member1.png">
				  </a>
				</div>
				<div class="media-body" style="vertical-align: middle;">
				  <h1 class="media-heading">Kyriaki Parastatidou <span style="color: grey; font-size: 24px;"> 8210119</span></h1>
				  <span class="glyphicon glyphicon-envelope"></span> t8210119@aueb.gr
				</div>
			</div>

		</div>
		<%@ include file="footer_ex2_8210139.jsp" %>
			  

      </body>
</html>
    