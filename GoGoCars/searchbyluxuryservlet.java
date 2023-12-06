import javax.servlet.http.*;
import javax.servlet.*;
import java.io.*;



public class searchbyluxuryservlet extends HttpServlet {

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String location = request.getParameter("location");
        String pick_up = request.getParameter("pick_up");
        String drop_off = request.getParameter("drop_off");

        if (pick_up==null || location==null || drop_off==null) {
            request.setAttribute("message", "Fill all the fields");

            RequestDispatcher dispatcher = request.getRequestDispatcher("search.jsp");
            dispatcher.forward(request, response);
    

        } else {

            request.setAttribute("pick_up", pick_up);
            request.setAttribute("drop_off", drop_off);

            response.sendRedirect ("results.jsp");
        }

    }
}