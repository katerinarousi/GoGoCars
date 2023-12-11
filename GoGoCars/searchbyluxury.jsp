<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="GoG.Car" %>
<%@ page import="GoG.CarDAO" %>
<%@ page import="GoG.User" %>
<%@ page import="GoG.UserDAO" %>






<%
        String pick_up = request.getParameter("pick_up");
        String drop_off = request.getParameter("drop_off");

        CarDAO cDAO = new CarDAO();


      
      
          
         

          List<Car> carList = cDAO.getCarouselCars();
          if (carList == null) {
            request.setAttribute("message", "No available cars");
          }

          request.setAttribute("carList", carList);

          RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
dispatcher.forward(request, response);

          

    

    

    

%>


