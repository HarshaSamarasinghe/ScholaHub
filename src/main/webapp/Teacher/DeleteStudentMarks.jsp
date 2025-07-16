<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Student</title>
<!-- Boxicons -->
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>

<!-- Custom CSS -->
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .form-container {
        background-color: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        width: 300px;
        text-align: center;
    }

    .form-container h2 {
        margin-bottom: 20px;
        color: #333;
    }

    .form-container input[type="text"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 20px;
        border: 1px solid #ddd;
        border-radius: 5px;
    }

    .form-container input[type="submit"] {
        background-color: #007bff;
        color: #fff;
        padding: 10px 15px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .form-container input[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>

<script>
    function confirmDeletion(event) {
        event.preventDefault(); // Prevent form submission
        const confirmation = confirm("Are you sure you want to delete this student?");
        if (confirmation) {
            event.target.submit(); // Submit the form if confirmed
        }
    }
</script>

</head>
<body>

<div class="form-container">
    <h2>Delete Student</h2>
    <form action="../deleteStudent" method="post" onsubmit="confirmDeletion(event)">
        <input type="text" name="studentid" placeholder="Enter Student ID" pattern="\d+" title="Please enter a valid numeric Student ID" required/>

        <input type="submit" value="Delete Student" />
    </form>
</div>

</body>
</html>