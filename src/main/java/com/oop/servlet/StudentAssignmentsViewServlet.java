package com.oop.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.oop.Util.CommonDBConnection;
import com.oop.model.Assignments;


@WebServlet(urlPatterns = "/StudentAssignments")
public class StudentAssignmentsViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int ConvertedID = Integer.parseInt(request.getParameter("id"));

			
			try {

				Statement stmt = CommonDBConnection.getConnection().createStatement();//common database Connection
				String sql = "SELECT * FROM assignments WHERE StudentBatch='"+ConvertedID+"'";
				ResultSet rs = stmt.executeQuery(sql);
				
				List<Assignments> assignmentDetails = new ArrayList<>();
				
					while(rs.next()) {
	
						Assignments data = new Assignments();
						
						data.setASID(rs.getInt(1));
						data.setASName(rs.getString(2));
						data.setASDiscription(rs.getString(3));
						data.setASAddedDate(rs.getString(4));
						data.setASDueDate(rs.getString(5));
						InputStream ins = rs.getBinaryStream(6);
						data.setASBatch(rs.getInt(7));
						
						assignmentDetails.add(data);

					}

					HttpSession session = request.getSession();                
		            session.setAttribute("assignmentDetails", assignmentDetails); 
		            request.setAttribute("Message", "Successfully!");
	
					rs.close();
					stmt.close();
					
					RequestDispatcher dis = request.getRequestDispatcher("/Student/StudentViewAssignments.jsp");
					dis.forward(request, response);
	
			}catch(Exception e) {
				
				e.printStackTrace();
			}
			
			
		}
			
	
	
}