<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="GoG.Car" %>
<%@ page import="GoG.CarDAO" %>


<%
String pick_up= request.getParameter("pick_up");
String pick_up_time= request.getParameter("pick_up_time");
String drop_off = request.getParameter("drop_off");
String drop_off_time= request.getParameter("drop_off_time");
String location = request.getParameter("location");
List<Car> carList= (List<Car>) request.getAttribute("carList");



%>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device=width, initial-scale=1.0">
    <title>Results</title>
    <link rel = "stylesheet" href="style.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body style="background-color: #fff;">

    <div class="header" style="height: 10vh; background-color: #036;">
       
        <span href="#" class="logo" onclick="window.location.href='search.jsp'">
            <img src="images/blue_back-removebg-preview.png">
        </span>
        <div class="header-right">
            <a class="profile-btn" href="#"><span></span>Profile</a>
        
        </div>
    </div>

    <div class="main">
        <div class = "container">
            <div class="search-bar">
                <form method="post" action="results.jsp">

                    <div class="location-input">
                        <label>Location</label>
                        <select  name="location" class="form-control" required>
                            <option value="<%=location%>"><%=location%></option>
                            <option value="Airport">Αεροδρόμιο</option>
                            <option value="syntagma">Σταθμός Συντάγματος</option>	
                            <option value="pireus">Λιμάνι Πειραιά</option>
                        </select>
                    </div>
                
                    <div class="Pickup-input">
                        <label>Pick Up</label>
                        <input type="date" value="<%=pick_up%>"">
                    </div>
                    <div class="Pickup-Time">
                        <label>Time</label>
                        <input type="time" placeholder= "e.g. 01-01-2023" value="<%=pick_up_time%>">
                    </div>
                    <div class="Dropoff-input">
                        <label>Drop Off</label>
                        <input type="date" value="<%=drop_off%>">
                    </div>
                    <div class="Dropoff-Time">
                        <label>Time</label>
                        <input type="time" placeholder= "e.g. 01-01-2023" value="<%=drop_off_time%>">
                    </div>
                    <button class="search-btn" >Search</button>
                </form>


            </div>
        </div>
    </div>
    
    <!-- Filters -->
    <div class="sidenav">
        <button class="filters-btn" onclick="dropDownMenu()"><p>Filters<span class="glyphicon glyphicon-filter"></span></p>
            <i class="fa fa-caret-down"></i>
        </button>
        <div class="dropdown-container">

            <button class="vechile-type-btn" onclick="dropDownMenu()"><h5>Vechile Type</h5> 
                <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-container">
                <a href="#"><h6>Car</h5></a>
                <a href="#"><h6>Motorcycle</h6></a>
                <a href="#"><h6>Bicycle</h6></a>
                <a href="#"><h6>Truck</h6></a>
            </div>

            <button class="category-btn" onclick="dropDownMenu()"><h5>Category</h5> 
                <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-container">
                <a href="#"><h6>Super Sport</h5></a>
                <a href="#"><h6>Off-Road</h6></a>
                <a href="#"><h6>SUV</h6></a>
                <a href="#"><h6>Sedan</h6></a>
            </div>

            <button class="engine-type-btn" onclick="dropDownMenu()"><h5>Engine Type</h5> 
                <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-container">
                <a href="#"><h6>gasoline</h6></a>
                <a href="#"><h6>diesel</h6></a>
                <a href="#"><h6>hybrid</h6></a>
                <a href="#"><h6>fully electric</h6></a>
            </div>

            <button class="transmissiom-btn" onclick="dropDownMenu()"><h5>Transmission</h5> 
                <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-container">
                <a href="#"><h6>automatic</h6></a>
                <a href="#"><h6>manual</h6></a>
            </div>
            
            <button class="interior-btn" onclick="dropDownMenu()"><h5>Interior</h5> 
                <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-container">
                <a href="#"><h6>Cloth Interior</h6></a>
                <a href="#"><h6>Leather Interior</h6></a>
                <a href="#"><h6>High-End Interior</h6></a>
                <a href="#"><h6>Customized Interior</h6></a>
            </div>
        </div>
    </div>

    





    <!-- Filters -->



    <!-- Products -->
    <div class="Products">

        <%
		if (request.getAttribute("message") != null) {
		%>
			<div class="alert alert-danger text-center">

				<%=(String)request.getAttribute("message") %>

			</div>
		<%
		} else {
	
    
         try{

           

          for (Car c : carList) {
            

        %>

                    
        <div class="card">
            <img class="card-img-top" src="images/volkswagen_up.jpeg" alt="Image Description">
        
            <div class="card-body">
                <div class="mb-2">
                <h4>
                    <a class="text-secondary" href="#"> <%=c.getModel()%></a>
                </h4>
                <h5>
                    <div class="car-owner" href="#">by <%=c.getOwnerID()%></div>
                    <div><%=c.getFuel()%>|<%=c.getTransmission()%>|<%=c.isHybrid()%> </div>
                </h5>
                <div class="d-block">
                    <span class="price"><span class="glyphicon glyphicon-euro" aria-hidden="true"></span><%=c.getPrice()%>/day</span>
                </div>
                </div>
            </div>
        
            <div class="card-footer">
                <div class="mb-3">
                <a class="d-inline-flex align-items-center small" href="#">
                </a>
                </div>
                <button class="book-button"><a href="checkout.jsp">Book Now</a></button>
            </div>
            </div>
            <!-- End Product -->

        <%
          }

          

      } catch (Exception e) {
        
 
        %>

        
        <p>Error: <%= e.getMessage() %></p>
        
        <%    


      }
    }
          %>

    </div>



    <div class="footer">
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