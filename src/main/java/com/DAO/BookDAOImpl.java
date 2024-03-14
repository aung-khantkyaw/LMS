package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Entity.*;

public class BookDAOImpl implements BookDAO{

	private Connection conn;

	public BookDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}
	
	public boolean addBooks(Books book) {
		boolean f=false;
		try {
			String sql = "INSERT INTO `books` (`book_id`, `book_name`, `book_author`, `book_publisher`, `book_edition`, `book_cover`, `book_qty`, `book_category`, `book_detail`) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, book.getBookid());
			pst.setString(2, book.getBookname());
			pst.setString(3, book.getAuthor());
			pst.setString(4, book.getPublisher());
			pst.setString(5, book.getEdition());
			pst.setString(6, book.getCover());
			pst.setInt(7, book.getQty());
			pst.setString(8, book.getCategories());
			pst.setString(9, book.getDetail());
			
			int i = pst.executeUpdate();
			if(i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean addCategory(BookCategories category) {
		boolean f= false;
		try {
			String sql = "INSERT INTO `book_categories` (`id`, `category`) VALUES (?,?)";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, category.getCatId());
			pst.setString(2, category.getCatName());
			
			int i = pst.executeUpdate();
			if(i == 1) {
				f = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<Books> getAllBooks() {
		List<Books> list = new ArrayList<Books>();
		Books book = null;
		
		try {
			String sql = "SELECT * FROM books JOIN book_categories ON books.book_category = book_categories.id;";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				book = new Books(sql, sql, sql, sql, sql, sql, 0, sql, sql);
				book.setBookid(rs.getString(1));
				book.setBookname(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPublisher(rs.getString(4));
				book.setEdition(rs.getString(5));
				book.setCover(rs.getString(6));
				book.setQty(rs.getInt(7));
				book.setCategories(rs.getString("book_categories.category"));
				book.setDetail(rs.getString(9));
				list.add(book);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public List<BookCategories> getAllCategories(){
		List<BookCategories> list = new ArrayList<BookCategories>();
		BookCategories category = null;
		
		try {
			String sql = "SELECT * FROM book_categories";
			PreparedStatement pst = conn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				category = new BookCategories(sql, sql);
				category.setCatId(rs.getString(1));
				category.setCatName(rs.getNString(2));
				list.add(category);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public Books getBookById(String id) {
		Books book = null;
		try {
			String sql = "SELECT * FROM books WHERE book_id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				book = new Books(sql, sql, sql, sql, sql, sql, 0, sql, sql);
				book.setBookid(rs.getString(1));
				book.setBookname(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPublisher(rs.getString(4));
				book.setEdition(rs.getString(5));
				book.setCover(rs.getString(6));
				book.setQty(rs.getInt(7));
				book.setCategories(rs.getString(8));
				book.setDetail(rs.getString(9));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return book;
	}

	public boolean updateEditBooks(Books book) {
		boolean updateBook = false;
		try {
			String sql = "UPDATE books SET book_name=?,book_author=?,book_publisher=?,book_edition=?,book_cover=?,book_qty=?,book_category=?,book_detail=? WHERE book_id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, book.getBookname());
			pst.setString(2, book.getAuthor());
			pst.setString(3, book.getPublisher());
			pst.setString(4, book.getEdition());
			pst.setString(5, book.getCover());
			pst.setInt(6, book.getQty());
			pst.setString(7, book.getCategories());
			pst.setString(8, book.getDetail());
			pst.setString(9, book.getBookid());
			int i = pst.executeUpdate();
			if(i == 1) {
				updateBook = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return updateBook;
	}
	
	public boolean deleteBooks(String id) {
		boolean f = false;
		try {
			String sql = "DELETE FROM books WHERE book_id=?";
			PreparedStatement pst = conn.prepareStatement(sql);
			pst.setString(1, id);
			int i = pst.executeUpdate();
			if( i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public Books getBookById(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteBooks(int id) {
		// TODO Auto-generated method stub
		return false;
	}

}
