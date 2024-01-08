<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="GoG.Car" %>
<%@ page import="GoG.CarDAO" %>
<%@ page import="GoG.User" %>
<%@ page import="GoG.UserDAO" %>

<%
CarDAO carDAO = new CarDAO(); 
UserDAO userDAO = new UserDAO();


List<Car> cars = carDAO.getCarouselCars(); 
List<User> users = userDAO.getUsersID_first_last_name();
%>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device=width, initial-scale=1.0">
    <title>Rent a car from our GoGo collection </title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel = "stylesheet" href="style.css">
</head>
<body>
    <div class="header" style=" background-image: linear-gradient(rgba(0,0,0,0.3), #036), url(images/background-rocks.jpg)">
        
        <a href="search.jsp" class="logo">
            <img src="images/final_logo1small-removebg-preview.png">
        </a>
        <div class="header-right">
            <a class="profile-btn" href="rentalinfo.jsp"><span></span>Rental Information</a>
            <a class="profile-btn"><span></span>Profile</a>            
        </div>

        <div>
            <% if(request.getAttribute("message") != null) { %>		
                <div class="warning-button"><%=(String)request.getAttribute("message") %></div>
            <% } %>
        </div>

        <div class = "container">	
            

            <h1 style="font-size:5vw">Find the drive that suits you</h1>
            <h2 style="font-size:2vw">Explore our peer-to-peer rentals</h2>
            <div class="search-bar">
                <form method="post" action="searchController.jsp">
                    <div class="location-input">
                        <label>Location</label>
                        <select  name="location" class="form-control" required>
                            <option value="">Add location</option>
                            <option value="Airport">Airport</option>
                            <option value="Syntagma">Syntagma Square</option>	
                            <option value="Pireus">Port of Piraeus</option>
                        </select>
                    </div>
                    <div class="Pickup-input">
                        <label>Pick Up</label>
                        <input type="date" placeholder= "e.g. 01-01-2023"  name="pickUp" required>
                    </div>
                    <div class="Pickup-Time">
                        <label>Time</label>
                        <input type="time" placeholder= "e.g. 01-01-2023"  name="pickUpTime" required>
                    </div>
                    <div class="Dropoff-input">
                        <label>Drop Off</label>
                        <input type="date" placeholder="Add Date" name="dropOff" required>
                    </div>
                    <div class="Dropoff-Time">
                        <label>Time</label>
                        <input type="time" placeholder= "e.g. 01-01-2023" name="dropOffTime" required>
                    </div>
                    <button class="search-btn" type="submit">Search</button>
                </form>


                <script>
                    function formatDateToYYYYMMDD(inputDate) {
                        const date = new Date(inputDate);
                        const year = date.getFullYear();
                        const month = String(date.getMonth() + 1).padStart(2, '0');
                        const day = String(date.getDate()).padStart(2, '0');
                
                        return `${year}-${month}-${day}`;
                    }
                
                    const pickUpDateInput = document.getElementsByName("pickUp")[0];
                    const dropOffDateInput = document.getElementsByName("dropOff")[0];
                
                    pickUpDateInput.addEventListener("change", function () {
                        const formattedDate = formatDateToYYYYMMDD(this.value);
                        console.log(formattedDate);
                    });
                
                    dropOffDateInput.addEventListener("change", function () {
                        const formattedDate = formatDateToYYYYMMDD(this.value);
                        console.log(formattedDate);
                    });
                </script>


            </div>
        </div>
    </div>
      
    <main>

<!-------------------------------------------------------------------------------------------------------->

        <div class="carousel-container">
            <div class="carousel">
                

<% 
            for (Car car: cars) { 
%>
                <div class="carousel-item">
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
                                <div><%=car.getFuel() %>|<%=car.getYear() %></div>
                            </h5>
                            <span class="price"><span class="glyphicon glyphicon-euro" aria-hidden="true"></span><%=car.getPrice() %>/day</span>
                        </div>
                    </div>
                
                    <div class="card-footer">
                        <div class="mb-3">
                            <a class="d-inline-flex align-items-center small" href="#">
                            </a>
                        </div>
                        <button class="book-button"><a href="checkout.jsp?carID=<%=car.getCarID()%>&hostID=<%=carOwner.getUserID()%>">Book Now</a></button>
                    </div>
                </div>   
                </div>           
<% 
            } 
%>             
            </div>
            <button id="prev"><span>&#8592;</span></button>
            <button id="next"><span>&#8594;</span></button>
        </div>
          
    </main>

 
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
