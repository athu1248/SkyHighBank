package daos;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import model.Transaction;

public class TransactionDAO {

	public static List<Transaction> getTransactions(String accountNo) throws SQLException {
		List<Transaction> transactions = new ArrayList<Transaction>();
		Connection con = DBManager.getConnection();
		// String custID = DBManager.getCustID(loginID);

		Statement stmt1 = con.createStatement();
		ResultSet rs = stmt1.executeQuery("SELECT *, IF(payer_account_no = '"+accountNo+"', 'true', 'false') isPayer FROM TRANSACTION WHERE payer_account_no = '" + accountNo + "' or payee_account_no = '" + accountNo + "' ORDER BY datetime ASC;");

		while (rs.next()) {
			Transaction t1 = new Transaction();
			t1.setTransactionID(rs.getString("transaction_id"));
			t1.setDatetime(rs.getDate("datetime"));
			t1.setPayerAccNo(rs.getString("payer_account_no"));
			t1.setPayeeAccNo(rs.getString("payee_account_no"));
			t1.setAmount(rs.getFloat("amount"));
			t1.setPayerBalance(rs.getFloat("payer_balance"));
			t1.setPayeeBalance(rs.getFloat("payee_balance"));
			t1.setType(rs.getString("type"));
			t1.setComments(rs.getString("comments"));
			t1.setPayer(Boolean.parseBoolean(rs.getString("isPayer")));
			transactions.add(t1);
		}

		con.close();

		return transactions;

	}

	public static String doTransaction(Transaction t) throws SQLException {
		String result = "";
		
		Connection con = DBManager.getConnection();
		con.setAutoCommit(false);
		Statement stmt1 = con.createStatement();
		
		boolean hasMoney = false;

		try {
			if (t.getAmount() > getBalance(t.getPayerAccNo())) {
				hasMoney = false;
			} else {
				hasMoney = true;
			}
		
			if (hasMoney) {
	
				// Delete the amount from the payer's end
				stmt1.executeUpdate("UPDATE ACCOUNT SET balance = balance - " + Double.toString(t.getAmount())
						+ "WHERE account_no = '" + t.getPayerAccNo() + "';");
	
				// Add the amount to the receivers's end
				stmt1.executeUpdate("UPDATE ACCOUNT SET balance = balance + " + Double.toString(t.getAmount())
						+ "WHERE account_no = '" + t.getPayeeAccNo() + "';");
				

				float payerBalance = getBalance(t.getPayerAccNo()) - t.getAmount();
				float payeeBalance = getBalance(t.getPayeeAccNo()) + t.getAmount();

				// Update transaction table
				stmt1.executeUpdate(
						"INSERT INTO TRANSACTION (payer_account_no, payee_account_no, amount, payer_balance, payee_balance, type, comments) VALUES ('"
								 + t.getPayerAccNo() +"', '"+ t.getPayeeAccNo() +"', "+ t.getAmount() 
								+", "+ payerBalance +", "+ payeeBalance +", '"+ t.getType() +"', '"+ t.getComments() +"');");
				
				con.commit();
				result = "Transfer successfull!";
				
			} else {
				result = "You do not have enough funds!";
			}

		} catch (SQLException e) {
			con.rollback();
			result = "Error while transferring... Please check all the details or try again later.";
		}
		con.rollback();
		con.close();
		
		return result;

	}
	
	private static float getBalance(String accountNo) {
		float balance = 0;
		Connection con = DBManager.getConnection();
		try {
			Statement stmt1 = con.createStatement();
			
			ResultSet rs = stmt1.executeQuery("SELECT * FROM ACCOUNT WHERE account_no = '"+ accountNo +"';");
			
			while (rs.next()) {
				balance = rs.getFloat("balance");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return balance;
	}

}
