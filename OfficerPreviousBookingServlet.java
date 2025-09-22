package controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.BookingTable;
import model.Booking;
/**
 * Servlet implementation class OfficerPreviousBookingServlet
 */
@WebServlet("/OfficerPreviousBookingServlet")
public class OfficerPreviousBookingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname= request.getParameter("customerId").toString();
		
		HttpSession session= request.getSession();
		BookingTable book= new BookingTable();
		try {
			ResultSet rs=book.previouslist(uname);
			if(rs!=null) {
				
				ArrayList<Booking> al= new ArrayList<Booking>();
				while(rs.next()) {
				Booking b= new Booking();
				b.setBookingId(Long.parseLong(rs.getString(1)));
				b.setUserId(Integer.parseInt(rs.getString(2)));
				b.setParcelPaymentTime(rs.getString(14));
				b.setReceiverName(rs.getString(3));
				b.setReceiverAddress(rs.getString(4));
				b.setParcelServiceCost(rs.getFloat(13));
				b.setParcelStatus(rs.getString(15));
				al.add(b);
				}
				session.setAttribute("bookings", al);
			}
			else {
				session.setAttribute("invalid", false);
			}
			response.sendRedirect("officerBookingHistory.jsp");
		}
		catch(SQLException | IOException e) {
	    	   e.printStackTrace();
	       }
			
	}

	

}
