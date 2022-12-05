package MainPage;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MovieDao;
import dao.StarsDao;
import model.Movie;
import service1.CommandProcess;

public class MainPage implements CommandProcess 
{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) 
	{	
		// 영화 리스트 조회
		MovieDao movieD = MovieDao.getInstance();
		StarsDao starsD = StarsDao.getInstance();
		List<Movie> TotalMovieList = starsD.TotalMovieList();
		List<Movie> TopList = starsD.TopList();
		List<Movie> ManList = starsD.ManList();
		List<Movie> WomanList = starsD.WomanList();
		
		int genreNo = 0;
		double[] GenreScore = new double[8];
		double maxScore = 0;
		
		for(int i=0 ; i<GenreScore.length ; i++)
		{
			GenreScore[i] = starsD.getAvgScore2(i+1);
			
			if(GenreScore[i] > maxScore)
			{
				maxScore = GenreScore[i];
				genreNo = i+1;
			}
		}
		
		List<Movie> GenreMovieList = starsD.GenreMovieList(genreNo);

		// paging : start
		final int ROW_PER_PAGE = 5; // 한 페이지에 10개씩
		final int PAGE_PER_BLOCK = 5; // 한 블럭에 5페이지

		String pageNum = request.getParameter("pageNum");
		String pageNum1 = request.getParameter("pageNum1");
		String pageNum2 = request.getParameter("pageNum2");
		String pageNum3 = request.getParameter("pageNum3");
		String pageNum4 = request.getParameter("pageNum4");
		
		if (pageNum == null || pageNum.equals("")) 
		{
			pageNum = "1";
		}
		
		if (pageNum1 == null || pageNum1.equals("")) 
		{
			pageNum1 = "1";
		}
		
		if (pageNum2 == null || pageNum2.equals("")) 
		{
			pageNum2 = "1";
		}
		
		if (pageNum3 == null || pageNum3.equals("")) 
		{
			pageNum3 = "1";
		}
		
		if (pageNum4 == null || pageNum4.equals("")) 
		{
			pageNum4 = "1";
		}
		// 현재 페이지
		
		int currentPage = Integer.parseInt(pageNum);
		int currentPage1 = Integer.parseInt(pageNum1);
		int currentPage2 = Integer.parseInt(pageNum2);
		int currentPage3 = Integer.parseInt(pageNum3);
		int currentPage4 = Integer.parseInt(pageNum4);
	
		int movieTotal = TotalMovieList.size();
		int movieTotal1 = TopList.size();
		int movieTotal2 = ManList.size();
		int movieTotal3 = WomanList.size();
		int movieTotal4 = GenreMovieList.size();
		// 총 갯수

		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		int startRow1 = (currentPage1 - 1) * ROW_PER_PAGE + 1;
		int startRow2 = (currentPage2 - 1) * ROW_PER_PAGE + 1;
		int startRow3 = (currentPage3 - 1) * ROW_PER_PAGE + 1;
		int startRow4 = (currentPage4 - 1) * ROW_PER_PAGE + 1;
		// 시작번호 : (페이지번호 - 1) * 페이지당 갯수 + 1
		
		int endRow = startRow + ROW_PER_PAGE - 1;
		int endRow1 = startRow1 + ROW_PER_PAGE - 1;
		int endRow2 = startRow2 + ROW_PER_PAGE - 1;
		int endRow3 = startRow3 + ROW_PER_PAGE - 1;
		int endRow4 = startRow4 + ROW_PER_PAGE - 1;
		// 끝번호 : 시작번호 + 페이지당개수 - 1
		
		List<Movie> TotalMoviePageList = starsD.TotalMoviePageList(startRow, endRow);
		List<Movie> TopPageList = starsD.TopPageList(startRow1, endRow1); 
		List<Movie> ManPageList = starsD.ManPageList(startRow2, endRow2);
		List<Movie> WomanPageList = starsD.WomanPageList(startRow3, endRow3);
		List<Movie> GenreTotalMoviePageList = starsD.GenreTotalMoviePageList(genreNo, startRow4, endRow4);
		
		int totalPage = (int)Math.ceil((double)movieTotal/ROW_PER_PAGE);
		int totalPage1 = (int)Math.ceil((double)movieTotal1/ROW_PER_PAGE);
		int totalPage2 = (int)Math.ceil((double)movieTotal2/ROW_PER_PAGE);
		int totalPage3 = (int)Math.ceil((double)movieTotal3/ROW_PER_PAGE);
		int totalPage4 = (int)Math.ceil((double)movieTotal4/ROW_PER_PAGE);
		// 총 페이지 수 , Math.ceil : 현재 실수보다 큰 정수
					
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;
		int startPage1 = currentPage1 - (currentPage1 - 1) % PAGE_PER_BLOCK;
		int startPage2 = currentPage2 - (currentPage2 - 1) % PAGE_PER_BLOCK;
		int startPage3 = currentPage3 - (currentPage3 - 1) % PAGE_PER_BLOCK;
		int startPage4 = currentPage4 - (currentPage4 - 1) % PAGE_PER_BLOCK;
		// 시작페이지 : 현재페이지 - (현재페이지 - 1) % 10
		
		int endPage = startPage + PAGE_PER_BLOCK - 1;
		int endPage1 = startPage1 + PAGE_PER_BLOCK - 1;
		int endPage2 = startPage2 + PAGE_PER_BLOCK - 1;
		int endPage3 = startPage3 + PAGE_PER_BLOCK - 1;
		int endPage4 = startPage4 + PAGE_PER_BLOCK - 1;
		// 끝페이지 : 시작페이지 + 블록당페이지 수 -1
		
		
		if (endPage > totalPage) 
		{
			endPage = totalPage;
		}
		if (endPage1 > totalPage1) 
		{
			endPage1 = totalPage1;
		}
		if (endPage2 > totalPage2) 
		{
			endPage2 = totalPage2;
		}
		if (endPage3 > totalPage3) 
		{
			endPage3 = totalPage3;
		}
		if (endPage4 > totalPage4) 
		{
			endPage4 = totalPage4;
		}
		// 총 페이지보다 큰 endPage는 나올 수 없다.
		// paging : end
		
		request.setAttribute("TotalMoviePageList", TotalMoviePageList);
		request.setAttribute("TopPageList", TopPageList);
		request.setAttribute("ManPageList", ManPageList);
		request.setAttribute("WomanPageList", WomanPageList);
		request.setAttribute("GenreTotalMoviePageList", GenreTotalMoviePageList);
		// movie list
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageNum1", pageNum1);
		request.setAttribute("pageNum2", pageNum2);
		request.setAttribute("pageNum3", pageNum3);
		request.setAttribute("pageNum4", pageNum4);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("currentPage1", currentPage1);
		request.setAttribute("currentPage2", currentPage2);
		request.setAttribute("currentPage3", currentPage3);
		request.setAttribute("currentPage4", currentPage4);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		request.setAttribute("startPage", startPage);
		request.setAttribute("startPage1", startPage1);
		request.setAttribute("startPage2", startPage2);
		request.setAttribute("startPage3", startPage3);
		request.setAttribute("startPage4", startPage4);
		request.setAttribute("endPage", endPage);
		request.setAttribute("endPage1", endPage1);
		request.setAttribute("endPage2", endPage2);
		request.setAttribute("endPage3", endPage3);
		request.setAttribute("endPage4", endPage4);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("totalPage1", totalPage1);
		request.setAttribute("totalPage2", totalPage2);
		request.setAttribute("totalPage3", totalPage3);
		request.setAttribute("totalPage4", totalPage4);
		// paging param

		return "mainPage";
	}
}