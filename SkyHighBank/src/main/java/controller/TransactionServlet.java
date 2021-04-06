package controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import daos.DBManager;
import daos.TransactionDAO;
import model.Transaction;

/**
 * Servlet implementation class TransactionServlet
 */
@WebServlet("/TransactionServlet")
public class TransactionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userID = (String) session.getAttribute("USER_ID");
		
		if (userID == null) {
			response.sendRedirect("login");
			
		} else {
			String param = request.getParameter("t");
			String accNo = "";
			try {
				accNo = DBManager.getAccountNo(userID);
			} catch (SQLException e2) {
				// TODO Auto-generated catch block
				e2.printStackTrace();
			}
			
			if (param == null) {
				List<Transaction> transactions = new ArrayList<Transaction>();

				try {
					transactions = TransactionDAO.getTransactions(accNo);
					request.setAttribute("TRANSACTIONS", transactions);
					RequestDispatcher dispatcher = request.getRequestDispatcher("transactionview.jsp");
					dispatcher.forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				// ADD PARAM == 1
				
			} else if (param.contentEquals("0")){
				
				RequestDispatcher dispatcher = request.getRequestDispatcher("transfer.jsp");
				dispatcher.forward(request, response);
				
			} else if (param.contentEquals("transferSbmt")) {

				try {
				
					String payeeAccNo = request.getParameter("payeeAccNo");
					Float amount = Float.parseFloat(request.getParameter("amount"));
					String type = request.getParameter("type");
					String comments = request.getParameter("comments");
	
					Transaction transaction = new Transaction();
					transaction.setPayerAccNo(accNo);
					transaction.setPayeeAccNo(payeeAccNo);
					transaction.setAmount(amount);
					transaction.setType(type);
					transaction.setComments(comments);
	
							
					String msg;
					msg = TransactionDAO.doTransaction(transaction);
					request.setAttribute("MESSAGE", msg);
					RequestDispatcher dispatcher = request.getRequestDispatcher("transfer.jsp");
					dispatcher.forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (NullPointerException npe) {
					request.setAttribute("MESSAGE", "Please enter amount!");
					RequestDispatcher dispatcher = request.getRequestDispatcher("transfer.jsp");
					dispatcher.forward(request, response);
			    } catch (NumberFormatException nfe) {
			    	request.setAttribute("MESSAGE", "Please enter amount!");
					RequestDispatcher dispatcher = request.getRequestDispatcher("transfer.jsp");
					dispatcher.forward(request, response);
			    }

				
			} else {
				List<Transaction> transactions = new ArrayList<Transaction>();

				try {
					transactions = TransactionDAO.getTransactions(accNo);
					request.setAttribute("TRANSACTIONS", transactions);
					RequestDispatcher dispatcher = request.getRequestDispatcher("transactionview.jsp");
					dispatcher.forward(request, response);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

		}
	}
}
