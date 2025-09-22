package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookingTable;
import model.Booking;
import model.User;

@WebServlet("/CustomerBookingHistoryServlet")
public class CustomerBookingHistoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("user");
        BookingTable table = new BookingTable();
        try {
            ResultSet rs = table.check(u.getUserid());
            if (rs!=null) {
            	ArrayList<Booking> pb = new ArrayList<>();
            	while(rs.next()) {
            		Booking b = new Booking();
            		b.setUserId(rs.getInt(2));
                    b.setBookingId(rs.getInt(1));
                    b.setParcelPaymentTime(rs.getString(14));
                    b.setReceiverName(rs.getString(3));
                    b.setReceiverAddress(rs.getString(4));
                    b.setParcelServiceCost(rs.getInt(13));
                    b.setParcelStatus(rs.getString(15));
                    pb.add(b);
            	}
                session.setAttribute("bookings", pb);
            } else {
                session.setAttribute("invalid", false);
            } 
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
		response.sendRedirect("customerBookingHistory.jsp");
	}
}
