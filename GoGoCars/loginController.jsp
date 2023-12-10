<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error_ex3_8210103.jsp" %>
<%@ page import="GoG.User" %>
<%@ page import="GoG.UserDAO" %>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");

UserDAO obj = new UserDAO();

try {
    User user = obj.authenticate(username, password);

    session.setAttribute("userObj", user);
    response.sendRedirect("search.jsp");

} catch(Exception e) {
    request.setAttribute("message", e.getMessage());
%>
    <jsp:forward page="login.jsp"/>
<%
}
%>