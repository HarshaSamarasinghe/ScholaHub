package com.oop.model;



public class Assignments {

	private int ASID;
	private String ASName;
	private String ASDiscription;
	private String ASAddedDate;
	private String ASDueDate;
	private int ASBatch;
	private Byte[] ASFile;

	
	
	
	//getters
	public int getASID() {
		return ASID;
	}
	public String getASName() {
		return ASName;
	}
	public String getASDiscription() {
		return ASDiscription;
	}
	public String getASAddedDate() {
		return ASAddedDate;
	}
	public String getASDueDate() {
		return ASDueDate;
	}
	public int getASBatch() {
		return ASBatch;
	}
	public Byte[] getASFile() {
		return ASFile;
	}

	
	//setters
	public void setASID(int aSID) {
		ASID = aSID;
	}
	public void setASName(String aSName) {
		ASName = aSName;
	}
	public void setASDiscription(String aSDiscription) {
		ASDiscription = aSDiscription;
	}
	public void setASAddedDate(String aSAddedDate) {
		ASAddedDate = aSAddedDate;
	}
	public void setASDueDate(String aSDueDate) {
		ASDueDate = aSDueDate;
	}
	public void setASBatch(int aSBatch) {
		ASBatch = aSBatch;
	}

	public void setASFile(Byte[] aSFile) {
		ASFile = aSFile;
	}

	

	
	
}