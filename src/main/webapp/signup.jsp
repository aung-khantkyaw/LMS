<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Digital Library</title>
<link rel="stylesheet"
	href="/LibraryManagementSystem/FRAMEWORK/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="/LibraryManagementSystem/FRAMEWORK/bootstrap-icons/bootstrap-icons.css">
<style>
body {
	background-color: #e8e8e8;
}

.custom-file-upload {
  display: inline-block;
  position: relative;
  
}

.custom-file-upload input[type="file"] {
  display: none;
}

.custom-file-upload span {
  display: inline-block;
  padding: 8px 12px;
  width: 100%;
  color: #fff;
  border-radius: 4px;
  cursor: pointer;
}

.custom-file-upload span:hover {
  background-color: #2980b9;
}

/* Style the selected file name */
.file-name {
background-color: #3498db;
  margin-top: 10px;
  color: #333;
}

.form {
  display: flex;
  flex-direction: column;
  gap: 10px;
  max-width: 500px;
  padding: 20px;
  border-radius: 20px;
  position: relative;
  background-color: rgba(17, 24, 39, 1);
  color: #fff;
  border: 1px solid #333;
}

.title {
  font-size: 28px;
  font-weight: 600;
  letter-spacing: -1px;
  position: relative;
  display: flex;
  align-items: center;
  padding-left: 30px;
  color: #00bfff;
}

.title::before {
  width: 18px;
  height: 18px;
}

.title::after {
  width: 18px;
  height: 18px;
  animation: pulse 1s linear infinite;
}

.title::before,
.title::after {
  position: absolute;
  content: "";
  height: 16px;
  width: 16px;
  border-radius: 50%;
  left: 0px;
  background-color: #00bfff;
}
.signin {
  font-size: 14.5px;
  color: rgba(255, 255, 255, 0.7);
}

.signin {
  text-align: center;
}

.signin a:hover {
  text-decoration: underline royalblue;
}

.signin a {
  color: #00bfff;
}


.form label {
  position: relative;
}

.form label .input {
  background-color: #333;
  color: #fff;
  width: 100%;
  padding: 20px 05px 05px 10px;
  outline: 0;
  border: 1px solid rgba(105, 105, 105, 0.397);
  border-radius: 10px;
}

.form label .input + span {
  color: rgba(255, 255, 255, 0.5);
  position: absolute;
  left: 10px;
  top: 0px;
  font-size: 0.9em;
  cursor: text;
  transition: 0.3s ease;
}

.form label .input:placeholder-shown + span {
  top: 12.5px;
  font-size: 0.9em;
}

.form label .input:focus + span,
.form label .input:valid + span {
  color: #00bfff;
  top: 0px;
  font-size: 0.7em;
  font-weight: 600;
}

.input {
  font-size: medium;
}

.submit {
  border: none;
  outline: none;
  padding: 10px;
  border-radius: 10px;
  color: #fff;
  font-size: 16px;
  transform: .3s ease;
  background-color: #00bfff;
}

.submit:hover {
  background-color: #00bfff96;
}

@keyframes pulse {
  from {
    transform: scale(0.9);
    opacity: 1;
  }

  to {
    transform: scale(1.8);
    opacity: 0;
  }
}
</style>
</head>
<body>
	<main class="d-flex w-100">
		<div class="container d-flex justify-content-center mt-5">
			<% 
			HttpSession sessions = request.getSession(false);
			if(session != null) {
			    String succMsg = (String) session.getAttribute("succMsg");
			    String failedMsg = (String) session.getAttribute("failedMsg");
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
			<form class="form col-6" action="SignUp" method="post" enctype="multipart/form-data">
				<p class="title">Register</p>
				<p class="message">Signup now and get full access to our app.</p>

				<label class="custom-file-upload">
				    <input type="file" class="input img" name="photo" required onchange="displayFileName(this)">
				    <span></span>
				    <span id="file-name-placeholder" class="file-name">Select File</span>
				</label>
				<label> 
					<input class="input" type="text" name="name" placeholder="" required>  <span>Username</span>
				</label> 
				<label> 
					<input class="input" type="text" name="phone" placeholder="" required> <span>Phone</span>
				</label> 
				<label> 
					<input class="input" type="email" name="email" placeholder="" required> <span>Email</span>
				</label>
				<label> 
					<input class="input" type="text" name="address" placeholder="" required> <span>Address</span>
				</label> 
				<label> 
					<input class="input" type="password" name="password" placeholder="" required> <span>Password</span>
				</label> 
				
				<button class="submit">Submit</button>
				<p class="signin">
					Already have an acount ? <a href="login.jsp">Signin</a>
				</p>
			</form>
		</div>
	</main>

	<script>
	function displayFileName(input) {
	    var fileName = input.files[0].name;
	    document.getElementById('file-name-placeholder').innerText = fileName;
	}
</script>
	<script
		src="/LibraryManagementSystem/FRAMEWORK/bootstrap/bootstrap.min.js"></script>
	<script
		src="/LibraryManagementSystem/FRAMEWORK/bootstrap-icons/bootstrap-icons.json"></script>
</body>
</html>