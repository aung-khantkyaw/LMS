package com.AdminServlet;

import java.io.IOException;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.Entity.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class BookEdit extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String book_id = req.getParameter("bookid");
			String bookname = req.getParameter("bookname");
			String author = req.getParameter("author");
			String publisher = req.getParameter("publisher");
			String edition = req.getParameter("edition");
			String fileName = req.getParameter("bimg");
			int qty = 5;
			String categories = req.getParameter("categories");
			String detail = req.getParameter("detail");
			
			Books book = new Books(book_id,bookname, author, publisher, edition, fileName, qty, categories, detail);
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			boolean f =dao.updateEditBooks(book);
			
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
