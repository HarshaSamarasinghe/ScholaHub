package com.oop.servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.oop.model.Teacher;
import com.oop.services.ITeacherServices;
import com.oop.services.TeacherServicesImpl;


@WebServlet(urlPatterns = "/TeacherDeleteProfileServlet")
public class TeacherDeleteProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Teacher teacherDelete = new Teacher();
		
		int convertedID = Integer.parseInt(request.getParameter("id"));//string to integer using wrapper class
		teacherDelete.setTeacherID(convertedID);
		
		try {
			
			ITeacherServices iTeacherServices = new TeacherServicesImpl();

			iTeacherServices.deleteTeacher(teacherDelete);
			
			request.setAttribute("Message", "User Deleted Successfully!");
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
		
		RequestDispatcher dis = request.getRequestDispatcher("/Admin/TeacherInfo.jsp");
		dis.forward(request, response);
		
		
	}

}
