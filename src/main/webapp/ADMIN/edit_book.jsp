<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="com.DAO.*"%>
<%@page import="java.util.List"%>
<%@page import="com.Entity.*"%>
<%@ include file="LAYOUT/header.jsp"%>

<%
String bookId = request.getParameter("id");
BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
Books book = dao.getBookById(bookId);
%>
<main class="content ">
	<div class="container-fluid p-0 ">
		<div class="row d-flex align-items-center justify-content-center">
			<div class="col-6">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<h5 class="text-primary">Book Edit</h5>
						</div>

						<form action="../BookEdit" method="POST" class="form">
							<label class="d-none"> <input class="input" type="text"
								name="bookid" value="<%=book.getBookid()%>"> <span
								class="px-3 lead">Book Name</span>
							</label>
							<div class="row">
								<label class="col-6"> <input class="input" type="text"
									name="bookname" value="<%=book.getBookname()%>"> <span
									class="px-3 lead">Book Name</span>
								</label> <label class="col-6"> <input class="input" type="text"
									name="edition" value="<%=book.getEdition()%>"> <span
									class="px-3 lead">Edition</span>
								</label>
							</div>

							<div class="row">
								<label class="col-6"> <input class="input" type="text"
									name="author" value="<%=book.getAuthor()%>"> <span
									class="px-3 lead">Author</span>
								</label> <label class="col-6"> <input class="input" type="text"
									name="publisher" value="<%=book.getPublisher()%>"> <span
									class="px-3 lead">Publisher</span>
								</label>
							</div>

							<label> <select class="input" name="categories">
									<option value="<%=book.getCategories()%>"><%=book.getCategories()%></option>
									<%
									List<BookCategories> categories = dao.getAllCategories();
									for (BookCategories category : categories) {
									%>
									<option value="<%=category.getCatId()%>"><%=category.getCatName()%></option>
									<%
									}
									%>
							</select>
							</label> <label class="d-none"> <input class="input" type="text"
								name="bimg" value="<%=book.getCover()%>"> <span
								class="px-3 lead">Book Cover</span>
							</label> <label> <textarea class="input01" name="detail" rows="2"
									required><%=book.getDetail()%></textarea> <span>Detail</span>
							</label>

							<button type="submit" class="fancy">
								<span class="top-key"></span> <span class="text fs-6 fw-bold">EDIT</span>
								<span class="bottom-key-1"></span> <span class="bottom-key-2"></span>
							</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<%@ include file="LAYOUT/footer.jsp"%>