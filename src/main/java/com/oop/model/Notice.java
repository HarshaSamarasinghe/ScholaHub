package com.oop.model;

public class Notice {
	
	private int NoticeID;
	private String nName;
	private String nDate;
	private String nDescription;
	private String nBatch;

    // Constructor
    public Notice(int NoticeID, String nName, String nDate, String nDescription, String nBatch) {
        this.NoticeID = NoticeID;
        this.nName = nName;
        this.nDate = nDate;
        this.nDescription = nDescription;
        this.nBatch = nBatch;
    }
	
	//getters
	public int getNoticeID() {
		return NoticeID;
	}
	public String getnName() {
		return nName;
	}
	public String getnDate() {
		return nDate;
	}
	public String getnDescription() {
		return nDescription;
	}
	public String getnBatch() {
		return nBatch;
	}
	//setters
	
	public void setNoticeID(int NoticeID) {
		this.NoticeID = NoticeID;
	}
	public void setnName(String nName) {
		this.nName = nName;
	}
	public void setnDate(String nDate) {
		this.nDate = nDate;
	}
	public void setnDescription(String nDescription) {
		this.nDescription = nDescription;
	}
	public void setnBatch(String nBatch) {
		this.nBatch = nBatch;
	}

}
