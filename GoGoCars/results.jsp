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
List<Car> carList= (List<Car>) request.getAttribute("carList");
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
        
        </div>
    </div>

    <div class="main">
        <div class = "container">
            <div class="search-bar">
                <form method="post" action="resultsController.jsp">
                    <div class="sidenav">
                        <button class="filters-btn" onclick="dropDownMenu()">
                            <p>Filters<span class="glyphicon glyphicon-filter"></span></p>
                            <i class="fa fa-caret-down"></i>
                        </button>
                        <div class="dropdown-container">
                            <!-- Add buttons for different filters (vehicle type, category, engine type, transmission) -->
                            <button class="vehicle-type-btn" onclick="showFilterOptions('vehicleTypeFilter')">Vehicle Type</button>
                            <div class="filter-options" id="vehicleTypeFilter">
                                <a href="#" onclick="setFilter('vehicleType', 'Car')">Car</a>
                                <a href="#" onclick="setFilter('vehicleType', 'Motorcycle')">Motorcycle</a>
                                <a href="#" onclick="setFilter('vehicleType', 'Bicycle')">Bicycle</a>
                                <a href="#" onclick="setFilter('vehicleType', 'Truck')">Truck</a>
                            </div>
                            <!-- Repeat similar structure for other filters -->
                            <button class="category-btn" onclick="showFilterOptions('categoryFilter')">Category</button>
                            <div class="filter-options" id="categoryFilter">
                                <a href="#" onclick="setFilter('categoryType', 'Super Sport')">Super Sport</a>
                                <a href="#" onclick="setFilter('categoryType', 'Off-Road')">Off-Road</a>
                                <a href="#" onclick="setFilter('categoryType', 'Compact')">Compact</a>
                                <a href="#" onclick="setFilter('categoryType', 'SUV')">SUV</a>
                                <a href="#" onclick="setFilter('categoryType', 'Sedan')">Sedan</a>
                            </div>
                            <!-- Engine Type -->
                            <button class="engine-type-btn" onclick="showFilterOptions('engineTypeFilter')">Engine Type</button>
                            <div class="filter-options" id="engineTypeFilter">
                                <a href="#" onclick="setFilter('engineType', 'Gasoline')">Gasoline</a>
                                <a href="#" onclick="setFilter('engineType', 'Diesel')">Diesel</a>
                                <a href="#" onclick="setFilter('engineType', 'Hybrid')">Hybrid</a>
                                <a href="#" onclick="setFilter('engineType', 'Fully Electric')">Fully Electric</a>
                            </div>
                            <!-- Transmission -->
                            <button class="transmission-btn" onclick="showFilterOptions('transmissionFilter')">Transmission</button>
                            <div class="filter-options" id="transmissionFilter">
                                <a href="#" onclick="setFilter('transmissionType', 'Automatic')">Automatic</a>
                                <a href="#" onclick="setFilter('transmissionType', 'Manual')">Manual</a>
                            </div>
                        </div>
                    </div>
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
    <form method="post" action="resultsController.jsp">
        <div class="sidenav">
            <button class="filters-btn" onclick="dropDownMenu()"><p>Filters<span class="glyphicon glyphicon-filter"></span></p>
                <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-container">
            
                <!-- Vechile Type -->
                <button id="vechileTypeFilterBtn" class="vechile-type-btn" onclick="dropDownMenu('vechileTypeFilter')">
                    <h5>Vechile Type</h5> 
                    <i class="fa fa-caret-down"></i>
                </button>
                <div class="dropdown-container" id="vechileTypeFilter">
                    <a href="#" onclick="setFilter('vechileType', 'Car')">Car</a>
                    <a href="#" onclick="setFilter('vechileType', 'Motorcycle')">Motorcycle</a>
                    <a href="#" onclick="setFilter('vechileType', 'Bicycle')">Bicycle</a>
                    <a href="#" onclick="setFilter('vechileType', 'Truck')">Truck</a>
                </div>
        <!-- Category -->
<button id="categoryTypeFilterBtn" class="category-btn" onclick="dropDownMenu('categoryTypeFilter')">
    <h5>Category</h5> 
    <i class="fa fa-caret-down"></i>
</button>
<div class="dropdown-container" id="categoryTypeFilter">
    <a href="#" onclick="setFilter('categoryType', 'Super Sport')">Super Sport</a>
    <a href="#" onclick="setFilter('categoryType', 'Off-Road')">Off-Road</a>
    <a href="#" onclick="setFilter('categoryType', 'Compact')">Compact</a>
    <a href="#" onclick="setFilter('categoryType', 'SUV')">SUV</a>
    <a href="#" onclick="setFilter('categoryType', 'Sedan')">Sedan</a>
</div>

<!-- Engine Type -->
<button id="engineTypeFilterBtn" class="engine-type-btn" onclick="dropDownMenu('engineTypeFilter')">
    <h5>Engine Type</h5> 
    <i class="fa fa-caret-down"></i>
</button>
<div class="dropdown-container" id="engineTypeFilter">
    <a href="#" onclick="setFilter('engineType', 'gasoline')">Gasoline</a>
    <a href="#" onclick="setFilter('engineType', 'diesel')">Diesel</a>
    <a href="#" onclick="setFilter('engineType', 'hybrid')">Hybrid</a>
    <a href="#" onclick="setFilter('engineType', 'fully-electric')">Fully Electric</a>
</div>

<!-- Transmission -->
<button id="transmissionTypeFilterBtn" class="transmissiom-btn" onclick="dropDownMenu('transmissionTypeFilter')">
    <h5>Transmission</h5> 
    <i class="fa fa-caret-down"></i>
</button>
<div class="dropdown-container" id="transmissionTypeFilter">
    <a href="#" onclick="setFilter('transmissionType', 'Automatic')">Automatic</a>
    <a href="#" onclick="setFilter('transmissionType', 'Manual')">Manual</a>
</div>
            <!-- 
            <button class="interior-btn" onclick="dropDownMenu()"><h5>Interior</h5> 
                <i class="fa fa-caret-down"></i>
            </button>
            <div class="dropdown-container">
                <a href="#"><h6>Cloth Interior</h6></a>
                <a href="#"><h6>Leather Interior</h6></a>
                <a href="#"><h6>High-End Interior</h6></a>
                <a href="#"><h6>Customized Interior</h6></a>
            </div>
            -->
        </div>
    </div>
    
    </form>
    <!-- Products -->
    <main class="row justify-content-center">
      


<% 
if (carList != null) {                
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
                        <a href="checkout.jsp?carID=<%=car.getCarID()%>&hostID=<%=carOwner.getUserID()%>&pickUp=<%=pickUp%>&dropOff=<%=dropOff%>&location=<%=location%>">Book Now</a>
                    </button>
                </div>
            </div>
               
        </div>           
    <% }
}%>
    
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