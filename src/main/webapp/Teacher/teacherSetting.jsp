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

	<title>Teacher Profile</title>
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
			<li>
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
				<a href="<%=request.getContextPath() %>/TeacherNoticeServlet">
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
			<li class="active">
			
			
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
					<h1 class="title">Dashboard</h1>
					<ul class="breadcrumb">
						<li>
							<a href="#">My Profile</a>
						</li>
						<li class="arrow-icon"><i class='bx bx-chevron-right'></i></li>
						<li>
							<a href="#" class="active">Home</a>
						</li>
					</ul>
				</div>
				
			</div>
			<div class="box-info">
				
				<div class="box">
					<span class="icon"><i class='bx bxs-user' ></i></span>
					<div class="text">
						<h3 style="font-size: 44px;">My Profile</h3>
					</div>
				</div>
				
				
				</div>
			
			<div class="table-data">
				<div class="order">
					<div class="head">
						
						
					</div>
					<table>
					
					
						
						<tbody>
							
							<tr>
								<td><span class="badge completed">Full Name : </span>
								</td>
								<td>
									<span class="name"><%=teacherDetails.gettName()%></span>
								</td>
							</tr>
							<tr>
								<td><span class="badge completed">Email : </span>
								</td>
								<td>
									<span class="name"><%=teacherDetails.gettEmail()%></span>
								</td>
							</tr>
							<tr>
								<td><span class="badge completed">Phone : </span>
								</td>
								<td>
									<span class="name"><%=teacherDetails.gettPhone()%></span>
								</td>
							</tr>
							<tr>
								<td><span class="badge completed">Address : </span>
								</td>
								<td>
									<span class="name"><%=teacherDetails.gettAddress()%></span>
								</td>
							</tr>

							<tr>
								<td><span class="badge process">User Name :</span></td>
								<td>
									<span class="name"><%=teacherDetails.gettUserName()%></span>
								</td>
								
							</tr>
						
							<tr>
								<td><span class="badge pending">Password :</span></td>
								<td>
									<span class="name"><%=teacherDetails.gettPassword()%></span>
								</td>
							</tr>
							
						</tbody>
						
					</table>
					
				</div>
			</div>
			
			<div class=" updatebtndiv">
			<a href="<%=request.getContextPath() %>/Teacher/TeacherProfileUpdate.jsp"><input type="button" class="updatebtn" name="update" value="Update Profile"></a>
			</div>
			
		</main>
	</section>
	

	

	<!-- CONTENT -->

	<script src="teacherDashboard.js"></script>
</body>
</html>