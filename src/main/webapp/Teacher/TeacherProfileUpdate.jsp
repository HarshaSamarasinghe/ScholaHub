<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page import="com.oop.model.Teacher" %>
<%	
	Teacher teacherDetails = (Teacher) session.getAttribute("loggedInTeacher");

%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Boxicons -->
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css'
	rel='stylesheet'>

<!-- My CSS -->
<link rel="stylesheet" href="teacherDashboard.css">

<title>Teacher Profile Update</title>
</head>
<body>
	<!-- SIDEBAR -->

	<section id="sidebar">
		<a href="#" class="logo"> <span class="icon"><i
				class='bx bxs-smile'></i></span> <span class="text">ScholaHub</span>
		</a>
		<ul class="side-menu">
			<li><a href="teacherDashboard.jsp"> <span class="icon"><i
						class='bx bxs-dashboard'></i></span> <span class="text">Dashboard</span>
			</a> <span class="top"></span> <span class="bottom"></span></li>
			<li><a href="<%=request.getContextPath() %>/View"> <span class="icon"><i
						class='bx bxs-shopping-bag-alt'></i></span> <span class="text">Assignments</span>
			</a> <span class="top"></span> <span class="bottom"></span></li>
			<li><a href="<%=request.getContextPath() %>/Teacher/MarksDashboard.jsp"> <span class="icon"><i
						class='bx bxs-bar-chart-alt-2'></i></span> <span class="text">Exam
						& Marks</span>
			</a> <span class="top"></span> <span class="bottom"></span></li>
			<li><a href="TeacherNoticeServlet"> <span class="icon"><i
						class='bx bxs-comment'></i></span> <span class="text">Notice</span>
			</a> <span class="top"></span> <span class="bottom"></span></li>
			<li><a href="#"> <span class="icon"><i
						class='bx bxs-group'></i></span> <span class="text">Student Info</span>
			</a> <span class="top"></span> <span class="bottom"></span></li>
		</ul>

		<ul class="side-menu bottom">
			<li class="active"><a href="teacherSetting.jsp"> <span
					class="icon"><i class='bx bxs-cog'></i></span> <span class="text">My
						Profile</span>
			</a></li>
			<li><a href="#"> <span class="icon"><i
						class='bx bxs-phone'></i></span> <span class="text">Contact Admin</span>
			</a></li>
			<li><a href="<%=request.getContextPath() %>/LogoutServlet" class="logout"> <span class="icon"><i
						class='bx bxs-log-out-circle'></i></span> <span class="text">Logout</span>
			</a></li>
		</ul>
	</section>
	<!-- SIDEBAR -->


	<!-- CONTENT -->
	<section id="content">
		<nav>
			<span class="menu-bar"><i class='bx bx-menu'></i></span> <a href="#"
				class="link-nav">Categories</a> <span class="curve"></span>
		</nav>

		<main>
			<div class="top">
				<div class="left">
					<h1 class="title">Dashboard</h1>
					<ul class="breadcrumb">
						<li><a href="teacherSetting.jsp">My Profile</a></li>
						<li class="arrow-icon"><i class='bx bx-chevron-right'></i></li>
						<li><a href="#" class="active">Home</a></li>
					</ul>
				</div>

			</div>
			<div class="box-info">

				<div class="box">
					<span class="icon"><i class='bx bxs-user'></i></span>
					<div class="text">
						<h3 style="font-size: 44px;">Update Profile</h3>
					</div>
				</div>


			</div>


			<div class="table-data">
				<div class="order">
					<div class="head">

						<form action="../TeacherUpdateProfileServlet" method="post">
						
							<input type="hidden" name="teacherID" value="<%=teacherDetails.getTeacherID()%>" ><br> 
							
							Enter new name: <input type="text" name="teacherName" value="<%= teacherDetails.gettName()%>"><br>
							
							Enter new Email: <input type="email" name="teacherEmail"	value="<%=teacherDetails.gettEmail()%>"><br> 
							
							Enter new Phone Number: <input type="text" name="teacherPhone" value="<%=teacherDetails.gettPhone()%>"><br>
							
							Enter new Address: <input type="text" name="teacherAddress" value="<%=teacherDetails.gettAddress()%>"><br>
							
							Enter new User Name: <input type="text" name="teacherUserName" value="<%=teacherDetails.gettUserName()%>"><br>
							
							Enter new Password: <input type="password" name="teacherPassword" value="<%=teacherDetails.gettPassword()%>"><br>
							<br> <input type="submit" value="Update">
						</form>
					</div>

				</div>
			</div>

		</main>
	</section>


	<!-- CONTENT -->

	<script src="teacherDashboard.js"></script>
</body>
</html>