package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;
import service1.CommandProcess;

public class LoginResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		String memberId = request.getParameter("memberId");
		String memberPass = request.getParameter("memberPass");
		
		MemberDao md = MemberDao.getInstance();  
		Member member = md.selectId(memberId);
		
		int result = 0;
		if(member==null||member.getMemberDel().equals("y"))
			result=-1;
		else {
			if(member.getMemberPass().equals(memberPass)) {
				int memberNo = member.getMemberNo();
				HttpSession session = request.getSession();
				session.setAttribute("memberId", memberId);
				session.setAttribute("memberNo", memberNo);
				result = 1;
			}else result=0;
		}
		request.setAttribute("result", result);
		return "loginResult";
	}
}
