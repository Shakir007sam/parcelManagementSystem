package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import dao.BookingTable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class OfficerPickupSchedulingServlet
 */
@WebServlet("/OfficerPickupSchedulingServlet")
public class OfficerPickupSchedulingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bid=request.getParameter("bookingId").toString();
		String date=request.getParameter("pickupDate").toString();
        String time=request.getParameter("pickupTime").toString();
        
//        PrintWriter out= response.getWriter();
//        out.println(date);
//        out.println(time);
        
        BookingTable book= new BookingTable();
        HttpSession session= request.getSession();
        String d= date+" "+time;
        
       try {
    	   int res= book.updatepickup(bid,d);
    	   if(res>0) {
    		   
    		   session.setAttribute("successful", true);
    	   }
    	   else {
    		   session.setAttribute("invalid", false);
    	   }
    	   response.sendRedirect("officerPickupScheduling.jsp");
       }
       catch(SQLException | IOException e) {
    	   e.printStackTrace();
       }
		
        
	}

}
