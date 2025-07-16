package com.oop.model;

public class Student {
	private int studentID;
	private String sName;
	private String sEmail;
	private String sPhone;
	private int sBatch;
	private String sAddress;
	private String sUserName;
	private String sPassword;

	
	// Default constructor (no-argument)
	public Student() {
	}
	
	public Student(int studentID, String sName, String sEmail, String sPhone, int sBatch, String sAddress, String sUserName,
			String sPassword) {
		this.studentID = studentID;
		this.sName = sName;
		this.sEmail = sEmail;
		this.sPhone = sPhone;
		this.sBatch = sBatch;
		this.sAddress = sAddress;
		this.sUserName = sUserName;
		this.sPassword = sPassword;
	}
	

	public int getsBatch() {
		return sBatch;
	}

	public void setsBatch(int sBatch) {
		this.sBatch = sBatch;
	}

	public int getStudentID() {
		return studentID;
	}


	public String getsName() {
		return sName;
	}


	public String getsEmail() {
		return sEmail;
	}




	public String getsPhone() {
		return sPhone;
	}


	public String getsAddress() {
		return sAddress;
	}

	public String getsUserName() {
		return sUserName;
	}
	
	public String getsPassword() {
		return sPassword;
	}


	public void setStudentID(int studentID) {
		this.studentID = studentID;
	}


	public void setsName(String sName) {
		this.sName = sName;
	}


	public void setsEmail(String sEmail) {
		this.sEmail = sEmail;
	}


	public void setsPhone(String sPhone) {
		this.sPhone = sPhone;
	}


	public void setsAddress(String sAddress) {
		this.sAddress = sAddress;
	}


	public void setsUserName(String sUserName) {
		this.sUserName = sUserName;
	}


	public void setsPassword(String sPassword) {
		this.sPassword = sPassword;
	}
}
