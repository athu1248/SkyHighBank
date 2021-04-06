package daos;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.Portfolio;

public class PortfolioDAO {
	//SELECT CUSTOMER.LAST_NAME, CUSTOMER.FIRST_NAME, ACCOUNT.account_id, ACCOUNT.balance FROM CUSTOMER INNER JOIN ACCOUNT ON CUSTOMER.customer_id = ACCOUNT.cust_id WHERE CUSTOMER.customer_id = 'CUST1';
	
	public static Portfolio getPortfolio(String userID) throws SQLException {
		Portfolio resultPortfolio = new Portfolio();
		
		Connection con = DBManager.getConnection();
		
		Statement stmt1 = con.createStatement();
		ResultSet rs = stmt1.executeQuery("SELECT USERS.last_name, USERS.first_name, ACCOUNT.account_no, ACCOUNT.balance FROM USERS INNER JOIN ACCOUNT ON USERS.account_no = ACCOUNT.account_no WHERE USERS.user_id = '"+ userID  +"';");
		
		while(rs.next()){
			resultPortfolio.setFirstName(rs.getString("FIRST_NAME"));
			resultPortfolio.setLastName(rs.getString("LAST_NAME"));
			resultPortfolio.setAccountNo(rs.getString("account_no"));
			resultPortfolio.setBalance(rs.getString("balance"));
		}
		
		con.close();
		
		return resultPortfolio;
	}
	
	public void update() {
		
	}
}
