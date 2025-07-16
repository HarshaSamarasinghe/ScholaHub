package com.oop.servlet;

import java.io.IOException;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.oop.model.Teacher;
import com.oop.services.ITeacherServices;
import com.oop.services.TeacherServicesImpl;

@WebServlet("/TeacherUpdateProfileServlet")
public class TeacherUpdateProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html");
		
		Teacher teacherUpd = new Teacher();
		
		int convertedID = Integer.parseInt(request.getParameter("teacherID"));
		teacherUpd.setTeacherID(convertedID);
		
		teacherUpd.settName(request.getParameter("teacherName"));
		teacherUpd.settEmail(request.getParameter("teacherEmail"));
		teacherUpd.settPhone(request.getParameter("teacherPhone"));
		teacherUpd.settAddress(request.getParameter("teacherAddress"));
		teacherUpd.settUserName(request.getParameter("teacherUserName"));
		teacherUpd.settPassword(request.getParameter("teacherPassword"));
		
		try {
			
			ITeacherServices iTeacherServices = new TeacherServicesImpl();
			iTeacherServices.updateTeacher(teacherUpd);

			
			HttpSession session = request.getSession();                
            session.setAttribute("loggedInTeacher", teacherUpd); 
            
            request.setAttribute("UpdatedMessage", "Updated Successfully!");
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		 RequestDispatcher dis = getServletContext().getRequestDispatcher("/Teacher/teacherSetting.jsp");
         dis.forward(request, response);
		
	}

}
