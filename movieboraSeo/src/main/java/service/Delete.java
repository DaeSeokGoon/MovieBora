package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import service1.CommandProcess;

public class Delete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String memberId = (String)session.getAttribute("memberId");
		int memberNo = 0;
		int result = 0;
		MemberDao md = MemberDao.getInstance();
		if (memberId.equals("admin")) {
			memberNo = Integer.parseInt(request.getParameter("memberNo"));
			result = md.delete(memberNo);
			
		} else {
			if(memberId!=null) {
				memberNo = (int) session.getAttribute("memberNo");
				result = md.delete(memberNo);
				if(result>0) session.invalidate();
			}
		}
		request.setAttribute("result", result);
		return "delete";
	}
}
