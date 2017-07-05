package servlet;

import java.sql.*;

public class SearchRoomId {
    public static int searchRoomId(Connection con, String building, int roomName) {
        int id = 0;
        try{
            Statement sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = sql.executeQuery("SELECT room_id FROM classroom_inf WHERE building='"+building + "' AND" + " room_name="+roomName);
            while (rs.next()) {
                id = rs.getInt(1);
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return id;
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/test","root","123");
        int id = searchRoomId(con, "致高楼A", 114);
        System.out.println(id);
    }
}
