package spring.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserRepository {
	
	public boolean emailExists(String email) {
		boolean check = false;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select email from user where email = ?");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				check = true;
			}
		} catch (SQLException e) {
			System.out.println("Email exists: " + e.getMessage());
		}
		return check;
		
	}
	
}
