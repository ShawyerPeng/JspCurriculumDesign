package service;

import po.Classroom;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InsertClassroomInfo {
    public static void add(Connection con, Classroom classroom) {
        try{
            PreparedStatement sql;
            sql = con.prepareStatement("insert classroom_inf (building, room_name, room_size, has_media) VALUES(?,?,?,?)");
            sql.setString(1, classroom.getBuilding());
            sql.setInt(2, classroom.getRoom_name());
            sql.setString(3, classroom.getRoom_size());
            sql.setString(4, classroom.getHas_media());
            sql.executeUpdate();
        } catch(SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/test","root","123");

        Classroom classroom = new Classroom("致高楼A", 114, "大", "是");
        add(con, classroom);
    }
}
