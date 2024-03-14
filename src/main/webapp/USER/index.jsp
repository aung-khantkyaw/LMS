<%@ include file="LAYOUT/header.jsp"%>
<%@page import="java.util.List"%>

<script type="text/javascript">
    var alerted = localStorage.getItem('alerted') || '';
    if (alerted != 'yes') {
    	alert("Hello! Welcome Back <%=users.getUsername()%>");
     localStorage.setItem('alerted','yes');
    }
</script>

<main class="content">
	<div class="container-fluid p-0 ">
		<div class="container emp-profile bg-white shadow p-3 mb-5 rounded">
			<div class="row  mt-4">
				<div class="col-md-4">
					<div class="profile-img">
						<img src="../User_Image/<%=users.getProfile()%>" alt="" />
					</div>
				</div>
				<div class="col-md-6">
					<div class="profile-head">
						<p>
							Registration at - <span class="text-success fw-bold fs-6 mark"><%=users.getRegistration_date()%></span>
						</p>
						<h5>
							<%=users.getUsername()%>
						</h5>

						<h6>
							<i class="align-middle" data-feather="map"></i>
							<%=users.getAddress()%>
							<br> <i class="align-middle" data-feather="mail"></i>
							<%=users.getEmail()%>
							<br>

						</h6>
					</div>
				</div>
				<div class="col-md-2">
					<a href="edit_profile.jsp?id=<%=users.getId()%>"
						class="btn btn-light rounded-pill fw-bold">Edit Profile</a>
				</div>
			</div>
			<div class="card w-100 flex-fill mt-5">
				<div class="card-header">

					<h5 class="card-title mb-0">Borrow Book</h5>
				</div>
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