package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;
import service1.CommandProcess;

public class LoginAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		int result = 0;
		String memberId = request.getParameter("memberId");
		String memberPass = request.getParameter("memberPass");
		String memberNo = request.getParameter("memberNo");
		MemberDao md = MemberDao.getInstance();
		Member member = md.selectId(memberId);
		if (member == null || member.getMemberDel().equals("y"))
			result = -1;	// 없는 아이디거나 탈퇴한 아이디
			else {
				if (member.getMemberPass().equals(memberPass)) {
					// jsp에서 session이 내장 객체지만 java에서는 객체를 생성하여 사용해야한다
					HttpSession session = request.getSession();
					session.setAttribute("memberId", memberId);
					session.setAttribute("memberNo", memberNo);
					result = 1;	// 로그인 성공
				}	// else 0이면 암호가 틀렸다
			}
			request.setAttribute("result", result);
		return "login";
	}
}

