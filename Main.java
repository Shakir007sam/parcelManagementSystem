package dao;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.*;
import java.util.*;
import java.util.regex.Pattern;

class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/ParcelManagementSystem";
    private static final String USER = "root";   // change if different
    private static final String PASSWORD = "Tcs#1234"; // change if different

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}

// -------------------- ENTITY CLASSES --------------------
class Sender {
    String userid;
    String name;
    String add;
    String mob;
    String password;

    public void getDetails(Scanner sc) {
        System.out.print("Enter Full Name : ");
        name = sc.nextLine();
        System.out.print("Enter Address : ");
        add = sc.nextLine();
        System.out.print("Enter Email (used as UserID): ");
        userid = sc.nextLine();
        System.out.print("Enter Mobile Number : ");
        mob = sc.nextLine();
        System.out.print("Enter Password : ");
        password = sc.nextLine();
    }
}

class Receiver {
    String name;
    String add;
    String pin;
    String mob;

    public void getDetails(Scanner sc) {
        System.out.print("Enter Receiver Name : ");
        name = sc.nextLine();
        System.out.print("Enter Receiver Address : ");
        add = sc.nextLine();
        System.out.print("Enter Receiver PIN : ");
        pin = sc.nextLine();
        System.out.print("Enter Receiver Mobile : ");
        mob = sc.nextLine();
    }
}

class Parcel {
    String bid;
    double weight;
    String content;
    String delType;
    String packType;
    String pickUpDate;
    String dropOffDate;
    double serviceCost;
    String paymentDateTime;
    String status;

    public void getDetails(Scanner sc) {
        System.out.print("Enter Parcel Weight (grams): ");
        weight = Double.parseDouble(sc.nextLine());
        System.out.print("Enter Parcel Content : ");
        content = sc.nextLine();
        System.out.print("Enter Delivery Type (Standard/Express) : ");
        delType = sc.nextLine();
        System.out.print("Enter Packing Preference : ");
        packType = sc.nextLine();
        System.out.print("Enter Pick Up Date (yyyy-mm-dd hh:mm:ss): ");
        pickUpDate = sc.nextLine();
        System.out.print("Enter Drop Off Date (yyyy-mm-dd hh:mm:ss): ");
        dropOffDate = sc.nextLine();
        System.out.print("Enter Service Cost : ");
        serviceCost = Double.parseDouble(sc.nextLine());
        System.out.print("Enter Payment DateTime (yyyy-mm-dd hh:mm:ss): ");
        paymentDateTime = sc.nextLine();
        status = "Confirmed";
    }
}

// -------------------- MAIN SYSTEM --------------------
public class Main {
    static Scanner sc = new Scanner(System.in);

    // ---------------- COMMON ----------------
    public static void officerOrCustomer() {
        System.out.print("\nPress: 1. Officer, 2. Customer & 3. Exit: ");
        char c = sc.nextLine().charAt(0);
        switch (c) {
            case '1': officerLogin(); break;
            case '2': customerLoginAndRegistration(); break;
            case '3': System.out.println("Exiting..."); break;
            default: System.out.println("Invalid input!"); officerOrCustomer();
        }
    }

    public static void getInvoice(Receiver rc, Parcel pc, int bookingId) {
        System.out.println("\nINVOICE GENERATED :");
        System.out.println("-------------------");
        System.out.println("Booking ID : " + bookingId);
        System.out.println("Receiver Name : " + rc.name);
        System.out.println("Receiver Address : " + rc.add);
        System.out.println("Receiver PIN : " + rc.pin);
        System.out.println("Receiver Mobile : " + rc.mob);
        System.out.println("Parcel Weight : " + pc.weight);
        System.out.println("Parcel Content : " + pc.content);
        System.out.println("Delivery Type : " + pc.delType);
        System.out.println("Packing : " + pc.packType);
        System.out.println("Pick Up Date : " + pc.pickUpDate);
        System.out.println("Drop Off Date : " + pc.dropOffDate);
        System.out.printf("Service Cost : %.2f\n", pc.serviceCost);
        System.out.println("Payment Date : " + pc.paymentDateTime);
        System.out.println("Status : " + pc.status);
    }

