package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    public static final String DBDRIVER = "com.mysql.jdbc.Driver";
    public static final String DBURL = "jdbc:mysql://localhost:3306/login?useSSL=false";
    public static final String DBUSER = "root";
    public static final String DBPASS = "123";
    boolean flag = false;
    String username = null;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;  //数据库连接
        PreparedStatement pstmt = null;    //数据库预处理操作
        ResultSet rs = null;    //查询要处理结果集

        try{
            Class.forName(DBDRIVER);
            conn = DriverManager.getConnection(DBURL,DBUSER,DBPASS);

            String sql = "select username from user where username = ? and password = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, request.getParameter("username"));
            pstmt.setString(2, request.getParameter("password"));

            rs = pstmt.executeQuery();
            if(rs.next()){          //如果有数据就执行
                flag = true;        //表示登陆成功
                username = rs.getString(1);
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally{
            try{
                rs.close();
                pstmt.close();
                conn.close();
            }catch(Exception e){
                e.printStackTrace();
            }
        }

        if(flag){
            request.getSession().setAttribute("sessionname", username);     //用Session保存用户名
            request.getSession().setAttribute("sessionpwd", request.getParameter("password"));        //保存密码

            response.sendRedirect("/index.jsp");
        } else {
            response.sendRedirect("/login.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
