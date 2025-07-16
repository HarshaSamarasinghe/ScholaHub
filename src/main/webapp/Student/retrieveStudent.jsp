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
	<link rel="stylesheet" href="<%=request.getContextPath() %>/CSS/retrivestudent.css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/CSS/teacherDashboard.css">

	<title>Student Dashboard</title>
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
				<a href="<%=request.getContextPath() %>/studentDashboard.jsp">
					<span class="icon"><i class='bx bxs-dashboard'></i></span>
					<span class="text">Student Dashboard</span>
				</a>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
			<li>
				<a href="#">
					<span class="icon"><i class='bx bxs-shopping-bag-alt'></i></span>
					<span class="text">View Notices</span>
				</a>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
			<li>
				<a href="<%=request.getContextPath() %>/Student/StudentViewAssignments.jsp">
					<span class="icon"><i class='bx bxs-shopping-bag-alt'></i></span>
					<span class="text">View Assignments</span>
				</a>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
			<li>
				<a href="<%=request.getContextPath() %>/Student/retrieveStudent.jsp">
					<span class="icon"><i class='bx bxs-shopping-bag-alt'></i></span>
					<span class="text">Exam Results</span>
				</a>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
		</ul>

		<ul class="side-menu bottom">
		     <li>
				<a href="<%=request.getContextPath() %>/LogoutServlet">
					<span class="icon"><i class='bx bxs-log-out-circle'></i></span>
					<span class="text">Logout</span>
				</a>
			</li>
		</ul>
	</section>
	<!-- SIDEBAR -->

    <div class="form-container" >
        <h2>View Results</h2>
      <form id="studentForm" action="<%=request.getContextPath() %>/retrieveStudent" method="post">
    <label for="studentid">Enter Student ID:</label>
    <input type="text" name="studentid" id="studentid" placeholder="student Id"required><br />
    <input type="submit" value="Retrieve Details" />
</form>

<!-- Snackbar element -->
<div id="snackbar"></div>
    </div>


</body>
</html>