package service;

import po.Status;

import java.sql.*;
import java.util.ArrayList;

public class SearchClassroomStatus {
    public static ArrayList<Status> getAllStatus(Connection con) {
        ArrayList<Status> arrayList = new ArrayList<Status>();

        try{
            PreparedStatement sql;
            ResultSet rs;
            sql = con.prepareStatement("SELECT room_id, date_use, time_use, state FROM classroom_sta", Statement.RETURN_GENERATED_KEYS);
            rs = sql.executeQuery();
            while (rs.next()) {
                int room_id = rs.getInt(1);
                Date date_use = rs.getDate(2);
                String time_use = rs.getString(3);
                String state = rs.getString(4);
                System.out.println(state);
                arrayList.add(new Status(room_id, date_use, time_use, state));
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
        getAllStatus(con);
    }
}
