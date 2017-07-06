package service;

import po.Classroom;

import java.sql.*;
import java.util.ArrayList;

public class SearchClassroomInfo {
    public static ArrayList<Classroom> getAllInfos(Connection con) {
        ArrayList<Classroom> arrayList = new ArrayList<Classroom>();

        try{
            PreparedStatement sql;
            ResultSet rs;
            sql = con.prepareStatement("SELECT building, room_name, room_size, has_media FROM classroom_inf");
            rs = sql.executeQuery();
            while (rs.next()) {
                String building = rs.getString(1);
                int room_name = rs.getInt(2);
                String room_size = rs.getString(3);
                String has_media = rs.getString(4);
                arrayList.add(new Classroom(building, room_name, room_size, has_media));
            }
            con.close();
        } catch(SQLException e) {
            e.printStackTrace();
        }

        return arrayList;
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/test","root","123");
        ArrayList<Classroom> classrooms = getAllInfos(con);
        System.out.println(classrooms);
    }
}
