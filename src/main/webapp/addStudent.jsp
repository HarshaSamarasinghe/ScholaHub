<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Boxicons -->
    <link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>
    <!-- My CSS -->
    <link rel="stylesheet" href="teacherDashboard.css">
    <title>Admin Dashboard</title>
</head>
<body>
    <!-- SIDEBAR -->
	<section id="sidebar">
		<a href="#" class="logo">
			<span class="icon"><i class='bx bxs-smile'></i></span>
			<span class="text">Admin</span>
		</a>
		<ul class="side-menu">
			<li class="active">
				<a href="adminDashboard.jsp">
					<span class="icon"><i class='bx bxs-dashboard'></i></span>
					<span class="text">Admin Dashboard</span>
				</a>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
			<li>
				<a href="addStudent.jsp">
					<span class="icon"><i class='bx bxs-shopping-bag-alt'></i></span>
					<span class="text">Add Student</span>
				</a>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
						<li>
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

    <section id="content">
        <nav>
            <span class="menu-bar"><i class='bx bx-menu'></i></span>
            <a href="#" class="link-nav">Categories</a>
            <a href="#" class="notification">
                <span class="icon"><i class='bx bxs-bell'></i></span>
                <span class="num">8</span>
            </a>
        </nav>

        <main>
            <div class="top">
                <h1 class="title">Add Student</h1>
            </div>
            <div class="container">
                <h2>Add Student</h2>
                <form action="<%=request.getContextPath() %>/AddstudentsServlet" method="post" id="employeeForm" onsubmit="return validateForm()">
                    <!-- Employee Name -->
                    <label for="sName">Student Name</label><br>
                    <input type="text" id="sName" name="sName" placeholder="Enter the student's name..." required minlength="2" title="Name should contain only letters and spaces"><br>

                    <!-- Employee Email -->
                    <label for="sEmail">Email</label><br>
                    <input type="text" id="sEmail" name="sEmail" placeholder="Enter the student's email..." required><br>

                    <!-- Employee Phone -->
                    <label for="sPhone">Phone Number</label><br>
                    <input type="text" id="sPhone" name="sPhone" placeholder="Enter the student's phone number..." required pattern="\d{10}" title="Phone number must be 10 digits"><br>

                    <!-- Employee Address -->
                    <label for="sAddress">Address</label><br>
                    <input type="text" id="sAddress" name="sAddress" placeholder="Enter the student's address..." required minlength="5"><br>
					
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
					
                    <!-- Employee Department -->
                    <label for="sUserName">User Name</label><br>
                    <input type="text" id="sUserName" name="sUserName" placeholder="Enter the username..." required><br>

                    <!-- Employee Position -->
                    <label for="sPassword">Password</label><br>
                    <input type="text" id="sPassword" name="sPassword" placeholder="Enter the student's password..." required><br><br>

                    <div>
                        <input type="submit" value="Add Student">
                    </div>
                </form>
            </div>
        </main>
    </section>

    <script>
        // Custom form validation function
        function validateForm() {
            const phone = document.getElementById('phone').value;
            const email = document.getElementById('email').value;

            // Regex for validating email
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(email)) {
                alert('Please enter a valid email address.');
                return false;
            }

            // Check if phone number is exactly 10 digits
            if (phone.length !== 10 || isNaN(phone)) {
                alert('Phone number must be exactly 10 digits.');
                return false;
            }

            return true; // If all validations pass
        }
    </script>

    <script src="teacherDashboard.js"></script>
</body>
</html>

