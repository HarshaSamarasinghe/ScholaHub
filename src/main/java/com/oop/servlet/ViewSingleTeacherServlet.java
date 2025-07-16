package com.oop.servlet;

import java.io.IOException;
import java.io.InputStream;
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
import com.oop.model.Assignments;
import com.oop.model.Teacher;

@WebServlet(urlPatterns = "/ViewSingleTeacherServlet")
public class ViewSingleTeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Teacher singleTeacher = new Teacher();
		
		int convertedID = Integer.parseInt(request.getParameter("id"));
		
		singleTeacher.setTeacherID(convertedID);
		
		
		try {
			
			Statement stmt = CommonDBConnection.getConnection().createStatement();

			String sql = "SELECT * FROM teacher WHERE teacherID ='"+convertedID+"'";

			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()) {

				singleTeacher.setTeacherID(rs.getInt(1));
				singleTeacher.settName(rs.getString(2));
				singleTeacher.settEmail(rs.getString(3));
				singleTeacher.settPhone(rs.getString(4));
				singleTeacher.settAddress(rs.getString(5));
				singleTeacher.settUserName(rs.getString(6));
				singleTeacher.settPassword(rs.getString(7));
				
				HttpSession session = request.getSession();                
                session.setAttribute("singleTeacher", singleTeacher); 
  
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dis = getServletContext().getRequestDispatcher("/Admin/AdminTeacherDelete.jsp");
        dis.forward(request, response);

	}
	

}

