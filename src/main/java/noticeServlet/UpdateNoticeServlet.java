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
 * Servlet implementation class UpdateNoticeServlet
 */
@WebServlet("/UpdateNoticeServlet")
public class UpdateNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Fetch data from the request
        int NoticeID = Integer.parseInt(request.getParameter("NoticeID"));
        String nName = request.getParameter("nName");
        String nDate = request.getParameter("nDate");
        String nDescription = request.getParameter("nDescription");
        String nBatch = request.getParameter("nBatch");


        // Call the DB utility to update the notice
        iNoticeServices noticeService = new noticeDBUtil();
        Notice existingProduct = noticeService.getNoticeById(NoticeID);
        
        if(existingProduct != null) {
        	
        	Notice updatedNotice = new Notice(NoticeID, nName, nDate, nDescription, nBatch);
        	
            // Update the product in the database
            boolean success = noticeService.updateNotice(updatedNotice);
        

        // Redirect to a different page based on success or failure
        if (success) {
            // Redirect to display-product.jsp
            response.sendRedirect("TeacherNoticeServlet");
        } else {
            // Handle failure to update
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to update notice");
        }
        }else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Notice not found");
        }
        	
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve product ID from request parameters
        int NoticeID = Integer.parseInt(request.getParameter("NoticeID"));

        // Get the product from the database
        iNoticeServices noticeService = new noticeDBUtil();
        Notice notice = noticeService.getNoticeById(NoticeID);

        if (notice != null) {
            // Set product as an attribute
            request.setAttribute("notice", notice);

            // Forward the request
            request.getRequestDispatcher("update_notice.jsp").forward(request, response);
        } else {
            // Handle case when product is not found
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Product not found");
        }
    }

}
