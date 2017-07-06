package servlet;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import po.Classroom;
import service.SearchClassroomInfo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/info")
public class ClassroomInfoServlet extends HttpServlet {
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

        ArrayList<Classroom> classrooms = SearchClassroomInfo.getAllInfos(conn);

        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String str = gson.toJson(classrooms);
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.append(str);
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
