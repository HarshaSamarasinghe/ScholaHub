<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.util.List" %>
<%@ page import="com.oop.model.Notice" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Boxicons -->
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>

    <!-- My CSS -->
    <link rel="stylesheet" href="teacherDashboard.css">

    <title>Teacher Notice Board</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f4f9;
        }
        .table-data {
            margin-top: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #007bff;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
            </style>
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
				<a href="StudentNoticeServlet">
					<span class="icon"><i class='bx bxs-shopping-bag-alt'></i></span>
					<span class="text">View Notices</span>
				</a>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
			<li>
				<a href="<%=request.getContextPath() %>/Student/StudentViewAssignments.jsp">
					<span class="icon"><i class='bx bxs-shopping-bag-alt'></i></span>
					<span class="text">View Assignment</span>
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
    <!-- CONTENT -->
    <section id="content">
        <nav>
            <span class="menu-bar"><i class='bx bx-menu'></i></span>
            <a href="#" class="link-nav">Categories</a>
            <form action="#">
                <div class="form-input"></div>
            </form>
            <a href="#" class="notification">
                <span class="icon"><i class='bx bxs-bell'></i></span>
                <span class="num">8</span>
            </a>


        </nav>
        <main>
            <div class="top">
                <div class="left">
                    <h1 class="title">Notice Board</h1>
                    <ul class="breadcrumb">
                        <li>
                            <a href="#">Dashboard</a>
                        </li>
                        <li class="arrow-icon"><i class='bx bx-chevron-right'></i></li>
                        <li>
                            <a href="#" class="active">Notice</a>
                        </li>
                    </ul>
                </div>
				<a href="StudentsLoginServlet" class="btn-download">
					<span class="icon"><i class='bx bxs-user'></i></span>
					<span class="text">My Profile</span>
				</a>
            </div>

            <div class="table-data">
                <div class="order">
                    <div class="head">
                        <h3>Notice Table</h3>
                        <a href="<%=request.getContextPath() %>/View"><span><i class='bx bx-filter'></i></span></a>
                    </div>
                    <table>
                        <thead>
                            <tr>
                                <th style="text-align: center;">ID</th>
                                <th style="text-align: center;">Notice Name</th>
                                <th style="text-align: center;">Description</th>
                                <th style="text-align: center;">Date</th>
                                <th style="text-align: center;">Student Batch</th>
                            </tr>
                        </thead>
                        <tbody>
                <% 
                List<Notice> noticeList = (List<Notice>) request.getAttribute("noticeList");
                for (Notice notice : noticeList) {
                %>
                <tr class="animated-row">
                    <td><%= notice.getNoticeID() %></td>
                    <td><%= notice.getnName() %></td>
                    <td><%= notice.getnDate() %></td>
                    <td><%= notice.getnDescription() %></td>
                    <td><%= notice.getnBatch() %></td>
                </tr>
                <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </section>

    <script src="teacherDashboard.js"></script>
</body>
</html>
