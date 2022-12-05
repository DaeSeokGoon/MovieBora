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
import model.Stars;
import service1.CommandProcess;

public class MyRecommend implements CommandProcess 
{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) 
	{
		HttpSession session = request.getSession();

		if (session.getAttribute("memberId") != null) 
		{
			int memberNo = (int) session.getAttribute("memberNo");
			String memberId = (String) session.getAttribute("memberId");
			
			//
			MemberDao memberD = MemberDao.getInstance();
			Member member = memberD.select(memberNo);
			
			StarsDao starsD = StarsDao.getInstance();
			int starsTotal = starsD.getTotal(memberId);
			
			ReviewDao reviewD = ReviewDao.getInstance();
			int reviewTotal = reviewD.getTotal(memberId);
			// 공통
			
			MovieDao movieD = MovieDao.getInstance();
			List<Stars> StarsList = starsD.StarsList(memberId);
			
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
			
			List<Movie> recommendPageListTotal = starsD.recommendPageListTotal(memberNo, genreNo);

			final int ROW_PER_PAGE = 4; // 한 페이지에 게시글 6개 씩
			final int PAGE_PER_BLOCK = 4; // 한 블럭에 5페이지 씩

			String pageNum = request.getParameter("pageNum"); // 페이지 번호
			
			if (pageNum == null || pageNum.equals("")) // 페이지 초기값 1로 설정
			{
				pageNum = "1";
			}
			
			int currentPage = Integer.parseInt(pageNum); // 현재 페이지

			int startRow = (currentPage - 1) * ROW_PER_PAGE + 1; // 게시글의 시작 번호(변수 num의 제일 마지막)
			int endRow = startRow + ROW_PER_PAGE - 1; // 게시글의 마지막 번호(변수 num = 1)
			
			int total = recommendPageListTotal.size(); // 총 추천 영화 수
			int totalPage = (int) Math.ceil((double) total / ROW_PER_PAGE); // 총 페이지 수
			
			int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK; // 한 블럭 당 시작 페이지(1, 11, 21, ...)
			int endPage = startPage + PAGE_PER_BLOCK - 1; // 한 블럭 당 마지막 페이지

			if (endPage > totalPage)
			{
				endPage = totalPage; // 마지막 페이지가 총 페이지 수 보다 클 경우
			}
			
			List<Movie> recommendPageList = starsD.recommendPageList(memberNo, genreNo, startRow, endRow);
			
			request.setAttribute("member", member);
			request.setAttribute("recommendPageList", recommendPageList);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("total", total);
			request.setAttribute("starsTotal", starsTotal);
			request.setAttribute("reviewTotal", reviewTotal);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		}
		return "myRecommend";
	}
}