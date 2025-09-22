package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/OfficerLoginServlet")
public class OfficerLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userId = request.getParameter("username").toString();
		String password = request.getParameter("password").toString();
		
		String user="Swastika";
		String pass="Swastika@24";
		HttpSession session = request.getSession();
		
		if(userId.equals(user) && password.equals(pass)) {
			
			session.setAttribute("username", userId);
			session.setAttribute("loggedin", true);
			session.removeAttribute("active");
			response.sendRedirect("officerHomepage.jsp");
		}
		else {
			session.setAttribute("invalidCredentials",false);
			response.sendRedirect("officerLogin.jsp");
		}
	}

}
