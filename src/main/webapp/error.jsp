<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Unsuccess</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link your CSS file here -->
    <style>
        /* Add the CSS styles here */
        #snackbar {
            visibility: hidden; /* Hidden by default */
            min-width: 250px; /* Minimum width of the snackbar */
            margin-left: -125px; /* Center the snackbar */
            background-color: red; /* Green background for success */
            color:white; /* White text color */
            text-align: center; /* Centered text */
            border-radius: 2px; /* Rounded corners */
            padding: 16px; /* Some padding */
            position: fixed; /* Sit on top of the screen */
            z-index: 1; /* High z-index to be on top */
            left: 50%; /* Center horizontally */
            bottom: 30px; /* Position from the bottom */
            font-size: 17px; /* Font size */
            transition: visibility 0s, opacity 0.5s linear; /* Transition for visibility and opacity */
            opacity: 0; /* Initially transparent */
        }

        #snackbar.show {
            visibility: visible; /* Make it visible */
            opacity: 1; /* Fully opaque */
        }
    </style>
</head>
<body>


    <div id="snackbar">Error! Your action was not completed.</div>

    <script>
        function showSnackbar() {
            var snackbar = document.getElementById("snackbar");
            snackbar.className = "show"; // Add the "show" class to display the snackbar
            setTimeout(function() { 
                snackbar.className = snackbar.className.replace("show", ""); // After 3 seconds, remove the "show" class
            }, 3000); // Duration for the snackbar to show
        }

        // Call this function whenever you want to show the success message
        showSnackbar();
    </script>
</body>
</html>