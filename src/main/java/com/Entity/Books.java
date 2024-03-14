package com.Entity;

public class Books {
	
	public String getBookid() {
		return bookid;
	}
	public void setBookid(String bookid) {
		this.bookid = bookid;
	}
	public String getBookname() {
		return bookname;
	}
	public void setBookname(String bookname) {
		this.bookname = bookname;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public String getPublisher() {
		return publisher;
	}
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	public String getEdition() {
		return edition;
	}
	public void setEdition(String edition) {
		this.edition = edition;
	}
	public String getCover() {
		return cover;
	}
	public void setCover(String cover) {
		this.cover = cover;
	}
	public int getQty() {
		return qty;
	}
	public void setQty(int qty) {
		this.qty = qty;
	}
	public String getCategories() {
		return categories;
	}
	public void setCategories(String categories) {
		this.categories = categories;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	public Books(String bookid, String bookname, String author, String publisher, String edition, String cover, int qty,
			String categories, String detail) {
		super();
		this.bookid = bookid;
		this.bookname = bookname;
		this.author = author;
		this.publisher = publisher;
		this.edition = edition;
		this.cover = cover;
		this.qty = qty;
		this.categories = categories;
		this.detail = detail;
	}
	@Override
	public String toString() {
		return "Books [bookid=" + bookid + ", bookname=" + bookname + ", author=" + author + ", publisher=" + publisher
				+ ", edition=" + edition + ", cover=" + cover + ", qty=" + qty + ", categories=" + categories
				+ ", detail=" + detail + "]";
	}
	private String bookid;
	private String bookname;
	private String author;
	private String publisher;
	private String edition;
	private String cover;
	private int qty;
	private String categories;
	private String detail;
}

