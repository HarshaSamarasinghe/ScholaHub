package com.oop.Util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.oop.model.Notice;
import com.oop.services.iNoticeServices;


public class noticeDBUtil implements iNoticeServices {

    // Database connection properties
    private static Connection con = null;
    private static PreparedStatement pstmt = null;
    private static ResultSet rs = null;

    // Add Notice to the database
    @Override
    public boolean addNotice(Notice notice) {
        boolean isSuccess = false;
        try {
            con = CommonDBConnection.getConnection();
            String sql = "INSERT INTO notice (nName, nDate, nDescription, nBatch) VALUES (?, ?, ?, ?)";
            pstmt = con.prepareStatement(sql);

            pstmt.setString(1, notice.getnName());
            pstmt.setString(2, notice.getnDate());
            pstmt.setString(3, notice.getnDescription());
            pstmt.setString(4, notice.getnBatch());

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
    public List<Notice> getAllNotices() {
        List<Notice> noticeList = new ArrayList<>();

        try {
            con = CommonDBConnection.getConnection();
            String sql = "SELECT * FROM notice";
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                int NoticeID = rs.getInt("NoticeID");
                String nName = rs.getString("nName");
                String nDate = rs.getString("nDate");
                String nDescription = rs.getString("nDescription");
                String nBatch = rs.getString("nBatch");

                Notice notice = new Notice(NoticeID, nName, nDate, nDescription, nBatch);
                noticeList.add(notice);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }

        return noticeList;
    }

    // Get Notice by ID
    @Override
    public Notice getNoticeById(int noticeId) {
        Notice notice = null;
        try {
            con = CommonDBConnection.getConnection();
            String sql = "SELECT * FROM notice WHERE NoticeID=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, noticeId);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                int NoticeID = rs.getInt("NoticeID");
                String nName = rs.getString("nName");
                String nDate = rs.getString("nDate");
                String nDescription = rs.getString("nDescription");
                String nBatch = rs.getString("nBatch");
                notice = new Notice(NoticeID, nName, nDate, nDescription, nBatch);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeResources();
        }
        return notice;
    }

    // Update Notice
    @Override
    public boolean updateNotice(Notice notice) {
        boolean isSuccess = false;
        try {
            con = CommonDBConnection.getConnection();
            String sql = "UPDATE notice SET nName=?, nDate=?, nDescription=?, nBatch=? WHERE NoticeID=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, notice.getnName());
            pstmt.setString(2, notice.getnDate());
            pstmt.setString(3, notice.getnDescription());
            pstmt.setString(4, notice.getnBatch());
            pstmt.setInt(5, notice.getNoticeID()); // Assuming getNoticeID() method exists in Notice

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
    public boolean deleteNotice(int NoticeID) {
        boolean isSuccess = false;
        try {
            con = CommonDBConnection.getConnection();
            String sql = "DELETE FROM notice WHERE NoticeID=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, NoticeID);
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
}
