<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.oop.model.Teacher" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<!-- Boxicons -->
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>

	<!-- My CSS -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/teacherDashboard.css">
	

	<title>Admin Dashboard</title>
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
				<a href="<%=request.getContextPath()%>/Admin/AdminDashboard.jsp">
					<span class="icon"><i class='bx bxs-dashboard' ></i></span>
					<span class="text">Dashboard</span>
				</a>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
			
			<li class="active">
				<a href="<%=request.getContextPath()%>/ViewAllTeacherServlet">
					<span class="icon"><i class='bx bxs-comment' ></i></span>
					<span class="text">Teacher Info</span>
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
			<form action="#">
				<div class="form-input">
					
				</div>
			</form>
			<a href="#" class="notification">
				
			</a>
	
			<span class="curve"></span>
		</nav>

		<main>
			<div class="top">
				<div class="left">
					<h1 class="title">Dashboard</h1>
					<ul class="breadcrumb">
						<li>
							<a href="#">Teacher Info</a>
						</li>
						<li class="arrow-icon"><i class='bx bx-chevron-right'></i></li>
						
					</ul>
				</div>
				<a href="<%=request.getContextPath()%>/Admin/AdminProfile.jsp" class="btn-download">
					<span class="icon"><i class='bx bxs-user' ></i></span>
					<span class="text">Admin Profile</span>
				</a>
			</div>
			
			<div class="box-info">
				<div style="max-width:450px;" class="box">
					<span class="icon"><i class='bx bxs-calendar-check'></i></span>
					<div class="text">
						<a href="<%=request.getContextPath()%>/Admin/AdminTeacherRegister.jsp"  class="active">
							<h3>Add a Teacher</h3></a>
							<p>Add a new Teacher</p>
					</div>
				</div>
				
			</div>

			<div class="table-data">
				<div class="order">
					<div class="head">
						<h3>All Teachers Table</h3>
						<a href="<%=request.getContextPath()%>/ViewAllTeacherServlet"><span><i class='bx bx-filter' ></i></span></a> 
						
					</div>
					<table>
						<thead>
							<tr>
								<th style="text-align: center;">Teacher ID</th>
								<th style="text-align: center;"> Name</th>
								<th style="text-align: center;">User Name</th>
								<th style="text-align: center;">Phone</th>
								
								<th style="text-align: center;">Actions</th>
								
							</tr>
						</thead>
						<tbody>
<%
	List<Teacher> teacherDetails = (List<Teacher>) session.getAttribute("teacherList");
if(teacherDetails !=null){
	for(Teacher data :teacherDetails){
		
%>	
						
							<tr>
								<td style="text-align: center;"><span  class="name"></span><%=data.getTeacherID() %></td>
								<td style="text-align: center;"><%=data.gettName() %></td>
								<td style="text-align: center;"><%=data.gettUserName() %></td>
								<td style="text-align: center;"><%=data.gettPhone() %></td>
							
								<td style="text-align: center;"><a href="<%=request.getContextPath()%>/ViewSingleTeacherServlet?id=<%=data.getTeacherID() %>"><button style="border-radius: 10px;
  background-color: #021960;
  border: none;
  color: #FFFFFF;
  text-align: center;
  font-size: 15px;
  padding: 5px;
  width: 70px;
  transition: all 0.8s;
  cursor: pointer;
  ">View</button></a>
  
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

	<script src="<%=request.getContextPath()%>/JavaScript/teacherDashboard.js"></script>
</body>
</html>