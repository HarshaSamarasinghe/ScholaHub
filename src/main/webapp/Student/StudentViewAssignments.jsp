<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.List" %>
<%@ page import="com.oop.model.Assignments" %>
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
	<link rel="stylesheet" href="<%=request.getContextPath() %>/CSS/teacherDashboard.css">

	<title>Student Dashboard</title>
	
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
				<a href="<%=request.getContextPath() %>/studentDashboard.jsp">
					<span class="icon"><i class='bx bxs-dashboard' ></i></span>
					<span class="text">Dashboard</span>
				</a>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
			<li class="active">
				<a href="<%=request.getContextPath() %>/Student/StudentViewAssignments.jsp">
					<span class="icon"><i class='bx bxs-shopping-bag-alt' ></i></span>
					<span class="text">My Assignments</span>
				</a>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
			<li>
				<a href="#">
					<span class="icon"><i class='bx bxs-bar-chart-alt-2' ></i></span>
					<span class="text">Exams & Marks</span>
				</a>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
			<li>
				<a href="#">
					<span class="icon"><i class='bx bxs-comment' ></i></span>
					<span class="text">My Notices</span>
				</a>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
			
		</ul>

		<ul class="side-menu bottom">
			<li >
				<a href="<%=request.getContextPath() %>/Student/">
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
				<%= studentDetails.getsName() %></span>
		
			<span class="curve"></span>
		</nav>
		<main>
			<div class="top">
				<div class="left">
					<h1 class="title">Assignments</h1>
					<ul class="breadcrumb">
						<li>
							<a href="">Dashboard</a>
						</li>
						<li class="arrow-icon"><i class='bx bx-chevron-right'></i></li>
						<li>
							<a href="<%=request.getContextPath() %>/Student/StudentViewAssignments.jsp" class="active">My Assignments</a>
						</li>
					</ul>
				</div>
				<a href="<%=request.getContextPath() %>/Student/" class="btn-download">
					<span class="icon"><i class='bx bxs-user' ></i></span>
					<span class="text">My Profile</span>
				</a>
			</div>
			
				
			

			<div class="table-data">
				<div class="order">
					<div class="head">
						<h3>My Assignments</h3>
						<a href="<%=request.getContextPath() %>/StudentAssignments?id=<%=studentDetails.getsBatch()%>"><span><i class='bx bx-filter' ></i></span></a> 
						
					</div>
					<table>
						<thead>
							<tr>
								<!--<th style="text-align: center;">ID</th> -->
								<th style="text-align: center;">Assignment</th>
								<th style="text-align: center;">Description</th>
								<th style="text-align: center;">Assigned Date</th>
							
								<th style="text-align: center;">Dead Line</th>
								<th style="text-align: center;">Actions</th>
								
							</tr>
						</thead>
						<tbody>
<%
	List<Assignments> ASDetails = (List<Assignments>)session.getAttribute("assignmentDetails");
		if(ASDetails !=null){
			for(Assignments data :ASDetails){
		
%>	
						
							<tr>
								<!-- <td><span style="text-align: center;" class="name"><c:out value="${assign.ASID}"/></span></td>  -->
								<td style="text-align: center;"><%=data.getASName() %></td>
								<td style="text-align: center;"><%=data.getASDiscription() %></td>
								<td style="text-align: center;"><%=data.getASAddedDate() %></td>
						
								<td style="text-align: center;"><%=data.getASDueDate() %></td>
								<td style="text-align: center;">
  								<a  href="<%=request.getContextPath() %>/ViewStudentSingleAssignment?id=<%=data.getASID() %> "><span class="badge completed">Download</span></a>
								</td>
								
							</tr>
<% 
	}
}

%>
							
						</tbody>
					</table>
				</div>
				
			</div>
		</main>
	</section>

	<!-- CONTENT -->

	<script src="<%=request.getContextPath() %>/JavaScript/teacherDashboard.js"></script>
</body>
</html>