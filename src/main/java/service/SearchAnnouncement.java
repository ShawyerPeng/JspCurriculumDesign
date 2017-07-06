package service;

import po.Announcement;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class SearchAnnouncement {
    public static ArrayList<Announcement> getAllAnnouncement(Connection con) {
        ArrayList<Announcement> arrayList = new ArrayList<Announcement>();

        try{
            PreparedStatement sql;
            ResultSet rs;
            sql = con.prepareStatement("SELECT title, author, content, publish_time, is_top FROM announcement");
            rs = sql.executeQuery();
            while (rs.next()) {
                SimpleDateFormat all = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String title = rs.getString(1);
                String author = rs.getString(2);
                String content = rs.getString(3);
                java.util.Date time = rs.getTimestamp(4);
                String str_time = all.format(time);
                java.util.Date publish_time = all.parse(str_time);
                // System.out.println(all.format(publish_time));
                int is_top = rs.getInt(5);
                arrayList.add(new Announcement(title, author, content, publish_time, is_top));
            }
            con.close();
        } catch(SQLException e) {
            e.printStackTrace();
        } catch (ParseException e) {
            e.printStackTrace();
        }

        return arrayList;
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/test","root","123");
        ArrayList<Announcement> announcements = getAllAnnouncement(con);
        SimpleDateFormat all = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        System.out.println(all.format(announcements.get(0).getPublishTime()));
    }
}
