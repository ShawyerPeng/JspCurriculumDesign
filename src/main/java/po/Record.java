package po;

import java.sql.Time;
import java.util.Date;

public class Record {
    private String name;
    private String number;
    private String organization;
    private Date apply_date;
    private int room;
    private Date date;
    private Time time;
    private String reason;

    public Record() {
    }

    public Record(String name, String number, String organization, Date apply_date, int room, Date date, Time time, String reason) {
        this.name = name;
        this.number = number;
        this.organization = organization;
        this.apply_date = apply_date;
        this.room = room;
        this.date = date;
        this.time = time;
        this.reason = reason;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public String getOrganization() {
        return organization;
    }

    public void setOrganization(String organization) {
        this.organization = organization;
    }

    public Date getApply_date() {
        return apply_date;
    }

    public void setApply_date(Date apply_date) {
        this.apply_date = apply_date;
    }

    public int getRoom() {
        return room;
    }

    public void setRoom(int room) {
        this.room = room;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Time getTime() {
        return time;
    }

    public void setTime(Time time) {
        this.time = time;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }
}
