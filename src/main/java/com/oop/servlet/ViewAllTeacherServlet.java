package com.oop.servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.oop.Util.CommonDBConnection;
import com.oop.model.Teacher;


@WebServlet("/ViewAllTeacherServlet")
public class ViewAllTeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			Statement stmt = CommonDBConnection.getConnection().createStatement();
			String sql = "SELECT * FROM teacher";
			ResultSet rs = stmt.executeQuery(sql);
			
			List<Teacher> teacherList = new ArrayList<>();
			
			while(rs.next()) {
				
				Teacher data = new Teacher();
				
				data.setTeacherID(rs.getInt(1));
				data.settName(rs.getString(2));
				data.settEmail(rs.getString(3));
				data.settPhone(rs.getString(4));
				data.settAddress(rs.getString(5));
				data.settUserName(rs.getString(6));
				data.settPassword(rs.getString(7));
				
				teacherList.add(data);
				
				System.out.println("Teacher names : "+data.gettName());
			}
			
			
			HttpSession session = request.getSession();                
            session.setAttribute("teacherList", teacherList); 
           
			
			
			rs.close();
			stmt.close();
			
			RequestDispatcher dis = request.getRequestDispatcher("/Admin/TeacherInfo.jsp");
			dis.forward(request, response);
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
		
		
	}

}