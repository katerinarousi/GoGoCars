<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="GoG.Car" %>
<%@ page import="GoG.CarDAO" %>
<%@ page import="GoG.User" %>
<%@ page import="GoG.UserDAO" %>


<%
        String pickUp = request.getParameter("pickUp");
        String dropOff = request.getParameter("dropOff");

        CarDAO cDAO = new CarDAO();

        try{
          List<Car> carList = cDAO.getSearchCars(pickUp,dropOff);
          if (carList == null) {
              request.setAttribute("message", "No available cars");
          }
  
          request.setAttribute("carList", carList);
  
          RequestDispatcher dispatcher = request.getRequestDispatcher("results.jsp");
          dispatcher.forward(request, response);
          
        } catch (Exception e){
          e.getMessage();
        }

          

          
%>
