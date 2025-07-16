<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Update</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f9;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 150vh;
    }

    form {
        background-color: #ffffff;
        padding: 40px;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        width: 400px;
    }

    input[type="text"], input[type="number"], input[type="submit"] {
        width: 100%;
        padding: 10px;
        margin: 10px 0;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-sizing: border-box;
    }

    input[type="submit"] {
        background-color: #3498db;
        color: #ffffff;
        border: none;
        cursor: pointer;
        transition: background-color 0.3s, transform 0.3s;
    }

    input[type="submit"]:hover {
        background-color: #2980b9;
        transform: scale(1.05);
    }

    input[type="submit"]:active {
        transform: scale(1);
    }

    h1 {
        text-align: center;
        color: #333;
    }
</style>
</head>
<body>
<form action="../updateStudent" method="post">
    <h1>Update Student Info</h1>
    Student ID: <input type="text" name="studentid" required/><br />
    Student Name: <input type="text" name="studentname" /><br />
    Exam Name: <input type="text" name="examname" /><br />
    Subject 1: <input type="text" name="subjectname1" /><br />
    Marks 1: <input type="number" name="subjectmarks1" /><br />
    Subject 2: <input type="text" name="subjectname2" /><br />
    Marks 2: <input type="number" name="subjectmarks2" /><br />
    Subject 3: <input type="text" name="subjectname3" /><br />
    Marks 3: <input type="number" name="subjectmarks3" /><br />
    <input type="submit" value="Update Student" />
    <div id="snackbar"></div>
</form>
</body>
</html>