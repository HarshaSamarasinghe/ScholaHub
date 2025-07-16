package com.oop.services;

import java.util.List;

import com.oop.model.Assignments;
import com.oop.model.Student;

public interface IStudentServices {
	
	
	public  List<Assignments> getSingleAssignmentDetails(Assignments getSingleAssignment);
	
    // Add a new notice
    boolean addStudent(Student student);
    
    // Retrieve all notices
    List<Student> getAllStudent();
    
    // Retrieve a notice by its ID
    Student getStudentById(int studentID);
    
    // Update an existing notice
    boolean updateStudent(Student student);
    
    // Delete a notice by its ID
    boolean deleteStudent(int studentID);

}
