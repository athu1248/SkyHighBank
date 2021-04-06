package daos;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import model.Contact;

public class ContactDAO {
	
	/**
	 * It is used to get the contact information of an existing user using their loginID.
	 * @param loginID
	 * @return contact object with all the details.
	 * @throws SQLException
	 */
	public static Contact getContactInfo(String userID) throws SQLException {
		Contact contact = new Contact();
		
		Connection con = DBManager.getConnection();
		Statement stmt1 = con.createStatement();
		
		ResultSet rs = stmt1.executeQuery("SELECT * FROM CONTACT WHERE user_id = '" + userID + "';");
		
		while (rs.next()) {
			contact.setAddress(rs.getString("address"));
			contact.setPhone(rs.getString("phone"));
			contact.setEmail(rs.getString("email"));
		}
		
		con.close();
		return contact;
	}
	
	/**
	 * It updates the existing contact info present inside the database.
	 * @param contact - contact object with all the new information in it
	 * @param loginID - the user's loginID
	 * @return boolean - true for modified successfully and false for not modified.
	 */
	public static boolean updateContactInfo(Contact contact, String userID) {
		Connection con = DBManager.getConnection();
		boolean bool1 = false;
		
		try {
			Statement stmt1 = con.createStatement();
			stmt1.executeUpdate("UPDATE CONTACT SET address = '"+contact.getAddress()+"', phone = '"+contact.getPhone()+"', email = '"+contact.getEmail()+"' WHERE user_id = '"+userID+"';");
			bool1 = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return bool1;
		
	}

}
