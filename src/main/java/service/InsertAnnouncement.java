package service;

import po.Announcement;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;

public class InsertAnnouncement {
    public static void add(Connection con, Announcement announcement) {
        try{
            PreparedStatement sql;
            sql = con.prepareStatement("insert announcement (title, author, content, is_top) VALUES(?,?,?,?)");
            sql.setString(1, announcement.getTitle());
            sql.setString(2, announcement.getAuthor());
            sql.setString(3, announcement.getContent());
            sql.setInt(4, announcement.getIsTop());
            sql.executeUpdate();
        } catch(SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/test","root","123");

        SimpleDateFormat all = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Announcement announcement = new Announcement("Hello, world!", "Shawyer", "\"jdbc:mysql://127.0.0.1/test\",\"root\",\"123\"", 1);
        add(con, announcement);
    }
}
