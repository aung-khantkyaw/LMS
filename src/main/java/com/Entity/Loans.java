package com.Entity;

public class Loans {
	public String getLoan_id() {
		return loan_id;
	}
	public void setLoan_id(String loan_id) {
		this.loan_id = loan_id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getBook_id() {
		return book_id;
	}
	public void setBook_id(String book_id) {
		this.book_id = book_id;
	}
	public String getLoan_date() {
		return loan_date;
	}
	public void setLoan_date(String loan_date) {
		this.loan_date = loan_date;
	}
	public String getDue_date() {
		return due_date;
	}
	public void setDue_date(String due_date) {
		this.due_date = due_date;
	}
	public String getReturn_date() {
		return return_date;
	}
	public void setReturn_date(String return_date) {
		this.return_date = return_date;
	}
	
	@Override
	public String toString() {
		return "loan [loan_id=" + loan_id + ", user_id=" + user_id + ", book_id=" + book_id
				+ ", loan_date=" + loan_date + ", due_date=" + due_date + ", return_date=" + return_date
				+ "]";
	}

	public Loans(String loan_id, String user_id, String book_id, String loan_date, String due_date,
			String return_date) {
		super();
		this.loan_id = loan_id;
		this.user_id = user_id;
		this.book_id = book_id;
		this.loan_date = loan_date;
		this.due_date = due_date;
		this.return_date = return_date;
	}

	private String loan_id;
	private String user_id;
	private String book_id;
	private String loan_date;
	private String due_date;
	private String return_date;
	
}
