package servlet;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import po.Status;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/status")
public class ClassroomStatusServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/test","root","123");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        // List list = new ArrayList();
        // SimpleDateFormat all = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        // SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
        // SimpleDateFormat time = new SimpleDateFormat("hh:mm:ss");
        // System.out.println(time.format(Time.valueOf("13:44:53")));
        // try {
        //     list.add(new Record("pengxiaoye","1502040228","jixinyuan1",date.parse("1998-10-30"),111,new Date(2014,10,30),Time.valueOf("13:44:53"),"no reason"));
        //     list.add(new Record("pengxiaoye","1502040229","jixinyuan2",date.parse("1998-10-30"),111,new Date(2014,10,30),Time.valueOf("13:44:53"),"no reason"));
        //     list.add(new Record("pengxiaoye","1502040227","jixinyuan3",date.parse("1998-10-30"),111,new Date(2014,10,30),Time.valueOf("13:44:53"),"no reason"));
        //     list.add(new Record("pengxiaoye","1502040226","jixinyuan4",date.parse("1998-10-30"),111,new Date(2014,10,30),Time.valueOf("13:44:53"),"no reason"));
        //     list.add(new Status());
        // } catch (ParseException e) {
        //     e.printStackTrace();
        // }

        ArrayList<Status> statuses = ClassroomStatus.getAllStatus(conn);

        Gson gson = new GsonBuilder().setPrettyPrinting().create();
        String str = gson.toJson(statuses);
        response.setContentType("application/json;charset=UTF-8");
        PrintWriter out = response.getWriter();
        out.append(str);
        out.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
