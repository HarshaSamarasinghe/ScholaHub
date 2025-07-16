package studentServlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.oop.Util.studentDBUtil;
import com.oop.services.IStudentServices;

/**
 * Servlet implementation class DeleteStudentsServlet
 */
@WebServlet("/DeleteStudentsServlet")
public class DeleteStudentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // Fetch notice ID from the request
	    int studentID = Integer.parseInt(request.getParameter("studentID"));
	    
	    System.out.println("Deleting student with ID: " + studentID);

	    // Call the service to delete the notice
	    IStudentServices studentService = new studentDBUtil();
	    boolean isSuccess = studentService.deleteStudent(studentID);

	    // Redirect or send a success response based on the result
	    if (isSuccess) {
            System.out.println("Student deleted successfully. Redirecting to Login.jsp.");
            response.sendRedirect("Login.jsp");
	    } else {
	        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to student notice");
	    }
	}

}

