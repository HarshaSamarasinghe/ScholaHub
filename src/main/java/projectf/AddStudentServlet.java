package projectf;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;

@WebServlet("/addStudent")
public class AddStudentServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Student student = new Student();
        student.setStudentId(Integer.parseInt(request.getParameter("studentid")));
        student.setStudentName(request.getParameter("studentname"));
        student.setExamName(request.getParameter("examname"));
        student.setSubjectName1(request.getParameter("subjectname1"));
        student.setSubjectMarks1(Integer.parseInt(request.getParameter("subjectmarks1")));
        student.setSubjectName2(request.getParameter("subjectname2"));
        student.setSubjectMarks2(Integer.parseInt(request.getParameter("subjectmarks2")));
        student.setSubjectName3(request.getParameter("subjectname3"));
        student.setSubjectMarks3(Integer.parseInt(request.getParameter("subjectmarks3")));

        try {
            StudentDAO studentDAO = new StudentDAO();
            studentDAO.addStudent(student);
           
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        
        RequestDispatcher dis = getServletContext().getRequestDispatcher("/success.jsp");
        dis.forward(request, response);
    }
}
