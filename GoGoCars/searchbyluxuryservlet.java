import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;





public class searchbyluxuryservlet extends HttpServlet {
   
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {




        String location = request.getParameter("location");
        String pick_up = request.getParameter("pick_up");
        String drop_off = request.getParameter("drop_off");

        System.out.println("Servlet: pick_up=" + pick_up + ", drop_off=" + drop_off);

    

        if (pick_up==null || location==null || drop_off==null) {
            request.setAttribute("message", "Fill all the fields");

            RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
            dispatcher.forward(request, response);
    

        } else {

            RequestDispatcher dispatcher1 = request.getRequestDispatcher("results.jsp");
            dispatcher1.forward(request, response);
        }

    

    }
}