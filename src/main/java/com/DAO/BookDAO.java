package com.DAO;

import java.sql.SQLException;
import java.util.List;

import com.Entity.*;

public interface BookDAO {
	public boolean addBooks(Books book);
	
	public List<Books> getAllBooks();

	public Books getBookById(int id);
	
	public boolean updateEditBooks(Books book) throws SQLException;
	
	public boolean deleteBooks(int id);
	
	public List<BookCategories> getAllCategories();
}
