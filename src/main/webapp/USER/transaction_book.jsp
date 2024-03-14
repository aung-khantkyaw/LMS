<%@page import="com.DAO.*"%>
<%@page import="java.util.List"%>
<%@page import="com.Entity.*"%>
<%@ include file="LAYOUT/header.jsp"%>
<%
String bookId = request.getParameter("book_id");
BookDAOImpl BookDao = new BookDAOImpl(DBConnect.getConn());
Books book = BookDao.getBookById(bookId);
%>

<main class="content">
	<div class="container-fluid p-0 d-flex justify-content-center ">

		<section class="borrow_form_container">
			<form class="transaction_form" action="../Loan" method="post">
				<div class="d-none">
					<label>Book Id</label> <input value="<%= book.getBookid() %>" type="text" name="book_id">
				</div>
				<div class="d-none">
					<label>User Id</label> <input value="<%= users.getId() %>" type="text" name="user_id">
				</div>
				<div class="input-box">
					<label class="text-white fw-bold">Book Name</label> <input value="<%= book.getBookname() %>" type="text" disabled name="book_name">
				</div>
				<div class="column">
					<div class="input-box">
						<label class="text-white fw-bold">Number of Date</label> <input type="number" name="num_date">
					</div>
					<div class="input-box">
						<label class="text-white fw-bold">Borrow Date</label> <input placeholder="Enter borrow date" type="date" name="borrow_date">
					</div>
				</div>
				<button type="submit">Confirm</button>
			</form>
		</section>

	</div>
</main>

<%@ include file="LAYOUT/footer.jsp"%>