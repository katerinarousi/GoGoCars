<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>


<!DOCTYPE html>
<html style="height: 100%;
margin: 0;">
<head>
    <meta name="viewport" content="width=device=width, initial-scale=1.0">
    <title>Checkout Rental</title>
    <link rel = "stylesheet" href="style.css">
</head>
<body style="background-color: #fff; display: flex;
flex-direction: column;">

  <div class="header" style="height: 10vh; background-color: #036;">
      <span href="#" class="logo" onclick="window.location.href='search.jsp'">
          <img src="images/blue_back-removebg-preview.png">
      </span>
      <div class="header-right">
          <a class="profile-btn" href="#"><span></span>Profile</a>

      </div>
  </div>


  



 <div class="container" style="flex: 1;
 padding: 20px;">
    <div class="page-header">
        <h1>Oops something went wrong</h1>
    </div>

    <div class="row">

        <div class="col-xs-12">

            <h2>Description</h2>

            <% if(exception != null) { %>	                  	
                <p><code><%=exception %></code></p>						
            <% } %>		

        </div>

    </div>        




</div>


</div>











  

  <div class="footer" style="background-color: #f0f0f0;
  text-align: center;
  padding: 20px;
  margin-top: auto;">
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

    
</body>
</html>