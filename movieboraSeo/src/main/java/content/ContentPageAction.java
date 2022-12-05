package content;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.StarsDao;
import model.Movie;
import service1.CommandProcess;

public class ContentPageAction implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {	
		HttpSession session = request.getSession();	
		int movieNo = Integer.parseInt(request.getParameter("movieNo"));

		StarsDao starsD = StarsDao.getInstance();
		Movie movie = starsD.selectAll(movieNo);
		
		request.setAttribute("movie", movie);
		request.setAttribute("movieNo", movieNo);
		
		return "contentPage";
	}
}
