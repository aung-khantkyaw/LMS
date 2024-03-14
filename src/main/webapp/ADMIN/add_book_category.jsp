<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.Entity.*"%>
<%@ include file="LAYOUT/header.jsp"%>

<main class="content d-flex align-items-center justify-content-center">
	<div class="container-fluid p-0 ">

		<div class="row d-flex justify-content-center">
			<div class="col-6 d-flex">
				<div class="card flex-fill">
					<div class="card-header">
						<h5 class="card-title mb-0">Book Categories</h5>
					</div>
					<table class="table table-hover my-0">
						<thead>
							<tr>
								<th>ID</th>
								<th>Name</th>
							</tr>
						</thead>
						<tbody>
							<%
							BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
							List<BookCategories> categories = dao.getAllCategories();
							for (BookCategories category : categories) {
							%>
							<tr>
								<td><%=category.getCatId()%></td>
								<td><%=category.getCatName()%></td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
					<div class="card-footer d-flex justify-content-center">
						<form action="../CategoryAdd" method="post" class="col-8">
							<div class="input-group">
								<input type="text" class="form-control" name="category"
									placeholder="Enter Book category">
								<div class="input-group-text">
									<button type="submit" class="btn btn-sm btn-primary">Add</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>


<%@ include file="LAYOUT/footer.jsp"%>