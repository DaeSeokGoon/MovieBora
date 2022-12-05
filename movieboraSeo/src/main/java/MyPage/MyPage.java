package MyPage;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.MovieDao;
import dao.ReviewDao;
import dao.StarsDao;
import model.Member;
import model.Movie;
import model.Review;
import model.Stars;
import service1.CommandProcess;

public class MyPage implements CommandProcess 
{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) 
	{
		HttpSession session = request.getSession();
	
		if (session.getAttribute("memberId") != null)
		{
			int memberNo = (int) session.getAttribute("memberNo");
			String memberId = (String) session.getAttribute("memberId");
			
			MemberDao memberD = MemberDao.getInstance();
			Member member = memberD.selectMember(memberId);
			// 로그인한 애 정보
			
			StarsDao starsD = StarsDao.getInstance();
			int starsTotal = starsD.getTotal(memberId);
			// 로그인한 애 별점먹인 수
			List<Stars> StarsList = starsD.StarsList(memberId);
			// 로그인한 애 별점 리스트 
			
			ReviewDao reviewD = ReviewDao.getInstance();
			int reviewTotal = reviewD.getTotal(memberId);
			// 로그인한 애 리뷰 수
			List<Review> ReviewList = reviewD.ReviewList(memberId);
			// 로그인한 애 리뷰 리스트
			
			MovieDao movieD = MovieDao.getInstance();
			String movieName = "";
			List<String> movieNameList = new ArrayList<>();
				
			for(int i=0 ; i<StarsList.size() ; i++)
			{
				movieName = movieD.selectMovieName(StarsList.get(i).getMovieNo());
				movieNameList.add(movieName);
			}
			// 별점먹인 영화 리스트들의 이름 리스트
			
			int genreNo = 0;	
			double[] GenreScore = new double[8];
			double maxScore = 0;
			
			for(int i=0 ; i<GenreScore.length ; i++)
			{
				GenreScore[i] = starsD.getAvgScore(i+1, memberNo);
				if(GenreScore[i] > maxScore)
				{
					maxScore = GenreScore[i];
					genreNo = i+1;
				}
			}
			
			List<Movie> RecommendList = starsD.recommendPageList(memberNo, genreNo, 1, 4);
			// 장르 추천 영화 리스트

			request.setAttribute("member", member);
			request.setAttribute("starsTotal", starsTotal);
			request.setAttribute("reviewTotal", reviewTotal);
			request.setAttribute("starsList", StarsList);
			request.setAttribute("reviewList", ReviewList);
			request.setAttribute("movieNameList", movieNameList);
			request.setAttribute("recommendList", RecommendList);
		}
		
		return "myPage";
	}
}