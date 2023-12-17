<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="GoG.Car" %>
<%@ page import="GoG.CarDAO" %>
<%@ page import="GoG.User" %>
<%@ page import="GoG.UserDAO" %>
<%@ page import="GoG.priceCalculator" %>
<%@ page import="java.time.LocalDate" %>
<%@ include file="authentication_guard.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device=width, initial-scale=1.0">
    <title>Checkout Rental</title>
    <link rel = "stylesheet" href="style.css">
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

  <div class="container">
    <h1 class="my_title_checkout">Just a few clicks away...</h1>
<%
User user = (User)session.getAttribute("userObj");

UserDAO userDAO = new UserDAO();
CarDAO carDAO = new CarDAO();

String carID = request.getParameter("carID");
String hostID = request.getParameter("hostID");

User hostObj = userDAO.findUser(hostID);
Car carObj = carDAO.findCar(carID);
%>
    <div class="big-field-car">
      <div class="car-details">
        <div class="car-image">
          <img src="<%=carObj.getImage()%>" alt="Image Description" width="450">
        </div>
        <div class="car-info">
          <h4> <%=carObj.getModel()%></h4>
          <div>
            <img class="user-image" src="images/user.jpg" alt="User Photo">
            <span> <strong><%=hostObj.getFirstname()%> <%=hostObj.getLastname()%></strong></span>
          </div>
          <div>

        <!-- This if covers the case where the data comes from the reults page -->
<%
        String pickUp= request.getParameter("pickUp");
        String dropOff = request.getParameter("dropOff");
        String location = request.getParameter("location");

        if (pickUp != null && dropOff != null && location != null) {
%>
            <img class="date-image" src="images/pickup.png" alt="Calendar Image">
            <span><strong>Pick up:</strong> <%=pickUp%></span>
          </div>
          <div>
            <img class="date-image" src="images/dropoff.png" alt="Calendar Image">
            <span><strong>Drop Off:</strong> <%=dropOff%></span>
          </div>
          <div>
            <img class="map-image" src="images/maps.jpg" alt="Map Image">
            <span><strong>Location:</strong> <%=location%></span>
          </div>
          <div>
            <img class="price-image" src="images/total cost.png" alt="Price Image">
            <span><strong>Total price:</strong> <%=carObj.getPrice()%>&nbsp;&euro;</span> <!-- priceCalculator.CalculatePrice(pickUp, dropOff, carObj.getPrice())-->
<%
        } else {
%>
            <img class="date-image" src="images/pickup.png" alt="Calendar Image">
            <span><strong>Pick up:</strong> <input type="date" required></span>
          </div>
          <div>
            <img class="date-image" src="images/dropoff.png" alt="Calendar Image">
            <span><strong>Drop Off:</strong> <input type="date" required></span>
          </div>
          <div>
            <img class="map-image" src="images/maps.jpg" alt="Map Image">
            <span><strong>Location:</strong>                         
              <select  name="location" class="form-control" required>
              <option value="">Add location</option>
              <option value="Airport">Airport</option>
              <option value="syntagma">Syntagma Square</option>	
              <option value="pireus">Port of Piraeus</option>
          </select></span>
          </div>
          <div>
            <img class="price-image" src="images/total cost.png" alt="Price Image">
            <span><strong>Total price:</strong> <%=carObj.getPrice()%>&nbsp;&euro;/day</span>

<%
        }
%>
          </div>
        </div>
      </div>
    </div>


    <div class="Billing-info">
      <div class="billing-container">
       <h3 style="font-size: 2vw;">Billing Info:</h3>
      </div>
      <div class="form-group">
        <label for="name"class="col-sm-3 control-label main-label">First name: </label>
        <div class="col-sm-9">
<%
          if (user.getFirstname() != null) {
%>
            <input type="text" id="firstname" class="form-control" value="<%=user.getFirstname()%>" placeholder="Please enter your name" >
<%
          } else {
%>
            <input type="text" id="firstname" class="form-control" placeholder="Please enter your name" >
<%
          }
%>
        </div>
      </div>
      <div class="form-group">
        <label for="lastname"class="col-sm-3 control-label main-label">Last name: </label>
        <div class="col-sm-9">
<%
          if (user.getLastname() != null) {
%>
            <input type="text" name="lastname" id="surname" class="form-control" value="<%=user.getLastname()%>" placeholder="Please enter your surname">
<%
          } else {
%>
            <input type="text" name="lastname" id="surname" class="form-control" placeholder="Please enter your surname">
<%
          }
