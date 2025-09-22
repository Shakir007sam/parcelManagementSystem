package model;

public class User {
	private String name;
	private String email;
	private String mobile;
	private String address;
	private String username;
	private String password;
	private String preferences;
	private String role;
	private int userid;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public String getPreferences() {
		return preferences;
	}

	public void setPreferences(String preferences) {
		this.preferences = preferences;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public User(String name, String email, String mobile, String address, String username, String password,
			String preferences, String role) {
		super();
		this.name = name;
		this.email = email;
		this.mobile = mobile;
		this.address = address;
		this.username = username;
		this.password = password;
		this.preferences = preferences;
		this.role = role;
	}

	public User() {
	}
}
