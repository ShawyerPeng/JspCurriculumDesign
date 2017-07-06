package servlet;

import service.InsertHistory;
import service.SearchRoomId;
import service.UpdateStatus;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@WebServlet("/apply")
public class ApplyServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        int number = Integer.parseInt(request.getParameter("number"));
        String organization = request.getParameter("organization");
        String dateofuse = request.getParameter("dateofuse");
        String timeofuse = request.getParameter("timeofuse");
        String building = request.getParameter("building");
        String size = request.getParameter("size");
        String needMedia = request.getParameter("needmedia");
        String available = request.getParameter("available");
        String reason = request.getParameter("reason");
        System.out.println(name+" "+number+" "+organization+" "+dateofuse+" "+timeofuse+" "+building+" "+size+" "+needMedia+" "+available+" "+reason);

        String room_name = getNumber(available);

        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/test","root","123");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        SimpleDateFormat all = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        InsertHistory.add(conn, number, name, building, room_name, all.format(new java.util.Date()), dateofuse, timeofuse, organization, reason, needMedia);

        int id = SearchRoomId.searchRoomId(conn, building, Integer.parseInt(room_name));

        UpdateStatus.updatestate(conn, id, timeofuse, dateofuse, "已占用");

        response.sendRedirect("/form.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    private static String getNumber(String str) {
        String regEx="[^0-9]";
        Pattern p = Pattern.compile(regEx);
        Matcher m = p.matcher(str);
        return m.replaceAll("").trim();
    }
}
