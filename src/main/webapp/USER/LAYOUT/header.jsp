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

	<%
	String id = (String) session.getAttribute("userId");
	String userName = (String) session.getAttribute("userName");
	UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
	Users users = dao.getUser(id);
	%>

<body>
	<div class="wrapper">
		<nav id="sidebar" class="sidebar js-sidebar">
			<div class="sidebar-content js-simplebar">
				<a class="sidebar-brand text-decoration-none" href="index.html">
					<span class="align-middle"><span class="text-warning">Digital
					</span> Library</span>
				</a>

				<ul class="sidebar-nav">
					<li class="sidebar-item" id="index.jsp"><a
						class="sidebar-link" href="index.jsp"> <i class="align-middle"
							data-feather="sliders"></i> <span class="align-middle">Dashboard</span>
					</a></li>

					<li class="sidebar-header fw-bold fs-6">Books</li>

					<li class="sidebar-item" id="all_books.jsp"><a
						class="sidebar-link" href="all_books.jsp"> <i
							class="align-middle" data-feather="book"></i> <span
							class="align-middle">All Book</span>
					</a></li>

					<li class="sidebar-item" id="borrow_books.jsp"><a
						class="sidebar-link" href="borrow_books.jsp"> <i
							class="align-middle" data-feather="book"></i> <span
							class="align-middle">Borrow Book</span>
					</a></li>

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
							class="nav-link d-none d-sm-inline-block" href="index.jsp"> <img
								src="../User_Image/<%=users.getProfile()%>"
								class="avatar img-fluid rounded me-1" alt="Profile" /> <span
								class="text-dark"><%=users.getUsername()%></span>
						</a></li>
						<li class="nav-item"><a href="../Logout" class="nav-icon" onclick="logout()">
								<i class="align-middle" data-feather="log-out"></i>
						</a></li>
					</ul>
				</div>
			</nav>
			
<script type="text/javascript">
	function logout(){
		localStorage.removeItem('alerted');
	}
</script>