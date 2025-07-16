package studentServlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.oop.model.Student;
import com.oop.Util.studentDBUtil;
import com.oop.services.IStudentServices;

/**
 * Servlet implementation class UpdateStudentsServlet
 */
@WebServlet("/UpdateStudentsServlet")
public class UpdateStudentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    int studentID = Integer.parseInt(request.getParameter("studentID"));
    String sName = request.getParameter("sName");
    String sEmail = request.getParameter("sEmail");
    String sPhone = request.getParameter("sPhone");
    int sBatch = Integer.parseInt(request.getParameter("studentBatch"));
    String sAddress = request.getParameter("sAddress");
    String sUserName = request.getParameter("sUserName");
    String sPassword = request.getParameter("sPassword");


    // Call the DB utility to update the notice
    IStudentServices studentService = new studentDBUtil();
    Student existingStudent = studentService.getStudentById(studentID);
    
    if(existingStudent != null) {
    	
    	Student updatedStudent = new Student(studentID, sName, sEmail, sPhone, sBatch, sAddress, sUserName, sPassword);
    	
        // Update the product in the database
        boolean success = studentService.updateStudent(updatedStudent);
    

    // Redirect to a different page based on success or failure
    if (success) {
        // Redirect to display-product.jsp
        response.sendRedirect("studentDashboard.jsp");
    } else {
        // Handle failure to update
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update the Student!!");
    }
    }else {
        response.sendError(HttpServletResponse.SC_NOT_FOUND, "Notice not found");
    }
    	
}

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // Retrieve product ID from request parameters
    int studentID = Integer.parseInt(request.getParameter("studentID"));

    // Get the product from the database
    IStudentServices studentService = new studentDBUtil();
    Student student = studentService.getStudentById(studentID);

    if (student != null) {
        // Set product as an attribute
        request.setAttribute("student", student);

        // Forward the request
        request.getRequestDispatcher("update-students.jsp").forward(request, response);
    } else {
        // Handle case when product is not found
        response.sendError(HttpServletResponse.SC_NOT_FOUND, "Student not found");
    }
}

}