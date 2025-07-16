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
 * Servlet implementation class DisplaySingleStudentServlet
 */
@WebServlet("/DisplaySingleStudentServlet")
public class DisplaySingleStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
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
	        request.getRequestDispatcher("user-account.jsp").forward(request, response);
	    } else {
	        // Handle case when product is not found
	        response.sendError(HttpServletResponse.SC_NOT_FOUND, "Student not found");
	    }
	}

}
