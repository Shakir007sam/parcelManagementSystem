package controller;
import dao.UserProfileTable;
import model.User;

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

@WebServlet("/CustomerLoginServlet")
public class CustomerLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username").toString();
		String password = request.getParameter("password").toString();
		UserProfileTable table = new UserProfileTable();
		ResultSet rs = table.check(username, password);
		HttpSession session = request.getSession();
		
		try {
			if(rs.next()) {
				PrintWriter out = response.getWriter();
				out.print(rs);
				User u = new User();
				u.setUserid(rs.getInt(1));
				u.setUsername(rs.getString(2));
				u.setName(rs.getString(3));
				u.setAddress(rs.getString(4));
				u.setEmail(rs.getString(5));
				u.setMobile(rs.getString(6));
				u.setPassword(rs.getString(7));
				u.setRole(rs.getString(8));
				u.setPreferences(rs.getString(9));
				session.setAttribute("user", u);
				session.setAttribute("loggedin", true);
				out.println("Login Successful");
				response.sendRedirect("customerHomepage.jsp");	
			}
			else {
				session.setAttribute("invalidCredentials", false);
				response.sendRedirect("customerLogin.jsp");	
			}
		} catch (SQLException | IOException e) {
			e.printStackTrace();
		}
	}

}
