package dao;

import model.User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserProfileTable {
	private static final String url = "jdbc:mysql://localhost:3306/ParcelManagementSystem";
	private static final String user = "root";
	private static final String pass = "Tcs#1234"; 
	private Connection con;
	private PreparedStatement ps;

	public UserProfileTable() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pass);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public ResultSet check(String u, String p) {
		try{
            String sql = "SELECT * FROM tbl_UserProfile WHERE UserName=? AND Password=?";
            ps = con.prepareStatement(sql);
            ps.setString(1, u);
            ps.setString(2, p);
            return ps.executeQuery();
        } catch (Exception e) { e.printStackTrace(); }
		return null;
	}

	public boolean insert(User u) {
		try {
			String sql = "INSERT INTO tbl_UserProfile (FullName, Address, Email, MobileNumber, Password, Role, Username, Preferences) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setString(1, u.getName());
			ps.setString(2, u.getAddress());
			ps.setString(3, u.getEmail());
			ps.setString(4, u.getMobile());
			ps.setString(5, u.getPassword());
			ps.setString(6, u.getRole());
			ps.setString(7, u.getUsername());
			ps.setString(8, u.getPreferences());
			ps.executeUpdate();
			return true;
		} catch (Exception e) {
			return false;
		}
	}
}
