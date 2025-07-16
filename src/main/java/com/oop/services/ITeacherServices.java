package com.oop.services;

import java.util.List;

import com.oop.model.Assignments;
import com.oop.model.Teacher;

public interface ITeacherServices {
	
	//Teacher CRUD
	
	public void insertTeacher(Teacher teacherReg);
	
	public List<Teacher> LoggedInTeacher(Teacher teacherLogin);
	
	public void updateTeacher(Teacher teacherUpd);
	
	public void deleteTeacher(Teacher teacherDelete);
	
	public  List<Teacher> viewTeacherDetails(Teacher teacherView);
	
	
	//Assignment CRUD
	
	public void addAssignments(Assignments addAssign);
	
	public  List<Assignments> viewAssignmentDetails();
	
	public  List<Assignments> getSingleAssignmentDetails(Assignments getSingleAssignment);
	
	public void updateAssignments();
	
	public void deleteAssignments(Assignments assignmentDelete);
	

}
