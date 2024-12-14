package models;

public class UserModel {
	private int id;
    private String name;
    private String username;
    private String email;
    private String password;
    private String phoneNo;

    // Constructors, getters, and setters

    public UserModel() {
    }

    public UserModel(String name, String username, String email, String password, String phoneNo) {
        this.name = name;
        this.username = username;
        this.email = email;
        this.password = password;
        this.phoneNo = phoneNo;
    }

    public int getId() {
        return id;
    }

    
    public void  setId (int i) {
        this.id = i;
    }

    
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNo() {
        return phoneNo;
    }

    public void setPhoneNo(String phoneNo) {
        this.phoneNo = phoneNo;
    }
}
