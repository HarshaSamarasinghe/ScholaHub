package studentServlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.oop.Util.studentDBUtil;
import com.oop.model.Student;

/**
 * Servlet implementation class DisplayStudentsServlet
 */
@WebServlet("/DisplayStudentsServlet")
public class DisplayStudentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Fetch all notices using noticeDBUtil
        studentDBUtil studentDB = new studentDBUtil();
        List<Student> studentList = studentDB.getAllStudent();
        
        // Set the notice list as an attribute to be accessed in the JSP
        request.setAttribute("studentList", studentList);
        
        // Forward to the JSP page
        request.getRequestDispatcher("user-account.jsp").forward(request, response);
    }

}
