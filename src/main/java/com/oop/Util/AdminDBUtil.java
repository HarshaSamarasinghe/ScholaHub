package com.oop.Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.oop.model.Admin;


public class AdminDBUtil {
	
	public static List<Admin> validate(String userName, String Password) {

		ArrayList<Admin> ad = new ArrayList<>();

		// create database connection
		String url = "jdbc:mysql://localhost:3306/scholahubdb";
		String user = "root";
		String pass = "#Harsha1234";

		// validate

		try {

			Class.forName("com.mysql.jdbc.Driver");

			Connection con = DriverManager.getConnection(url, user, pass);
			Statement stmt = con.createStatement();

			String sql = "select * from admin where adUserName='" + userName + "' and adPassword='"+ Password + "'";

			ResultSet rs = stmt.executeQuery(sql);

			if (rs.next()) {

				Admin loggedInAdmin = new Admin();
				
				loggedInAdmin.setAdminID(rs.getInt(1));
				loggedInAdmin.setAdName(rs.getString(2));
				loggedInAdmin.setAdEmail(rs.getString(3));
				loggedInAdmin.setAdPhone(rs.getString(4));
				loggedInAdmin.setAdAddress(rs.getString(5));
				loggedInAdmin.setAdUserName(rs.getString(6));
				loggedInAdmin.setAdPassword(rs.getString(7));
				
				
				ad.add(loggedInAdmin);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return ad;
	}

}
