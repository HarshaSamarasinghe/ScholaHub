<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/headerFooter.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="CSS/IndexStyle.css">
    <title>Home Page</title>
    <script type="text/javascript">
   		if(window.location.search.includes('logout=success')){
   			
   			alert('Logout Successfully!');
   		}
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
    
    <header>
        <div class="hero">
            <h1>Please Welcome to ScholaHub</h1>
            <p>Your Gateway to Quality Education</p>
            <p>Future Today.</p>
            <a href="#about" class="btn">Learn More</a>
        </div>
        
    </header>

    
    <!--footer-->

    
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