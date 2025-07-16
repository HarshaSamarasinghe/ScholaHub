<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../CSS/headerFooter.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="../CSS/style.css">
    <title>Administrator Login Page</title>
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
            <li><a href="../Login.jsp">User Login</a></li> 
            <li><a href="AdminLogin.jsp">Admin Login</a></li>
        </ul>
    </nav>

   <section class="containerWrapper">
        <div class="container" id="container">
            
            <div class="form-container sign-in">
                <form action="../AdminLoginServlet" method="post">
                    <h1>Administrator Login</h1><br>
                    
                    <span>Enter your user name & password</span><br>
                    <input type="userName" placeholder="Admin Name" name="adminName">
                    <input type="password" placeholder="Password" name="adminPassword">
                    <a href="#">Forgot Your Password?</a>
                    <button>Log In</button>
                </form>
            </div>
            
            <div class="toggle-container">
                <div class="toggle">
                  
                    <div class="toggle-panel toggle-right">
                        <h1>Welcome, Administrator!</h1>
                        <p>This is the Administrator Page. If you are a User please go to the User Login! </p>
                        <a href="../Login.jsp"><button class="hidden" id="register">User Login</button></a>
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