package com.oop.services;

import java.util.List;

import com.oop.model.Notice;

public interface iNoticeServices {
    // Add a new notice
    boolean addNotice(Notice notice);
    
    // Retrieve all notices
    List<Notice> getAllNotices();
    
    // Retrieve a notice by its ID
    Notice getNoticeById(int noticeId);
    
    // Update an existing notice
    boolean updateNotice(Notice notice);
    
    // Delete a notice by its ID
    boolean deleteNotice(int NoticeID);
}
