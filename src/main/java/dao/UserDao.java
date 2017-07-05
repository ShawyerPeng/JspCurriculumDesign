package dao;

import po.User;

import java.sql.*;

public class UserDao {
    public static final String DBDRIVER = "com.mysql.jdbc.Driver";
    public static final String DBURL = "jdbc:mysql://localhost:3306/login?useSSL=false";
    public static final String DBUSER = "root";
    public static final String DBPASS = "123";

    Connection conn = getConnection();
    Statement stmt = null;
    ResultSet rs = null;

    public Connection getConnection() {
        Connection conn = null;
        try {
            Class.forName(DBDRIVER);
            conn = DriverManager.getConnection(DBURL, DBUSER, DBPASS);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }

    public void close(){
        try{
            if(conn != null)
                conn.close();
        }catch(SQLException e){
            e.printStackTrace();
        }
    }


    //查询用户名是否存在
    public boolean select_username(User user){
        //create();
        try{
            String str="select * from user where username='" + user.getUsername() + "'";
            stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            rs = stmt.executeQuery(str);
            if(rs.next()) {
                return true;
            } else {
                return false;
            }
        } catch(Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            try {
                rs.close();
                stmt.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    //查询用户名和密码是否匹配；
    public boolean select_all(User user){
        //create();
        try{
            String str="select * from user where username='" + user.getUsername() +
                    "' and password='" + user.getPassword() + "'";
            stmt=conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
            rs=stmt.executeQuery(str);
            if(rs.next()){
                return true;
            }
            else{
                return false;
            }
        }catch(Exception e) {
            e.printStackTrace();
            return false;
        }finally{
            try{
                rs.close();
                stmt.close();
            }catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    //新用户注册
    public boolean add(User user){
        if(select_username(user)){
            //若有该用户名存在，则不注册，直接返回false;
            return false;
        }
        try{
            String str="INSERT INTO user (username,password) values('" + user.getUsername() + "','" + user.getPassword() + "')";
            stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
            conn.setAutoCommit(true);
            int i = stmt.executeUpdate(str);
            if(i == 1){
                stmt.close();
                return true;
            }
        } catch(SQLException e){
            e.printStackTrace();
            return false;
        }
        return true;
    }

    //更新用户信息（数据库中操作...用user2用户信息更新user1用户信息)
    public boolean update(User user1,User user2){
        if(!select_username(user1))//若没有用户user1，则返回false;
            return false;
        try{
            String str="UPDATE user SET " + "username='" + user2.getUsername() +
                    "' , password='" + user2.getPassword() +
                    "' where username='" + user1.getUsername() +
                    "' and 'password=" + user1.getPassword() + "'";
            conn.setAutoCommit(true);
            int i=stmt.executeUpdate(str);
            if(i==1){
                return true;
            }
            else{
                return false;
            }
        }catch (Exception e) {
            e.printStackTrace();
            return false;
        }finally{
            try{
                rs.close();
                stmt.close();
            }catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
    //根据用户名删除信息
    public boolean delete(User user) {
        if(!select_all(user))//若用户名和密码不匹配，则返回false;
            return false;
        try{
            String str="delete user where username='" + user.getUsername() + "'";
            conn.setAutoCommit(true);
            int i=stmt.executeUpdate(str);
            if(i==1){
                return true;
            }
            else{
                return false;
            }
        }catch (Exception e) {
            e.printStackTrace();
            return false;
        }finally{
            try{
                rs.close();
                stmt.close();
            }catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
