package com.UserServlet;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import com.DAO.LoansDAOImpl;
import com.DB.DBConnect;
import com.Entity.Loans;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
/**
 * Servlet implementation class Loans
 */
public class Loan extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		String tran_id = generateCustomId("Loan");
		String user_id = request.getParameter("user_id");
		String book_id = request.getParameter("book_id");
		
		int num_date = Integer.parseInt(request.getParameter("num_date"));
		String inputDate = request.getParameter("borrow_date");
		
		String tran_date = null;
		String due_date = null;
		String return_date = null;

		try {
			SimpleDateFormat inputDateFormat = new SimpleDateFormat("yyyy-MM-dd");
			Date format_date = inputDateFormat.parse(inputDate);

			SimpleDateFormat outputDateFormat = new SimpleDateFormat("dd/MM/yyyy");
			tran_date = outputDateFormat.format(format_date);

			Calendar calendar = Calendar.getInstance();
			calendar.setTime(format_date);
			calendar.add(Calendar.DAY_OF_YEAR, num_date);
			Date nextDate = calendar.getTime();	
			due_date = outputDateFormat.format(nextDate);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		try {
			
			Loans tran = new Loans(tran_id,user_id,book_id,tran_date,due_date,return_date);
			LoansDAOImpl dao = new LoansDAOImpl(DBConnect.getConn());
			boolean f = dao.addLoan(tran);
			if (f) {				
				response.sendRedirect("USER/borrow_books.jsp");
			}else {
				response.sendRedirect("USER/borrow_books.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	private String generateCustomId(String type) {
		try {
			String query = "SELECT loan_id FROM book_loan ORDER BY loan_id DESC LIMIT 1";
			PreparedStatement pst = DBConnect.getConn().prepareStatement(query);
			ResultSet rs = pst.executeQuery();
			String lastCustomId = null;
			if (rs.next()) {
				lastCustomId = rs.getString("loan_id");
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
