package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Entity.Users;


public class UserDAOImpl implements UserDAO {
	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean userRegister(Users user) {
		boolean f=false;
		try {
			String sql = "INSERT INTO users(user_id, user_name, user_phone, user_email, user_address, user_profile, password, registration_date) VALUES (?,?,?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, user.getId());
			pst.setString(2, user.getUsername());
			pst.setString(3, user.getPhone());
			pst.setString(4, user.getEmail());
			pst.setString(5, user.getAddress());
			pst.setString(6, user.getProfile());
			pst.setString(7, user.getPassword());
			pst.setString(8, user.getRegistration_date());
			
			int i = pst.executeUpdate();
			if(i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}


	public Users login(String username, String password) {
		Users user = null;

		try {
			String sql = "select * from users where user_name = ? and password = ? ";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, username);
			pst.setString(2, password);
			
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				user = new Users(sql, sql, sql, sql, sql, sql, sql, sql);
				user.setId(rs.getString(1));
				user.setUsername(rs.getString(2));
				user.setPhone(rs.getString(3));
				user.setEmail(rs.getString(4));
				user.setAddress(rs.getString(5));
				user.setProfile(rs.getString(6));
				user.setPassword(rs.getString(7));
				user.setRegistration_date(rs.getString(8));
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public List<Users> getAllUsers() {
		List<Users> list = new ArrayList<Users>();
		Users user = null;
		
		try {
			String sql = "SELECT * FROM users;";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				user = new Users(sql, sql, sql, sql, sql, sql, sql, sql);
				user.setId(rs.getString(1));
				user.setUsername(rs.getString(2));
				user.setPhone(rs.getString(3));
				user.setEmail(rs.getString(4));
				user.setAddress(rs.getString(5));
				user.setProfile(rs.getString(6));
				user.setPassword(rs.getString(7));
				user.setRegistration_date(rs.getString(8));
				list.add(user);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Users getUser(String id) {
		Users user = null;
		
		try {
			String sql = "SELECT * FROM users Where user_id=?;";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				user = new Users(sql, sql, sql, sql, sql, sql, sql, sql);
				user.setId(rs.getString(1));
				user.setUsername(rs.getString(2));
				user.setPhone(rs.getString(3));
				user.setEmail(rs.getString(4));
				user.setAddress(rs.getString(5));
				user.setProfile(rs.getString(6));
				user.setPassword(rs.getString(7));
				user.setRegistration_date(rs.getString(8));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return user;
	}
	
	public boolean updateUser(Users user) {
		boolean updateUser = false;
		System.out.println(user.getUsername());
try {
			

			String sql = "UPDATE users SET user_name=?,user_phone=?,user_email=?,user_address=?,user_profile=?,password=?,registration_date=? WHERE user_id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, user.getUsername());
			pst.setString(2, user.getPhone());
			pst.setString(3, user.getEmail());
			pst.setString(4, user.getAddress());
			pst.setString(5, user.getProfile());
			pst.setString(6, user.getPassword());
			pst.setString(7, user.getRegistration_date());
			pst.setString(8, user.getId());
			
			int i = pst.executeUpdate();
			if(i == 1) {
				updateUser = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return updateUser;
	}
	
	public boolean deleteUser(String id) {
		boolean f = false;
		try {
			String sql = "DELETE FROM users WHERE user_id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			int i = pst.executeUpdate();
			if( i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
