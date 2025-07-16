package com.oop.Util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.oop.model.Assignments;
import com.oop.model.Student;
import com.oop.services.IStudentServices;


public class studentDBUtil implements IStudentServices {
	private static boolean isSuccess;
    private static Connection con = null;
    private static PreparedStatement pstmt = null;
	private static Statement stmt = null;
    private static ResultSet rs = null;
	public static int studentID;
	
    @Override
    public boolean addStudent(Student student) {
        boolean isSuccess = false;
        try {
           
				con = CommonDBConnection.getConnection();
			
            String sql = "INSERT INTO student (sName, sEmail, sPhone, sAddress, sUserName, sPassword, stdBatch) VALUES (?,?, ?, ?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);

            pstmt.setString(1, student.getsName());
            pstmt.setString(2, student.getsEmail());
            pstmt.setString(3, student.getsPhone());
            pstmt.setString(4, student.getsAddress());
            pstmt.setString(5, student.getsUserName());
            pstmt.setString(6, student.getsPassword());
            pstmt.setInt(7, student.getsBatch());

            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                isSuccess = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }

        return isSuccess;
    }

    // Retrieve all notices from the database
    @Override
    public List<Student> getAllStudent() {
        List<Student> studentList = new ArrayList<>();

        try {
           
				con = CommonDBConnection.getConnection();
			
            String sql = "SELECT * FROM student";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int studentID = rs.getInt("studentID");
                String sName = rs.getString("sName");
                String sEmail = rs.getString("sEmail");
                String sPhone = rs.getString("sPhone");
                String sAddress = rs.getString("sAddress");
                String sUserName = rs.getString("sUserName");
                String sPassword = rs.getString("sPassword");
                int sBatch = rs.getInt("stdBatch");

                Student student = new Student(studentID, sName, sEmail, sPhone,sBatch, sAddress, sUserName, sPassword);
                studentList.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }

        return studentList;
    }

    // Get Notice by ID
    @Override
    public Student getStudentById(int studentID) {
    	Student student = null;
        try {
            
				con = CommonDBConnection.getConnection();
		
            String sql = "SELECT * FROM student WHERE studentID=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, studentID);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                int sstudentID = rs.getInt("studentID");
                String sName = rs.getString("sName");
                String sEmail = rs.getString("sEmail");
                String sPhone = rs.getString("sPhone");
                int sBatch = rs.getInt("stdBatch");
                String sAddress = rs.getString("sAddress");
                String sUserName = rs.getString("sUserName");
                String sPassword = rs.getString("sPassword");
                student = new Student(sstudentID, sName, sEmail, sPhone, sBatch, sAddress, sUserName, sPassword);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return student;
    }

    // Update Notice
    @Override
    public boolean updateStudent(Student student) {
        boolean isSuccess = false;
        try {
          
				con = CommonDBConnection.getConnection();
		
            String sql = "UPDATE student SET sName=?, sEmail=?, sPhone=?, sAddress=?, sUserName=?, sPassword=?, stdBatch=? WHERE studentID=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, student.getsName());
            pstmt.setString(2, student.getsEmail());
            pstmt.setString(3, student.getsPhone());
            pstmt.setString(4, student.getsAddress());
            pstmt.setString(5, student.getsUserName());
            pstmt.setString(6, student.getsPassword());
            pstmt.setInt(7, student.getsBatch());
            pstmt.setInt(8, student.getStudentID());
            
            


            int rowsAffected = pstmt.executeUpdate();
            if (rowsAffected > 0) {
                isSuccess = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return isSuccess;
    }

    // Delete Notice
    @Override
    public boolean deleteStudent(int studentID) {
        boolean isSuccess = false;
        try {
            
				con = CommonDBConnection.getConnection();
		
            stmt = con.createStatement();
            String sql = "delete from student where studentID = ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, studentID);
            int rowsAffected = pstmt.executeUpdate();

            if (rowsAffected > 0) {
                isSuccess = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources(); // Ensure the connection, statement, and result set are properly closed
        }
        return isSuccess;
    }


    private void closeResources() {
        try {
            if (rs != null) {
                rs.close();
            }
            if (pstmt != null) {
                pstmt.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

	@Override
	public List<Assignments> getSingleAssignmentDetails(Assignments getSingleAssignment) {
		// TODO Auto-generated method stub
		return null;
	}
}
