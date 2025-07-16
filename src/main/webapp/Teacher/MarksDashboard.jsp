<%@page import="com.oop.Util.CommonDBConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		<!-- Boxicons-->
	<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>

	<!-- My CSS -->
	<link rel="stylesheet" href="<%=request.getContextPath()%>/CSS/teacherDashboard.css">
	<style>

    .flip-card {
        background-color: transparent;
        width: 70%;
        max-width: 900px;
        height: 300px;
        perspective: 1000px;
        margin-left:300px;
    }

    .flip-card-inner {
        position: relative;
        width: 100%;
        height: 100%;
        text-align: center;
        transition: transform 0.6s;
        transform-style: preserve-3d;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
    }

    .flip-card:hover .flip-card-inner {
        transform: rotateY(180deg);
    }

    .flip-card-front, .flip-card-back {
        position: absolute;
        width: 100%;
        height: 100%;
        backface-visibility: hidden;
        border-radius: 10px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        padding: 20px;
        box-sizing: border-box;
    }

    .flip-card-front {
        background-color:lightblue;
        color: white;
    }

    .flip-card-back {
        background-color: #ffffff;
        color: #333;
        transform: rotateY(180deg);
    }

    .flip-card-back .badge {
        background-color: #4CAF50;
        color: white;
        padding: 5px 10px;
        border-radius: 5px;
    }

    h1 {
        margin: 0;
        font-size: 44px;
        color:black;
    }

    .icon-container {
        margin-top: 10px;
    }

    .icon-container i {
        font-size: 20px;
        margin: 0 5px;
        color: white;
    </style>
</head>


<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.oop.Util.CommonDBConnection" %>
<%
   
    Map<String, Object> topStudent = new HashMap<>();

    try {
       
        Connection conn = CommonDBConnection.getConnection();

        CallableStatement cs = null;
        ResultSet rs = null;
        try {
            cs = conn.prepareCall("{call GetTopStudentGPA()}");
            rs = cs.executeQuery();

            if (rs.next()) {
                topStudent.put("name", rs.getString("studentname"));
                topStudent.put("exam", rs.getString("examname"));
                topStudent.put("gpa", rs.getDouble("gpa"));
            }
        } catch (SQLException e) {
            e.printStackTrace(); // This will help to understand the error better
        } finally {
            if (rs != null) rs.close(); // Close the result set
            if (cs != null) cs.close(); // Close the callable statement
        }

        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>
<body>
<script src="<%=request.getContextPath()%>/JavaScript/sidebar.js"></script>
	
<section id="sidebar">
    <a href="<%=request.getContextPath() %>/Teacher/teacherDashboard.jsp" class="logo">
        <span class="icon"><i class='bx bxs-smile'></i></span>
        <span class="text">Teacher View</span>
    </a>
    <ul class="side-menu">
        <li>
            <a href="<%=request.getContextPath() %>/Teacher/teacherDashboard.jsp">
                <span class="icon"><i class='bx bxs-dashboard'></i></span>
                <span class="text">Dashboard</span>
            </a>
            <span class="top"></span>
            <span class="bottom"></span>
        </li>
        <li>
            <a href="<%=request.getContextPath() %>/View">
                <span class="icon"><i class='bx bxs-shopping-bag-alt'></i></span>
                <span class="text">Assignments</span>
            </a>
            <span class="top"></span>
            <span class="bottom"></span>
        </li>
        <li class="active">
            <a href="<%=request.getContextPath() %>/Teacher/MarksDashboard.jsp">
                <span class="icon"><i class='bx bxs-bar-chart-alt-2'></i></span>
                <span class="text">Subjects & Marks</span>
            </a>
            <span class="top"></span>
            <span class="bottom"></span>
        </li>
        <li>
            <a href="#">
                <span class="icon"><i class='bx bxs-comment'></i></span>
                <span class="text">Notice</span>
            </a>
            <span class="top"></span>
            <span class="bottom"></span>
        </li>
        <li>
            <a href="#">
                <span class="icon"><i class='bx bxs-group'></i></span>
                <span class="text">Student Info</span>
            </a>
            <span class="top"></span>
            <span class="bottom"></span>
        </li>
    </ul>

    <ul class="side-menu bottom">
        <li>
            <a href="#">
                <span class="icon"><i class='bx bxs-cog'></i></span>
                <span class="text">Settings</span>
            </a>
        </li>
        <li>
            <a href="#">
                <span class="icon"><i class='bx bxs-phone'></i></span>
                <span class="text">Contact Admin</span>
            </a>
        </li>
        <li>
            <a href="<%=request.getContextPath() %>/LogoutServlet" class="logout">
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
            <div class="form-input">
                <input type="search" placeholder="Search...">
                <button type="submit" class="search-icon"><i class='bx bx-search'></i></button>
            </div>
        </form>
        <a href="#" class="notification">
            <span class="icon"><i class='bx bxs-bell'></i></span>
            <span class="num">8</span>
        </a>
        
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
        </div>
        <div class="box-info">
            <div class="box">
                <span class="icon"><i class='bx bxs-calendar-check'></i></span>
                <div class="text">
                    <a href="<%=request.getContextPath() %>/Teacher/AddStudentMarks.jsp"><h3>Add</h3></a>
                    <p>Add Student Marks</p>
                </div>
            </div>
            <div class="box">
                <span class="icon"><i class='bx bxs-group'></i></span>
                <div class="text">
                    <a href="<%=request.getContextPath() %>/Teacher/DeleteStudentMarks.jsp"><h3>Delete</h3></a>
                    <p>Delete student Marks</p>
                </div>
            </div>
            <div class="box">
                <span class="icon"><i class='bx bxs-user'></i></span>
                <div class="text">
                    <a href="<%=request.getContextPath() %>/Teacher/UpdateStudentMarks.jsp"><h3>Update</h3></a>
                    <p>Update student Marks</p>
                </div>
            </div>
        </div>
    </main>
</section>

<div class="flip-card">
    <div class="flip-card-inner">
        <div class="flip-card-front">
            <h1>Top Student</h1>
            <div class="icon-container">
                <i class='bx bx-search'></i>
                <i class='bx bx-filter'></i>
            </div>
        </div>
        <div class="flip-card-back">
            <div>
                <span class="name" style="font-weight: bold; font-size: 48px;"><%= topStudent.get("name") %></span>
            </div>
            <div style="margin-top: 60px;">
                <strong>Exam:</strong> <%= topStudent.get("exam") %>
            </div>
            <div style="margin-top: 20px;">
                <strong>GPA:</strong> <span class="badge"><%= topStudent.get("gpa") %></span>
            </div>
        </div>
    </div>
</div>


<script src="teacherDashboard.js"></script>
</body>
</html>