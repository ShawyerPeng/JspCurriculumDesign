package po;

public class User {
    private String userid;
    private String username;
    private String password;
    private int isAdmin;

    public User() {

    }
    public User(String username, int isAdmin) {
        this.username = username;
        this.isAdmin = isAdmin;
    }
    public User(String userid, String username, String password, int isAdmin) {
        this.userid = userid;
        this.username = username;
        this.password = password;
        this.isAdmin = isAdmin;
    }

    public String getUserid() {
        return userid;
    }
    public void setUserid(String userid) {
        this.userid = userid;
    }
    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public int getIsAdmin() {
        return isAdmin;
    }
    public void setIsAdmin(int isAdmin) {
        this.isAdmin = isAdmin;
    }
}