%>
        </div>
      </div>
      <div class="form-group">
        <label for="email"class="col-sm-3 control-label main-label">Email: </label>
        <div class="col-sm-9">
          <input type="text" name="email" id="email" class="form-control" value="<%=user.getEmail()%>" placeholder="Please enter your email">
        </div>
      </div>
      <div class="form-group">
        <label for="Date of birth" class="col-sm-3 control-label main-label">Date of birth: </label>
        <div class="col-sm-9">
          <input type="text" name="Date of birth" id="Date of birth" class="form-control" placeholder="Please enter your date of birth">
        </div>
      </div>    
      <div class="form-group">
        <label for="contact-number" class="col-sm-3 control-label main-label">Contact number:</label>
        <div class="contact-input">
          <select id="contact_country_code" name="contact_country_code">
            <option value="Greece">+30 (Greece)</option>
            <option value="Germany">+49 (Germany)</option>
            <option value="France">+33 (France)</option>
            <option value="Italy">+39 (Italy)</option>
            <option value="Kenya">+254 (Kenya)</option>
          </select>
          <input type="tel" id="contact_number" name="contact_number" required>
        </div>
      </div>
      <div class="form-group">
        <label for="Payment-method" class="col-sm-3 control-label main-label">Payment Method: </label>
        <div class="payment-method">
        <label>
          <input type="radio" name="payment" value="Credit card" required> Cash
        </label>
        <label>
          <input type="radio" name="payment" value="Debit card" required> Credit Card
        </label>
        <label>
          <input type="radio" name="payment" value="Paypal" required> Pay-Pal
        </label>
        <label>
          <input type="radio" name="payment" value="Cash" required> Phone
        </label>
      </div>
    </div>
  </div> 
  
  </div>
  <button class="checkout-button" type="button">Continue to Payment</button>
 
 
 
 
 
 <div class="footer-checkout">
  <div class="footer">
    <label>GoGoCars</label>
    <div class="b-example-divider"></div>
      <div class="container">
        <footer>
            <ul class="nav justify-content-center border-bottom pb-3 mb-3">
                <li class="nav-item"><a href="search.jsp" class="nav-link px-2 text-body-secondary">Home</a></li>
                <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Features</a></li>
                <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">Pricing</a></li>
                <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">FAQs</a></li>
                <li class="nav-item"><a href="#" class="nav-link px-2 text-body-secondary">About</a></li>
            </ul>
            <p>&copy; 2023 Company, Inc</p>
        </footer>
    </div>
    </div>
 </div>
 
  
      
  </div>
</div>

            
      

</body>
</html>


   
<!-- GIA ZOI, PALIOS KWD CSS

  .my_title_checkout{
  display: flex;
  align-items: center;
  color:#fd5003;
  justify-content: center;

}
.form-group {
  flex-direction: column;
  margin-left: 80px;
  margin-top: 20px;
  position: relative;
  width: 450px;
  padding-bottom: 5px;
  padding-top: 5px;
}

.form-group input {
  width: 100%;
  border: none;
  font-size: 15px;
  background-color: #fff;
  background-size: auto;
}

.contact-input {
    display: flex;
    margin-bottom: 20px;
}
.car-details {
  display: flex;
  align-items: center;
}

.car-image {
  flex: 1;
  padding: 20px;
  float:left;
}
.car-image img {
  max-width: 100%;
  height: auto;
  border-radius: 5px;
}
.car-info {
  flex: 2;
  font-size: 20px;
}
.car-info h4 {
  font-size: 1.5rem;
  color: #fd5003;
}
.car-info h5 {
  font-size: 1.2rem;
  color: #030303;}

.user-image, .date-image, .price-image , .map-image {
    max-width: 30px;
    height: auto;
    margin-right: 10px;
}

.owner-image {
  max-width: 100px;
  height: auto;
}
.big-field-car{
  background-color: #f0f0f0f0;
  border: 1px solid #f0f0f0;
  border-radius: 10px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.045);
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  gap: 20px;
  display: grid;
  position: relative;
  padding-top: 20px;
  background-size: auto;
  margin: 55px;
  padding:50px;
  max-width: 750pxs;
  padding-bottom: 20px;
  width: 700px;
  float:left;
  margin-right:0.5px;
  margin-top: 10px;
}

.main-label {
  font-weight: bold;
  justify-content: center;
  align-items: center; 
}

.contact-input select {
  background-color: #fff;
  padding: 5px;
  border: 2px solid #464444;
  border-radius: 5px;
}

.contact-input input[type="tel"] {
  flex: 1;
  padding: 5px;
  border: 2px solid #464444;
  border-radius: 5px;
}
.payment-method label {
  display: inline-block;
  margin-right: 20px;
}

.checkout-button {

  margin-top: -200px;
  background-color: #036;
  color: rgb(239, 110, 5);
  border: none;
  padding: 20px 40px;
  font-size: 30px;
  cursor: pointer;
  border-radius: 5px;
  margin: 100px;
  padding: 40px;
  display: block;

}

.col-sm-9 {
  flex: 1;
  padding: 5px;
  border: 2px solid #464444;
  border-radius: 5px;
  margin-top: 12px;

}
.billing-container {
  text-align: center; 
  color:#fd5003;
}

.Billing-info{
  border: 1px solid #f0f0f0;
  border-radius: 10px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.045);
  text-align: center;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  justify-content: center;
  gap: 20px;
  display: grid;
  position: relative;
  padding-top: 20px;
  background-size: auto;
  margin: 20px auto;
  max-width: 600pxs;
  padding-bottom: 20px;
  width: 600px;
  float:right;
  margin-left:0.5px;
  margin-top: 10px;
  background-color: #f0f0f0f0;
  font-size: 20px;
}
.footer-checkout{
  clear: both;
}


-->