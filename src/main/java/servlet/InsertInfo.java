package servlet;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class InsertInfo {
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/test","root","123");
        insertRoom(con, "致高楼A", "114", "大", "是");
    }

    public static void insertRoom(Connection con, String building, String room_name, String room_size, String has_media) {
        try{
            PreparedStatement sql;
            ResultSet rs;
            sql = con.prepareStatement("insert into classroom_inf (building, room_name, room_size, has_media) VALUES(?,?,?,?)", Statement.RETURN_GENERATED_KEYS);
            sql.setString(1, building);
            sql.setString(2, room_name);
            sql.setString(3, room_size);
            sql.setString(4, has_media);
            int row = sql.executeUpdate();
            rs = sql.getGeneratedKeys();
            int room_id = 0;
            if (rs.next()) {
                room_id = rs.getInt(row);
                System.out.println(room_id);
            }

            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            Calendar cal = Calendar.getInstance();
            cal.set(Calendar.YEAR, 2017);
            cal.set(Calendar.MONTH, 9);
            cal.set(Calendar.DAY_OF_MONTH, 1);
            for(int i=0;i<30;i++) {
                Date date = cal.getTime();
                String str_date = df.format(date);
                insertState(con,room_id,str_date,"第一大节");
                insertState(con,room_id,str_date,"第二大节");
                insertState(con,room_id,str_date,"第三大节");
                insertState(con,room_id,str_date,"第四大节");
                insertState(con,room_id,str_date,"第五大节");
                cal.add(Calendar.DATE, 1);
                System.out.println("---"+date.toString());
            }

            con.close();
        } catch(SQLException e) {
            e.printStackTrace();
        }
    }

    private static void insertState(Connection con, int room_id, String date, String time) {
        try {
            PreparedStatement sql;
            sql = con.prepareStatement("insert into classroom_sta (room_id, date_use, time_use, state) VALUES(?,?,?,?)");
            sql.setInt(1, room_id);
            sql.setString(2, date);
            sql.setString(3, time);
            sql.setString(4, "空闲");
            sql.executeUpdate();
        } catch(SQLException e) {
            e.printStackTrace();
        }
    }
}
