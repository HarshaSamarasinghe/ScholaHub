package com.oop.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import com.mysql.jdbc.PreparedStatement;
import com.oop.Util.CommonDBConnection;



@WebServlet("/upload")
@MultipartConfig(maxFileSize = 16177215) //16MB
public class TeacherAddAssignmentsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		InputStream ins = null;
		String name = request.getParameter("AS_Name");
		String description = request.getParameter("AS_Discription");
		String AddDate = request.getParameter("AS_addDate");
		String DueDate = request.getParameter("AS_dueDate");
		String batch = request.getParameter("studentBatch");

		Part filePart = request.getPart("file");
		
		if(filePart !=null) {
			ins = filePart.getInputStream();
		}
		
		
		Connection conn = null;
		String message = null;
		
		try {
			
			conn = CommonDBConnection.getConnection();//database connection
			
			//construct SQL Statement
			String sql = "INSERT INTO assignments (ASName,ASDescription,ASAddedDate,ASDueDate,File,StudentBatch) VALUES (?,?,?,?,?,?)";
			
			PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
			
			stmt.setString(1, name);
			stmt.setString(2, description);
			stmt.setString(3, AddDate);
			stmt.setString(4, DueDate);

			if(ins !=null) {
				//fetch input stream of the upload file for the blob column
				stmt.setBlob(5, ins);
			}
			
			stmt.setString(6, batch);
			
			// sends the statement to the database server
			int row = stmt.executeUpdate();
			if(row>0) {
				
				message = "File Uploaded to the database!";
				
			}
			conn.close();
			
		}catch(Exception e) {
			
			message = "Error: "+e.getMessage();
			e.printStackTrace();
		}

			//sets message in request part
			request.setAttribute("Message",message);
			
			// forward to the teacherAssignments.jsp page
			RequestDispatcher dis = getServletContext().getRequestDispatcher("/Teacher/teacherAssignments.jsp");
            dis.forward(request, response);
			
		

	}

}
