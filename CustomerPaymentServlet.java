package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookingTable;
import model.Booking;

@WebServlet("/CustomerPaymentServlet")
public class CustomerPaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mode = ((Booking) session.getAttribute("newBooking")).getParcelPaymentType();
		if (mode.equalsIgnoreCase("Cash on Pickup")) {
			response.sendRedirect("customerInvoicePage.jsp");
		} else {
			response.sendRedirect("customerPayBill.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BookingTable table = new BookingTable();
		HttpSession session = request.getSession();
		Booking b = (Booking) session.getAttribute("debitCardPayment");
		b.setCardNumber(request.getParameter("cardNumber").toString());
		b.setCardHolder(request.getParameter("cardHolder").toString());
		b.setExpiryDate(request.getParameter("expiryDate").toString());
		b.setCvv(request.getParameter("cvv").toString());
		if (table.insert(b, "debitCard")) {
			session.setAttribute("newBooking", b);
			response.sendRedirect("customerInvoicePage.jsp");
		} else {
			session.setAttribute("booking failed", "true");
			response.sendRedirect("customerBookingService.jsp");
		}
	}
}
