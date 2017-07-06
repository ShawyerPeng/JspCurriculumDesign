package filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

// @WebFilter("AuthFilter")
public class AuthFilter implements Filter {
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) resp;
        // 取得根目录所对应的绝对路径
        String currentURL = request.getRequestURI();
        // 截取到当前文件名用于比较
        String targetURL = currentURL.substring(currentURL.indexOf("/", 0), currentURL.length());

        HttpSession session = request.getSession(false);
        // 判断当前页是否是重定向以后的登录页面页面，如果是就不做session的判断，防止出现死循环
        if (!"/login.jsp".equals(targetURL) && !"/register.jsp".equals(targetURL)) {
            if (session == null || session.getAttribute("sessionname") == null) {
                // 用户登录以后需手动添加session
                System.out.println("request.getContextPath()=" + request.getContextPath());
                response.sendRedirect(request.getContextPath() + "/login.jsp");
                // 如果session为空表示用户没有登录就重定向到login.jsp页面
                return;
            }
        }
        // 加入filter链继续向下执行
        chain.doFilter(request, response);
    }

    public void init(FilterConfig config) throws ServletException {

    }

}
