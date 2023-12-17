<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_ex3_8210139.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <%@ include file="header_ex3_8210139.jsp" %>
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
						<li class="active"><a href="index_ex3_8210139.jsp">Home</a></li>
						<li><a href="register_ex3_8210139.jsp">Register</a></li>					
						<li><a href="about_ex3_8210139.jsp">About</a></li>					
					</ul>		
		
				</div>
				<!--/.nav-collapse -->
			</div>
		</nav>

		<div class="container theme-showcase" role="main">

			<!-- Main jumbotron for a primary marketing message or call to action -->
			<div class="jumbotron">
				<h1>3η Ατομική 'Ασκηση</h1>
			</div>

			<!-- Page Title -->
			<div class="page-header">
				<h1>Registration Form</h1>
			</div>
			
		</div>
		<!-- /container -->
		<div class="container">
			<div>
				<p class="alert alert-warning text-center"><strong>Please fill in the following form to create an account</strong></p>
			</div>
			
	
			<form action="registerController_ex3_8210139.jsp" method="POST" class="form-horizontal">
			  <!-- name -->
			  <div class="form-group">
				<label for="name" class="col-sm-3 control-label main-label">Name </label>
				<div class="col-sm-8">
				  <input type="text" name="name" id="name" class="form-control" placeholder="your name">
				</div>
			  </div>
	
			  <!-- surname -->
			  <div class="form-group">
				<label for="surname" class="col-sm-3 control-label main-label">Surname </label>
				<div class="col-sm-8">
				  <input type="text" name="surname" id="surname" class="form-control" placeholder="your surname">
				</div>
			  </div>
	
			  <!-- email -->
			  <div class="form-group">
				<label for="email" class="col-sm-3 control-label main-label">Email </label>
				<div class="col-sm-8">
				  <input type="text" name="email" id="email" class="form-control" placeholder="your email">
				</div>
			  </div>
              <!-- Username -->
			  <div class="form-group">
				<label for="user_name" class="col-sm-3 control-label main-label">Username </label>
				<div class="col-sm-8">
				  <input type="text" name="username" id="username" class="form-control" placeholder="your username">
				</div>
			  </div>
              <!-- password -->
			  <div class="form-group">
				<label for="password" class="col-sm-3 control-label main-label">Password </label>
				<div class="col-sm-8">
				  <input type="text" name="password" id="password" class="form-control" placeholder="your password">
				</div>
			  </div>
             <!-- confirm -->
			  <div class="form-group">
				<label for="confirm" class="col-sm-3 control-label main-label">Confirm </label>
				<div class="col-sm-8">
				  <input type="text" name="confirm" id="confirm" class="form-control" placeholder="confirm your password">
				</div>
			  </div>
			  
			  <!-- latest news --> 
			  <div class="form-group">
				<div class="col-sm-offset-3 col-sm-8">
				  <div class="checkbox">
					<div style="color: blue; padding-bottom: 10px;">
						<label>
							<input type="checkbox" name="terms" value="agree" > I agree to the terms and conditions
						  </label></div>
				  </div>
				</div>
			  <div class="form-group">
				<div class="col-sm-offset-3 col-sm-8">
					<button type="submit" class="btn btn-success btn-lg"><span class="glyphicon glyphicon-ok"></span>Submit</button>
					<button type="button" class="btn btn-danger btn-lg"><span class="glyphicon glyphicon-remove"></span>Cancel</button>
				</div>
			  </div>
            </form>
		</div>	<!-- /.container -->  
			  

		<%@ include file="footer_ex3_8210139.jsp" %>
      </body>
</html>
    
    