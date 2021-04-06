package controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.LoginDAO;
import daos.UserDAO;
import model.Account;
import model.Contact;
import model.Login;
import model.User;

/**
 * Servlet implementation class AdminServlet
 */
@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String userID = (String) session.getAttribute("USER_ID");
		
		
		if (userID == null) {
			response.sendRedirect("login");
			
		} else {

			boolean isAdmin = false;

			try {
				isAdmin = LoginDAO.checkAdmin(userID);
				
				if (isAdmin) {

					String param = request.getParameter("hiddenField");
					
					if (param != null) {
						
						if (param.contentEquals("createuser")) {
							String email1 = request.getParameter("email");
							String firstName1 = request.getParameter("firstName");
							String lastName1 = request.getParameter("lastName");
							String password1 = request.getParameter("password1");
							float balance1 = Float.parseFloat(request.getParameter("balance"));
							String phone1 = request.getParameter("phone");
							String address1 = request.getParameter("address");
							
							User user1 = new User();
							user1.setEmail(email1);
							user1.setFirstName(firstName1);
							user1.setLastName(lastName1);
							
							Login login1 = new Login();
							login1.setPassword(password1);
							
							Account acc1 = new Account();
							acc1.setBalance(balance1);
							
							Contact contact1 = new Contact();
							contact1.setAddress(address1);
							contact1.setPhone(phone1);
							
							String userCreatedMsg;
							userCreatedMsg = UserDAO.createUser(user1, login1, acc1, contact1);
							
							request.setAttribute("MESSAGE", userCreatedMsg);
							RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp");
							dispatcher.forward(request, response);
							
						} else {
							RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp");
							dispatcher.forward(request, response);
							
						}
						
					} else {
						RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp");
						dispatcher.forward(request, response);
						
					}
					
				} else {
					RequestDispatcher dispatcher = request.getRequestDispatcher("login");
					dispatcher.forward(request, response);
					
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
	}

}
