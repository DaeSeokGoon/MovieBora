package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;
import service1.CommandProcess;

public class UpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String memberId = (String) session.getAttribute("memberId");
		Member member = new Member();
		MemberDao md = MemberDao.getInstance();

		if (memberId.equals("master")) {
			int mno = Integer.parseInt(request.getParameter("MemberNo"));
			member = md.select(mno);
		} else {
			member = md.selectId(memberId);
		}
		request.setAttribute("member", member);
		
		return "updateForm";
	}
}
