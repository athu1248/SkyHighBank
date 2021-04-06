package daos;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.Login;

public class LoginDAO {
	
	public static boolean checkUser(Login login) throws SQLException {
		// Checks if a user with loginID and password exists
		boolean result = false;
		
		Connection con = DBManager.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT * FROM LOGIN WHERE email = '"+login.getEmail()+"' && password = '"+login.getPassword()+"'");
		
		while(rs.next()){
			result = true;
		}
		con.close();
		
		return result;
	}
	
	public static boolean checkStaff(String userID) throws SQLException {
		boolean result = false;
		
		Connection con = DBManager.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT user_id, IF(isStaff, 'true', 'false') isStaff FROM USERS WHERE user_id = '"+ userID +"'");
		
		while (rs.next()) {
			if (rs.getString("isStaff").contentEquals("true")) {
				result = true;
			}
		}
		
		return result;
	}
	
	public static boolean checkAdmin(String userID) throws SQLException {
		boolean result = false;
		
		Connection con = DBManager.getConnection();
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery("SELECT user_id, IF(isAdmin, 'true', 'false') isAdmin FROM USERS WHERE user_id = '"+ userID +"'");
		
		while (rs.next()) {
			if (rs.getString("isAdmin").contentEquals("true")) {
				result = true;
			}
		}
		
		return result;
	}
	
	public void update() {
		
	}
}