    // ---------------- OFFICER ----------------
    public static void officerLogin() {
        System.out.print("User ID : ");
        String uid = sc.nextLine();
        System.out.print("Password : ");
        String pwd = sc.nextLine();

        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM tbl_UserProfile WHERE UserID=? AND Password=? AND Role='Officer'";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, uid);
            ps.setString(2, pwd);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                officerHomepage();
            } else {
                System.out.println("Invalid credentials.");
                officerLogin();
            }
        } catch (Exception e) { e.printStackTrace(); }
    }

    public static void officerHomepage() {
        System.out.println("\nOfficer Homepage :");
        System.out.println("1. Home ");
        System.out.println("2. Tracking Status");
        System.out.println("3. Delivery Update");
        System.out.println("4. Pick & Drop Update");
        System.out.println("5. Booking History");
        System.out.println("6. Logout");
        System.out.print(": ");
        String op = sc.nextLine();
        switch (op) {
            case "1": officerHomepage(); break;
            case "2": {trackingStatus(); officerHomepage(); break;}
            case "3": updateDeliveryStatus(); officerHomepage(); break;
            case "4": updatePickDrop(); officerHomepage(); break;
            case "5": bookingHistoryOfficer(); officerHomepage(); break;
            case "6": officerOrCustomer(); break;
            default: {System.out.println("Invalid Inputttt");officerHomepage();}
        }
    }

    public static void trackingStatus() {
        System.out.print("Enter Booking ID : ");
        int bid = Integer.parseInt(sc.nextLine());
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT b.BookingID, u.FullName, u.RecAddress AS Address, " +
                    "b.RecName AS ReceiverName, b.RecAddress AS ReceiverAddress, " +
                    "b.ParPaymentTime AS DateOfBooking, b.ParStatus AS Status " +
                    "FROM tbl_Booking b " +
                    "JOIN tbl_UserProfile u ON b.UserID = u.UserID " +
                    "WHERE b.BookingID = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, bid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                System.out.println("\n---- Tracking Details ----");
                System.out.println("Booking ID        : " + rs.getInt("BookingID"));
                System.out.println("Sender Name       : " + rs.getString("FullName"));
                System.out.println("Sender Address    : " + rs.getString("Address"));
                System.out.println("Receiver Name     : " + rs.getString("ReceiverName"));
                System.out.println("Receiver Address  : " + rs.getString("ReceiverAddress"));
                System.out.println("Date Of Booking   : " + rs.getString("DateOfBooking"));
                System.out.println("Parcel Status     : " + rs.getString("Status"));

                if (rs.getString("Status").equalsIgnoreCase("Delivered")) {
                    System.out.print("Do you want to generate invoice? (1: Yes / 0: No): ");
                    int x = Integer.parseInt(sc.nextLine());
                    if (x == 1) {
                        InvoiceGen(bid);
                    }
                }
            } else {
                System.out.println("Invalid Booking ID");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    public static void updateDeliveryStatus() {
        System.out.print("Booking ID : ");
        int bid = Integer.parseInt(sc.nextLine());
        System.out.print("Enter New Status : ");
        String status = sc.nextLine();
        try (Connection con = DBConnection.getConnection()) {
            String sql = "UPDATE tbl_Booking SET ParStatus=? WHERE BookingID=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, bid);
            ps.executeUpdate();
            System.out.println("Updated!");
        } catch (Exception e) { e.printStackTrace(); }
    }

    public static void updatePickDrop() {
        System.out.print("Booking ID : ");
        int bid = Integer.parseInt(sc.nextLine());
        System.out.print("Enter Pickup Date (yyyy-mm-dd hh:mm:ss): ");
        String pdate = sc.nextLine();
        System.out.print("Enter Dropoff Date (yyyy-mm-dd hh:mm:ss): ");
        String ddate = sc.nextLine();
        try (Connection con = DBConnection.getConnection()) {
            String sql = "UPDATE tbl_Booking SET ParPickupTime=?, ParDropoffTime=? WHERE BookingID=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, pdate);
            ps.setString(2, ddate);
            ps.setInt(3, bid);
            ps.executeUpdate();
            System.out.println("Pickup/Drop updated!");
        } catch (Exception e) { e.printStackTrace(); }
    }

    public static void bookingHistoryOfficer() {
        System.out.print("Enter UserID : ");
        String uid = sc.nextLine();
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT b.UserID, b.BookingID, b.ParPaymentTime AS DateOfBooking, " +
                    "b.RecName AS ReceiverName, b.RecAddress AS DeliveredAddress, " +
                    "b.ParServiceCost AS Amount, b.ParStatus AS Status " +
                    "FROM tbl_Booking b " +
                    "JOIN tbl_UserProfile u ON b.UserID = u.UserID " +
                    "WHERE u.UserID = ? " +
                    "ORDER BY b.ParPaymentTime DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, uid);
            ResultSet rs = ps.executeQuery();
            System.out.println("\n----- Booking History (Officer View) -----");
            while (rs.next()) {
                System.out.println("UserID        : " + rs.getInt("UserID"));
                System.out.println("BookingID     : " + rs.getInt("BookingID"));
                System.out.println("DateOfBooking : " + rs.getString("DateOfBooking"));
                System.out.println("ReceiverName  : " + rs.getString("ReceiverName"));
                System.out.println("DeliveredAddr : " + rs.getString("DeliveredAddress"));
                System.out.println("Amount        : ₹" + rs.getDouble("Amount"));
                System.out.println("Status        : " + rs.getString("Status"));
                System.out.println("--------------------------------------------");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    // ---------------- CUSTOMER ----------------
    public static void customerLoginAndRegistration() {
        System.out.print("Press 1. Registration  2. Login : ");
        String op = sc.nextLine();
        if (op.equals("1")) {
            Sender sn = new Sender();
            sn.getDetails(sc);
            registerCustomer(sn);
            customerLoginAndRegistration();
        } else {
            System.out.print("User ID : ");
            String uid = sc.nextLine();
            System.out.print("Password : ");
            String pwd = sc.nextLine();
            Sender sn = validateCustomer(uid, pwd);
            if (sn != null) {
                System.out.println("Login Successful!");
                customerHomepage(sn);
            } else {
                System.out.println("Invalid credentials.");
                customerLoginAndRegistration();
            }
        }
    }

    public static void registerCustomer(Sender sn) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "INSERT INTO tbl_UserProfile (FullName, RecAddress, Email, MobileNumber, Password, Role) VALUES (?, ?, ?, ?, ?, 'Customer')";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, sn.name);
            ps.setString(2, sn.add);
            ps.setString(3, sn.userid);
            ps.setString(4, sn.mob);
            ps.setString(5, sn.password);
            ps.executeUpdate();
            System.out.println("Customer registered!");
        } catch (Exception e) { e.printStackTrace(); }
    }

    public static Sender validateCustomer(String uid, String pwd) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM tbl_UserProfile WHERE UserID=? AND Password=? AND Role='Customer'";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, uid);
            ps.setString(2, pwd);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Sender sn = new Sender();
                sn.userid = rs.getString("UserID");
                sn.name = rs.getString("FullName");
                sn.add = rs.getString("RecAddress");
                sn.mob = rs.getString("MobileNumber");
                sn.password = rs.getString("Password");
                return sn;
            }
        } catch (Exception e) { e.printStackTrace(); }
        return null;
    }

    public static void customerHomepage(Sender sn) {
        System.out.println("\nCustomer Homepage:");
        System.out.println("1. Home ");
        System.out.println("2. Booking Service");
        System.out.println("3. Tracking Status");
        System.out.println("4. Booking History");
        System.out.println("5. Contact Support");
        System.out.println("6. Logout");
        System.out.print(": ");
        String op = sc.nextLine();
        switch (op) {
            case "1": customerHomepage(sn); break;
            case "2": bookingServiceCustomer(sn); customerHomepage(sn); break;
            case "3": trackingStatus(); customerHomepage(sn); break;
            case "4": bookingHistoryCustomer(sn); customerHomepage(sn); break;
            case "5": customerSupport(sn); break;
            case "6": officerOrCustomer(); break;
            default: System.out.println("Invalid Input");customerHomepage(sn);
        }
    }


    ////customerSupport
    public static void customerSupport(Sender sn){
        Scanner scanner = new Scanner(System.in);

        System.out.println("=== Contact Support ===");

        System.out.print("Enter your name: ");
        String name = scanner.nextLine().trim();

        System.out.print("Enter your email: ");
        String email = scanner.nextLine().trim();

        while (!isValidEmail(email)) {
            System.out.print("Invalid email format. Try again: ");
            email = scanner.nextLine().trim();
        }

        System.out.print("Enter your message: ");
        String message = scanner.nextLine().trim();

        boolean success = saveSupportRequest(name, email, message);

        if (success) {
            System.out.println("✅ Your message has been sent to support!");

        } else {
            System.out.println("❌ Failed to send your message. Please try again later.");

        }
        customerHomepage(sn);
        scanner.close();
    }

    // Basic email validation
    private static boolean isValidEmail(String email) {
        String emailRegex = "^[\\w.-]+@[\\w.-]+\\.\\w{2,}$";
        return Pattern.matches(emailRegex, email);
    }

    // Simulate sending the support request (write to file)
    private static boolean saveSupportRequest(String name, String email, String message) {
        try (FileWriter writer = new FileWriter("support_requests.txt", true)) {
            writer.write("Name: " + name + "\n");
            writer.write("Email: " + email + "\n");
            writer.write("Message: " + message + "\n");
            writer.write("--------\n");
            return true;
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }



    public static void bookingServiceCustomer(Sender sn) {
        Receiver rc = new Receiver();
        rc.getDetails(sc);
        Parcel pc = new Parcel();
        pc.getDetails(sc);

        try (Connection con = DBConnection.getConnection()) {
            // Get userId from DB
            String getId = "SELECT UserID FROM tbl_UserProfile WHERE UserID=?";
            PreparedStatement pst = con.prepareStatement(getId);
            pst.setString(1, sn.userid);
            ResultSet rs = pst.executeQuery();
            int userId = 0;
            if (rs.next()) userId = rs.getInt("UserID");

            String sql = "INSERT INTO tbl_Booking (UserID, RecName, RecAddress, RecPin, RecMobile, ParWeightGram, ParContentDescription, ParDeliveryType, ParPackingPreference, ParPickupTime, ParDropoffTime, ParServiceCost, ParPaymentTime, ParStatus) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setInt(1, userId);
            ps.setString(2, rc.name);
            ps.setString(3, rc.add);
            ps.setString(4, rc.pin);
            ps.setString(5, rc.mob);
            ps.setDouble(6, pc.weight);
            ps.setString(7, pc.content);
            ps.setString(8, pc.delType);
            ps.setString(9, pc.packType);
            ps.setString(10, pc.pickUpDate);
            ps.setString(11, pc.dropOffDate);
            ps.setDouble(12, pc.serviceCost);
            ps.setString(13, pc.paymentDateTime);
            ps.setString(14, pc.status);
            ps.executeUpdate();

            ResultSet keys = ps.getGeneratedKeys();
            int bookingId = 0;
            if (keys.next()) bookingId = keys.getInt(1);

            getInvoice(rc, pc, bookingId);

        } catch (Exception e) { e.printStackTrace(); }
    }

    public static void bookingHistoryCustomer(Sender sn) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT b.UserID, b.BookingID, b.ParPaymentTime AS DateOfBooking, " +
                    "b.RecName AS ReceiverName, b.RecAddress AS DeliveredAddress, " +
                    "b.ParServiceCost AS Amount, b.ParStatus AS Status " +
                    "FROM tbl_Booking b " +
                    "JOIN tbl_UserProfile u ON b.UserID = u.UserID " +
                    "WHERE u.UserID = ? " +
                    "ORDER BY b.ParPaymentTime DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, sn.userid);
            ResultSet rs = ps.executeQuery();
            System.out.println("\n----- Booking History -----");
            while (rs.next()) {
                System.out.println("UserID        : " + rs.getInt("UserID"));
                System.out.println("BookingID     : " + rs.getInt("BookingID"));
                System.out.println("DateOfBooking : " + rs.getString("DateOfBooking"));
                System.out.println("ReceiverName  : " + rs.getString("ReceiverName"));
                System.out.println("DeliveredAddr : " + rs.getString("DeliveredAddress"));
                System.out.println("Amount        : ₹" + rs.getDouble("Amount"));
                System.out.println("Status        : " + rs.getString("Status"));
                System.out.println("------------------------------");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    // ---------------- MAIN ----------------
    public static void main(String[] args) {
        System.out.println("Welcome to ParcelPro");
        officerOrCustomer();
        System.out.println("Application closed. Have a nice day!");
    }

    //Invoice Generate
    public static void InvoiceGen(int bid) {
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM tbl_Booking WHERE BookingID=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, bid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                System.out.println("BookingID : " + rs.getString("BookingID"));
                System.out.println("Receiver Name : " + rs.getString("RecName"));
                System.out.println("Receiver Address : " + rs.getString("RecAddress"));
                System.out.println("Receiver Pin : " + rs.getString("RecPin"));
                System.out.println("Receiver Mobile No.: " + rs.getString("RecMobile"));
                System.out.println("Parcel Weight(gram) : " + rs.getString("ParWeightGram"));
                System.out.println("Parcel Content Desc : " + rs.getString("ParContentDescription"));
                System.out.println("Parcel Service Type : " + rs.getString("ParDeliveryType"));
                System.out.println("Parcel Packing Pref : " + rs.getString("ParPackingPreference"));
                System.out.println("Parcel Pickup Time : " + rs.getString("ParPickupTime"));
                System.out.println("Parcel Dropoff Time : " + rs.getString("ParDropoffTime"));
                System.out.println("Parcel Service Cost : " + rs.getString("ParServiceCost"));
                System.out.println("Parcel Payment Time : " + rs.getString("ParPaymentTime"));
            } else System.out.println("Invalid Booking ID");
        } catch (Exception e) { e.printStackTrace(); }
    }


}




