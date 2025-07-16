package noticeServlet;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.oop.Util.noticeDBUtil;
import com.oop.model.Notice;

/**
 * Servlet implementation class TeacherNoticeServlet
 */
@WebServlet("/TeacherNoticeServlet")
public class TeacherNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Fetch all notices using noticeDBUtil
        noticeDBUtil noticeDB = new noticeDBUtil();
        List<Notice> noticeList = noticeDB.getAllNotices();
        
        // Set the notice list as an attribute to be accessed in the JSP
        request.setAttribute("noticeList", noticeList);
        
        // Forward to the JSP page
        request.getRequestDispatcher("teacherNotice.jsp").forward(request, response);
    }

}
