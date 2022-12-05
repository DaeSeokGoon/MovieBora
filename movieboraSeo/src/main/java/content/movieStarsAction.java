package content;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MovieDao;
import dao.StarsDao;
import model.Stars;
import service1.CommandProcess;

public class movieStarsAction implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		double score = Integer.parseInt(request.getParameter("score"));
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		int movieNo = Integer.parseInt(request.getParameter("movieNo"));
		int scorechk = 0;
		int result = 0;
		
		Stars stars = new Stars();
		stars.setScore(score);
		stars.setMovieNo(movieNo);
		stars.setMemberNo(memberNo);
		
		StarsDao sd = StarsDao.getInstance();

		scorechk = sd.scoreChk(stars);
		
		if(scorechk == 0) {	//입력
			sd.insertScore(stars);
			result = 0;
		}else {	//수정
			sd.updateScore(stars);
			result = 1;
		}

		request.setAttribute("movieNo", movieNo);
		request.setAttribute("result", result);
		
		return "starsConfirm";
	}

}
