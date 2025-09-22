package controller;

import dao.BookingTable;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Booking;
import model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CustomerTrackingStatusServlet")
public class CustomerTrackingStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("customerTrackingStatus.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String booking = request.getParameter("bookingId").toString();
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("user");
		BookingTable table = new BookingTable();
		try {
			ResultSet rs = table.check(u.getUserid()+"", booking);
			if (rs != null && rs.next()) {
				Booking b = new Booking();
				b.setParcelStatus(rs.getString(15));
				b.setParcelDrop(rs.getString(12));
				session.setAttribute("booking", b);
			} else {
				session.setAttribute("invalid", false);
			}
			response.sendRedirect("customerTrackingStatus.jsp");
		} catch (SQLException | IOException e) {
			e.printStackTrace();
		}
	}
}
