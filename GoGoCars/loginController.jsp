<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="GoG.User" %>
<%@ page import="GoG.UserDAO" %>
<%@ page errorPage="errorpage.jsp"%>

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