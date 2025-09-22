package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BookingTable;
import model.Booking;
;/**
 * Servlet implementation class OfficerDeliveryStatusServlet
 */
@WebServlet("/OfficerDeliveryStatusServlet")
public class OfficerDeliveryStatusServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String bid = request.getParameter("bookingId").toString();
		String st = request.getParameter("deliveryStatus").toString();
		HttpSession session = request.getSession();
		BookingTable b= new BookingTable();
		 try {
			 int rs=b.checkBooking(bid,st);
			 if(rs>0) {	 
				 session.setAttribute("booking", true);
			 }
			 else {
				 session.setAttribute("invalid", false);
			 }
			 response.sendRedirect("officerDeliveryUpdate.jsp");
		 }
		 catch (SQLException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
	}
}
