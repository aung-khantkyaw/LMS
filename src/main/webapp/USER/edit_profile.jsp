<%@page import="com.DAO.*"%>
<%@page import="java.util.List"%>
<%@page import="com.Entity.*"%>
<%@ include file="LAYOUT/header.jsp"%>


<main class="content">
	<div class="container-fluid p-0 d-flex justify-content-center">
			<form class="form col-6" action="../UserEdit" method="post">
				<p class="title">Edit Profile</p>
				<label> 
					<input class="input d-none" type="text" name="user_id" value="<%=users.getId()%>" required>  
				</label> 
				<label> 
					<input class="input d-none" type="text" name="user_profile" value="<%= users.getProfile()%>" required> 
				</label> 
				<label> 
					<input class="input" type="text" name="name" value="<%= users.getUsername()%>" required>  <span>Username</span>
				</label> 
				<label> 
					<input class="input" type="text" name="phone" value="<%= users.getPhone()%>" required> <span>Phone</span>
				</label> 
				<label> 
					<input class="input" type="email" name="email" value="<%= users.getEmail()%>" required> <span>Email</span>
				</label>
				<label> 
					<input class="input" type="text" name="address" value="<%= users.getAddress()%>" required> <span>Address</span>
				</label> 
				<label> 
					<input class="input d-none" type="password" name="password" value="<%= users.getPassword()%>" required>
				</label> 
				<label> 
					<input class="input d-none" type="text" name="registration_date" value="<%= users.getRegistration_date()%>" required> 
				</label> 
				
				<button class="submit">Submit</button>
				
			</form>
	</div>
</main>

<%@ include file="LAYOUT/footer.jsp"%>