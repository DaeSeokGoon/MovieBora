package content;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDao;
import model.Review;
import service1.CommandProcess;

public class ReviewForm implements CommandProcess 
{
	public String requestPro(HttpServletRequest request, HttpServletResponse response) 
	{		
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		int movieNo = Integer.parseInt(request.getParameter("movieNo"));
		int reviewNo = 0;
		int result = 0;		
		
		Review review = new Review();
		review.setMemberNo(memberNo);
		review.setMovieNo(movieNo);	
		ReviewDao rd = ReviewDao.getInstance();
		result = rd.chkReview(review);
		
		if(result >= 1) {
			review = rd.chkReviewNo(review);
			reviewNo = review.getReviewNo();
			result = 1;
		}else { result = 0; }
		request.setAttribute("result", result); // 리뷰글 여부 확인
		request.setAttribute("movieNo", movieNo); // 무비넘버
		request.setAttribute("memberNo", memberNo); // 멤버넘버
		request.setAttribute("reviewNo", reviewNo); // 조회한 리뷰 넘버	
		
		return "reviewForm";			
	}
}
