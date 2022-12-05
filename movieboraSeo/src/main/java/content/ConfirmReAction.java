package content;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDao;
import service1.CommandProcess;

public class ConfirmReAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));		
		ReviewDao rd = ReviewDao.getInstance();
		result = rd.confirmReSelect(memberNo);
		
		request.setAttribute("result", result);		
		
		return "confirmRe";
	}

}
