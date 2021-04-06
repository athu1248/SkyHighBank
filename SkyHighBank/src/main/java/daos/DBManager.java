package daos;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBManager {

	/**
	 * It is used to get connection to the database
	 * @return Connection
	 */
	public static Connection getConnection(){
		Connection con = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/obsdb","root","root");
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	/**
	 * It is used to get the customer ID from an existing user's login ID
	 * @param email - Email of the user
	 * @return userID in String
	 * @throws SQLException
	 */
	public static String getEmail(String userID) throws SQLException {
		
		String email = "";
		Connection con = getConnection();
		Statement stmt1 = con.createStatement();
		ResultSet rs = stmt1.executeQuery("SELECT * FROM USERS WHERE user_id = '" + userID + "';");
		
		while (rs.next()) {
			email = rs.getString("email");
		}
		
		con.close();
		
		return email;
	}
	
	public static String getAccountNo(String userID) throws SQLException {
		
		String accountNo = "";
		Connection con = getConnection();
		Statement stmt1 = con.createStatement();
		ResultSet rs = stmt1.executeQuery("SELECT * FROM USERS WHERE user_id = '" + userID + "';");
		
		while (rs.next()) {
			accountNo = rs.getString("account_no");
		}
		
		con.close();
		
		return accountNo;
	}
	
	public static String getUserID(String email) throws SQLException {
		
		String userID = "";
		Connection con = getConnection();
		Statement stmt1 = con.createStatement();
		ResultSet rs = stmt1.executeQuery("SELECT * FROM USERS WHERE email = '" + email + "';");
		
		while (rs.next()) {
			userID = rs.getString("user_id");
		}
		
		con.close();
		
		return userID;
	}
	
	/**
	 * It is used to get balance of an existing user from his customer ID
	 * @param custID
	 * @return balance amount in Double
	 * @throws SQLException
	 */
}
