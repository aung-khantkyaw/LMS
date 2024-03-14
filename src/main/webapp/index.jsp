<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Digital Library</title>
<link rel="stylesheet" href="USER/app.css">
<link rel="stylesheet"
	href="/LibraryManagementSystem/FRAMEWORK/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="/LibraryManagementSystem/FRAMEWORK/bootstrap-icons/bootstrap-icons.css">
<style>
/*
 * Globals
 */


/* Custom default button */
.btn-secondary,
.btn-secondary:hover,
.btn-secondary:focus {
  color: #000;
  text-shadow: none; /* Prevent inheritance from `body` */
}


/*
 * Base structure
 */

body {
  text-shadow: 0 .05rem .1rem rgba(0, 0, 0, .5);
  box-shadow: inset 0 0 5rem rgba(0, 0, 0, .5);
}

.cover-container {
  max-width: 42em;
}


/*
 * Header
 */

.nav-masthead .nav-link {
  padding: .25rem 0;
  font-weight: 700;
  color: rgba(255, 255, 255, .5);
  background-color: transparent;
  border-bottom: .25rem solid transparent;
}

.nav-masthead .nav-link:hover,
.nav-masthead .nav-link:focus {
  border-bottom-color: rgba(255, 255, 255, .25);
}

.nav-masthead .nav-link + .nav-link {
  margin-left: 1rem;
}

.nav-masthead .active {
  color: #fff;
  border-bottom-color: #fff;
}
</style>
</head>
<body class="d-flex h-100 text-center text-white bg-dark">
    
<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
  <header class="mb-auto">
    <div>
      <h3 class="float-md-start mb-0 text-white"><span class="text-warning">Digital </span>Library</h3>
      <nav class="nav nav-masthead justify-content-center float-md-end">
        <a class="nav-link active" aria-current="page" href="#">Home</a>
        <a class="nav-link" href="login.jsp">Sign In</a>
      </nav>
    </div>
  </header>

  <main class="px-3">
    <h1 class="text-white">Library Management System</h1>
    <p class="lead">Welcome to our cutting-edge Digital Library Management System – a revolution in accessing knowledge at your fingertips.</p>
    <p class="lead">
      <a href="signup.jsp" class="btn btn-lg fw-bold border-white bg-white btn-light">Create a new account</a>
    </p>
  </main>

  
  <footer class="mt-auto text-white-50">
    <p>&copy; 2024 Digital Library Management System. All rights reserved.</p>
</footer>
</div>


    

	<script
		src="/LibraryManagementSystem/FRAMEWORK/bootstrap/bootstrap.min.js"></script>
	<script
		src="/LibraryManagementSystem/FRAMEWORK/bootstrap-icons/bootstrap-icons.json"></script>
</body>
</html>