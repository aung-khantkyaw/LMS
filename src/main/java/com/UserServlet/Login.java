package com.UserServlet;

import java.io.IOException;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.Entity.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

public class Login extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			
			HttpSession session = req.getSession();
			
			String username = req.getParameter("username");
			String password = req.getParameter("password");
			
			if("admin".equals(username) && "admin123".equals(password) ) {
				session.setAttribute("userName", username);
				resp.sendRedirect("ADMIN/index.jsp");	
			}else {
				
				Users user = dao.login(username, password);
				if(user != null) {
					session.setAttribute("userId", user.getId());
					session.setAttribute("userName", user.getUsername());
					resp.sendRedirect("USER/index.jsp");
				}else {
					resp.sendRedirect("login.jsp");
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	

}
