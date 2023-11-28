<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% List<Car> cars = CarDAO.getCarouselCars(); %>
<% List<User> users = UserDAO.getUsersID_First_Last_Name();%>

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
        
        <a href="search.html" class="logo">
            <img src="images/final_logo1small-removebg-preview.png">
        </a>
        <div class="header-right">
            <a class="profile-btn" href="rentalinfo.html"><span></span>Rental Information</a>
            <a class="profile-btn" href="rentalinfo.html"><span></span>Profile</a>            
        </div>

        <div class = "container">
            <h1 style="font-size:5vw">Find the drive that suits you</h1>
            <h2 style="font-size:2vw">Explore our peer-to-peer rentals</h2>
            <div class="search-bar">
                <form>
                    <div class="location-input">
                        <label>Location</label>
                        <input type="text" placeholder="Add location">
                    </div>
                    <div class="Pickup-input">
                        <label>Pick Up</label>
                        <input type="date" placeholder= "e.g. 01-01-2023" value="">
                    </div>
                    <div class="Pickup-Time">
                        <label>Time</label>
                        <input type="time" placeholder= "e.g. 01-01-2023" value="">
                    </div>
                    <div class="Dropoff-input">
                        <label>Drop Off</label>
                        <input type="date" placeholder="Add Date">
                    </div>
                    <div class="Dropoff-Time">
                        <label>Time</label>
                        <input type="time" placeholder= "e.g. 01-01-2023" value="">
                    </div>
                    <a class="search-btn" href="results.html">Search</a>
                </form>


            </div>
        </div>
    </div>
      
    <main>

        <div class="carousel-container">
            <div class="carousel">
                

        <% for (Car car: cars) { %>
                <div class="carousel-item">
                <div class="card">

                    <img class="car-image-carousel" src="image" alt="Image Description">
                    <div class="card-body">
                        <div class="mb-2">
                            <h4>
                                <a class="text-secondary" href="#"><%=car.getModel %> </a>
                            </h4>
                            <h5>
                                <% for (User user: users) {
                                    if (user.getUserID == car.getOwnerID) { %>
                                        <div class="car-owner" href="#">by <%=user.getFirstName %> <%= user.getLastName %></div> <!-- Combine OwnerID with UserID to find Owner Name (add them to the sql + database proccess) -->
                                <%
                                        break;
                                    }
                                }
                                %>
                                <div><%=car.getFuel %>|<%=car.getYear %></div>
                            </h5>
                            <span class="price"><span class="glyphicon glyphicon-euro" aria-hidden="true"></span><%=car.gerPrice %>/day</span>
                        </div>
                    </div>
                
                    <div class="card-footer">
                        <div class="mb-3">
                            <a class="d-inline-flex align-items-center small" href="#">
                            </a>
                        </div>
                        <button class="book-button"><a href="checkout.html">Book Now</a></button>
                    </div>
                </div>   
            </div>
            <button id="prev"><span>&#8592;</span></button>
            <button id="next"><span>&#8594;</span></button>
        <% } %>
        </div>
          
    </main>

 
    <div class="footer">
        <label>GoGoCars</label>
        <div class="b-example-divider"></div>

        <div class="container">
            <footer>
                <ul class="nav justify-content-center border-bottom pb-3 mb-3">
                    <li class="nav-item"><a href="search.html" class="nav-link px-2 text-body-secondary">Home</a></li>
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
