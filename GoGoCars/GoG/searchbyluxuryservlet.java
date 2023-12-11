package GoG;

import javax.servlet.*;
import javax.servlet.http.*;

import java.util.List;
import java.io.IOException;


public class searchbyluxuryservlet extends HttpServlet {
   
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        response.setContentType("text/html; charset=ISO-8859-7");


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