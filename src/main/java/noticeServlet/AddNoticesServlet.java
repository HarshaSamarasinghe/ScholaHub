package noticeServlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.oop.model.Notice;
import com.oop.services.iNoticeServices;
import com.oop.Util.noticeDBUtil;
/**
 * Servlet implementation class AddNoticesServlet
 */
@WebServlet("/AddNoticesServlet")
public class AddNoticesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch data from the request
        String nName = request.getParameter("nName");
        String nDescription = request.getParameter("nDescription");
        String nDate = request.getParameter("nDate");
        String nBatch = request.getParameter("nBatch");

        Notice notice = new Notice(0, nName, nDescription, nDate, nBatch);

        // Call the DB utility to save the notice
        iNoticeServices noticeService = new noticeDBUtil();
        boolean isSuccess = noticeService.addNotice(notice);

        // Redirect to a different page based on success or failure
        if (isSuccess) {
            response.sendRedirect("TeacherNoticeServlet"); 
        } else {
            response.sendRedirect("addNotice.jsp");
        }
    }

}
