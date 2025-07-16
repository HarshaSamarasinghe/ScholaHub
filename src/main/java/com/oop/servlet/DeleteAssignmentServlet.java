package com.oop.servlet;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.oop.model.Assignments;
import com.oop.services.ITeacherServices;
import com.oop.services.TeacherServicesImpl;


@WebServlet("/DeleteAssignmentServlet")
public class DeleteAssignmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Assignments assignDelete = new Assignments();
		
		int convertedID = Integer.parseInt(request.getParameter("id"));
		
		assignDelete.setASID(convertedID);
		
		try {
			
			ITeacherServices iTeacherServices = new TeacherServicesImpl();
			
			iTeacherServices.deleteAssignments(assignDelete);
			
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
		request.setAttribute("Message", "Assignment Deleted Successfully!");
        RequestDispatcher dis = getServletContext().getRequestDispatcher("/Teacher/teacherAssignments.jsp");
        dis.forward(request, response);
		
	}

}
