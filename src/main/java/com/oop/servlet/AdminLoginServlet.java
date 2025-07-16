package com.oop.servlet;

import java.io.IOException;
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
import com.oop.model.Admin;




@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("adminName");
		String password = request.getParameter("adminPassword");
		
		System.out.println("Admin User Name: "+userName);
		System.out.println("Admin Password: "+password);
		
		try {
			Statement stmt = CommonDBConnection.getConnection().createStatement();
			String sql = "SELECT * FROM admin where adUserName='" + userName + "' and adPassword='"+ password + "'";
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				
				Admin loggedInAdmin = new Admin();
				
				loggedInAdmin.setAdminID(rs.getInt(1));
				loggedInAdmin.setAdName(rs.getString(2));
				loggedInAdmin.setAdEmail(rs.getString(3));
				loggedInAdmin.setAdPhone(rs.getString(4));
				loggedInAdmin.setAdAddress(rs.getString(5));
				loggedInAdmin.setAdUserName(rs.getString(6));
				loggedInAdmin.setAdPassword(rs.getString(7));
				
				HttpSession session = request.getSession();
				session.setAttribute("loggedInAdmin", loggedInAdmin);
				
				RequestDispatcher dis = getServletContext().getRequestDispatcher("/Admin/AdminProfile.jsp");
				dis.forward(request, response);
			}

		}
		catch (Exception e) {
			
			e.printStackTrace();
			System.out.println(e);
		}

		
	}

}
