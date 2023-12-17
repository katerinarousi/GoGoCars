<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="GoG.User" %>
<%@ page import="GoG.UserDAO" %>
<%@ page errorPage="errorpage.jsp"%>

<%
String username = request.getParameter("username");
String password = request.getParameter("password");
String email = request.getParameter("email");

String isHostString = request.getParameter("role");
boolean isHost = false;

if ("host".equals(isHostString)) {
        isHost = true;
}


UserDAO obj = new UserDAO();

try {
    User myuser = new User(username,email,password,isHost);
    obj.register(myuser); 
    %>
    <jsp:forward page="login.jsp"/>
<%
} catch(Exception e) {
    request.setAttribute("message", e.getMessage());
%>
    <jsp:forward page="register.jsp"/>
<%
}
%>