package servlet;

import com.itextpdf.io.font.PdfEncodings;
import com.itextpdf.kernel.color.Color;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.border.SolidBorder;
import com.itextpdf.layout.element.Cell;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Table;
import com.itextpdf.layout.property.TextAlignment;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

@WebServlet("/export")
public class ExportFormServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置response参数，可以打开下载页面
        // response.addHeader("Content-Disposition","attachment;filename="+ new String("output.pdf".getBytes("UTF-8")));

        // request.setCharacterEncoding("UTF-8");
        // String name = request.getParameter("name");
        // int number = Integer.parseInt(request.getParameter("number"));
        // String organization = request.getParameter("organization");
        // String dateofuse = request.getParameter("dateofuse");
        // String timeofuse = request.getParameter("timeofuse");
        // String building = request.getParameter("building");
        // String size = request.getParameter("size");
        // String needMedia = request.getParameter("needmedia");
        // String available = request.getParameter("available");
        // String reason = request.getParameter("reason");
        String organization = "HHU";
        String dateofuse = "2017-7-18";
        String timeofuse = "1th";
        String needMedia = "是";


        // 创建 PdfWriter 对象
        PdfWriter writer = new PdfWriter(this.getServletContext().getRealPath("/output.pdf"));
        // 实例化文档对象
        PdfDocument pdf = new PdfDocument(writer);
        // 初始化document
        Document document = new Document(pdf);

        PdfFont font1 = PdfFontFactory.createFont("C:\\Users\\PatrickYates\\Desktop\\JspDemo\\src\\main\\webapp\\fonts\\Yahei Consolas Hybrid.ttf", PdfEncodings.IDENTITY_H, false);
        // 添加段落
        document.add(new Paragraph("河海大学（学生课余活动）借用教室审批表\n\n").setFont(font1).setFontSize(22).setTextAlignment(TextAlignment.CENTER));

        Table table = new Table(1);
        table.addCell(new Cell().add(new Paragraph("申请学院（部门）：" + organization).setFont(font1)).setFontSize(12).setBorder(new SolidBorder(Color.BLACK, 0.5f)));
        table.addCell(new Cell().add(new Paragraph("活动（报告、讲座）名称：\n" +
                "报告、讲座人姓名：           所属单位：           职务职称：").setFont(font1)).setFontSize(12).setBorder(new SolidBorder(Color.BLACK, 0.5f)));
        table.addCell(new Cell().add(new Paragraph("活动需用教室时间：" + dateofuse+"     星期     " + timeofuse).setFont(font1)).setFontSize(12).setBorder(new SolidBorder(Color.BLACK, 0.5f)));
        if (needMedia.equals("是")) {
            table.addCell(new Cell().add(new Paragraph("是否借用多媒体：" + " 是（√）    否（  ）\n" +
                    "贵重物品（多媒体设备）损坏赔偿意见：\n\n\n" +
                    "学院（部门）负责人签字：\n").setFont(font1)).setFontSize(12).setBorder(new SolidBorder(Color.BLACK, 0.5f)));
        }
        if (needMedia.equals("否")) {
            table.addCell(new Cell().add(new Paragraph("是否借用多媒体：" + " 是（  ）    否（√）\n" +
                    "贵重物品（多媒体设备）损坏赔偿意见：\n\n\n" +
                    "学院（部门）负责人签字：\n").setFont(font1)).setFontSize(12).setBorder(new SolidBorder(Color.BLACK, 0.5f)));
        }
        table.addCell(new Cell().add(new Paragraph("活动组织单位：\n" +
                "活动负责人：                                    联系电话（必填）：                       \n").setFont(font1)).setFontSize(12).setBorder(new SolidBorder(Color.BLACK, 0.5f)));
        table.addCell(new Cell().add(new Paragraph("活动面向对象：                                     参加活动人数：                 ").setFont(font1)).setFontSize(12).setBorder(new SolidBorder(Color.BLACK, 0.5f)));
        table.addCell(new Cell().add(new Paragraph("活动意义和预期效果：\n\n\n").setFont(font1)).setFontSize(12).setBorder(new SolidBorder(Color.BLACK, 0.5f)));
        table.addCell(new Cell().add(new Paragraph("宣传部意见：\n\n\n").setFont(font1)).setFontSize(12).setBorder(new SolidBorder(Color.BLACK, 0.5f)));
        table.addCell(new Cell().add(new Paragraph("学院（部门）意见：\n\n\n" +
                "学院（部门）负责人签字：\n" +
                "学院（部门）公章\n\n\n" +
                "年    月    日\n").setFont(font1)).setFontSize(12).setBorder(new SolidBorder(Color.BLACK, 0.5f)));
        document.add(table);

        // 关闭document
        document.close();

        //1.获取要下载的文件的绝对路径
        String realPath = this.getServletContext().getRealPath("/output.pdf");
        System.out.println(realPath);
        //2.获取要下载的文件名
        String fileName = realPath.substring(realPath.lastIndexOf("\\")+1);
        //3.设置content-disposition响应头控制浏览器以下载的形式打开文件
        response.setContentType("application/pdf;charset=utf-8");
        response.setHeader("content-disposition", "attachment;filename="+fileName);
        //4.获取要下载的文件输入流
        InputStream in = new FileInputStream(realPath);
        int len = 0;
        //5.创建数据缓冲区
        byte[] buffer = new byte[1024];
        //6.通过response对象获取OutputStream流
        OutputStream out = response.getOutputStream();
        //7.将FileInputStream流写入到buffer缓冲区
        while ((len = in.read(buffer)) > 0) {
            //8.使用OutputStream将缓冲区的数据输出到客户端浏览器
            out.write(buffer,0,len);
        }
        in.close();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
