package po;

public class History {
    private String name;
    private String number;
    private String organization;
    private String applyTime;
    private String room;
    private String useTime;
    private String needMedia;
    private String reason;

    public History() {

    }
    public History(String name, String number, String organization, String applyTime, String room, String useTime, String needMedia, String reason) {
        this.name = name;
        this.number = number;
        this.organization = organization;
        this.applyTime = applyTime;
        this.room = room;
        this.useTime = useTime;
        this.needMedia = needMedia;
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
    public String getApplyTime() {
        return applyTime;
    }
    public void setApplyTime(String applyTime) {
        this.applyTime = applyTime;
    }
    public String getRoom() {
        return room;
    }
    public void setRoom(String room) {
        this.room = room;
    }
    public String getUseTime() {
        return useTime;
    }
    public void setUseTime(String useTime) {
        this.useTime = useTime;
    }
    public String getNeedMedia() {
        return needMedia;
    }
    public void setNeedMedia(String needMedia) {
        this.needMedia = needMedia;
    }
    public String getReason() {
        return reason;
    }
    public void setReason(String reason) {
        this.reason = reason;
    }
}
