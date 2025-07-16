package studentServlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import com.oop.Util.CommonDBConnection;
import com.oop.model.Student;

/**
 * Servlet implementation class StudentsLoginServlet
 */
@WebServlet("/StudentsLoginServlet")
public class StudentsLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	   public StudentsLoginServlet() {
	        super();
	        // TODO Auto-generated constructor stub
	    }


		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			String sUserName = request.getParameter("studentUserName");
			String sPassword = request.getParameter("studentPassword");
			
			System.out.println("UserName in Servlet: "+sUserName);
			System.out.println("Password in Servlet: "+sPassword);
			
			try {
				
				Statement stmt = CommonDBConnection.getConnection().createStatement();

				String sql = "SELECT * FROM student WHERE sUserName='" + sUserName + "' and sPassword='" + sPassword + "'";

				ResultSet rs = stmt.executeQuery(sql);
				
				if(rs.next()) {
					Student loggedInStudent = new Student();
					
					loggedInStudent.setStudentID(rs.getInt(1));
					loggedInStudent.setsName(rs.getString(2));
					loggedInStudent.setsEmail(rs.getString(3));
					loggedInStudent.setsPhone(rs.getString(4));
					loggedInStudent.setsAddress(rs.getString(5));
					loggedInStudent.setsUserName(rs.getString(6));
					loggedInStudent .setsPassword(rs.getString(7));
					loggedInStudent.setsBatch(rs.getInt(8));
					
					HttpSession session = request.getSession();                
	                session.setAttribute("loggedInStudent", loggedInStudent); 
	                request.setAttribute("loginMessage", "Login Successfully!");
	                
	                RequestDispatcher dis = getServletContext().getRequestDispatcher("/studentDashboard.jsp");
	                dis.forward(request, response);
				}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			
			
		}

}
