package com.AdminServlet;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.Entity.BookCategories;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class CategoryAdd
 */
public class CategoryAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CategoryAdd() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String cateId = generateCustomId("Cate");
		String cateName = request.getParameter("category");

		BookCategories category = new BookCategories(cateId, cateName);
		BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
		boolean f = dao.addCategory(category);
		if (f) {
			response.sendRedirect("ADMIN/add_book_category.jsp");
		} else {
			response.sendRedirect("ADMIN/add_book_category.jsp");
		}
	}

	private String generateCustomId(String type) {
		try {
			String query = "SELECT id FROM book_categories ORDER BY id DESC LIMIT 1";
			PreparedStatement pst = DBConnect.getConn().prepareStatement(query);
			ResultSet rs = pst.executeQuery();
			String lastCustomId = null;
			if (rs.next()) {
				lastCustomId = rs.getString("id");
			}
			String newCustomId;
			if (lastCustomId != null) {
				String prefix = lastCustomId.substring(0, 5);
				int number = Integer.parseInt(lastCustomId.substring(5));
				String newNumber = String.format("%04d", number + 1);
				newCustomId = prefix + newNumber;
			} else {
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
