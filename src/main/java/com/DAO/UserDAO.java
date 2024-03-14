package com.DAO;

import java.util.List;

import com.Entity.Users;

public interface UserDAO {
public boolean userRegister(Users user);
	
	public List<Users> getAllUsers();
	
	public Users login(String username, String password);
	
	public boolean deleteUser(String id);
}
