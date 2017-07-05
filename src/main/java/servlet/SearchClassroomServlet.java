package servlet;

import po.Classroom;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.Vector;

@WebServlet("/search")
public class SearchClassroomServlet extends HttpServlet {
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String building = request.getParameter("building");
        String dateofuse = request.getParameter("dateofuse");
        String timeofuse = request.getParameter("timeofuse");
        String size = request.getParameter("size");
        String needMedia = request.getParameter("needmedia");

        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?useSSL=false", "root", "123");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Vector<Classroom> vector = search(con, building, dateofuse, timeofuse, size, needMedia);
        for (Classroom e : vector) {
            System.out.println(e);
        }
    }

    @Override
    public void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    private Vector<Classroom> search(Connection con, String building, String date, String time, String size, String hasMedia){
        Vector<Classroom> v = new Vector<Classroom>();
        try{
            Statement sql,sql1;
            ResultSet rs,rs1;
            sql = con.createStatement();
            sql1 = con.createStatement();
            rs = sql.executeQuery("select room_id from classroom_sta where " + "date_use=convert("+date+",date)" + " and time_use='"+time + "' and state='空闲'");
            while(rs.next()){
                Classroom c = new Classroom();
                String roomId = rs.getString(1);
                rs1 = sql1.executeQuery("select * from classroom_inf" + " where room_id="+roomId);
                rs1.next();
                c.setBuilding(rs1.getString(2));
                c.setRoom_name(rs1.getInt(3));
                c.setRoom_size(rs1.getString(4));
                c.setHas_media(rs1.getString(5));
                if((rs1.getString(4)).equals(size)){
                    v.addElement(c);
                }
            }
            return v;
        }
        catch(SQLException e){
            e.printStackTrace();
        }
        return null;
    }
}
