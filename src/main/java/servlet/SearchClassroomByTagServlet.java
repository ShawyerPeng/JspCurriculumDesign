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
        request.setCharacterEncoding("UTF-8");
        String date = request.getParameter("date_use");
        String time = request.getParameter("time_use");
        String building = request.getParameter("building");
        String room_size = request.getParameter("room_size");
        String has_media = request.getParameter("has_media");

        System.out.println("--------"+date + time + building + room_size + has_media);

        ArrayList<Status> arrayList = new ArrayList<Status>();
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/test","root","123");
            PreparedStatement sql;
            ResultSet rs;
            sql = con.prepareStatement("SELECT classroom_sta.room_id, classroom_sta.date_use, classroom_sta.time_use, classroom_sta.state FROM classroom_sta, classroom_inf WHERE classroom_sta.date_use=convert('"+date+"',date)"
                    +" and classroom_sta.time_use='"+time + "' and classroom_sta.state='空闲" + "' and classroom_inf.building='"+building +"' and classroom_inf.room_size='"+room_size +"' and classroom_inf.has_media='"+has_media + "'");
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
        System.out.println(str);
        out.append(str);
        out.close();

        // request.getRequestDispatcher("/form.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
