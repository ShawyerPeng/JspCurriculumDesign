package po;

import java.util.Date;

public class Announcement {
    private String title;
    private String author;
    private String content;
    private Date publishTime;
    private int isTop;

    public Announcement() {

    }
    public Announcement(String title, String author, String content, int isTop) {
        this.title = title;
        this.author = author;
        this.content = content;
        this.isTop = isTop;
    }
    public Announcement(String title, String author, String content, Date publishTime, int isTop) {
        this.title = title;
        this.author = author;
        this.content = content;
        this.publishTime = publishTime;
        this.isTop = isTop;
    }

    public String getTitle() {
        return title;
    }
    public void setTitle(String title) {
        this.title = title;
    }
    public String getAuthor() {
        return author;
    }
    public void setAuthor(String author) {
        this.author = author;
    }
    public String getContent() {
        return content;
    }
    public void setContent(String content) {
        this.content = content;
    }
    public Date getPublishTime() {
        return publishTime;
    }
    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }
    public int getIsTop() {
        return isTop;
    }
    public void setIsTop(int isTop) {
        this.isTop = isTop;
    }
}
