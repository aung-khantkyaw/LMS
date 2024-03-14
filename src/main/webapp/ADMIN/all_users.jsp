<%@page import="com.DAO.UserDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.Entity.Users"%>
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
							<th scope="col">Name</th>
							<th scope="col">Phone</th>
							<th scope="col">Email</th>
							<th scope="col">Address</th>
							<th scope="col">Registration Date</th>
							<th scope="col">Action</th>
						</tr>
					</thead>
					<tbody>
						<%
						UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
						List<Users> list = dao.getAllUsers();
						for (Users user : list) {
						%>
						<tr>
							<td><%=user.getId()%></td>
							<td><img alt="" src="../User_Image/<%=user.getProfile()%>" style="width: 50px; height: 50px;"></td>
							<td><%=user.getUsername()%></td>
							<td><%=user.getPhone()%></td>
							<td><%=user.getEmail()%></td>
							<td><%=user.getAddress()%></td>
							<td><%=user.getRegistration_date()%></td>
							<td>
								<a href="../UserDelete?id=<%=user.getId()%>" class="btn btn-sm btn-danger">
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