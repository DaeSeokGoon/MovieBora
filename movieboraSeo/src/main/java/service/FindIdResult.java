package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service1.CommandProcess;

public class FindIdResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String memberName = request.getParameter("memberName");
		String memberEmail = request.getParameter("memberEmail");
	
		MemberDao md = MemberDao.getInstance();
		Member member = md.findId(memberName, memberEmail);		
		
		request.setAttribute("member", member);
		return "findIdResult";
	}

}
