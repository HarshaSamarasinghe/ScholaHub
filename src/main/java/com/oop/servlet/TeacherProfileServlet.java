package com.oop.servlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/TeacherProfileServlet")
public class TeacherProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
    	HttpSession session1 = request.getSession(false);
    	
        if (session1 != null && session1.getAttribute("teacherDetails") != null) {
        	
            request.getRequestDispatcher("Teacher/teacherSetting.jsp").forward(request, response);
        } 
        
        /*else {
            response.sendRedirect("Teacher/login.jsp");
        }*/
    }
}
