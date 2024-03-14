<%@page import="com.DAO.*"%>
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
							<th scope="col">Borrow Id</th>
							<th scope="col">Book Name</th>
							<th scope="col">Borrow Date</th>
							<th scope="col">Due Date</th>
							<th scope="col">Return Date</th>
						</tr>
					</thead>
					<tbody>
						<%
						LoansDAOImpl loandao = new LoansDAOImpl(DBConnect.getConn());
						List<Loans> list = loandao.getBorrowBookById(id);
						for (Loans tran : list) {
						String date = tran.getReturn_date();
						%>
						<tr>
							<td><%= tran.getLoan_id() %></td>
							<td><%= tran.getBook_id() %></td>
							<td><%= tran.getLoan_date() %></td>
							<td><%= tran.getDue_date() %></td>
							<% if(date == null){ %>
								<td><span class="badge bg-warning">In progress</span></td>
							<%}else{ %>
								<td><span class="badge bg-success">Done</span></td>
							<%} %>
							
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