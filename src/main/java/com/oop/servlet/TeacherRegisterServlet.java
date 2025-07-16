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

@WebServlet("/TeacherRegisterServlet")
public class TeacherRegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Teacher teacherReg = new Teacher();
		
		teacherReg.settName(request.getParameter("teacherName"));
		teacherReg.settEmail(request.getParameter("teacherEmail"));
		teacherReg.settPhone(request.getParameter("teacherPhone"));
		teacherReg.settAddress(request.getParameter("teacherAddress"));
		teacherReg.settUserName(request.getParameter("teacherUserName"));
		teacherReg.settPassword(request.getParameter("teacherPassword"));
		
		ITeacherServices iTeacherServices = new TeacherServicesImpl();
		iTeacherServices.insertTeacher(teacherReg);
		
		RequestDispatcher dis = getServletContext().getRequestDispatcher("/Admin/AdminTeacherRegister.jsp");
		request.setAttribute("Message", "Registration Completed Successfully !");
		
		dis.forward(request, response);
	}

}
