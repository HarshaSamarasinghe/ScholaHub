package projectf;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;

@WebServlet("/retrieveStudent")
public class RetrieveStudentServlet extends HttpServlet {
 
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int studentId = Integer.parseInt(request.getParameter("studentid"));

        try {
            StudentDAO studentDAO = new StudentDAO();
            Student student = studentDAO.getStudentById(studentId);
            if (student != null) {
                request.setAttribute("student", student);
                request.getRequestDispatcher("/Student/displayStudentResult.jsp").forward(request, response);
            } else {
                // Set an attribute to indicate the student was not found
                request.setAttribute("message", "Student ID does not exist.");
                request.getRequestDispatcher("notfound.jsp").forward(request, response); // Replace with your form page
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
