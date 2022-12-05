package content;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDao;
import service1.CommandProcess;

public class ReviewDeleteAction implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
	
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		int movieNo = Integer.parseInt(request.getParameter("movieNo"));
		ReviewDao rd = ReviewDao.getInstance();
		int result = rd.reviewDelete(reviewNo);
		
		request.setAttribute("result", result);
		request.setAttribute("movieNo", movieNo);
		
		return "reviewDelete";
	}

}
