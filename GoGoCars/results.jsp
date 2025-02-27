
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="GoG.Car" %>
<%@ page import="GoG.CarDAO" %>
<%@ page import="GoG.User" %>
<%@ page import="GoG.UserDAO" %>

<%@ include file="authentication_guard.jsp" %>

<%
String pickUp= request.getParameter("pickUp");
String pickUpTime= request.getParameter("pickUpTime");
String dropOff = request.getParameter("dropOff");
String dropOffTime= request.getParameter("dropOffTime");
String location = request.getParameter("location");
UserDAO userDAO = new UserDAO();
List<Car> carList= (List<Car>)request.getAttribute("carList");
List<Car> copy = carList;
List<User> users = userDAO.getUsersID_first_last_name();


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
            <a href="logout.jsp" class="profile-btn"><span></span>Logout</a>
        
        </div>
    </div>

    <div class="main">
        <div class = "container">
            <div class="search-bar">
                <form method="post" action="searchController.jsp">

                    <div class="location-input">
                        <label>Location</label>
                        <select  name="location" class="form-control" required>
                            <option value="<%=location%>"><%=location%></option>
                            <option value="Airport">Airport</option>
                            <option value="Syntagma">Syntagma Square</option>	
                            <option value="Pireus">Port of Piraeus</option>
                        </select>
                    </div>
                
                    <div class="Pickup-input">
                        <label>Pick Up</label>
                        <input type="date" value="<%=pickUp%>" name="pickUp">
                    </div>
                    <div class="Pickup-Time">
                        <label>Time</label>
                        <input type="time" placeholder= "e.g. 01-01-2023" value="<%=pickUpTime%>" name="pickUpTime">
                    </div>
                    <div class="Dropoff-input">
                        <label>Drop Off</label>
                        <input type="date" value="<%=dropOff%>" name="dropOff" >
                    </div>
                    <div class="Dropoff-Time">
                        <label>Time</label>
                        <input type="time" placeholder= "e.g. 01-01-2023" value="<%=dropOffTime%>" name="dropOffTime" >
                    </div>
                    <button class="search-btn" >Search</button>
                </form>


            </div>
        </div>
    
    
    
    
    
    </div>

    <!-- <%
    if (request.getAttribute("message") != null) {
    %>
        <div class="alert alert-danger text-center">
            "There are no cars available on these dates."
    
        </div>
    <%
    } else {
    %>-->
    <!-- Filters -->

        <div class="sidenav">
            <%carList = (List<Car>)request.getAttribute("copy"); %>
            <button class="filters-btn" onclick="dropDownMenu('filters')">
                <p>Filters<span class="glyphicon glyphicon-filter"></span></p>
            </button>

                <div class="dropdown-container" id="filters" style="z-index: 10; position:relative; ">
                    <button class="clear-filters"><a href="searchController.jsp?pickUp=<%=pickUp%>&dropOff=<%=dropOff%>&location=<%=location%>" style="background-color: #f0f0f0; color:black; border: none;"> Clear Filters </a></button>
                    <h5 class="category-btn">Category</h5> 
                        <a href="resultsController.jsp?filtertype=carType&filtervalue=Compact&pickUp=<%=pickUp%>&dropOff=<%=dropOff%>&location=<%=location%>"><h6>Compact</h6></a>
                        <a href="resultsController.jsp?filtertype=carType&filtervalue=SUV&pickUp=<%=pickUp%>&dropOff=<%=dropOff%>&location=<%=location%>"><h6>SUV</h6></a>
                        <a href="resultsController.jsp?filtertype=carType&filtervalue=Sedan&pickUp=<%=pickUp%>&dropOff=<%=dropOff%>&location=<%=location%>"><h6>Sedan</h6></a>

                    <h5 class="engine-type-btn">Engine Type</h5> 
                        <a href="resultsController.jsp?filtertype=fuel&filtervalue=Gasoline&pickUp=<%=pickUp%>&dropOff=<%=dropOff%>&location=<%=location%>"><h6>Gasoline</h6></a>
                        <a href="resultsController.jsp?filtertype=fuel&filtervalue=Diesel&pickUp=<%=pickUp%>&dropOff=<%=dropOff%>&location=<%=location%>"><h6>Diesel</h6></a>
                        <a href="resultsController.jsp?filtertype=fuel&filtervalue=Fully&pickUp=<%=pickUp%>&dropOff=<%=dropOff%>&location=<%=location%>"><h6>Fully Electric</h6></a>

                    <h5 class="transmission-btn">Transmission</h5> 
                        <a href="resultsController.jsp?filtertype=transmission&filtervalue=automatic&carList=carList&pickUp=<%=pickUp%>&dropOff=<%=dropOff%>&location=<%=location%>"><h6>Automatic</h6></a>
                        <a href="resultsController.jsp?filtertype=transmission&filtervalue=manual&carList=carList&pickUp=<%=pickUp%>&dropOff=<%=dropOff%>&location=<%=location%>"><h6>Manual</h6></a>

                    <h5 class="hybrid-type-btn">Hybrid</h5> 
                        <a href="resultsController.jsp?filtertype=hybrid&filtervalue=hybrid&carList=carList&pickUp=<%=pickUp%>&dropOff=<%=dropOff%>&location=<%=location%>"><h6>Hybrid</h6></a>
                        <a href="resultsController.jsp?filtertype=hybrid&filtervalue=nothybrid&carList=carList&pickUp=<%=pickUp%>&dropOff=<%=dropOff%>&location=<%=location%>"><h6>Not Hybrid</h6></a>
                
                </div>
        </div>


    <!-- Products -->
    <main class="row justify-content-center"  style="z-index: 1;">
      
        <%carList = (List<Car>)session.getAttribute("list"); %>


<% 
if (carList != null) {
    String pickUpFilters = request.getParameter("pickUpController");
    String dropOffFilters = request.getParameter("dropOffController");
    String locationFilters = request.getParameter("locationController");     
    for (Car car: carList) {
%>
        <div class="car-results col-md-3">
             
            <div class="card">
                <%--=car.getImage()--%>
    
                <img class="car-image-carousel" src="<%=car.getImage()%>" alt="">
                <div class="card-body">
                    <div class="mb-2">
                        <h4>
                            <a class="text-secondary" href="#"> <%=car.getModel() %>  </a>
                        </h4>
                        <h5>
    
                        <% 
                        User carOwner = null;
                        for (User user: users) {
                            if (user.getUserID().equals(car.getOwnerID())) { 
                                carOwner = user;
                            %>
                            <div class="car-owner" href="#">by <%=carOwner.getFirstname() %> <%= carOwner.getLastname() %></div> 
                            <%
                                break;
                            }
                        }
                        %>
                        <div><%=car.getFuel() %>|<%=car.getYear() %>|<%=car.getCarType() %>|<%=car.getTransmission()%>|<%=car.isHybrid() %></div>
                        </h5>
                        <span class="price"><span class="glyphicon glyphicon-euro" aria-hidden="true"></span><%=car.getPrice() %>/day</span>
                    </div>
                </div>
                    
                <div class="card-footer">
                    <div class="mb-3">
                        <a class="d-inline-flex align-items-center small" href="#">
                        </a>
                    </div>
                    <button class="book-button">
<%
        if (pickUpFilters == null || dropOffFilters == null || locationFilters == null) {
%>
                        <a href="checkout.jsp?carID=<%=car.getCarID()%>&hostID=<%=carOwner.getUserID()%>&pickUp=<%=pickUp%>&dropOff=<%=dropOff%>&location=<%=location%>">Book Now</a>
<%
        } else {
%>
                        <a href="checkout.jsp?carID=<%=car.getCarID()%>&hostID=<%=carOwner.getUserID()%>&pickUp=<%=pickUpFilters%>&dropOff=<%=dropOffFilters%>&location=<%=locationFilters%>">Book Now</a> 
<%
        }
%>
                    </button>
                </div>
            </div>
               
        </div>           
    <% }
} else {
%>
        <div class="container mt-4">
            <div class="danger-button">No cars available for the requested date!</div>
        </div>
<%
}
%>
    
    </main>

    <!--<% 
    } 
    %>-->
        
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
