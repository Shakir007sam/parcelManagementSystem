package controller;
import model.User;
import model.Booking;
import dao.BookingTable;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CustomerBookingServiceServlet")
public class CustomerBookingServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("customerBookingService.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String receiverName = request.getParameter("receiverName").toString();
		String receiverPin = request.getParameter("receiverPincode").toString();
		String receiverMobile = request.getParameter("receiverContact").toString();
		String receiverAddress = request.getParameter("receiverAddress").toString();
		float parcelWeight = Float.parseFloat(request.getParameter("weight").toString());
		String parcelContent = request.getParameter("contents").toString();
		String parcelDelivery = request.getParameter("deliverySpeed").toString();
		String parcelPacking = request.getParameter("packaging").toString();
		String parcelPick = request.getParameter("pickupTime").toString();
		String parcelDrop = request.getParameter("dropoffTime").toString();
		String parcelPaymentType =  request.getParameter("paymentMethod");
		float parcelServiceCost = Float.parseFloat(request.getParameter("estimatedCost").toString());
		HttpSession session = request.getSession();
		User u = (User) session.getAttribute("user");
		
		Booking newBooking = new Booking(
				u.getUserid(), receiverName, receiverAddress, receiverPin, receiverMobile, 
				parcelWeight, parcelContent, parcelDelivery, parcelPacking, parcelPick, parcelDrop, 
				parcelServiceCost, parcelPaymentType, "Booked", LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")));
		
		BookingTable table = new BookingTable();
		
		if(parcelPaymentType.equalsIgnoreCase("Cash on Pickup")) {
			table.insert(newBooking);
			session.setAttribute("newBooking", newBooking);
			response.sendRedirect("customerInvoicePage.jsp");
		}
		else if(parcelPaymentType.equalsIgnoreCase("Debit Card")) {
			session.setAttribute("debitCardPayment", newBooking);
			response.sendRedirect("customerPayBill.jsp");
		}
		else {
			session.setAttribute("booking failed", "true");
			response.sendRedirect("customerBookingService.jsp");
		}
	}
}
