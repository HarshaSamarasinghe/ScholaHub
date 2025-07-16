package com.oop.servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.oop.model.Assignments;
import com.oop.services.ITeacherServices;
import com.oop.services.TeacherServicesImpl;


@WebServlet("/EditAssignmentServlet")
public class EditAssignmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Assignments GetSingleAS = new Assignments();
		
		int convertedID = Integer.parseInt(request.getParameter("id"));
		
		GetSingleAS.setASID(convertedID);
		
		
		try {
			
			ITeacherServices iTeacherServices = new TeacherServicesImpl();
			
		       List <Assignments> singleAssignmentDetails = iTeacherServices.getSingleAssignmentDetails(GetSingleAS);
		       
		       RequestDispatcher dis = request.getRequestDispatcher("Teacher/updateAssignment.jsp");
		       
		       request.setAttribute("singleAssignmentDetails", singleAssignmentDetails);
		       dis.forward(request, response);
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
		
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
