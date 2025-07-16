package com.oop.servlet;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/AssignmentsProfileServlet")
public class AssignmentsProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	 protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	       
	    	HttpSession session2 = request.getSession(false);
	    	
	        if (session2 != null && session2.getAttribute("assignmentDetails") != null) {
	        	
	            request.getRequestDispatcher("Teacher/teacherAssignments.jsp").forward(request, response);
	        } 
	 }
}
