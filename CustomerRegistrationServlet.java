package controller;
import model.User;
import dao.UserProfileTable;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CustomerRegistrationServlet")
public class CustomerRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.sendRedirect("customerRegistration.jsp");
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 
		String name = request.getParameter("name").toString();
		String email = request.getParameter("email").toString();
		String mobile = request.getParameter("countryCode").toString()
				+ " " + request.getParameter("mobile").toString();
		String address = request.getParameter("address").toString();
		String username = request.getParameter("username").toString();
		String password = request.getParameter("password").toString();
		String preferences = request.getParameter("preferences").toString();
		HttpSession session = request.getSession();
		
		User newUser = new User( name,  email,  mobile,  address,  username,  password,
				 preferences, "Customer");
		
		UserProfileTable table = new UserProfileTable();
		
		if(table.insert(newUser)) {
			session.setAttribute("new user", "true");
			response.sendRedirect("customerLogin.jsp");
		}
		else {
			session.setAttribute("old user", "true");
			response.sendRedirect("customerRegistration.jsp");
		}
	}

}
