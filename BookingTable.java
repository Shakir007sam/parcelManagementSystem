package dao;

import model.Booking;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
//import java.sql.ResultSet;
import java.sql.SQLException;

public class BookingTable {
	private static final String url = "jdbc:mysql://localhost:3306/ParcelManagementSystem";
	private static final String user = "root";
	private static final String pass = "Tcs#1234";
	private Connection con;
	private PreparedStatement ps;

	public BookingTable() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pass);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

//officer tracking method
		public ResultSet checkOfficer(String u, String b) throws SQLException {
			try{
	            String sql = "SELECT * FROM tbl_Booking WHERE UserID=? AND BookingId=?";
	            ps = con.prepareStatement(sql);
	            ps.setString(1, u);
	            ps.setString(2, b);
	            return ps.executeQuery();
	        } catch (Exception e) { e.printStackTrace(); }
			return null;
		}

// officer delivery status update
		public int checkBooking(String b, String s) throws SQLException {
			try {
				String sql="UPDATE tbl_Booking SET ParStatus=?, ParLastUpdateTime=NOW() WHERE BookingId=?";
				ps= con.prepareStatement(sql);
				ps.setString(1, s);
				ps.setString(2, b);
				return ps.executeUpdate();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return 0;
		}
		
// officer pickup
		public int updatepickup(String b, String s) throws SQLException {
			try {
				String sql="UPDATE tbl_booking SET ParPickupTime=?, ParLastUpdateTime=NOW() WHERE BookingId=?";
				ps=con.prepareStatement(sql);
				ps.setString(1, s);
				ps.setString(2, b);
				return ps.executeUpdate();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return 0;
		}
		
// officer previous booking
		public ResultSet previouslist(String c) throws SQLException {
			try {
				String sql="SELECT * FROM tbl_booking WHERE UserID=? ORDER BY ParPaymentTime DESC";
				ps=con.prepareStatement(sql);
				ps.setString(1, c);
				return ps.executeQuery();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
			return null;
		}
	
//	Customer Previous Booking 
	public ResultSet check(int u) throws SQLException {
		try {
			String sql = "SELECT * FROM tbl_Booking WHERE UserId=? order by BookingId desc";
			ps = con.prepareStatement(sql);
			ps.setInt(1, u);
			return ps.executeQuery();
		} catch (Exception e) {
			System.out.println("\n" + e.getMessage());
			return null;
		}
	}

//	Customer Tracking Status
	public ResultSet check(String u, String b) throws SQLException {
		try {
			String sql = "SELECT * FROM tbl_Booking WHERE UserID=? AND BookingId=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, u);
			ps.setString(2, b);
			return ps.executeQuery();
		} catch (Exception e) {
			System.out.println("\n" + e.getMessage());
			return null;
		}

	}
	

//	Booking Service through Debit Card
	public boolean insert(Booking b, String type) {
		try {
			String sql = "INSERT INTO tbl_Booking (UserID, RecName, RecAddress, RecPin, RecMobile, "
					+ "ParWeightGram, ParContentDescription, ParDeliveryType, ParPackingPreference, "
					+ "ParPickupTime, ParDropoffTime, ParServiceCost, ParPaymentTime, ParStatus, "
					+ "CardNumber, CardHolderName, ExpiryDate, CVV) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'Booked', ?, ?, ?, ?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, b.getUserId());
			ps.setString(2, b.getReceiverName());
			ps.setString(3, b.getReceiverAddress());
			ps.setString(4, b.getReceiverPin());
			ps.setString(5, b.getReceiverMobile());
			ps.setFloat(6, b.getParcelWeight());
			ps.setString(7, b.getParcelContent());
			ps.setString(8, b.getParcelDelivery());
			ps.setString(9, b.getParcelPacking());
			ps.setString(10, b.getParcelPick());
			ps.setString(11, b.getParcelDrop());
			ps.setFloat(12, b.getParcelServiceCost());
			ps.setString(13, b.getParcelPaymentTime());
			ps.setString(14, b.getCardNumber());
			ps.setString(15, b.getCardHolder());
			ps.setString(16, b.getExpiryDate());
			ps.setString(17, b.getCvv());
			ps.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("\n" + e.getMessage());
			return false;
		}
	}


// Booking Service through Cash
	public boolean insert(Booking b) {
		try {
			String sql = "INSERT INTO tbl_Booking (UserID, RecName, RecAddress, RecPin, RecMobile, "
					+ "ParWeightGram, ParContentDescription, ParDeliveryType, ParPackingPreference, "
					+ "ParPickupTime, ParDropoffTime, ParServiceCost, ParPaymentTime, ParStatus) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'Booked')";
			ps = con.prepareStatement(sql);
			ps.setInt(1, b.getUserId());
			ps.setString(2, b.getReceiverName());
			ps.setString(3, b.getReceiverAddress());
			ps.setString(4, b.getReceiverPin());
			ps.setString(5, b.getReceiverMobile());
			ps.setFloat(6, b.getParcelWeight());
			ps.setString(7, b.getParcelContent());
			ps.setString(8, b.getParcelDelivery());
			ps.setString(9, b.getParcelPacking());
			ps.setString(10, b.getParcelPick());
			ps.setString(11, b.getParcelDrop());
			ps.setFloat(12, b.getParcelServiceCost());
			ps.setString(13, b.getParcelPaymentTime());
			ps.executeUpdate();
			return true;
		} catch (Exception e) {
			System.out.println("\n" + e.getMessage());
			return false;
		}
	}
	
// Customer track data thorugh booking id alone 
	public ResultSet check(String b) throws SQLException {
		try {
			String sql = "SELECT * FROM tbl_Booking WHERE BookingId=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, b);
			return ps.executeQuery();
		} catch (Exception e) {
			System.out.println("\n" + e.getMessage());
			return null;
		}
	}
}