package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/check")
public class CheckImgcodeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String code = request.getParameter("code");
        System.out.println("验证码：" + code);
        // 获取session中保存的验证码
        String oldCode = (String) request.getSession().getAttribute("validateCode");
        if(code.equals(oldCode)){ // 验证通过
            request.getRequestDispatcher("index.jsp").forward(request, response);
        } else{
            System.out.println("验证失败");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
