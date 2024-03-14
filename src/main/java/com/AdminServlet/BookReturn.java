package com.AdminServlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;


import com.DAO.*;
import com.DB.DBConnect;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BookReturn
 */
public class BookReturn extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String id = request.getParameter("id");
			Date date = new Date();  
		    SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");  
		    String return_date = formatter.format(date);  
		    
			LoansDAOImpl dao = new LoansDAOImpl(DBConnect.getConn());
			boolean f = dao.returnTran(id,return_date);
			if (f) {				
				response.sendRedirect("ADMIN/borrower.jsp");
			}else {
				response.sendRedirect("ADMIN/borrower.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
