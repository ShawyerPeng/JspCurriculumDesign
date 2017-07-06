package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

public class InsertHistory {
    public static void add(Connection con,int stuId,String applyPerson,String building,String roomName,String applyTime,String date,String time,String organization,String applyReason,String need_media) {
        try{
            PreparedStatement sql;
            sql = con.prepareStatement("insert application_inf (stu_id, apply_person, building, room_name, apply_time, " +
                    "use_date, use_time, organization, apply_reason, need_media) VALUES(?,?,?,?,?,?,?,?,?,?)");
            sql.setInt(1, stuId);
            sql.setString(2, applyPerson);
            sql.setString(3, building);
            sql.setString(4, roomName);
            sql.setString(5, applyTime);
            sql.setString(6, date);
            sql.setString(7, time);
            sql.setString(8, organization);
            sql.setString(9, applyReason);
            sql.setString(10, need_media);
            sql.executeUpdate();
        } catch(SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/test","root","123");

        SimpleDateFormat all = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        add(con, 1502040228, "彭小野", "致高楼A", "114", all.format(new java.util.Date()), "2017-07-05", "第一大节", "河海大学", "无", "是");
    }
}
