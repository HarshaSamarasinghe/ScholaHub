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


@WebServlet("/ViewStudentSingleAssignment")
public class ViewStudentSingleAssignment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Assignments viewAssignDetails = new Assignments();
		
		int convertedID = Integer.parseInt(request.getParameter("id"));
		
		viewAssignDetails.setASID(convertedID);
		
		
		try {
			
			Statement stmt = CommonDBConnection.getConnection().createStatement();

			String sql = "SELECT * FROM assignments WHERE ASID='"+convertedID+"'";

			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()) {

				viewAssignDetails.setASID(rs.getInt(1));
				viewAssignDetails.setASName(rs.getString(2));
				viewAssignDetails.setASDiscription(rs.getString(3));
				viewAssignDetails.setASAddedDate(rs.getString(4));
				viewAssignDetails.setASDueDate(rs.getString(5));
				InputStream ins = rs.getBinaryStream(6);
				viewAssignDetails.setASBatch(rs.getInt(7));;
				
				HttpSession session = request.getSession();                
                session.setAttribute("viewAssignDetails", viewAssignDetails); 

                
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dis = getServletContext().getRequestDispatcher("/Student/AssignmentDetails.jsp");
        dis.forward(request, response);

	}

}
