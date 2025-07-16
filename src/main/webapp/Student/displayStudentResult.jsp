<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Result</title>
</head>
<body>
<head>
<meta charset="UTF-8">
<title>Student Results</title>
<link rel="stylesheet" href="<%=request.getContextPath() %>/CSS/retrivestudent.css"> <!-- Linking the external CSS -->
</head>
<body>
    <div class="container">
        <h2><u>Results</u></h2>
        <p><strong>Student Name:</strong> ${student.studentName}</p>
        <p><strong>Exam Name:</strong> ${student.examName}</p>
        <p><strong>${student.subjectName1} </strong> : ${student.subjectMarks1}</p>
        <p><strong> ${student.subjectName2}  </strong>: ${student.subjectMarks2}</p>
        <p><strong>${student.subjectName3} </strong>: ${student.subjectMarks3}</p><br><br>

        <a href="<%=request.getContextPath() %>/studentDashboard.jsp" class="btn">Home</a>
    </div>
</body>
</html>

