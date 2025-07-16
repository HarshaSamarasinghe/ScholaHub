<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.oop.model.Admin" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	Admin adminDetails = (Admin) session.getAttribute("loggedInAdmin");
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Boxicons -->
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>

	<!-- My CSS -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/teacherDashboard.css">

	<title>Admin Profile</title>
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

			
				<a href="<%=request.getContextPath()%>/Admin/AdminDashboard.jsp">
					<span class="icon"><i class='bx bxs-dashboard' ></i></span>
					<span class="text">Dashboard</span>
				</a>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
			
			<li>
				<a href="<%=request.getContextPath()%>/ViewAllTeacherServlet">
					<span class="icon"><i class='bx bxs-comment' ></i></span>
					<span class="text">Teacher Info</span>
				</a>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
			<li>
				<a href="<%=request.getContextPath()%>/addStudent.jsp">
					<span class="icon"><i class='bx bxs-group' ></i></span>
					<span class="text">Student Info</span>
				</a>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
		</ul>

		<ul class="side-menu bottom">
			<li class="active">
			
			
				<a href="<%=request.getContextPath()%>/Admin/AdminProfile.jsp">
					<span class="icon"><i class='bx bxs-cog' ></i></span>
					<span class="text">Admin Profile</span>
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
			
			<span class="curve"></span>
		</nav>

		<main>
			<div class="top">
				<div class="left">
					<h1 class="title">Dashboard</h1>
					<ul class="breadcrumb">
						<li>
							<a href="<%=request.getContextPath()%>/Admin/AdminProfile.jsp">Admin Profile</a>
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
						<h3 style="font-size: 38px;">Administrator-->&nbsp;&nbsp;<%=adminDetails.getAdName() %></h3>
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
								<td><span class="badge completed">Name : </span>
								</td>
								<td>
									<span class="name"><%=adminDetails.getAdName() %></span>
								</td>
							</tr>
							<tr>
								<td><span class="badge completed">Email : </span>
								</td>
								<td>
									<span class="name"><%=adminDetails.getAdEmail() %></span>
								</td>
							</tr>
							<tr>
								<td><span class="badge completed">Phone : </span>
								</td>
								<td>
									<span class="name"><%=adminDetails.getAdPhone() %></span>
								</td>
							</tr>
							<tr>
								<td><span class="badge completed">Address : </span>
								</td>
								<td>
									<span class="name"><%=adminDetails.getAdAddress() %></span>
								</td>
							</tr>

							<tr>
								<td><span class="badge process">User Name :</span></td>
								<td>
									<span class="name"><%=adminDetails.getAdUserName() %></span>
								</td>
								
							</tr>
						
							<tr>
								<td><span class="badge pending">Password :</span></td>
								<td>
									<span class="name"><%=adminDetails.getAdPassword() %></span>
								</td>
							</tr>
							
						</tbody>
						
					</table>
	
				</div>
			</div>
		<!--  <div class=" updatebtndiv">
			<a href="<%=request.getContextPath()%>/Admin/AdminProfileUpdate.jsp"><input type="button" class="updatebtn" name="update" value="Update Profile"></a>
	
			<a href="<%=request.getContextPath()%>/Admin/AdminProfileDelete.jsp"><input type="button" class="deletebtn" name="delete" value="Delete Account"></a>
			
			
			</div>  -->	
			
		</main>
	</section>

	<!-- CONTENT -->

	<script src="<%=request.getContextPath()%>/JavaScript/teacherDashboard.js"></script>
</body>
</html>