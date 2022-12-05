package content;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MovieDao;
import dao.ReviewDao;

import model.Review;
import service1.CommandProcess;

public class ReviewContent implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) 
	{
		int reviewNo = Integer.parseInt(request.getParameter("reviewNo"));
		
		ReviewDao rd = ReviewDao.getInstance();
		MovieDao movieD = MovieDao.getInstance();
		Review review = rd.reviewContent(reviewNo); // 리뷰 내용 출력
		
		String movieName = movieD.selectMovieName(review.getMovieNo());
		
		review.setMovieName(movieName);
		
		request.setAttribute("review", review);

		return "reviewContent";
	}
}
