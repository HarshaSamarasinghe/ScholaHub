<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Student</title>
<!-- Boxicons -->
<link href='https://unpkg.com/boxicons@2.0.9/css/boxicons.min.css' rel='stylesheet'>

<!-- Custom CSS -->
<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #e9ecef;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 150vh;
    }

    .form-container {
        background-color: #ffffff;
        padding: 40px;
        border-radius: 12px;
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        width: 400px;
        text-align: left;
    }

    .form-container h2 {
        margin-bottom: 25px;
        color: #333;
        font-size: 24px;
        text-align: center;
    }

    .form-container input[type="text"],
    .form-container input[type="number"] {
        width: 100%;
        padding: 12px;
        margin-bottom: 20px;
        border: 1px solid #ccc;
        border-radius: 6px;
        font-size: 16px;
        transition: border-color 0.3s;
        box-sizing: border-box;
    }

    .form-container input[type="text"]:focus,
    .form-container input[type="number"]:focus {
        border-color: #007bff;
        outline: none;
    }

    .form-container input[type="submit"] {
        background-color: #007bff;
        color: #fff;
        padding: 12px 20px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        font-size: 16px;
        transition: background-color 0.3s;
        width: 100%;
    }

    .form-container input[type="submit"]:hover {
        background-color: #0056b3;
    }
</style>

<script>
    function validateForm(event) {
        const inputs = document.querySelectorAll('.form-container input[type="text"], .form-container input[type="number"]');
        for (let input of inputs) {
            if (input.value.trim() === '') {
                alert('Please fill out all fields.');
                input.focus();
                event.preventDefault();
                return false;
            }
        }
        return true;
    }
</script>

</head>
<body>

<div class="form-container">
    <h2>Add Student</h2>
    <form action="../addStudent" method="post" onsubmit="return validateForm(event)">
        <input type="text" name="studentname" placeholder="Student Name" /><br />
        <input type="text" name="studentid" placeholder="Student ID" /><br />
        <input type="text" name="examname" placeholder="Exam Name" /><br />
        <input type="text" name="subjectname1" placeholder="Subject 1" /><br />
        <input type="number" name="subjectmarks1" placeholder="Marks 1" /><br />
        <input type="text" name="subjectname2" placeholder="Subject 2" /><br />
        <input type="number" name="subjectmarks2" placeholder="Marks 2" /><br />
        <input type="text" name="subjectname3" placeholder="Subject 3" /><br />
        <input type="number" name="subjectmarks3" placeholder="Marks 3" /><br />
        <input type="submit" value="Add Student" />
    </form>
</div>

</body>
</html>