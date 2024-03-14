<%@page import="java.sql.Connection"%>
<%@page import="com.DB.*"%>
<%@page import="com.DAO.*"%>
<%@page import="com.Entity.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Digital</title>
<link rel="stylesheet" href="app.css">
<link rel="stylesheet"
	href="/LibraryManagementSystem/FRAMEWORK/bootstrap/bootstrap.min.css">
<link rel="stylesheet"
	href="/LibraryManagementSystem/FRAMEWORK/bootstrap-icons/bootstrap-icons.css">

<link rel="stylesheet" href="custom.css">
<script
	src="/LibraryManagementSystem/FRAMEWORK/bootstrap/bootstrap.min.js"></script>
<script
	src="/LibraryManagementSystem/FRAMEWORK/bootstrap-icons/bootstrap-icons.json"></script>

</head>
<body>
		<div class="wrapper">
		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand text-decoration-none" href="index.html">
					<span class="align-middle"><span class="text-warning">Digital </span>
						Library</span>
				</a>

				<ul class="sidebar-nav">
					<li class="sidebar-item" id="index.jsp">
						<a class="sidebar-link" href="index.jsp"> 
							<i class="align-middle" data-feather="sliders"></i> 
							<span class="align-middle">Dashboard</span>
						</a>
					</li>
					
					<li class="sidebar-header fw-bold fs-6">Books</li>

					<li class="sidebar-item" id="add_book.jsp">
						<a class="sidebar-link" href="add_book.jsp"> 
							<i class="align-middle" data-feather="file-plus"></i> 
							<span class="align-middle">Add Book</span>
						</a>
					</li>
					
					<li class="sidebar-item" id="add_book_category.jsp">
						<a class="sidebar-link" href="add_book_category.jsp"> 
							<i class="align-middle" data-feather="book"></i> 
							<span class="align-middle">Add Book Category</span>
						</a>
					</li>

					<li class="sidebar-item" id="all_books.jsp">
						<a class="sidebar-link" href="all_books.jsp"> 
							<i class="align-middle" data-feather="list"></i> 
							<span class="align-middle">All Book</span>
						</a>
					</li>
					
					<li class="sidebar-header fw-bold fs-6">Users</li>

					<li class="sidebar-item" id="all_users.jsp">
						<a class="sidebar-link" href="all_users.jsp"> 
							<i class="align-middle" data-feather="users"></i> 
							<span class="align-middle">All Users</span>
						</a>
					</li>

					<li class="sidebar-item" id="borrower.jsp">
						<a class="sidebar-link" href="borrower.jsp"> 
							<i class="align-middle" data-feather="user"></i> 
							<span class="align-middle">Borrowers</span>
						</a>
					</li>		
				</ul>
			</div>
		</nav>
		<div class="main">
			<nav class="navbar navbar-expand navbar-light navbar-bg">
				<a class="sidebar-toggle js-sidebar-toggle"> <i
					class="hamburger align-self-center"></i>
				</a>

				<div class="navbar-collapse collapse">
					<ul class="navbar-nav navbar-align">

						<li class="nav-item"><a
							class="nav-link d-none d-sm-inline-block" href="index.jsp"> <img src="data:image/png;base64,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" class="avatar img-fluid rounded me-1" alt="Charles Hall" /> 
								<span class="text-dark">Admin</span>
						</a></li>
						<li class="nav-item"><a href="../Logout" class="nav-icon">
								<i class="align-middle" data-feather="log-out"></i>
						</a></li>
					</ul>
				</div>
			</nav>