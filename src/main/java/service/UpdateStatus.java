package service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UpdateStatus {
    public static void updatestate(Connection con, int room_id, String time_use, String date_use, String state) {
        try{
            Statement sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
            sql.executeUpdate("UPDATE classroom_sta SET state='"+state + "' WHERE" + " date_use=convert('"+date_use+"',date)" + " and time_use='"+time_use+"'");
        } catch(SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {

    }
}
