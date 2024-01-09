<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="GoG.User" %>
<%@ page import="GoG.UserDAO" %>
<%@ page errorPage="errorpage.jsp"%>
<%@ page import="java.util.List" %>
<%@ page import="GoG.Car" %>
<%@ page import="GoG.CarDAO" %>


<%@ include file="authentication_guard.jsp" %>
<%

String filtertype = request.getParameter("filtertype");
String filtervalue = request.getParameter("filtervalue");


UserDAO userDAO = new UserDAO();
List<Car> carList = (List<Car>) request.getAttribute("carList");
List<User> users = userDAO.getUsersID_first_last_name();

CarDAO carDAO = new CarDAO();
if (filtertype != null && filtervalue != null) {
    carList = carDAO.getFiltered(carList, filtertype, filtervalue);
    
}

request.setAttribute("carList", carList);

request.getRequestDispatcher("results.jsp").forward(request, response);
%>