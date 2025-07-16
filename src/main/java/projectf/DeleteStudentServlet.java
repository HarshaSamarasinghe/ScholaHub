package projectf;

import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deleteStudent")
public class DeleteStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int studentId = Integer.parseInt(request.getParameter("studentid"));

        try {
            StudentDAO studentDAO = new StudentDAO();
            boolean isDeleted = studentDAO.deleteStudent(studentId);
            
            if (isDeleted) {
                response.sendRedirect("success.jsp");
            } else {
                // If the student ID is not found, redirect to an error page
                response.sendRedirect("notfound.jsp");
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
