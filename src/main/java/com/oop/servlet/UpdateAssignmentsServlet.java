package com.oop.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import com.oop.Util.CommonDBConnection;
import com.oop.model.Assignments;
import com.oop.services.ITeacherServices;
import com.oop.services.TeacherServicesImpl;

@WebServlet("/updateAssignmentsServlet")
@MultipartConfig(maxFileSize = 16177215) // 16MB
public class UpdateAssignmentsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	int ID = Integer.parseInt(request.getParameter("AS_ID"));
    	
        InputStream ins = null;
        Part filePart = request.getPart("file");

        if (filePart != null) {
            ins = filePart.getInputStream();
        }

        Connection conn = null;
        String message = null;

        try {
        	ITeacherServices iTeacherServices = new TeacherServicesImpl();
            conn = CommonDBConnection.getConnection();

            String sql = "UPDATE assignments SET ASName=?, ASDescription=?, ASAddedDate=?, ASDueDate=?, File=?, StudentBatch=? WHERE ASID='"+ID+"'";
            PreparedStatement stmt = (PreparedStatement) conn.prepareStatement(sql);
            
            stmt.setString(1, request.getParameter("AS_Name"));
            stmt.setString(2, request.getParameter("AS_Discription"));
            stmt.setString(3, request.getParameter("AS_addDate"));
            stmt.setString(4, request.getParameter("AS_dueDate"));

            if (ins != null) {
                stmt.setBlob(5, ins);
            }
            else {
                stmt.setNull(5, java.sql.Types.BLOB);
            }

            stmt.setString(6, request.getParameter("studentBatch"));
      
            int row = stmt.executeUpdate();
            
            if (row > 0) {
                message = "Assignments updated successfully!";
            }
            
            
            List<Assignments> assignmentDetails = iTeacherServices.viewAssignmentDetails();
    		request.setAttribute("assignmentDetails", assignmentDetails);

		} catch (Exception e) {
			
			message = "Error: " + e.getMessage();
			e.printStackTrace();
			
		} finally {
			
			if (conn != null) {
				try {
					
					conn.close();
					
				} catch (Exception er) {
					er.printStackTrace();
				}
			}

            request.setAttribute("Message", message);
            RequestDispatcher dis = getServletContext().getRequestDispatcher("/Teacher/teacherAssignments.jsp");
            dis.forward(request, response);
        }
    }
}
