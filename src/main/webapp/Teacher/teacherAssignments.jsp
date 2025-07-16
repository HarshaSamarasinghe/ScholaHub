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

	<title>Teacher Dashboard</title>
	
	<script type="text/javascript">
    window.onload = function(){
		var msg = "<c:out value='${Message}'/>";
		if(msg){
			
			alert(msg);// display the Successfull message 
		}
};

    </script>
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
				<a href="#">
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
				<span class="num"></span>
			</a>

			
				<span style="font-size: 17px; font-weight: bold; color: #333; font-family: Arial, sans-serif; width:250px ;padding: 5px 10px;">
				<%=teacherDetails.gettName() %></span>
		
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
							<a href="<%=request.getContextPath() %>/Teacher/teacherAssignments.jsp" class="active">Assignments</a>
						</li>
					</ul>
				</div>
				<a href="<%=request.getContextPath() %>/Teacher/teacherSetting.jsp" class="btn-download">
					<span class="icon"><i class='bx bxs-user' ></i></span>
					<span class="text">My Profile</span>
				</a>
			</div>
			<div class="box-info">
				<div style="max-width:450px;" class="box">
					<span class="icon"><i class='bx bxs-calendar-check'></i></span>
					<div class="text">
						<a href="<%=request.getContextPath() %>/Teacher/addAssignment.jsp"  class="active">
							<h3>Add Assignments</h3></a>
							<p>Add a new Assignment</p>
					</div>
				</div>
				
			</div>

			<div class="table-data">
				<div class="order">
					<div class="head">
						<h3>Assignments Table</h3>
						<a href="<%=request.getContextPath() %>/View"><span><i class='bx bx-filter' ></i></span></a> 
						
					</div>
					<table>
						<thead>
							<tr>
								<!--<th style="text-align: center;">ID</th> -->
								<th style="text-align: center;">Assignment Name</th>
								<th style="text-align: center;">Description</th>
								<th style="text-align: center;">Assigned Date</th>
							
								<th style="text-align: center;">Student Batch</th>
								<th style="text-align: center;">Actions</th>
								
							</tr>
						</thead>
						<tbody>
						<c:forEach var="assign" items="${assignmentDetails}">
							<tr>
								<!-- <td><span style="text-align: center;" class="name"><c:out value="${assign.ASID}"/></span></td>  -->
								<td style="text-align: center;"><c:out value="${assign.ASName}"/></td>
								<td style="text-align: center;"><c:out value="${assign.ASDiscription}"/></td>
								<td style="text-align: center;"><c:out value="${assign.ASAddedDate}"/></td>
						
								<td style="text-align: center;"><c:out value="${assign.ASBatch}"/></td>
								<td style="text-align: center;"><a href="<%=request.getContextPath() %>/EditAssignmentServlet?id=<c:out value='${assign.ASID}'/>"><span class="badge process">Update</span></a>
  
								&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath() %>/DeleteAssignmentServlet?id=<c:out value='${assign.ASID}'/> " ><span class="badge pending">Delete</span></a>
  								&nbsp;&nbsp;&nbsp;<a  href="<%=request.getContextPath() %>/ViewSingleAssignment?id=<c:out value='${assign.ASID}'/> "><span class="badge completed">View</span></a>
								</td>
								
							</tr>
							
							
							<c:url value="updateAssignment.jsp" var="assignmentsUpdate">
					
					<c:param name="ASID" value="${ASID}"/>
					<c:param name="ASName" value="${ASName}"/>
					<c:param name="ASDiscription" value="${ASDiscription}"/>
					<c:param name="ASAddedDate" value="${ASAddedDate}"/>
					<c:param name="ASDueDate" value="${ASDueDate}"/>
					<c:param name="ASBatch" value="${ASBatch}"/>
	
					</c:url>
	
							
						</c:forEach>
							
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