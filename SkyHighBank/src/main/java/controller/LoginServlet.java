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

import daos.DBManager;
import daos.LoginDAO;
import daos.PortfolioDAO;
import model.Login;
import model.Portfolio;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
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
		
		HttpSession session = request.getSession();
		String userID = (String) session.getAttribute("USER_ID");
		String param = request.getParameter("hiddenField");
		
		// if user is logged in
		if (userID == null ) {

			
			// if request has a parameter
			if (param != null) {
				
				// If login in request
				if (param.equals("login")){
					
					String email = request.getParameter("email");
					String passwd = request.getParameter("passwd");
					
				
					Login login = new Login();
					login.setEmail(email);
					login.setPassword(passwd);
					
					boolean isUser = false;
					
					try {
						isUser = LoginDAO.checkUser(login); 
						
						if (isUser) {
							
							userID = DBManager.getUserID(email);
							session.setAttribute("USER_ID", userID);
							
							boolean isStaff, isAdmin = false;
							isStaff = LoginDAO.checkStaff(userID);
							isAdmin = LoginDAO.checkAdmin(userID);
							
							if (isAdmin) {
								
								RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp");
								dispatcher.forward(request, response);
								
							} else if (isStaff) {
								
								RequestDispatcher dispatcher = request.getRequestDispatcher("portfolio.jsp");
								dispatcher.forward(request, response);
								
							} else {
								
								Portfolio portfolio = new Portfolio();
								portfolio = PortfolioDAO.getPortfolio(userID);
								
								request.setAttribute("PORTFOLIO", portfolio);
								RequestDispatcher dispatcher = request.getRequestDispatcher("portfolio.jsp");
								dispatcher.forward(request, response);
								
							}
							
						} else {
							
							request.setAttribute("MESSAGE", "Wrong email or password!");
							RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
							dispatcher.forward(request, response);
						}
						
					} catch (SQLException e) {
						
						e.printStackTrace();
					}
			
					
				} else if (param.contentEquals("logout")) {
					session.removeAttribute("USER_ID");
					request.setAttribute("MESSAGE", "You have logged out!");
					RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
					dispatcher.forward(request, response);
					
					
				} else {
					
					RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
					dispatcher.forward(request, response);
					
				}
				
			} else {
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
				dispatcher.forward(request, response);
				
			}
			
			
		} else {  
			

			
			//If user is not logged in
			
			if (param != null) {

				if (param.contentEquals("logout")) {
					session.removeAttribute("USER_ID");
					request.setAttribute("MESSAGE", "You have logged out!");
					RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
					dispatcher.forward(request, response);
					
					
				} else {
					
				
					boolean isStaff, isAdmin = false;
					try {
						isStaff = LoginDAO.checkStaff(userID);
						isAdmin = LoginDAO.checkAdmin(userID);
						
						if (isAdmin) {
							
							RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp");
							dispatcher.forward(request, response);
							
						} else if (isStaff) {
							
							Portfolio portfolio = new Portfolio();
							portfolio = PortfolioDAO.getPortfolio(userID);
							
							request.setAttribute("PORTFOLIO", portfolio);
							RequestDispatcher dispatcher = request.getRequestDispatcher("portfolio.jsp");
							dispatcher.forward(request, response);
							
						} else {
							
							Portfolio portfolio = new Portfolio();
							portfolio = PortfolioDAO.getPortfolio(userID);
							
							request.setAttribute("PORTFOLIO", portfolio);
							RequestDispatcher dispatcher = request.getRequestDispatcher("portfolio.jsp");
							dispatcher.forward(request, response);
							
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
				} 
				
			} else {

				boolean isStaff, isAdmin = false;
				try {
					isStaff = LoginDAO.checkStaff(userID);
					isAdmin = LoginDAO.checkAdmin(userID);
					
					if (isAdmin) {
						
						RequestDispatcher dispatcher = request.getRequestDispatcher("admin.jsp");
						dispatcher.forward(request, response);
						
					} else if (isStaff) {
						
						Portfolio portfolio = new Portfolio();
						portfolio = PortfolioDAO.getPortfolio(userID);
						
						request.setAttribute("PORTFOLIO", portfolio);
						RequestDispatcher dispatcher = request.getRequestDispatcher("portfolio.jsp");
						dispatcher.forward(request, response);
						
					} else {
						
						Portfolio portfolio = new Portfolio();
						portfolio = PortfolioDAO.getPortfolio(userID);
						
						request.setAttribute("PORTFOLIO", portfolio);
						RequestDispatcher dispatcher = request.getRequestDispatcher("portfolio.jsp");
						dispatcher.forward(request, response);
						
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			
		} 
		
		
	}

}
