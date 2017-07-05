package po;

import java.util.Date;

public class Status {
    private int roomId;
    private Date dateUse;
    private String timeUse;
    private String state;

    public Status() {

    }
    public Status(int roomId, Date dateUse, String timeUse, String state) {
        this.roomId = roomId;
        this.dateUse = dateUse;
        this.timeUse = timeUse;
        this.state = state;
    }

    public int getRoomId() {
        return roomId;
    }
    public void setRoomId(int roomId) {
        this.roomId = roomId;
    }
    public Date getDateUse() {
        return dateUse;
    }
    public void setDateUse(Date dateUse) {
        this.dateUse = dateUse;
    }
    public String getTimeUse() {
        return timeUse;
    }
    public void setTimeUse(String timeUse) {
        this.timeUse = timeUse;
    }
    public String getState() {
        return state;
    }
    public void setState(String state) {
        this.state = state;
    }
}
