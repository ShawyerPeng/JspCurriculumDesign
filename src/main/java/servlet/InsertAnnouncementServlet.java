package servlet;

import po.Announcement;
import service.InsertAnnouncement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

@WebServlet("/insertAnnouncement")
public class InsertAnnouncementServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/test","root","123");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String content = request.getParameter("content");
        int isTop = 0;
        if (request.getParameter("isTop")==null) {
            isTop = 0;
        } else if (request.getParameter("isTop").equals("1")) {
            isTop = 1;
        }
        Announcement announcement = new Announcement(title, author, content, isTop);
        InsertAnnouncement.add(conn, announcement);

        response.sendRedirect("/content_post.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
