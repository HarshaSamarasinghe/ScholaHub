<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
	
    <!-- My CSS -->
    <link rel="stylesheet" href="teacherDashboard.css">
    
	<title>Add Notice</title>
</head>
<body>
    <!-- SIDEBAR -->

	<section id="sidebar">
		<a href="#" class="logo">
			<span class="icon"><i class='bx bxs-smile'></i></span>
			<span class="text">ScholaHub</span>
		</a>
		<ul class="side-menu">
			<li class="active">
				<a href="<%=request.getContextPath() %>/Teacher/teacherDashboard.jsp">
					<span class="icon"><i class='bx bxs-dashboard' ></i></span>
					<span class="text">Dashboard</span>
				</a>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
			<li>
				<a href="<%=request.getContextPath() %>/Teacher/teacherAssignments.jsp">
					<span class="icon"><i class='bx bxs-shopping-bag-alt' ></i></span>
					<span class="text">Assignments</span>
				</a>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
			<li>
				<a href="<%=request.getContextPath() %>/Teacher/#">
					<span class="icon"><i class='bx bxs-bar-chart-alt-2' ></i></span>
					<span class="text">Exam & Marks</span>
				</a>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
			<li>
				<a href="TeacherNoticeServlet">
					<span class="icon"><i class='bx bxs-comment' ></i></span>
					<span class="text">Notice</span>
				</a>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
			<li>
				<a href="<%=request.getContextPath() %>/Teacher/#">
					<span class="icon"><i class='bx bxs-group' ></i></span>
					<span class="text">Student Info</span>
				</a>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
		</ul>

		<ul class="side-menu bottom">
			<li >
			
				<a href="<%=request.getContextPath() %>/Teacher/teacherSetting.jsp">
					<span class="icon"><i class='bx bxs-cog' ></i></span>
					<span class="text">My Profile</span>
				</a>
			</li>
            <li>
				<a href="#">
					<span class="icon"><i class='bx bxs-phone' ></i></span>
					<span class="text">Contact Admin</span>
				</a>
			</li>
			<li>
				<a href="#" class="logout">
					<span class="icon"><i class='bx bxs-log-out-circle' ></i></span>
					<span class="text">Logout</span>
				</a>
			</li>
		</ul>
	</section>
	<!-- CONTENT -->
	<section id="content">
		<nav>
			<span class="menu-bar"><i class='bx bx-menu' ></i></span>
			<a href="#" class="notification">
				<span class="icon"><i class='bx bxs-bell' ></i></span>
				<span class="num">5</span>
			</a>
			<span style="font-size: 17px; font-weight: bold; color: #333;">
				<%= teacherDetails.gettName() %>
			</span>
		</nav>
		<main>
			<div class="top">
				<div class="left">
					<h1 class="title">Add Notice</h1>
					<ul class="breadcrumb">
						<li><a href="teacherDashboard.jsp">Dashboard</a></li>
						<li class="arrow-icon"><i class='bx bx-chevron-right'></i></li>
						<li><a href="teacherNotices.jsp" class="active">Notices</a></li>
						<li class="arrow-icon"><i class='bx bx-chevron-right'></i></li>
						<li><a href="addNotice.jsp" class="active">Add Notice</a></li>
					</ul>
				</div>
				<a href="teacherSetting.jsp" class="btn-download">
					<span class="icon"><i class='bx bxs-user'></i></span>
					<span class="text">My Profile</span>
				</a>
			</div>
			
			<div class="container">
<form action="<%=request.getContextPath() %>/AddNoticesServlet" class="formClass" method="post">

					<label for="nName">Notice Title</label><br>
					<input type="text" id="nName" name="nName" placeholder="Enter the Notice Title..."><br>

					<label for="nDescription">Notice Description</label><br>
					<textarea id="nDescription" name="nDescription" placeholder="Enter the Notice Description..." rows="4"></textarea><br>

					<label for="nDate">Date</label><br>
					<input type="date" id="nDate" name="nDate" placeholder="Select Date..."><br>

					<label for="nBatch">Select the Batch</label><br>
					<select id="nBatch" name="nBatch">
						<option value="1-1">1-1</option>
						<option value="1-2">1-2</option>
						<option value="2-1">2-1</option>
						<option value="2-2">2-2</option>
						<option value="3-1">3-1</option>
						<option value="3-2">3-2</option>
						<option value="4-1">4-1</option>
						<option value="4-2">4-2</option>
					</select><br><br>

					<div>
						<input type="submit" value="ADD">
					</div>
				</form>
			</div>
		</main>
	</section>
	<script src="teacherDashboard.js"></script>
</body>
</html>
