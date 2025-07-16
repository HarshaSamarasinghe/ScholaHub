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
 * Servlet implementation class AddstudentsServlet
 */
@WebServlet("/AddstudentsServlet")
public class AddstudentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  // Fetch data from the request
		  String sName = request.getParameter("sName");
		  String sEmail = request.getParameter("sEmail");
		  String sPhone = request.getParameter("sPhone");
		  int sBatch = Integer.parseInt(request.getParameter("studentBatch"));
		  String sAddress = request.getParameter("sAddress");
		  String sUserName = request.getParameter("sUserName");
		  String sPassword = request.getParameter("sPassword");

		  Student student = new Student(0, sName, sEmail, sPhone,sBatch,  sAddress, sUserName, sPassword);

		  // Call the DB utility to save the notice
		  IStudentServices DBUtil = new studentDBUtil();
		  boolean isSuccess = DBUtil.addStudent(student);

		  // Redirect to a different page based on success or failure
		  if (isSuccess) {
		      response.sendRedirect("addStudent.jsp"); 
		  } else {
		      response.sendRedirect("adminDashboard.jsp");
		  }
		}

}
