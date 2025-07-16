<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.oop.Util.CommonDBConnection" %>
<%@ page import="com.oop.model.StudentBatch" %>
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
			<li class="active">
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
				<a href="TeacherNoticeServlet">
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
							<a href="#">Dashboard</a>
						</li>
						<li class="arrow-icon"><i class='bx bx-chevron-right'></i></li>
						<li>
							<a href="#" class="active">Home</a>
						</li>
					</ul>
				</div>
				<a href="<%=request.getContextPath() %>/Teacher/teacherSetting.jsp" class="btn-download">
					<span class="icon"><i class='bx bxs-user' ></i></span>
					<span class="text">My Profile</span>
				</a>
			</div>
<% 	

List<StudentBatch> batchDetails = new ArrayList<>();
	try {
			Statement stmt = CommonDBConnection.getConnection().createStatement();
			String sql = "SELECT * FROM batches";
			ResultSet rs = stmt.executeQuery(sql);

			while(rs.next()) {
				
				StudentBatch data = new StudentBatch();
				
				data.setBatchID(rs.getInt(1));
				data.setbName(rs.getString(2));
				data.setbYear(rs.getString(3));
				
				batchDetails.add(data);
				
			}
	
			rs.close();
			stmt.close();
	
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		

%>		
			<div class="table-data">
				<div class="order">
					<div class="head">
						<h3>STUDENT BATCHES</h3>
						
					</div>
					<table>
						<thead>
							<tr>
								<th>Batch ID</th>
								<th>Batch Name</th>
								<th>Batch Year</th>
							</tr>
						</thead>
						<tbody>
						
<%
	
if(batchDetails !=null){
	for(StudentBatch data :batchDetails){
		
%>						
							<tr>
								<td>
									
									<span class="name"><%=data.getBatchID() %></span>
								</td>
								<td><%=data.getbName() %></td>
								<td><span class="badge completed"><%=data.getbYear() %></span></td>
							</tr>
<% 
	}
}

%>
							
						
						</tbody>
					</table>
				</div>
			</div>
			
			<div class="table-data">
				<div class="order">
					<div class="head">
						<h3>MESSAGES AND NOTICES</h3>
						<span><i class='bx bx-filter' ></i></span>
					</div>
					<table>
						<thead>
							<tr>
								<th>User</th>
								<th>Date order</th>
								<th>Status</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>
									
									<span class="name">John Doe</span>
								</td>
								<td>29-10-2021</td>
								<td><span class="badge completed">Completed</span></td>
							</tr>
							<tr>
								<td>
									
									<span class="name">John Doe</span>
								</td>
								<td>29-10-2021</td>
								<td><span class="badge process">Process</span></td>
							</tr>
							<tr>
								<td>
									
									<span class="name">John Doe</span>
								</td>
								<td>29-10-2021</td>
								<td><span class="badge process">Process</span></td>
							</tr>
							<tr>
								<td>
									
									<span class="name">John Doe</span>
								</td>
								<td>29-10-2021</td>
								<td><span class="badge pending">Pending</span></td>
							</tr>
							<tr>
								<td>
									
									<span class="name">John Doe</span>
								</td>
								<td>29-10-2021</td>
								<td><span class="badge completed">Completed</span></td>
							</tr>
							<tr>
								<td>
									
									<span class="name">John Doe</span>
								</td>
								<td>29-10-2021</td>
								<td><span class="badge pending">Pending</span></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

			<!-- 2ND TABLE -->

		</main>
	</section>

	<!-- CONTENT -->

	<script src="teacherDashboard.js"></script>
</body>
</html>