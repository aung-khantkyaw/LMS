package com.UserServlet;


import java.io.IOException;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.Entity.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UsersEdit
 */
public class UserEdit extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String id = request.getParameter("user_id");
			String name = request.getParameter("name");
			String phone = request.getParameter("phone");
			String profile = request.getParameter("user_profile");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			String password = request.getParameter("password");
			String registration_date = request.getParameter("registration_date");

			Users user = new Users(id, name,phone,email,address,profile,password,registration_date);
			user.setId(id);
			user.setUsername(name);
			user.setPhone(phone);
			user.setEmail(email);
			user.setAddress(address);
			user.setProfile(profile);
			user.setPassword(password);
			user.setRegistration_date(registration_date);
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			boolean f =dao.updateUser(user);
			if (f) {				
				response.sendRedirect("USER/index.jsp");
			}else {
				response.sendRedirect("USER/index.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
