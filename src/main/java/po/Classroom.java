package po;

public class Classroom {
    private int room_id;
    private String building;
    private int room_name;
    private String room_size;
    private String has_media;

    public Classroom() {

    }
    public Classroom(String building, int room_name, String room_size, String has_media) {
        this.building = building;
        this.room_name = room_name;
        this.room_size = room_size;
        this.has_media = has_media;
    }

    public int getRoom_id() {
        return room_id;
    }
    public void setRoom_id(int room_id) {
        this.room_id = room_id;
    }
    public String getBuilding() {
        return building;
    }
    public void setBuilding(String building) {
        this.building = building;
    }
    public int getRoom_name() {
        return room_name;
    }
    public void setRoom_name(int room_name) {
        this.room_name = room_name;
    }
    public String getRoom_size() {
        return room_size;
    }
    public void setRoom_size(String room_size) {
        this.room_size = room_size;
    }
    public String getHas_media() {
        return has_media;
    }
    public void setHas_media(String has_media) {
        this.has_media = has_media;
    }
}
