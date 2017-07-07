package servlet;

import dao.UserDao;
import po.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
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
            } else{
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.append("<script type=\"text/javascript\">     \n" +
                        "function countDown(secs,surl){     \n" +
                        " //alert(surl);     \n" +
                        " var jumpTo = document.getElementById('jumpTo');\n" +
                        " jumpTo.innerHTML=secs;  \n" +
                        " if(--secs>0){     \n" +
                        "     setTimeout(\"countDown(\"+secs+\",'\"+surl+\"')\",1000);     \n" +
                        "     }     \n" +
                        " else{       \n" +
                        "     location.href=surl;     \n" +
                        "     }     \n" +
                        " }     \n" +
                        "</script> \n" +
                        "</head>\n" +
                        "\n" +
                        "<body><span id=\"jumpTo\">用户名重复, 5</span>秒后自动跳转\n" +
                        "<script type=\"text/javascript\">countDown(5,'/register.jsp');</script>  ");
                out.close();
                // response.sendRedirect("/register.jsp");
            }
        } catch( Exception e ){
            e.printStackTrace ();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
