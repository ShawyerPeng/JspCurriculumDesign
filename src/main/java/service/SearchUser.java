package service;

import po.User;

import java.sql.*;
import java.util.ArrayList;

public class SearchUser {
    public static User searchUser(Connection con, String username) {
        User user = new User();
        try{
            Statement sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = sql.executeQuery("SELECT username, is_admin FROM user WHERE username='"+username+"'");
            while (rs.next()) {
                user.setUsername(rs.getString(1));
                user.setIsAdmin(rs.getInt(2));
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

    public static ArrayList<User> getAllUser(Connection con) {
        ArrayList<User> users = new ArrayList<User>();
        try{
            Statement sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
            ResultSet rs = sql.executeQuery("SELECT userid, username, is_admin FROM user");
            while (rs.next()) {
                int userid = rs.getInt(1);
                String username = rs.getString(2);
                int isAdmin = rs.getInt(3);
                users.add(new User(userid, username, isAdmin));
            }
        } catch(SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1/test","root","123");

    }
}
