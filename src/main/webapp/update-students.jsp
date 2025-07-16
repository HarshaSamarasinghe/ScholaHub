<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ page import="com.oop.model.Student" %>
<%    
   Student studentDetails = (Student) session.getAttribute("loggedInStudent");
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
    
	<title>Update Student</title>
</head>
<body>
    <!-- SIDEBAR -->
	<section id="sidebar">
		<a href="#" class="logo">
			<span class="icon"><i class='bx bxs-smile'></i></span>
			<span class="text">Student</span>
		</a>
		<ul class="side-menu">
			<li class="active">
				<a href="studentDashboard.jsp">
					<span class="icon"><i class='bx bxs-dashboard'></i></span>
					<span class="text">Student Dashboard</span>
				</a>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
			<li>
				<a href="StudentNoticeServlet">
					<span class="icon"><i class='bx bxs-shopping-bag-alt'></i></span>
					<span class="text">View Notices</span>
				</a>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
			<li>
				<a href="<%=request.getContextPath() %>/studentAssignment.jsp">
					<span class="icon"><i class='bx bxs-shopping-bag-alt'></i></span>
					<span class="text">View Assignment</span>
				</a>
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
			<span class="menu-bar"><i class='bx bx-menu' ></i></span>
			<a href="#" class="notification">
				<span class="icon"><i class='bx bxs-bell' ></i></span>
				<span class="num">5</span>
			</a>
			<span style="font-size: 17px; font-weight: bold; color: #333;">
				<%= studentDetails.getsName() %>
			</span>
		</nav>
		<main>
			<div class="top">
				<div class="left">
					<h1 class="title">Update Student</h1>
					<ul class="breadcrumb">
						<li><a href="teacherDashboard.jsp">Dashboard</a></li>
						<li class="arrow-icon"><i class='bx bx-chevron-right'></i></li>
						<li><a href="teacherNotices.jsp" class="active">Profile</a></li>
						<li class="arrow-icon"><i class='bx bx-chevron-right'></i></li>
						<li><a href="addNotice.jsp" class="active">Update Profile</a></li>
					</ul>
				</div>
				<a href="teacherSetting.jsp" class="btn-download">
					<span class="icon"><i class='bx bxs-user'></i></span>
					<span class="text">My Profile</span>
				</a>
			</div>
			
			<div class="container">
<form action="<%= request.getContextPath() %>/UpdateStudentsServlet" class="formClass" method="post">

    <label for="sName">Student Name</label><br>
    <input type="text" id="sName" name="sName" 
           value="<%= (request.getAttribute("student") != null) ? ((Student)request.getAttribute("student")).getsName() : "" %>" required><br>

    <label for="sEmail">Email</label><br>
    <input type="email" id="sEmail" name="sEmail" 
           value="<%= (request.getAttribute("student") != null) ? ((Student)request.getAttribute("student")).getsEmail() : "" %>" required><br>

    <label for="sPhone">Phone</label><br>
    <input type="text" id="sPhone" name="sPhone" 
           value="<%= (request.getAttribute("student") != null) ? ((Student)request.getAttribute("student")).getsPhone() : "" %>" required><br>
	
	<label for="sPhone">Student Batch</label><br>
    <input type="text" id="sPhone" name="studentBatch" 
           value="<%= (request.getAttribute("student") != null) ? ((Student)request.getAttribute("student")).getsBatch() : "" %>" required><br>
	
	
    <label for="sAddress">Address</label><br>
    <input type="text" id="sAddress" name="sAddress" 
           value="<%= (request.getAttribute("student") != null) ? ((Student)request.getAttribute("student")).getsAddress() : "" %>" required><br>

    <label for="sUserName">Username</label><br>
    <input type="text" id="sUserName" name="sUserName" 
           value="<%= (request.getAttribute("student") != null) ? ((Student)request.getAttribute("student")).getsUserName() : "" %>" required><br>

    <label for="sPassword">Password</label><br>
    <input type="password" id="sPassword" name="sPassword" 
           value="<%= (request.getAttribute("student") != null) ? ((Student)request.getAttribute("student")).getsPassword() : "" %>" required><br>

    <input type="hidden" name="studentID" 
           value="<%= (request.getAttribute("student") != null) ? ((Student)request.getAttribute("student")).getStudentID() : "" %>">

    <div>
        <input type="submit" value="Update">
    </div>
</form>

			</div>
		</main>
	</section>
	<script src="teacherDashboard.js"></script>
</body>
</html>
