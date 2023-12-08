<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="GoG.*" %>




<%
String location = request.getParameter("location");
String pick_up = request.getParameter("pick_up");
String drop_off = request.getParameter("drop_off");

boolean isBefore = false;
CarDAO cDAO = new CarDAO();
try{  
    isBefore = cDAO.correctDates(pick_up, drop_off);

    if (isBefore == true) {
        response.sendRedirect("results.jsp");
        return;

    } else 



    }
}catch (Exception e) {

    request.setAttribute("message", "Fill all the fields");


    %>

    <jsp:forward page ="search.jsp"/>

<%

}
%>


