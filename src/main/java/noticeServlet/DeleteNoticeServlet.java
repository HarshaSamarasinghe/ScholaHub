package noticeServlet;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.oop.services.iNoticeServices;
import com.oop.Util.noticeDBUtil;

/**
 * Servlet implementation class DeleteNoticeServlet
 */
@WebServlet("/DeleteNoticeServlet")
public class DeleteNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    // Fetch notice ID from the request
	    int NoticeID = Integer.parseInt(request.getParameter("NoticeID"));

	    // Call the service to delete the notice
	    iNoticeServices noticeService = new noticeDBUtil();
	    boolean isSuccess = noticeService.deleteNotice(NoticeID);

	    // Redirect or send a success response based on the result
	    if (isSuccess) {
	        response.setStatus(HttpServletResponse.SC_OK);
	    } else {
	        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to delete notice");
	    }
	}

}