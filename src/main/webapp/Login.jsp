<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/headerFooter.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="CSS/style.css">
    <title>Student and Teacher Login Page</title>
    <script type="text/javascript">
    window.onload = function(){
		var errorMessage = "<c:out value='${errorMessage}'/>";
		if(errorMessage){
			
			alert(errorMessage);// display the error message 
		}
};
    </script>
</head>

<body>
    <!--header -->
    <nav class="navbar">
        <ul class="nav-left">
            <li><h2>ScholaHub</h2></li>
            <li><a href="#">Home</a></li>
            <li><a href="#">Categories</a></li>
            <li><a href="#">Support</a></li>
            <li><a href="#">About</a></li>
        </ul>

        <ul class="nav-right">
            <li><a href="Login.jsp">User Login</a></li> 
            <li><a href="Admin/AdminLogin.jsp">Admin Login</a></li>
        </ul>
    </nav>

    <section class="containerWrapper">
        <div class="container" id="container">
            <div class="form-container sign-up">
                <form action="login" method="post">
                    <h1>Teacher Login</h1><br>
                    
                    <span>Enter your user name & password</span><br>
                    <input type="userName" placeholder="User Name" name="teacherUserName" required>
                    <input type="password" placeholder="Password" name="teacherPassword" required>
                    <p id="error-message" style="color: red; display: none;"></p> 
                    <a href="#">Forgot Your Password?</a>
                    <button type="submit" name="submit" value="login">Log In</button>
                </form>
                
            </div>
            <div class="form-container sign-in">
                <form action="StudentsLoginServlet" method="post">
                    <h1>Student Login</h1><br>
                    
                    <span>Enter your user name & password</span><br>
                    <input type="userName" placeholder="UserName" name="studentUserName">
                    <input type="password" placeholder="Password" name="studentPassword">
                    <a href="#">Forgot Your Password?</a>
                    <button>Log In</button>
                </form>
            </div>
            
            <div class="toggle-container">
                <div class="toggle">
                    <div class="toggle-panel toggle-left">
                        <h1>Welcome, Teacher!</h1>
                        <p>If you are a Student , please Login here.</p>
                        <button class="hidden" id="login">Log In</button>
                    </div>
                    <div class="toggle-panel toggle-right">
                        <h1>Welcome, Student!</h1>
                        <p>If you are a Teacher , please Login here. </p>
                        <button class="hidden" id="register">Log In</button>
                    </div>
                </div>
            </div>
        </div>
        
      
    
          <!--footer-->
    </section>

    
    <footer class="footer">
        <div class="footerContainer">
            <div class="socialIcons">
                <a href=""><i class="fa-brands fa-facebook"></i></a>
                <a href=""><i class="fa-brands fa-instagram"></i></a>
                <a href=""><i class="fa-brands fa-twitter"></i></a>
                <a href=""><i class="fa-brands fa-linkedin-in"></i></a>
                <a href=""><i class="fa-brands fa-youtube"></i></a>
            </div>
            <div class="footerNav">
                <ul>
                    <li><a href="">Home</a></li>
                    <li><a href="">About</a></li>
                    <li><a href="">Contact us</a></li>
                    <li><a href="">Terms of use</a></li>
                </ul>
            </div>
        </div>
        <div class="footerButton">
            <p>Copyright &copy;2024; Designed by <span class="designer">ScholaHub</span></p>
        </div>
    </footer>

    


    <script src="JavaScript/script.js"></script>
</body>

</html>