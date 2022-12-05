package content;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDao;
import model.Review;
import service1.CommandProcess;

public class ReviewUpdateForm implements CommandProcess 
{
	public String requestPro(HttpServletRequest request, HttpServletResponse response) 
	{
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));			
		
		ReviewDao rd = ReviewDao.getInstance();		
		Review review = rd.reviewContent(reviewNo);		
		
		request.setAttribute("review", review);		
		
		return "reviewUpdateForm";
	}

}
