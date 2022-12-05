package MainPage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MovieDao;
import dao.StarsDao;
import model.Movie;
import service1.CommandProcess;

public class SearchResult implements CommandProcess 
{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
	{
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
			
		MovieDao movieD = MovieDao.getInstance();
		StarsDao starsD = StarsDao.getInstance();
			
		List<Movie> resultMoiveList = starsD.resultMovieList(searchKey, searchValue);
			
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
			
		int total = resultMoiveList.size(); // 총 추천 영화 수
		int totalPage = (int) Math.ceil((double) total / ROW_PER_PAGE); // 총 페이지 수
		
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK; // 한 블럭 당 시작 페이지(1, 11, 21, ...)
		int endPage = startPage + PAGE_PER_BLOCK - 1; // 한 블럭 당 마지막 페이지

		if (endPage > totalPage)
		{
			endPage = totalPage; // 마지막 페이지가 총 페이지 수 보다 클 경우
		}
		
		String startRow2 = String.valueOf(startRow);
		String endRow2 = String.valueOf(endRow);
		
		List<Movie> resultMoviePageList = starsD.resultMoviePageList(searchKey, searchValue, startRow2, endRow2);
			
		request.setAttribute("resultMoviePageList", resultMoviePageList);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("total", total);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		
		request.setAttribute("searchKey", searchKey);
		request.setAttribute("searchValue", searchValue);
		
		return "searchResult";
	}
}
