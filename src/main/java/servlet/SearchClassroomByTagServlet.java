package servlet;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import po.Status;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;

@WebServlet("/searchByTag")
public class SearchClassroomByTagServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String date = request.getParameter("date_use");
        String time = request.getParameter("time_use");

        ArrayList<Status> arrayList = new ArrayList<Status>();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/test","root","123");
            PreparedStatement sql;
            ResultSet rs;
            sql = con.prepareStatement("SELECT room_id, date_use, time_use, state FROM classroom_sta WHERE date_use=convert('"+date+"',date)"+" and time_use='"+time+"' and state='空闲'");
            rs = sql.executeQuery();
            while (rs.next()) {
                int room_id = rs.getInt(1);
                Date date_use = rs.getDate(2);
                String time_use = rs.getString(3);
                String state = rs.getString(4);
                arrayList.add(new Status(room_id, date_use, time_use, state));
            }
            con.close();
        } catch(SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        Gson gson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").setPrettyPrinting().create();
        String str = gson.toJson(arrayList);
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.append(str);
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
