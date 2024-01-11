<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="GoG.Car" %>
<%@ page import="GoG.CarDAO" %>
<%@ page import="GoG.User" %>
<%@ page import="GoG.UserDAO" %>
<%@ page import="java.util.List" %>



<%@ include file="authentication_guard.jsp" %>
<%

String filtertype = request.getParameter("filtertype");
String filtervalue = request.getParameter("filtervalue");

UserDAO userDAO = new UserDAO();
List<Car> carList = (List<Car>)session.getAttribute("list");
List<User> users = userDAO.getUsersID_first_last_name();

CarDAO carDAO = new CarDAO();
if (filtertype != null && filtervalue != null) {

    if (filtertype.equals("transmission")) {
        boolean value = false;
        if (filtervalue.equals("manual")) {
            value= true;
        }
        carList = carDAO.getFilteredextra(carList, filtertype, value); 

    } else if (filtertype.equals("hybrid")) {
        boolean value = false;
        if (filtervalue.equals("hybrid")) {
            value= true;
        } 
        carList = carDAO.getFilteredextra(carList, filtertype, value);

    } else {
        carList = carDAO.getFiltered(carList, filtertype, filtervalue);
    }
    
    
}

session.setAttribute("list", carList);

request.getRequestDispatcher("results.jsp").forward(request, response);
%>