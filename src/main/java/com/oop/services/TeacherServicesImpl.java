package com.oop.services;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Part;

import com.oop.Util.CommonDBConnection;
import com.oop.model.Assignments;
import com.oop.model.Teacher;

public class TeacherServicesImpl implements ITeacherServices {

	@Override
	public void insertTeacher(Teacher teacherReg) {
		try {
			String tName = teacherReg.gettName();
			String tEmail = teacherReg.gettEmail();
			String tPhone = teacherReg.gettPhone();
			String tAddress = teacherReg.gettAddress();
			String tUserName = teacherReg.gettUserName();
			String tPassword = teacherReg.gettPassword();

			Statement stmt = CommonDBConnection.getConnection().createStatement();

			String sql = "INSERT INTO teacher VALUES('" + 0 + "', '" + tName + "','" + tEmail + "','" + tPhone + "',"
					+ "'" + tAddress + "','" + tUserName + "','" + tPassword + "')";

			stmt.executeUpdate(sql);

			stmt.close();

		} catch (Exception e) {

			e.printStackTrace();
		}

	}

	@Override
	public List<Teacher> LoggedInTeacher(Teacher teacherLogin) {

		ArrayList<Teacher> t = new ArrayList<>();

		// validate

		try {
			
			String userName = teacherLogin.gettUserName();
			String Password = teacherLogin.gettPassword();


			Statement stmt = CommonDBConnection.getConnection().createStatement();

			String sql = "SELECT * FROM teacher WHERE tUserName='" + userName + "' and tPassword='" + Password + "'";

			ResultSet rs = stmt.executeQuery(sql);

			if (rs.next()) {
				
				Teacher loggedInTeacher = new Teacher();
				
				loggedInTeacher.setTeacherID(rs.getInt(1));
				loggedInTeacher.settName(rs.getString(2));
				loggedInTeacher.settEmail(rs.getString(3));
				loggedInTeacher.settPhone(rs.getString(4));
				loggedInTeacher.settAddress(rs.getString(5));
				loggedInTeacher.settUserName(rs.getString(6));
				loggedInTeacher .settPassword(rs.getString(7));
				
				t.add(loggedInTeacher);

				
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return t;
	}

	@Override
	public void updateTeacher(Teacher teacherUpd) {
		
		try {
			
			int teacherID = teacherUpd.getTeacherID();
			String tName = teacherUpd.gettName();
			String tEmail = teacherUpd.gettEmail();
			String tPhone = teacherUpd.gettPhone();
			String tAddress = teacherUpd.gettAddress();
			String tUserName = teacherUpd.gettUserName();
			String tPassword = teacherUpd.gettPassword();
			

			Statement stmt = CommonDBConnection.getConnection().createStatement();//common database Connection
			
			String sql = "UPDATE teacher SET tName='" + tName + "',tEmail='" + tEmail + "'"
					+ ",tPhone='" + tPhone + "',tAddress='" + tAddress + "',tUserName='" + tUserName + "',tPassword='" + tPassword + 
					"' WHERE teacherID='"+teacherID+"'";
			
			stmt.executeUpdate(sql);

			stmt.close();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		

	}


	@Override
	public List<Teacher> viewTeacherDetails(Teacher teacherView) {

		ArrayList<Teacher> teach = new ArrayList<>();

		int ID = teacherView.getTeacherID();
		
		try {
			

			Statement stmt = CommonDBConnection.getConnection().createStatement();//common database Connection
			
			String sql = "SELECT * FROM teacher WHERE teacherID='"+ID+"'";
			
			ResultSet rs = stmt.executeQuery(sql);
			
				while(rs.next()) {
					
					int teacherID = rs.getInt(1);
					String tName = rs.getString(2);
					String tEmail = rs.getString(3);
					String tPhone = rs.getString(4);
					String tAddress = rs.getString(5);
					String tPasswordU = rs.getString(6);
					String tUserNameU = rs.getString(7);
					
					Teacher viewTeacher = new Teacher();
					
					viewTeacher.setTeacherID(teacherID);
					viewTeacher.settName(tName);
					viewTeacher.settEmail(tEmail);
					viewTeacher.settPhone(tPhone);
					viewTeacher.settAddress(tAddress);
					viewTeacher.settUserName(tUserNameU);
					viewTeacher.settPassword(tPasswordU);
					
					teach.add(viewTeacher);
					
				}
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
		return teach;
	}

	@Override
	public void deleteTeacher(Teacher teacherDelete) {
		
		int ID = teacherDelete.getTeacherID();
		
		try {
			
			CommonDBConnection db = new CommonDBConnection();//common database Connection
			Statement stmt = db.getConnection().createStatement();//common database Connection
			
			String sql = "DELETE FROM teacher WHERE teacherID='"+ID+"'";
			
			stmt.executeUpdate(sql);
			
			
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
	}

	@Override
	public void addAssignments(Assignments addAssign) {
		
	}

	@Override
	public List<Assignments> viewAssignmentDetails() {

		ArrayList<Assignments> assign = new ArrayList<>();

		
		try {

			Statement stmt = CommonDBConnection.getConnection().createStatement();//common database Connection
			
			String sql = "SELECT * FROM assignments";
			
			ResultSet rs = stmt.executeQuery(sql);
			
				while(rs.next()) {
					
					int ASID = rs.getInt(1);
					String ASName = rs.getString(2);
					String ASDiscription = rs.getString(3);
					String ASAddedDate = rs.getString(4);
					String ASDueDate = rs.getString(5);
					int ASBatch = rs.getInt(7);
					
					Assignments assignmentsView = new Assignments();
					
					assignmentsView.setASID(ASID);
					assignmentsView.setASName(ASName);
					assignmentsView.setASDiscription(ASDiscription);
					assignmentsView.setASAddedDate(ASAddedDate);
					assignmentsView.setASDueDate(ASDueDate);
					assignmentsView.setASBatch(ASBatch);;
					
					assign.add(assignmentsView);
					
				}
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		return assign;
	}

	@Override
	public void updateAssignments() {
		
		/*try {
			
			int ASID = assignmentsUpd.getASID();
			String ASName = assignmentsUpd.getASName();
			String ASDiscription = assignmentsUpd.getASDiscription();
			String ASAddedDate = assignmentsUpd.getASAddedDate();
			String ASDueDate = assignmentsUpd.getASDueDate();
			String ASBatch = assignmentsUpd.getASBatch();
			String FilePath = assignmentsUpd.getASFile();
			
			Statement stmt = CommonDBConnection.getConnection().createStatement();//common database Connection
			
			String sql = "UPDATE assignments SET ASName='"+ASName+"', ASDiscription='"+ASDiscription+"', ASAddedDate='"+ASAddedDate+"',"
					+ " ASDueDate='"+ASDueDate+"', ASFilePath='"+FilePath+"',batchID='"+ASBatch+"' WHERE ASID='"+ASID+"'";
			
			stmt.executeUpdate(sql);

			stmt.close();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}*/
		
		
	}

	@Override
	public List<Assignments> getSingleAssignmentDetails(Assignments getSingleAssignment) {
		
		ArrayList<Assignments> singleAssignment = new ArrayList<>();
		
		int ID = getSingleAssignment.getASID();
		
		try {
			
			
			Statement stmt = CommonDBConnection.getConnection().createStatement();//common database Connection
			
			String sql = "SELECT * FROM assignments WHERE ASID='"+ID+"'";
			
			ResultSet rs = stmt.executeQuery(sql);
			
				while(rs.next()) {
					
					int ASID = rs.getInt(1);
					String ASName = rs.getString(2);
					String ASDiscription = rs.getString(3);
					String ASAddedDate = rs.getString(4);
					String ASDueDate = rs.getString(5);
					String filePath = rs.getString(6);
					int ASBatch = rs.getInt(7);
					
					Assignments singleAS = new Assignments();
					
					singleAS.setASID(ASID);
					singleAS.setASName(ASName);
					singleAS.setASDiscription(ASDiscription);
					singleAS.setASAddedDate(ASAddedDate);
					singleAS.setASDueDate(ASDueDate);
					singleAS.setASBatch(ASBatch);
					
					singleAssignment.add(singleAS);
					
				}
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		return singleAssignment; 
		
	}

	@Override
	public void deleteAssignments(Assignments assignmentDelete) {
		
		int ID = assignmentDelete.getASID();
		
		try {
			
			CommonDBConnection db = new CommonDBConnection();//common database Connection
			Statement stmt = db.getConnection().createStatement();//common database Connection
			
			String sql = "DELETE FROM assignments WHERE ASID='"+ID+"'";
			
			stmt.executeUpdate(sql);
			
			
			
		}catch(Exception e) {
			
			e.printStackTrace();
		}
		
	}

}