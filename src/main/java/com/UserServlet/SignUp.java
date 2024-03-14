package com.UserServlet;

import java.io.File;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.Entity.Users;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

@MultipartConfig
public class SignUp extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			Date date = Calendar.getInstance().getTime();
			DateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
			formatter = new SimpleDateFormat("dd MMM yyyy");
			
			String user_id = generateCustomId("User");
			String name = req.getParameter("name");
			String phone = req.getParameter("phone");
			String email = req.getParameter("email");
			String address = req.getParameter("address");
			Part part = req.getPart("photo");
			String fileName = part.getSubmittedFileName();
			String password = req.getParameter("password");
			String registration_date = formatter.format(date);
			
			
			Users user = new Users(user_id, name,phone,email,address,fileName,password,registration_date);
			
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
		
			boolean f =dao.userRegister(user);
			HttpSession session = req.getSession();
			if (f) {
				String path = "D:\\04. Thwe\\LibraryManagementSystem\\src\\main\\webapp\\User_Image";
				File file = new File(path);
				part.write(file + File.separator+ fileName);
				session.setAttribute("succMsg","user Register Success...");
				resp.sendRedirect("signup.jsp");
			}else {
				session.setAttribute("failedMsg","Something is Wrong in Server...");
				resp.sendRedirect("signup.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private String generateCustomId(String type) {
		try {
			String query = "SELECT user_id FROM users ORDER BY user_id DESC LIMIT 1";
			PreparedStatement pst = DBConnect.getConn().prepareStatement(query);
			ResultSet rs = pst.executeQuery();
			String lastCustomId = null;
			if(rs.next()) {
				lastCustomId = rs.getString("user_id");
			}
			String newCustomId;
			if(lastCustomId != null) {
				String prefix = lastCustomId.substring(0,5);
				int number = Integer.parseInt(lastCustomId.substring(5));
				String newNumber = String.format("%04d", number + 1);
				newCustomId = prefix + newNumber;
			}else {
				newCustomId = type + "-0001";
			}
			rs.close();
			pst.close();
			DBConnect.getConn().close();
			return newCustomId;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

}
