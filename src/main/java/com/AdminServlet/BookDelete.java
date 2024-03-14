package com.AdminServlet;

import java.io.IOException;


import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BookDelete extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String id = req.getParameter("id");
			
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			boolean f = dao.deleteBooks(id);
			if (f) {				
				resp.sendRedirect("ADMIN/all_books.jsp");
			}else {
				resp.sendRedirect("ADMIN/all_books.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	
}
