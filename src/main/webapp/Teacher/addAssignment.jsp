<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

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

	<title>Teacher Dashboard</title>
</head>
<body>
    <!-- SIDEBAR -->

	<section id="sidebar">
		<a href="#" class="logo">
			<span class="icon"><i class='bx bxs-smile'></i></span>
			<span class="text">ScholaHub</span>
		</a>
		<ul class="side-menu">
			<li>
				<a href="<%=request.getContextPath() %>/Teacher/teacherDashboard.jsp">
					<span class="icon"><i class='bx bxs-dashboard' ></i></span>
					<span class="text">Dashboard</span>
				</a>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
			<li class="active">
				<a href="<%=request.getContextPath() %>/View">
					<span class="icon"><i class='bx bxs-shopping-bag-alt' ></i></span>
					<span class="text">Assignments</span>
				</a>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
			<li>
				<a href="<%=request.getContextPath() %>/Teacher/MarksDashboard.jsp">
					<span class="icon"><i class='bx bxs-bar-chart-alt-2' ></i></span>
					<span class="text">Exam & Marks</span>
				</a>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
			<li>
				<a href="#">
					<span class="icon"><i class='bx bxs-comment' ></i></span>
					<span class="text">Notice</span>
				</a>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
			<li>
				<a href="#">
					<span class="icon"><i class='bx bxs-group' ></i></span>
					<span class="text">Student Info</span>
				</a>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
		</ul>

		<ul class="side-menu bottom">
			<li >
				<a href="teacherSetting.jsp">
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
				<a href="<%=request.getContextPath() %>/LogoutServlet" class="logout">
					<span class="icon"><i class='bx bxs-log-out-circle' ></i></span>
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
			<a href="#" class="link-nav">Categories</a>
			<form action="#">
				<div class="form-input">
					
				</div>
			</form>
			<a href="#" class="notification">
				<span class="icon"><i class='bx bxs-bell' ></i></span>
				<span class="num">8</span>
			</a>

			
				<span style="font-size: 17px; font-weight: bold; color: #333; font-family: Arial, sans-serif; width:250px ;padding: 5px 10px;">
				<%=teacherDetails.gettName() %></span>
		
			<span class="curve"></span>
		</nav>

		<main>
			<div class="top">
				<div class="left">
					<h1 class="title">Add Assignments</h1>
					<ul class="breadcrumb">
						<li>
							<a href="">Dashboard</a>
						</li>
						<li class="arrow-icon"><i class='bx bx-chevron-right'></i></li>
						<li>
							<a href="teacherAssignments.jsp" class="active">Assignments</a>
						</li>
                        <li class="arrow-icon"><i class='bx bx-chevron-right'></i></li>
						<li>
							<a href="addAssignment.jsp" class="active">Add Assignments</a>
						</li>
					</ul>
				</div>
				<a href="teacherSetting.jsp" class="btn-download">
					<span class="icon"><i class='bx bxs-user' ></i></span>
					<span class="text">My Profile</span>
				</a>
			</div>
			

                    <div class="container">
                        <form action="../upload" class="formClass" method="post" enctype="multipart/form-data">
                         
                          <label for="AS_Name">Assignment Name</label><br>
                          <input type="text" id="AS_Name" name="AS_Name" placeholder="Enter the Assignment Name..."><br>
                          
                          <label for="AS_Discription">Assignment Description</label><br>
                          <input type="text" id="AS_Name" name="AS_Discription" placeholder="Enter the Assignment Description..."><br>
                          
                          <label for="Date">Added Date</label><br>
                          <input type="date" id="AS_addDate" name="AS_addDate" placeholder="Today is..."><br>
                          
                          <label for="AS_dueDate">Due Date</label><br>
                          <input type="date" id="AS_dueDate" name="AS_dueDate" placeholder="Assignment Due Date..."><br>
                      
                          <label for="studentBatch">Select the Batch</label><br>
                          <select id="studentBatch" name="studentBatch">
                            <option value="1">1-1</option>
                            <option value="2">1-2</option>
                            <option value="3">2-1</option>
                            <option value="4">2-2</option>
                            <option value="5">3-1</option>
                            <option value="6">3-2</option>
                            <option value="7">4-1</option>
                            <option value="8">4-2</option>
                          </select><br><br>
                          
                          <label for="file">Upload the File as pdf</label><br>
                          <input type="file" id="file" name="file" accept="application/pdf" required><br><br><br>
                          
                          <div>
                            <input type="submit" value="ADD">

                          </div>
                          
                        </form>
                      </div>
                    
				
			
		</main>
	</section>

	<!-- CONTENT -->

	<script src="teacherDashboard.js"></script>
</body>
</html>