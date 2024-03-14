package com.DAO;

import java.util.List;

import com.Entity.Loans;

public interface LoansDAO {
	public boolean addLoan(Loans tran);
	public List<Loans> getBorrowBook();
	public List<Loans> getBorrowBookById(String id);
	public boolean returnTran(String id, String return_date);
}
