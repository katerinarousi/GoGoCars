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

        try{
          List<Car> carList = cDAO.getSearchCars(pick_up,drop_off);
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


