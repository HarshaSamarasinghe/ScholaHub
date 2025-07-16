package com.oop.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;



import com.oop.Util.CommonDBConnection;
import com.oop.model.Teacher;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException; 
import jakarta.servlet.annotation.WebServlet; 
import jakarta.servlet.http.HttpServlet; 
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/login")
public class TeacherLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public TeacherLoginServlet() {
        super();
        
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String UserName = request.getParameter("teacherUserName");
		String Password = request.getParameter("teacherPassword");
		
		System.out.println("UserName in Servlet: "+UserName);
		System.out.println("Password in Servlet: "+Password);
		
		try {
			
			Statement stmt = CommonDBConnection.getConnection().createStatement();

			String sql = "SELECT * FROM teacher WHERE tUserName='" + UserName + "' and tPassword='" + Password + "'";

			ResultSet rs = stmt.executeQuery(sql);
			
			
			
			if(rs.next()) {
				Teacher loggedInTeacher = new Teacher();
				
				loggedInTeacher.setTeacherID(rs.getInt(1));
				loggedInTeacher.settName(rs.getString(2));
				loggedInTeacher.settEmail(rs.getString(3));
				loggedInTeacher.settPhone(rs.getString(4));
				loggedInTeacher.settAddress(rs.getString(5));
				loggedInTeacher.settUserName(rs.getString(6));
				loggedInTeacher .settPassword(rs.getString(7));
				
				HttpSession session = request.getSession();                
                session.setAttribute("loggedInTeacher", loggedInTeacher); 
                request.setAttribute("loginMessage", "Login Successfully!");
 
               RequestDispatcher dis = getServletContext().getRequestDispatcher("/Teacher/teacherDashboard.jsp");
               dis.forward(request, response);
			}
			else {
				
				//Show error message and Redirect to Login.jsp page if password or userName is wrong!
				request.setAttribute("errorMessage", "Wrong UserName or Password!");
				RequestDispatcher dis = getServletContext().getRequestDispatcher("/Login.jsp");
	            dis.forward(request, response);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}

}
