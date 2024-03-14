package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Entity.Loans;

public class LoansDAOImpl implements LoansDAO {

	private Connection conn;
	
	public LoansDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean addLoan(Loans tran) {
		boolean f = false;
		try {
			String sql = "INSERT INTO `book_loan`(`loan_id`, `user_id`, `book_id`, `loan_date`, `due_date`, `return_date`) VALUES (?,?,?,?,?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, tran.getLoan_id());
			pst.setString(2, tran.getUser_id());
			pst.setString(3, tran.getBook_id());
			pst.setString(4, tran.getLoan_date());
			pst.setString(5, tran.getDue_date());
			pst.setString(6, tran.getReturn_date());
			
			int i = pst.executeUpdate();
			if(i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Loans> getBorrowBook() {
		List<Loans> list = new ArrayList<Loans>();
		Loans tran = null;
		try {
			String sql = "select * from book_loan join books ON book_loan.book_id = books.book_id join users ON book_loan.user_id = users.user_id;";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				tran = new Loans(sql, sql, sql, sql, sql, sql);
				tran.setLoan_id(rs.getString(1));
				tran.setUser_id(rs.getString("users.user_name"));
				tran.setBook_id(rs.getString("books.book_name"));
				tran.setLoan_date(rs.getString(4));
				tran.setDue_date(rs.getString(5));
				tran.setReturn_date(rs.getString(6));
				list.add(tran);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public List<Loans> getBorrowBookById(String id) {
		List<Loans> list = new ArrayList<Loans>();
		Loans tran = null;
		try {
			String sql = "select * from book_loan join books ON book_loan.book_id = books.book_id where user_id=?;";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				tran = new Loans(sql, sql, sql, sql, sql, sql);
				tran.setLoan_id(rs.getString(1));
				tran.setUser_id(rs.getString(2));
				tran.setBook_id(rs.getString("books.book_name"));
				tran.setLoan_date(rs.getString(4));
				tran.setDue_date(rs.getString(5));
				tran.setReturn_date(rs.getString(6));
				list.add(tran);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public boolean returnTran(String id, String return_date) {
		boolean f = false;
		try {
			String sql = "update book_loan set return_date=? where loan_id=?;";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, return_date);
			pst.setString(2, id);
			int i = pst.executeUpdate();
			if(i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
}
