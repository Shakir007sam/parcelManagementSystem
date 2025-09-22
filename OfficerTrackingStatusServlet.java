package controller;

import dao.BookingTable;
import model.Booking;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class OfficerTrackingStatusServlet
 */
@WebServlet("/OfficerTrackingStatusServlet")
public class OfficerTrackingStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String customer = request.getParameter("customerId").toString();
		String booking = request.getParameter("bookingId").toString();
		HttpSession session = request.getSession();
		BookingTable table = new BookingTable();
		try {
			ResultSet rs = table.checkOfficer(customer, booking);
			if (rs!=null && rs.next()) {
				Booking b = new Booking();
				b.setBookingId(Long.parseLong(rs.getString(1)));
				b.setUserId(Integer.parseInt(rs.getString(2)));
				b.setReceiverName(rs.getString(3));
				b.setParcelStatus(rs.getString(15));
				b.setParcelLastUpdateTime(rs.getString(16));
				session.setAttribute("booking", b);
			} else {
				session.setAttribute("invalid", false);
			} 
			response.sendRedirect("officerTrackingStatus.jsp");
		} catch (SQLException | IOException e) {
			e.printStackTrace();
		}
	}
}
