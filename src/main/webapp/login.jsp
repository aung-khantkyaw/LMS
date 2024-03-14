<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
.login {
	height: 90vh;
}
.form-container {
  border-radius: 0.75rem;
  background-color: rgba(17, 24, 39, 1);
  padding: 2rem;
  color: rgba(243, 244, 246, 1);
}

.title {
  text-align: center;
  font-size: 1.5rem;
  line-height: 2rem;
  font-weight: 700;
}

.form {
  margin-top: 1.5rem;
}

.input-group {
  margin-top: 0.25rem;
  font-size: 0.875rem;
  line-height: 1.25rem;
}

.input-group label {
  display: block;
  color: rgba(156, 163, 175, 1);
  margin-bottom: 4px;
}

.input-group input {
  width: 100%;
  border-radius: 0.375rem;
  border: 1px solid rgba(55, 65, 81, 1);
  outline: 0;
  background-color: rgba(17, 24, 39, 1);
  padding: 0.75rem 1rem;
  color: rgba(243, 244, 246, 1);
}

.input-group input:focus {
  border-color: rgba(167, 139, 250);
}

.signup a {
  color: rgba(243, 244, 246, 1);
  text-decoration: none;
  font-size: 14px;
}

.signup a:hover {
  text-decoration: underline rgba(167, 139, 250, 1);
}

.sign {
  margin: 10px 0;
  display: block;
  width: 100%;
  background-color: #00bfff;
  padding: 0.75rem;
  text-align: center;
  color: rgba(17, 24, 39, 1);
  border: none;
  border-radius: 0.375rem;
  font-weight: 600;
}

.signup {
  text-align: center;
  font-size: 0.75rem;
  line-height: 1rem;
  color: rgba(156, 163, 175, 1);
}

</style>
</head>
<body>
	<main class="d-flex w-100">
		<div class="container d-flex flex-column">
			<div class="row vh-100">
				<div
					class="col-sm-10 col-md-8 col-lg-6 col-xl-5 mx-auto d-table h-100">
					<div class="d-table-cell align-middle">

						<div class="form-container">
						<div class="text-center mt-4">
							<h1 class="h2 text-white">Welcome back!</h1>
							<p class="lead">Sign in to your account to continue</p>
						</div>
							<form action="Login" method="post" class="form">
								<div class="input-group">
									<label for="username">Username</label> <input type="text"
										name="username" id="username" placeholder="">
								</div>
								<div class="input-group">
									<label for="password">Password</label> <input type="password"
										name="password" id="password" placeholder="">
								</div>
								<button class="sign">Sign in</button>
							</form>
							<p class="signup">
								Don't have an account? <a rel="noopener noreferrer" href="signup.jsp"
									class="">Sign up</a>
							</p>
						</div>

					</div>
				</div>
			</div>
		</div>
	</main>
	<script
		src="/LibraryManagementSystem/FRAMEWORK/bootstrap/bootstrap.min.js"></script>
	<script
		src="/LibraryManagementSystem/FRAMEWORK/bootstrap-icons/bootstrap-icons.json"></script>
</body>
</html>