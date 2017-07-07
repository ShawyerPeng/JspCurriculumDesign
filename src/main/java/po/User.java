package po;

public class User {
    private int userid;
    private String username;
    private String password;
    private int isAdmin;

    public User() {

    }
    public User(String username, int isAdmin) {
        this.username = username;
        this.isAdmin = isAdmin;
    }
    public User(int userid, String username, int isAdmin) {
        this.userid = userid;
        this.username = username;
        this.isAdmin = isAdmin;
    }
    public User(int userid, String username, String password, int isAdmin) {
        this.userid = userid;
        this.username = username;
        this.password = password;
        this.isAdmin = isAdmin;
    }

    public int getUserid() {
        return userid;
    }
    public void setUserid(int userid) {
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
