package projectf;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.oop.Util.CommonDBConnection;

public class StudentDAO {

    public void addStudent(Student student) throws SQLException, ClassNotFoundException {
        Connection conn = CommonDBConnection.getConnection();
        String sql = "INSERT INTO student_marks (studentid, studentname, examname, subjectname1, subjectmarks1, subjectname2, subjectmarks2, subjectname3, subjectmarks3) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, student.getStudentId());
        stmt.setString(2, student.getStudentName());
        stmt.setString(3, student.getExamName());
        stmt.setString(4, student.getSubjectName1());
        stmt.setInt(5, student.getSubjectMarks1());
        stmt.setString(6, student.getSubjectName2());
        stmt.setInt(7, student.getSubjectMarks2());
        stmt.setString(8, student.getSubjectName3());
        stmt.setInt(9, student.getSubjectMarks3());
        stmt.executeUpdate();
        conn.close();
    }

    public Student getStudentById(int studentId) throws SQLException, ClassNotFoundException {
        String sql = "SELECT * FROM student_marks WHERE studentid = ?";
        
        try (Connection connection = CommonDBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            
            preparedStatement.setInt(1, studentId);
            try (ResultSet resultSet = preparedStatement.executeQuery()) {
                if (resultSet.next()) {
                    // Student exists, map the result to a Student object
                    Student student = new Student();
                    student.setStudentId(resultSet.getInt("studentid"));
                    student.setStudentName(resultSet.getString("studentname"));
                    student.setExamName(resultSet.getString("examname"));
                    student.setSubjectName1(resultSet.getString("subjectname1"));
                    student.setSubjectMarks1(resultSet.getInt("subjectmarks1"));
                    student.setSubjectName2(resultSet.getString("subjectname2"));
                    student.setSubjectMarks2(resultSet.getInt("subjectmarks2"));
                    student.setSubjectName3(resultSet.getString("subjectname3"));
                    student.setSubjectMarks3(resultSet.getInt("subjectmarks3"));
                    return student;
                } else {
                    // Student ID not found
                    return null;
                }
            }
        }
    

    }

    public boolean updateStudent(Student student) throws SQLException, ClassNotFoundException {
        String sql = "UPDATE student_marks SET studentname = COALESCE(?, studentname), "
                   + "examname = COALESCE(?, examname), "
                   + "subjectname1 = COALESCE(?, subjectname1), "
                   + "subjectmarks1 = COALESCE(?, subjectmarks1), "
                   + "subjectname2 = COALESCE(?, subjectname2), "
                   + "subjectmarks2 = COALESCE(?, subjectmarks2), "
                   + "subjectname3 = COALESCE(?, subjectname3), "
                   + "subjectmarks3 = COALESCE(?, subjectmarks3) "
                   + "WHERE studentid = ?";

        try (Connection connection = CommonDBConnection.getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            // Set parameters
            preparedStatement.setString(1, student.getStudentName());
            preparedStatement.setString(2, student.getExamName());
            preparedStatement.setString(3, student.getSubjectName1());
            preparedStatement.setInt(4, student.getSubjectMarks1());
            preparedStatement.setString(5, student.getSubjectName2());
            preparedStatement.setInt(6, student.getSubjectMarks2());
            preparedStatement.setString(7, student.getSubjectName3());
            preparedStatement.setInt(8, student.getSubjectMarks3());
            preparedStatement.setInt(9, student.getStudentId());

            // Execute update
            int rowsUpdated = preparedStatement.executeUpdate();
            if (rowsUpdated > 0) {
                System.out.println("Update successful for student ID: " + student.getStudentId());
                return true; // Update successful
            } else {
                System.out.println("No rows updated. Check if the student ID exists: " + student.getStudentId());
                return false; // No update performed
            }
        }
    }



    public boolean deleteStudent(int studentId) throws SQLException, ClassNotFoundException {
        Connection conn = CommonDBConnection.getConnection();
        
        try {
            // Check if student exists
            String checkSql = "SELECT studentid FROM student_marks WHERE studentid = ?";
            PreparedStatement checkStmt = conn.prepareStatement(checkSql);
            checkStmt.setInt(1, studentId);
            ResultSet rs = checkStmt.executeQuery();
            
            if (!rs.next()) {
                // Student ID not found
                return false;
            }
            
            // Student exists, proceed to delete
            String deleteSql = "DELETE FROM student_marks WHERE studentid = ?";
            PreparedStatement deleteStmt = conn.prepareStatement(deleteSql);
            deleteStmt.setInt(1, studentId);
            deleteStmt.executeUpdate();
            
            return true;
        } finally {
            conn.close();
        }
    }

}
    // Methods for update and delete would go here as well

