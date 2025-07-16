package com.oop.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


import com.oop.Util.CommonDBConnection;
import com.oop.model.Assignments;


@WebServlet("/DownloadAssignmentServlet")
public class DownloadAssignmentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Assignments viewAssignDetails = new Assignments();
		
		int convertedID = Integer.parseInt(request.getParameter("id"));
		
		viewAssignDetails.setASID(convertedID);
		
		Connection conn = null;
		try {
			
			conn = CommonDBConnection.getConnection();//database connection

			String sql = "SELECT ASName,File FROM assignments WHERE ASID='"+convertedID+"'";
			PreparedStatement stmt = conn.prepareStatement(sql);
			//stmt.setInt(1, convertedID);
			
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()) {

				String fileName = rs.getString("ASName");
				InputStream ins = rs.getBinaryStream("File");
				
				
				System.out.println("File name: "+fileName);
				
				response.setContentType("application/pdf");
				response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + ".pdf\"");
				
				
				OutputStream output = response.getOutputStream();
				byte[] buffer = new byte[4096];
				int bytesRead = -1;
				
				while((bytesRead = ins.read(buffer)) != -1) {
					
					output.write(buffer, 0, bytesRead);
				}
				
				ins.close();
				output.close();

				HttpSession session = request.getSession();                
                session.setAttribute("viewAssignDetails", viewAssignDetails); 
                
               // request.setAttribute("Message", "Assignment Downloaded Successfully!");
                
                
			}
			
			rs.close();
			stmt.close();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dis = getServletContext().getRequestDispatcher("/Teacher/AssignmentDetails.jsp");
        dis.forward(request, response);
        request.setAttribute("Message", "Assignment Downloaded Successfully!");

	}
	

}
