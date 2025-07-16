<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

	<title>Teacher Registration Page</title>
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
				<a href="<%=request.getContextPath()%>/Admin/TeacherInfo.jsp">
					<span class="icon"><i class='bx bxs-shopping-bag-alt' ></i></span>
					<span class="text">Teacher Info</span>
				</a>
				<span class="top"></span>
				<span class="bottom"></span>
			</li>
			<li>
				<a href="#">
					<span class="icon"><i class='bx bxs-bar-chart-alt-2' ></i></span>
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
			<span class="curve"></span>
		</nav>

		<main>
			<div class="top">
				<div class="left">
					<h1 class="title">Teacher Registration</h1>
					<ul class="breadcrumb">
						<li>
							<a href="">Dashboard</a>
						</li>
						<li class="arrow-icon"><i class='bx bx-chevron-right'></i></li>
						<li>
							<a href="<%=request.getContextPath()%>/ViewAllTeacherServlet" class="active">Teacher Info</a>
						</li>
                        <li class="arrow-icon"><i class='bx bx-chevron-right'></i></li>
						<li>
							<a href="<%=request.getContextPath()%>/Admin/AdminTeacherRegister.jsp" class="active"> Add a Teacher</a>
						</li>
					</ul>
				</div>
				<a href="<%=request.getContextPath()%>/Admin/AdminProfile.jsp" class="btn-download">
					<span class="icon"><i class='bx bxs-user' ></i></span>
					<span class="text">Admin Profile</span>
				</a>
			</div>
			

         <div class="container">
           <form action="../TeacherRegisterServlet" class="formClass" method="post" onsubmit="return validateForm()">
                         
              <label for="text">Full Name</label><br>
              <input type="text" id="teacherName" name="teacherName" placeholder="Enter Teacher Name..." required minlength="2" pattern="[A-Za-z\s]+" ><br>
                          
              <label for="text">Email</label><br>
              <input type="text" id="teacherEmail" name="teacherEmail" placeholder="Enter Email..." required><br>
              
							<label for="text">Phone</label><br>
              <input type="text" id="teacherPhone" name="teacherPhone" placeholder="Enter Teacher Phone..." required pattern="\d{10}" title="Phone number must be 10 digits"><br>

							<label for="text">Address</label><br>
              <input type="text" id="teacherAddress" name="teacherAddress" placeholder="Enter Teacher Address..." required><br>

							<label for="text">User Name</label><br>
              <input type="text" id="teacherUserName" name="teacherUserName" placeholder="Type a User Name..." required><br>

							<label for="text">Password</label><br>
              <input type="text" id="teacherPassword" name="teacherPassword" placeholder="Type a Password..." required><br>
                          
                          <div>
                            <input type="submit" value="ADD">

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

	<!-- CONTENT -->

	<script src="<%=request.getContextPath()%>/JavaScript/teacherDashboard.js"></script>
</body>
</html>