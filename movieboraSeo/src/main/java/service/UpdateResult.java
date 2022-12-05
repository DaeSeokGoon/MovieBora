package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import dao.MemberDao;
import model.Member;
import service1.CommandProcess;

public class UpdateResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		
			String memberId = null;
			memberId = request.getParameter("memberId");
			String memberEmail = request.getParameter("memberEmail");
			String memberPass = request.getParameter("memberPass");
			String memberName = request.getParameter("memberName");
			String memberNickname = request.getParameter("memberNickname");
			String memberGender = request.getParameter("memberGender");
			String memberProfile = request.getParameter("memberProfile");			
			// member 생성
			Member member = new Member();
			// member에 수정내용 세팅
			member.setMemberId(memberId);
			member.setMemberEmail(memberEmail);
			member.setMemberPass(memberPass);
			member.setMemberName(memberName);
			member.setMemberNickname(memberNickname);
			member.setMemberGender(memberGender);
			member.setMemberProfile(memberProfile);;
			
		// memberDao 생성 및 update
			MemberDao md = MemberDao.getInstance();
			int result = md.update(member);
			request.setAttribute("result", result);		
			return "updateResult";
	}
}
