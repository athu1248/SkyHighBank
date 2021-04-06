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

import daos.ContactDAO;
import daos.DBManager;
import daos.LoginDAO;
import model.Contact;
import model.Login;

/**
 * Servlet implementation class ContactServlet
 */
@WebServlet("/ContactServlet")
public class ContactServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		String userID = (String) session.getAttribute("USER_ID");
		
		if(userID != null)  {
			
			Contact contact = null;
			
			String param = request.getParameter("c");
			
			if (param != null) {
				if (param.equals("0")) {
					// If request from menu item of jsp pages
					try {
						contact = ContactDAO.getContactInfo(userID);
						request.setAttribute("CONTACT", contact);
						RequestDispatcher dispatcher = request.getRequestDispatcher("contact.jsp");
						dispatcher.forward(request, response);
						
					} catch (SQLException e) {
						e.printStackTrace();
					}
					
				} else if (param.equals("1")) {
					// If request to modify contact from contact.jsp
					try {
						contact = ContactDAO.getContactInfo(userID);
						request.setAttribute("CONTACT", contact);
						RequestDispatcher dispatcher = request.getRequestDispatcher("contactModify.jsp");
						dispatcher.forward(request, response);
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
				} else if (param.equals("2")) {
					boolean isUser = false;
					
					
					try {
						String password = request.getParameter("password");
						String email = DBManager.getEmail(userID);
						
						Login login = new Login();
						
						login.setEmail(email);
						login.setPassword(password);
						isUser = LoginDAO.checkUser(login); 
						
						if (isUser) {
							contact = new Contact();
							
							String address = request.getParameter("address");
							String phone = request.getParameter("phone");
							email = request.getParameter("email");
							
							contact.setAddress(address);
							contact.setPhone(phone);
							contact.setEmail(email);
							
							boolean isModified = ContactDAO.updateContactInfo(contact, userID);
							
							if (isModified) {
								request.setAttribute("CONTACT", contact);
								RequestDispatcher dispatcher = request.getRequestDispatcher("contact.jsp");
								dispatcher.forward(request, response);
							} else {
								RequestDispatcher dispatcher = request.getRequestDispatcher("error.html");
								dispatcher.forward(request, response);
							}
						} else {
							RequestDispatcher dispatcher = request.getRequestDispatcher("error.html");
							dispatcher.forward(request, response);
						}
						
					} catch (SQLException e) {
						e.printStackTrace();
					}
					
					
				} else {
					response.sendRedirect("contact?c=0");
				}
			
			} else {
				response.sendRedirect("contact?c=0");
			}
			
		} else {
			response.sendRedirect("login");
		}
		
	}

}
