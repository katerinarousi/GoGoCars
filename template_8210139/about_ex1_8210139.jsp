<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>Example Lesson1: Registration Form</title>

        <!-- Bootstrap core CSS -->      
        <link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap.min.css">
		
		<link rel="stylesheet" href="<%=request.getContextPath() %>/css/bootstrap-theme.min.css">
		<link rel="stylesheet" href="<%=request.getContextPath() %>/css/theme_8210139.css">
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
						<li class="active"><a href="index_ex1_8210139.jsp">Home</a></li>
						<li><a href="register_ex1_8210139.jsp">Register</a></li>					
						<li><a href="about_ex1_8210139.jsp">About</a></li>					
					</ul>		
		
				</div>
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
				  <h1 class="media-heading">Zoi Spyridi <span style="color: grey; font-size: 24px;"> 8210139</span></h1>
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
				  <h1 class="media-heading">Aikaterini Rousi <span style="color: grey; font-size: 24px;"> 8210139</span></h1>
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
				  <h1 class="media-heading">Iasonas Nerantzakis <span style="color: grey; font-size: 24px;"> 8210139</span></h1>
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
				  <h1 class="media-heading">Kyriaki Parastatidou <span style="color: grey; font-size: 24px;"> 8210139</span></h1>
				  <span class="glyphicon glyphicon-envelope"></span> t8210119@aueb.gr
				</div>
			</div>

		</div>
			  

		<!-- footer -->
		<footer class="navbar-inverse">
			<div class="container">
				<div class="row">
					<div class="col-xs-12">
						<p class="text-center">&copy; Copyright 2023 by ismgroup14</p>
					</div>
				</div>
			</div>
		</footer>
		<!-- End footer -->
    
          <!-- JavaScript files before the closing body tag -->
          <script src="<%=request.getContextPath() %>/js/jquery.min.js"></script>
          <script src="<%=request.getContextPath() %>/js/bootstrap.min.js"></script>
      </body>
</html>
    