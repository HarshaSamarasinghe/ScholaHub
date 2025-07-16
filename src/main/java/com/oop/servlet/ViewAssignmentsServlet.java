package com.oop.servlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.oop.model.Assignments;
import com.oop.services.ITeacherServices;
import com.oop.services.TeacherServicesImpl;


@WebServlet("/View")
public class ViewAssignmentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String action = request.getServletPath();
		
		if(action!=null) {
			
			try {
				
				
				ITeacherServices iTeacherServices = new TeacherServicesImpl();
				
			       List <Assignments> assignmentDetails = iTeacherServices.viewAssignmentDetails();
			       
			       if (!assignmentDetails.isEmpty()) {
		            	
		                HttpSession session = request.getSession();
		                session.setAttribute("assignmentDetails", assignmentDetails); 
		               
		                
		                RequestDispatcher dis = getServletContext().getRequestDispatcher("/Teacher/teacherAssignments.jsp");
		                dis.forward(request, response);
		            } 

				
			}catch(Exception e) {
				
				e.printStackTrace();
			}
			

		}
		
		
		
	}
	

	

}
