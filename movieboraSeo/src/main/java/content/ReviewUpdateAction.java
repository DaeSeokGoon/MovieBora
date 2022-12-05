package content;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDao;
import model.Review;
import service1.CommandProcess;

public class ReviewUpdateAction implements CommandProcess 
{
	public String requestPro(HttpServletRequest request, HttpServletResponse response) 
	{
		int result = 0;
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		String reviewSubject = request.getParameter("reviewSubject");
		String reviewContent= request.getParameter("reviewContent");
		
		Review review = new Review();
		
		review.setReviewSubject(reviewSubject);
		review.setReviewContent(reviewContent);
		review.setReviewNo(reviewNo);
		
		ReviewDao rd = ReviewDao.getInstance();
		result = rd.reviewUpdate(review);
		
		request.setAttribute("result", result);
		request.setAttribute("reviewNo", reviewNo);
		
		return "reviewUpdate";
	}

}
