package content;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MovieDao;
import model.Movie;
import service1.CommandProcess;

public class ContentAction implements CommandProcess 
{
	public String requestPro(HttpServletRequest request, HttpServletResponse response)	{
		HttpSession session = request.getSession();
		int memberNo = (int)session.getAttribute("memberNo");					
		
		// 멤버넘버 세션 생성		
		int movieNo = Integer.parseInt(request.getParameter("movieNo"));
		MovieDao md = MovieDao.getInstance();
		
		Movie movie = md.select(movieNo);
		
		request.setAttribute("memberNo", memberNo);
		request.setAttribute("movie", movie);
		
		return "content";
	}
}
