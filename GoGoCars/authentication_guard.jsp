<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<%
if (session.getAttribute("userObj") == null) {

    request.setAttribute("message", "You are not authorized to view this page!");

%>
    <jsp:forward page="login.jsp" />

<%
    return;
}    
%>
