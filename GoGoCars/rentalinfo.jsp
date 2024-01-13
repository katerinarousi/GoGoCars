<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="authentication_guard.jsp" %>
<%@ page import="GoG.User" %>
<%@ page import="GoG.UserDAO" %>
<%@ page import="GoG.Rental" %>
<%@ page import="GoG.RentalDAO" %>
<%@ page import="GoG.Car" %>
<%@ page import="GoG.CarDAO" %>
<%@ page import="java.util.List" %>

<% 

RentalDAO rDAO = new RentalDAO();
UserDAO uDAO = new UserDAO();
User hostnow = (User)session.getAttribute("userObj");
CarDAO cDAO = new CarDAO();

List<Rental> rentals = rDAO.showRental(hostnow.getUserID());

%>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device=width, initial-scale=1.0">
    <title>Rental Info</title>
    <link rel = "stylesheet" href="style.css">
   
<!-- TABLE HEAD -->
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
      <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>
  
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
      

<!-- END TABLE HEAD -->
  
<body>
  <div style="background-color: #f0f0f0;">

    <div class="header" style="height: 10vh; background-color: #036;">
      <span href="search.jsp" class="logo">
          <img src="images/blue_back-removebg-preview.png">
      </span>
      <div class="header-right">
          <a class="profile-btn" href="#"><span></span>Profile</a>
          <a href="logout.jsp" class="profile-btn"><span></span>Logout</a>

      </div>
      
      <div class="container mt-4">
<%      
        if(request.getAttribute("message") != null) { %>		
          <div class="danger-button"><%=(String)request.getAttribute("message") %></div>
<%      
        } 
        if (!hostnow.isHost()){
          request.setAttribute("message", "Access denied! Rental information is only available for registered hosts.");
%>
          <jsp:forward page="search.jsp" />
<%      
        }
%>
      </div>
    </div>
  </div>
      
    
  <img src="images/GOGOCARSIMAGE.png" class="logo2">  
  <h2 class="heading-section">Information About my Rentals</h2> 
 
    <section class="ftco-section">
        
        <div class="containerT">
             
                <div class="row">
                    <div class="col-md-12">
                      <% if (rentals.size() == 0) {
                             %>
                        <div class = "danger-button">Unfortunately, there are no reservations considering your rentals</div>  
                      <%} else {         
                      %>
                        <div class="table-wrap">
                            <table class="table table-striped" style="text-align: center;" >
                           
                              <thead>
                                <tr>
                                  <th>Rental ID</th>
                                  <th>Car</th>
                                  <th>Last Name</th>
                                  <th>First Name</th>
                                  <th>Price per day (in €€)</th>
                                  <th>Start date</th>
                                   <th>End date</th>
                                   <th>Status</th>
                                </tr>
                              </thead>
                                            
                              <tbody>
                                
                                <% for (Rental rental: rentals){
                                  User renter = uDAO.findUser(rental.getRenterID());
                                  Car car = cDAO.findmycar(rental.getCarID());
                                  %>
                                  <tr>
                                    <th scope="row"><%=rental.getRentalID()%></th>
                                    <td><%=car.getModel()%></td>
                                    <td><%=renter.getLastname()%></td>
                                    <td><%=renter.getFirstname()%></td>
                                    <td><%=car.getPrice()%></td>
                                    <td><%=rental.getStartDate()%></td>
                                    <td><%=rental.getEndDate()%></td>
                                    <td> 
                                      <% int status = rDAO.getStatus(rental.getStartDate(), rental.getEndDate());
                                        if (status == 1){
                                          %>
                                          <div class="box danger">
                                            Completed
                                          </div>
                                          <%
                                        } else if (status == 2) {
                                          %>
                                          <div class="box warning">
                                            In Progress
                                          </div>
                                          <%
                                        } else {
                                          %>
                                          <div class="box success">
                                            Upcoming
                                          </div>
                                          <%
                                        }
                                        %>
                                    
                                    </td>
                                  </tr>
                                  <%
                                }
                      
                                %>
              
                              
                            </table>
                        </div>
                      <% } 
                      %>
                    </div>
                </div>
        </div>
    </section>
    
      

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


</body>
</html>
                  
    <!--
                                <tr>
                                  <th scope="row">1003</th>
                                  <td>Fiat 500</td>
                                  <td>Parastatidou</td>
                                  <td>Kyriaki</td>
                                  <td>210</td>
                                  <td>12/09/2023</td>
                                  <td>17/09/2023</td>
                                  <td> 
                                    <div class="box danger">
                                      Completed
                                    </div>
                                  </td>
                                </tr>
    
                                <tr>
                                  <th scope="row">1004</th>
                                  <td>Toyota Aygo</td>
                                  <td>Neratzakis</td>
                                  <td>Iasonas</td>
                                  <td>191.40</td>
                                  <td>5/11/2023</td>
                                  <td>11/11/2023</td>
                                  <td>
                                    <div class="box warning">
                                      Upcoming
                                    </div>

                                    </td>
                                </tr>
    
                                <tr>
                                  <th scope="row">1005</th>
                                  <td>Toyota Yaris Hybrid 2023</td>
                                  <td>Pousi</td>
                                  <td>Katerina</td>
                                  <td>427.5</td>
                                  <td>27/10/2023</td>
                                  <td>5/11/2023</td>
                                  <td>
                                     <div class="box success">
                                    Progress
                                     </div> </td>
                                </tr>
    
                              -->