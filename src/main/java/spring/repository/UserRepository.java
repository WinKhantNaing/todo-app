package spring.repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.stereotype.Repository;

import spring.model.User;

@Repository
public class UserRepository {
	
	public boolean emailExists(String email) {
		boolean check = false;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select user_email from user where user_email = ?");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				check = true;
			}
		} catch (SQLException e) {
			System.out.println("Check email exists: " + e.getMessage());
		}
		return check;
		
	}
	
	public User accountExists(User user) {
		User checkedUser = null;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("select * from user where user_email = ? and user_password = ?");
			ps.setString(1, user.getUserEmail());
			ps.setString(2, user.getUserPassword());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				checkedUser = new User();
				checkedUser.setUserID(rs.getInt("user_id"));
				checkedUser.setUserName(rs.getString("user_name"));
				checkedUser.setUserEmail(rs.getString("user_email"));
				checkedUser.setUserPassword(rs.getString("user_password"));
			}
		} catch (SQLException e) {
			System.out.println("Account Exists Check: " + e.getMessage());
		}
		return checkedUser;
		
	}
	
	public int addNewUser(User user) {
		int result = 0;
		Connection con = ConnectionClass.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("insert into user (user_name,user_email,user_password) values (?,?,?)");
			ps.setString(1, user.getUserName());
			ps.setString(2, user.getUserEmail());
			ps.setString(3, user.getUserPassword());
			result = ps.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("Insert User" + e.getMessage());
		}
		return result;
		
	}
	
}
