<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="exercise2_2023_2024_8210139.*" %>
<%@ page errorPage="appError.jsp" %>
<%
String username = request.getParameter("username");
String password = request.getParameter("password");

UserDAO uDAO = new UserDAO();

try {

    User user = uDAO.authenticate(username, password);

    /*
    * Store user object to session via an attribute
    */
    session.setAttribute("UserObj2023", user);

    /*
    * We can safely redirect authenticated user to dashboard
    * We could use also JSP forward action. 
    */
    response.sendRedirect("dashboard_ex2_8210139.jsp");

} catch(Exception e) {

    request.setAttribute("message", e.getMessage());

%>
    <jsp:forward page="login_ex2_8210139.jsp" />

<%
}
%>



    