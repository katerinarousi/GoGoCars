package GoG;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;




import java.util.List;
import java.util.ArrayList;
import java.util.Base64;
import java.sql.*;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;





public class searchbyluxuryservlet extends HttpServlet {
   
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {




        String location = request.getParameter("location");
        String pick_up = request.getParameter("pick_up");
        String drop_off = request.getParameter("drop_off");

     
      try{
    
          
          CarDAO cDAO = new CarDAO();


          List<Car> carList = cDAO.getSearchCars(pick_up, drop_off);

          if (carList == null) {
            
          request.setAttribute("message", "No available cars");

          }
          request.setAttribute("carList", carList);

          RequestDispatcher dispatcher1 = request.getRequestDispatcher("results.jsp");
          dispatcher1.forward(request, response);

          



    

    } catch (Exception e) {
        e.getMessage();
    }
}
}