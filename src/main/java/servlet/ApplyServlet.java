package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/apply")
public class ApplyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String number = request.getParameter("number");
        String organization = request.getParameter("organization");
        String dateofuse = request.getParameter("dateofuse");
        String timeofuse = request.getParameter("timeofuse");
        String building = request.getParameter("building");
        String size = request.getParameter("size");
        String needMedia = request.getParameter("needmedia");
        String available = request.getParameter("available");
        String reason = request.getParameter("reason");

        System.out.println(name+" "+number+" "+organization+" "+dateofuse+" "+timeofuse+" "+building+" "+size+" "+needMedia+" "+available+" "+reason);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
