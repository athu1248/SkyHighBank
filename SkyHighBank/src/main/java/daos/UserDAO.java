package daos;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;

import model.Account;
import model.Contact;
import model.Login;
import model.User;

public class UserDAO {
	
	private static String asciiUpperCase = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    private static String asciiLowerCase = asciiUpperCase.toLowerCase();
    private static String digits = "1234567890";
    private static String asciiChars = asciiUpperCase + asciiLowerCase + digits;
	
	/**
	 * This method is used to create a user which doesn't exist already in all required tables, i.e. USERS, LOGIN, ACCOUNT, CONTACT
	 * @param user
	 * @param login
	 * @param account
	 * @param contact
	 * @return
	 * @throws SQLException
	 */
	public static String createUser(User user, Login login, Account account, Contact contact) throws SQLException {
		String result;
		boolean if_exists;
		ResultSet rs;
		if_exists = false;
		result = "Unable to create user!";

		// Checking if user exists with same email
		Connection con = DBManager.getConnection();
		con.setAutoCommit(false);
		Statement stmt = con.createStatement();
		rs = stmt.executeQuery("SELECT * FROM USERS WHERE email = '"+user.getEmail()+"'");
		while(rs.next()){
			if_exists = true;
		}
		rs = stmt.executeQuery("SELECT * FROM LOGIN WHERE email = '"+user.getEmail()+"'");
		while(rs.next()){
			if_exists = true;
		}
		rs = stmt.executeQuery("SELECT * FROM CONTACT WHERE email = '"+user.getEmail()+"'");
		while(rs.next()){
			if_exists = true;
		}
		
		if(!if_exists) { // NOT false = true  (if_exists = false)
			
			String userID;
			String accountNo;
			// Checking if randomly generated account number already exists
			boolean userID_exists;
			do {
				userID = generateRandomString(20, asciiChars);
				rs = stmt.executeQuery("SELECT * FROM USERS WHERE user_id = '"+userID+"'");
				while(rs.next()){
					userID_exists = true;
					continue;
				}
				userID_exists = false;
			} while (userID_exists);

			// Checking if randomly generated account number already exists
			boolean accountNo_exists;
			do {
				accountNo = generateRandomString(12, digits);
				rs = stmt.executeQuery("SELECT * FROM ACCOUNT WHERE account_no = '"+accountNo+"'");
				while(rs.next()){
					accountNo_exists = true;
					continue;
				}
				accountNo_exists = false;
			} while (accountNo_exists);
			
			stmt.executeUpdate("INSERT INTO USERS (user_id, email, first_name, last_name, account_no) VALUES ('"+userID+"', '"+user.getEmail()+"', '"+user.getFirstName()+"', '"+user.getLastName()+"', '"+accountNo+"');");
			stmt.executeUpdate("INSERT INTO LOGIN (email, password) VALUES ('"+user.getEmail()+"', '"+login.getPassword()+"');");
			stmt.executeUpdate("INSERT INTO ACCOUNT (account_no, balance) VALUES ('"+accountNo+"', "+account.getBalance()+");");
			stmt.executeUpdate("INSERT INTO CONTACT (user_id, email, address, phone) VALUES ('"+userID+"', '"+user.getEmail()+"', '"+contact.getAddress()+"', '"+contact.getPhone()+"');");
			
			con.commit();
			result = "User created succesfully!";
		} else {
			result = "User with same email already exists!";
		}
		con.rollback();
		con.close();
		
		return result;
	}
	
	private static String generateRandomString(int length, String seedChars) {
        
        StringBuilder sb = new StringBuilder();
        int i = 0;
        Random rand = new Random();
        while (i < length) {
            sb.append(seedChars.charAt(rand.nextInt(seedChars.length())));
            i++;
        }
        return sb.toString();
    }

}
