package projectf;

import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/updateStudent")
public class UpdateStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Step 1: Get studentId from the request
            String studentIdStr = request.getParameter("studentid");
            
            // Validate the studentId
            if (studentIdStr == null || studentIdStr.isEmpty()) {
                response.sendRedirect("error.jsp"); // Invalid student ID
                return;
            }
            
            int studentId = Integer.parseInt(studentIdStr); // Parse student ID to int
            
            // Step 2: Get the existing student from the database
            StudentDAO studentDAO = new StudentDAO();
            Student existingStudent = studentDAO.getStudentById(studentId);
            
            if (existingStudent == null) {
                // Student not found, redirect to the "notfound" page
                response.sendRedirect("notfound.jsp");
                return;
            }

            // Step 3: Create a new Student object with updated values, using defaults if values are null/empty
            Student student = new Student();
            student.setStudentId(studentId); // Set the student ID
            
            // Handle potential null or empty values from the request
            student.setStudentName(getParameterOrDefault(request, "studentname", existingStudent.getStudentName()));
            student.setExamName(getParameterOrDefault(request, "examname", existingStudent.getExamName()));
            student.setSubjectName1(getParameterOrDefault(request, "subjectname1", existingStudent.getSubjectName1()));
            student.setSubjectMarks1(getIntParameterOrDefault(request, "subjectmarks1", existingStudent.getSubjectMarks1()));
            student.setSubjectName2(getParameterOrDefault(request, "subjectname2", existingStudent.getSubjectName2()));
            student.setSubjectMarks2(getIntParameterOrDefault(request, "subjectmarks2", existingStudent.getSubjectMarks2()));
            student.setSubjectName3(getParameterOrDefault(request, "subjectname3", existingStudent.getSubjectName3()));
            student.setSubjectMarks3(getIntParameterOrDefault(request, "subjectmarks3", existingStudent.getSubjectMarks3()));
            
            // Step 4: Perform the update operation in the database
            studentDAO.updateStudent(student);
            
            // Step 5: Redirect to the success page
            response.sendRedirect("success.jsp");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace(); // Log the error for debugging
            response.sendRedirect("error.jsp"); // Redirect to the error page
        } catch (NumberFormatException e) {
            e.printStackTrace(); // Handle invalid input for numeric fields
            response.sendRedirect("error.jsp"); // Redirect in case of invalid number format
        }
    }
    
    // Utility method to get a parameter or use the default value if null/empty
    private String getParameterOrDefault(HttpServletRequest request, String paramName, String defaultValue) {
        String param = request.getParameter(paramName);
        return (param == null || param.isEmpty()) ? defaultValue : param;
    }

    // Utility method to get an integer parameter or use the default value if null/empty
    private int getIntParameterOrDefault(HttpServletRequest request, String paramName, int defaultValue) {
        String param = request.getParameter(paramName);
        try {
            return (param == null || param.isEmpty()) ? defaultValue : Integer.parseInt(param);
        } catch (NumberFormatException e) {
            return defaultValue; // Return the default value if parsing fails
        }
    }
}


