import com.itextpdf.io.font.PdfEncodings;
import com.itextpdf.kernel.color.Color;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.border.SolidBorder;
import com.itextpdf.layout.element.*;
import com.itextpdf.layout.property.TextAlignment;

import java.io.IOException;

public class Test {
    public static void main(String[] args) throws IOException {
        // 创建 PdfWriter 对象
        PdfWriter writer = new PdfWriter("output.pdf");
        // 实例化文档对象
        PdfDocument pdf = new PdfDocument(writer);
        // 初始化document
        Document document = new Document(pdf);

        PdfFont font1 = PdfFontFactory.createFont("C:\\Users\\PatrickYates\\Desktop\\JspDemo\\src\\main\\webapp\\fonts\\Yahei Consolas Hybrid.ttf", PdfEncodings.IDENTITY_H, false);
        // 添加段落
        document.add(new Paragraph("河海大学（学生课余活动）借用教室审批表\n\n").setFont(font1).setFontSize(22).setTextAlignment(TextAlignment.CENTER));

        Table table = new Table(1);
        table.addCell(new Cell().add(new Paragraph("申请学院（部门）：").setFont(font1)).setFontSize(12).setBorder(new SolidBorder(Color.BLACK, 0.5f)));
        table.addCell(new Cell().add(new Paragraph("活动（报告、讲座）名称：\n" +
                "报告、讲座人姓名：           所属单位：           职务职称：").setFont(font1)).setFontSize(12).setBorder(new SolidBorder(Color.BLACK, 0.5f)));
        table.addCell(new Cell().add(new Paragraph("活动需用教室时间：第   周     星期     第   大节课").setFont(font1)).setFontSize(12).setBorder(new SolidBorder(Color.BLACK, 0.5f)));
        table.addCell(new Cell().add(new Paragraph("是否借用多媒体： 是（  ）    否（  ）\n" +
                "贵重物品（多媒体设备）损坏赔偿意见：\n\n\n" +
                "学院（部门）负责人签字：\n").setFont(font1)).setFontSize(12).setBorder(new SolidBorder(Color.BLACK, 0.5f)));
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
    }
}
