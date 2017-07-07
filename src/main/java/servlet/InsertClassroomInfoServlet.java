package servlet;

import po.Classroom;
import service.InsertClassroomInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

@WebServlet("/insertClassroomInfo")
public class InsertClassroomInfoServlet extends HttpServlet {
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

        request.setCharacterEncoding("UTF-8");
        String building = request.getParameter("building");
        int room_name = Integer.parseInt(request.getParameter("room_name"));
        String room_size = request.getParameter("room_size");
        String has_media = request.getParameter("has_media");

        Classroom classroom = new Classroom(building, room_name, room_size, has_media);
        InsertClassroomInfo.add(conn, classroom);

        response.sendRedirect("/classroom_info.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
