<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Boxicons -->
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
	
	<!-- My CSS -->
	<link rel="stylesheet" href="teacherDashboard.css">

	<title>Admin Dashboard</title>
</head>
<body>
    <!-- SIDEBAR -->
	<section id="sidebar">
		<a href="#" class="logo">
			<span class="icon"><i class='bx bxs-smile'></i></span>
			<span class="text">Admin</span>
		</a>
		<ul class="side-menu">
			<li class="active">
				<a href="#">
					<span class="icon"><i class='bx bxs-dashboard'></i></span>
					<span class="text">Admin Dashboard</span>
				</a>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
			<li>
				<a href="addStudent.jsp">
					<span class="icon"><i class='bx bxs-shopping-bag-alt'></i></span>
					<span class="text">Add Student</span>
				</a>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
						<li>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
		</ul>

		<ul class="side-menu bottom">
		     <li>
				<a href="Login.jsp">
					<span class="icon"><i class='bx bxs-log-out-circle'></i></span>
					<span class="text">Logout</span>
				</a>
			</li>
		</ul>
	</section>
	<!-- SIDEBAR -->

	<!-- CONTENT -->
	<section id="content">
		<nav>
			<span class="menu-bar"><i class='bx bx-menu'></i></span>
			<a href="#" class="link-nav">Categories</a>
			<form action="#">
				<div class="form-input"></div>
			</form>
			<a href="#" class="notification">
				<span class="icon"><i class='bx bxs-bell'></i></span>
				<span class="num">8</span>
			</a>
			<span class="curve"></span>
		</nav>

		<main>
			<div class="top">
				<div class="left">
					<h1 class="title">Dashboard</h1>
					<ul class="breadcrumb">
						<li><a href="#">Dashboard</a></li>
						<li class="arrow-icon"><i class='bx bx-chevron-right'></i></li>
						<li><a href="#" class="active">Home</a></li>
					</ul>
				</div>
				<a href="StudentsLoginServlet" class="btn-download">
					<span class="icon"><i class='bx bxs-user'></i></span>
					<span class="text">My Profile</span>
				</a>
			</div>

			<!-- MESSAGES AND NOTICES TABLE -->
			<div class="table-data">
				<div class="order">
					<div class="head">
						<h3>MESSAGES AND NOTICES</h3>
						<span><i class='bx bx-filter'></i></span>
					</div>
					<table>
						<thead>
							<tr>
								<th>User</th>
								<th>Date</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><span class="name">John Doe</span></td>
								<td>29-10-2021</td>
								<td><span class="badge completed">Completed</span></td>
							</tr>
							<tr>
								<td><span class="name">Jane Smith</span></td>
								<td>30-10-2021</td>
								<td><span class="badge process">In Process</span></td>
							</tr>
							<tr>
								<td><span class="name">Alex Brown</span></td>
								<td>01-11-2021</td>
								<td><span class="badge pending">Pending</span></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</main>
	</section>
	<!-- CONTENT -->

</body>
</html>
