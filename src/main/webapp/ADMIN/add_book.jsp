<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.Entity.*"%>
<%@ include file="LAYOUT/header.jsp"%>
<% 
			HttpSession sessions = request.getSession(false);
			if(session != null) {
			    String succMsg = (String) session.getAttribute("bookAddsuccMsg");
			    String failedMsg = (String) session.getAttribute("bookAddfailedMsg");
			    if(succMsg != null) {
			%>
			        <script>
				        alert("<%= succMsg %>");
				    </script>
			<%
			    } else if(failedMsg != null) {
			%>
			        <script>
				        alert("<%= failedMsg %>");
				    </script>
			<%
			    } 
			    session.invalidate();
			}
			%>
<main class="content d-flex align-items-center justify-content-center">
	<div class="container-fluid p-0 ">
		<div class="row d-flex align-items-center justify-content-center">
			<div class="col-6">
				<div class="card">
					<div class="card-body">
						<div class="text-center">
							<h5 class="text-primary">New Book Add</h5>
						</div>

						<form  action="../BookAdd" method="post" enctype="multipart/form-data"  class="form">

							<div class="row">
								<label class="col-6"> <input class="input" type="text" name="bookname"
									required> <span class="px-3 lead">Book Name</span>
								</label > 
								<label class="col-6"> <input class="input" type="text" name="edition"
									required> <span class="px-3 lead">Edition</span>
								</label>
							</div>
							
							<div class="row">
								<label class="col-6"> <input class="input" type="text" name="author"
									required> <span class="px-3 lead">Author</span>
								</label > 
								<label class="col-6"> <input class="input" type="text" name="publisher"
									required> <span class="px-3 lead">Publisher</span>
								</label>
							</div>

							<label> 
									<select class="input" name="categories">
										<%
										BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
										List<BookCategories> categories = dao.getAllCategories();
										for (BookCategories category : categories) {
										%>
										<option value="<%=category.getCatId()%>"><%=category.getCatName()%></option>
										<%
										}
										%>
									</select>
							</label> 
							
							<label> 
								<input type="file" class="form-control" name="photo">
							</label>
							
							<label> 
								<textarea class="input01" name="detail" rows="2" required></textarea> <span>Detail</span>
							</label>

							<button type="submit" class="fancy">
								<span class="top-key"></span> <span class="text fs-6 fw-bold">SUBMIT</span> <span
									class="bottom-key-1"></span> <span class="bottom-key-2"></span>
							</button>
						</form>

						
					</div>
				</div>
			</div>
		</div>
	</div>
</main>

<%@ include file="LAYOUT/footer.jsp"%>