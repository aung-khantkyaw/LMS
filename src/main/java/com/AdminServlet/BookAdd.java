package com.AdminServlet;

import java.io.File;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.DAO.*;
import com.DB.DBConnect;
import com.Entity.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@MultipartConfig
public class BookAdd extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String book_id = generateCustomId("Book");
			
			String bookname = req.getParameter("bookname");
			String author = req.getParameter("author");
			String publisher = req.getParameter("publisher");
			String edition = req.getParameter("edition");
			Part part = req.getPart("photo");
			String fileName = part.getSubmittedFileName();
			int qty = 5;
			String categories = req.getParameter("categories");
			String detail = req.getParameter("detail");
			

			Books book = new Books(book_id, bookname, author, publisher, edition, fileName, qty, categories, detail);
			
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			book.toString();
			boolean f =dao.addBooks(book);
			
			if (f) {
				String path = "D:\\04. Thwe\\LibraryManagementSystem\\src\\main\\webapp\\Book_Image";
				File file = new File(path);
				
				part.write(file + File.separator+ fileName);
				
				resp.sendRedirect("ADMIN/all_books.jsp");
			}else {
				resp.sendRedirect("ADMIN/all_books.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private String generateCustomId(String type) {
		try {
			String query = "SELECT book_id FROM books ORDER BY book_id DESC LIMIT 1";
			PreparedStatement pst = DBConnect.getConn().prepareStatement(query);
			ResultSet rs = pst.executeQuery();
			String lastCustomId = null;
			if(rs.next()) {
				lastCustomId = rs.getString("book_id");
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
