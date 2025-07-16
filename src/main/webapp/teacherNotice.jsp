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
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
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
        .btn {
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-weight: 500;
            transition: background-color 0.3s;
        }
        .btn-primary {
            background-color: #007bff;
            color: white;
        }
        .btn-primary:hover {
            background-color: #0056b3;
        }
        .btn-danger {
            background-color: #dc3545;
            color: white;
        }
        .btn-danger:hover {
            background-color: #c82333;
        }
        .actions {
            display: flex;
            justify-content: center;
            gap: 10px; /* Space between buttons */
        }
    </style>
</head>
<body>
    <!-- SIDEBAR -->

	<section id="sidebar">
		<a href="#" class="logo">
			<span class="icon"><i class='bx bxs-smile'></i></span>
			<span class="text">ScholaHub</span>
		</a>
		<ul class="side-menu">
			<li">
				<a href="<%=request.getContextPath() %>/Teacher/teacherDashboard.jsp">
					<span class="icon"><i class='bx bxs-dashboard' ></i></span>
					<span class="text">Dashboard</span>
				</a>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
			<li>
				<a href="<%=request.getContextPath() %>/Teacher/teacherAssignments.jsp">
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
			<li class="active">
				<a href="TeacherNoticeServlet">
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
                            <a href="<%=request.getContextPath() %>/Teacher/teacherDashboard.jsp">Dashboard</a>
                        </li>
                        <li class="arrow-icon"><i class='bx bx-chevron-right'></i></li>
                        <li>
                            <a href="<%=request.getContextPath() %>/Teacher/teacherNotice.jsp" class="active">Notice</a>
                        </li>
                    </ul>
                </div>
                <a href="<%=request.getContextPath() %>/Teacher/teacherSetting.jsp" class="btn-download">
                    <span class="icon"><i class='bx bxs-user'></i></span>
                    <span class="text">My Profile</span>
                </a>
            </div>
            <div class="box-info">
                <div style="max-width:450px;" class="box">
                    <span class="icon"><i class='bx bxs-calendar-check'></i></span>
                    <div class="text">
                        <a href="<%=request.getContextPath() %>/addNotice.jsp" class="active">
                            <h3>Add Notice</h3>
                        </a>
                        <p>Add a new notice</p>
                    </div>
                </div>
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
                                <th style="text-align: center;">Actions</th>
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
                    <td><%= notice.getnDescription() %></td>
                    <td><%= notice.getnDate() %></td>
                    <td><%= notice.getnBatch() %></td>
                    <td class="actions">
                        <a href="UpdateNoticeServlet?NoticeID=<%= notice.getNoticeID() %>" class="btn btn-primary">Update</a>
                        <a href="#" onclick="confirmDelete(<%= notice.getNoticeID() %>)" class="btn btn-danger">Delete</a>
                    </td>
                </tr>
                <% } %>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>
    </section>

    <script>
    function confirmDelete(NoticeID) {
        if (confirm("Are you sure you want to delete this Notice?")) {
            // Prevent default link action
            event.preventDefault();

            // AJAX request to delete the notice
            var xhr = new XMLHttpRequest();
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        // Redirect after successful deletion
                        window.location.href = "TeacherNoticeServlet";
                    } else {
                        // Handle error
                        alert("Failed to delete notice");
                    }
                }
            };
            // FIX: Correct the query parameter name
            xhr.open("GET", "DeleteNoticeServlet?NoticeID=" + NoticeID, true);
            xhr.send();
        }
    }

</script>
</body>
</html>
