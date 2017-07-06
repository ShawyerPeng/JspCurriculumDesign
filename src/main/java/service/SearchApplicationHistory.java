package service;

import po.History;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class SearchApplicationHistory {
    public static ArrayList<History> getAllHistory(Connection con) {
        ArrayList<History> arrayList = new ArrayList<History>();

        try{
            PreparedStatement sql;
            ResultSet rs;
            sql = con.prepareStatement("SELECT stu_id, apply_person, building, room_name, apply_time, use_date, use_time, organization, apply_reason, need_media FROM application_inf");
            rs = sql.executeQuery();
            while (rs.next()) {
                SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
                SimpleDateFormat time = new SimpleDateFormat("hh:mm:ss");
                String name = rs.getString(2);
                String number = rs.getString(1);
                String organization = rs.getString(8);
                String applyTime = rs.getString(5).substring(0,rs.getString(5).length()-2);
                String room = rs.getString(3) + rs.getInt(4);
                String useTime = rs.getString(6) + " " + rs.getString(7);
                String needMedia = rs.getString("need_media");
                String reason = rs.getString("apply_reason");
                arrayList.add(new History(name, number, organization, applyTime, room, useTime, needMedia, reason));
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
        ArrayList<History> histories = getAllHistory(con);
        System.out.println(histories.get(0).getApplyTime());
    }
}
