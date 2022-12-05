package content;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.ReviewDao;
import model.Review;
import service1.CommandProcess;

public class ReviewListAction implements CommandProcess 
{
	public String requestPro(HttpServletRequest request, HttpServletResponse response) 
	{
		int movieNo = Integer.parseInt(request.getParameter("movieNo"));
		
		final int ROW_PER_PAGE = 10;
		// 페이지당 행 갯수
		final int PAGE_PER_BLOCK = 10;
		// 블럭당 페이지 갯수
		String pageNum = request.getParameter("pageNum");
		//페이지 넘버 --- 2
		if (pageNum == null || pageNum.equals("")) pageNum = "1";
		//페이지 넘버 값 없으면 1페이지
		int currentPage = Integer.parseInt(pageNum);
		// 현제 페이지 = 페이지넘버 = 1  --- 13 ----2
		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		// 시작행 = 1 - 1 * 0 +1  = 1 --- 121 ---- 11
		int endRow = startRow + ROW_PER_PAGE - 1;	
		// 마지막행 = 1 + 10 - 1  = 10 --- 130 ---- 20
		ReviewDao rd = ReviewDao.getInstance();
		int total  = rd.getTotalReview(movieNo); 
		// 전체 행 갯수 --- 200 --- 41
		int totalPage = (int)Math.ceil((double)total / ROW_PER_PAGE);
		// 토탈페이지 = 200 / 10 = 20 --- 20 --- 5
		
		List<Review> list = rd.ReviewContents(startRow, endRow , movieNo);
		int countAll = rd.countAll(movieNo, startRow, endRow);
		int countDel = rd.countDel(movieNo, startRow, endRow);
		
		int ShowSize = countAll - countDel;
		
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;
		// 시작 페이지 = 현재 페이지 - ( 현재페이지 -1 ) % 블럭당 페이지  = 1 --- 11
		int endPage = startPage + PAGE_PER_BLOCK - 1;  
		// 끝 페이지 = 1 + 10 -1 = 10 --- 20
		if (endPage > totalPage) 
		{
			endPage = totalPage;
		}
		
		// jsp에서 사용할 데이터 전달
		request.setAttribute("list", list);
		request.setAttribute("ShowSize", ShowSize);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		request.setAttribute("movieNo", movieNo);
			
		return "reviewList";
	}
}
