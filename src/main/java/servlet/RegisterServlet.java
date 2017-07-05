package servlet;

import dao.UserDao;
import po.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType ( "text/html" );
        // 获取用户名和密码，封装进User对象...
        User user = new User();
        user.setUsername(request.getParameter("reg_username"));
        user.setPassword(request.getParameter("reg_password"));

        // 访问数据库
        UserDao userdao = new UserDao();
        request.getSession().setAttribute("UserName", user.getUsername());

        //若用户名用户名不存在，则注册并转向login_success.jsp;
        try{
            if(userdao.add(user)){
                response.sendRedirect("/login.jsp");
            }
            else{
                response.sendRedirect("/login.jsp");
            }
        }catch( Exception e ){
            e.printStackTrace ();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
