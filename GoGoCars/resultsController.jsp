<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="GoG.User" %>
<%@ page import="GoG.UserDAO" %>
<%@ page errorPage="errorpage.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="GoG.Car" %>
<%@ page import="GoG.CarDAO" %>


<%@ include file="authentication_guard.jsp" %>
<%

String filterType = request.getParameter("filter");
String filterValue = request.getParameter("filterValue");

String pickUp = request.getParameter("pickUp");
String pickUpTime = request.getParameter("pickUpTime");
String dropOff = request.getParameter("dropOff");
String dropOffTime = request.getParameter("dropOffTime");
String location = request.getParameter("location");

UserDAO userDAO = new UserDAO();
List<Car> carList = (List<Car>) request.getAttribute("carList");
List<User> users = userDAO.getUsersID_first_last_name();


CarDAO carDAO = new CarDAO();
if (filterType != null && filterValue != null) {
    carList = carDAO.getFiltered(carList, filterType, filterValue);
}

request.setAttribute("carList", carList);

request.getRequestDispatcher("results.jsp").forward(request, response);
%>