<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.Entity.*"%>
<%@ include file="LAYOUT/header.jsp"%>

<main class="content">
	<div class="container-fluid p-0 ">
		<div class="col-12 d-flex">
			<div class="card flex-fill">
				
				<table class="table table-hover my-0">
					<thead>
						<tr>
							<th scope="col">Id</th>
							<th scope="col">Image</th>
							<th scope="col">Book Name</th>
							<th scope="col">Author</th>
							<th scope="col">Publisher</th>
							<th scope="col">Edition</th>
							<th scope="col">Categories</th>
							<th scope="col">Detail</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<%
						BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
						List<Books> list = dao.getAllBooks();
						for (Books book : list) {
						%>
						<tr>
							<td><%=book.getBookid()%></td>
							<td><img alt="" src="../Book_Image/<%=book.getCover()%>"
								style="width: 50px; height: 50px;"></td>
							<td><%=book.getBookname()%></td>
							<td><%=book.getAuthor()%></td>
							<td><%=book.getPublisher()%></td>
							<td><%=book.getEdition()%></td>
							<td><%=book.getCategories()%></td>
							<td><%=book.getDetail()%></td>
							<td>
								<a href="edit_book.jsp?id=<%=book.getBookid()%>" class="btn btn-sm btn-primary">
									<i class="align-middle" data-feather="edit"></i> <span class="align-middle fw-bold">Edit</span>
								</a> 
								<a href="../BookDelete?id=<%=book.getBookid()%>" class="btn btn-sm btn-danger">
									<i class="align-middle" data-feather="delete"></i> <span class="align-middle fw-bold">Delete</span>
								</a>
							</td> 
						</tr>
						<%
						}
						%>


					</tbody>
				</table>
			</div>
		</div>
	</div>
</main>


<%@ include file="LAYOUT/footer.jsp"%>