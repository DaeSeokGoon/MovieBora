package content;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.ReviewDao;
import model.Review;
import service1.CommandProcess;

public class ReviewWrite implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
	
		ReviewDao rv = ReviewDao.getInstance();
		int reviewNo = rv.reviewNo();
		String reviewSubject = request.getParameter("reviewSubject");
		String reviewContent = request.getParameter("reviewContent");
		//String reviewDate = request.getParameter("reviewDate");
		//String reviewDel = request.getParameter("reviewDel");
		
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		int movieNo = Integer.parseInt(request.getParameter("movieNo"));
		
		Review review = new Review();
		review.setReviewNo(reviewNo);
		review.setReviewSubject(reviewSubject);
		review.setReviewContent(reviewContent);
		
		review.setMemberNo(memberNo);
		review.setMovieNo(movieNo);
		
		int result = rv.reviewInsert(review);
		movieNo = review.getMovieNo();
	
		
		request.setAttribute("result", result);
		request.setAttribute("movieNo", movieNo);
		return "reviewChk";
	}

}
