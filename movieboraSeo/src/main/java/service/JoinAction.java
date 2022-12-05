package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service1.CommandProcess;

public class JoinAction implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		MemberDao memberNum = MemberDao.getInstance();
		int result = 0;
		int memberNo = memberNum.memberNo();
		String memberId = request.getParameter("memberId");
		String memberName = request.getParameter("memberName");
		String memberEmail = request.getParameter("memberEmail");
		String memberNickname = request.getParameter("memberNickname");
		String memberPass = request.getParameter("memberPass");	
		String memberGender = request.getParameter("memberGender");
		String memberProfile = request.getParameter("memberProfile");
		
		Member member = new Member();	//member 화면에서 입력한 데이터를 받기 위한 객체(도시락)
		member.setMemberNo(memberNo);
		member.setMemberId(memberId);
		member.setMemberName(memberName);
		member.setMemberEmail(memberEmail);
		member.setMemberNickname(memberNickname);
		member.setMemberPass(memberPass);
		member.setMemberGender(memberGender);
		member.setMemberProfile(memberProfile);
		
		MemberDao md = MemberDao.getInstance();
		Member member1 = md.selectId(memberId);  // member2 DB에서 중복인지 확인하기 위한 객체
		if(member1 == null) result = md.insert(member);
		else result = -1;   // 이미 있는 데이터
		request.setAttribute("result", result);
		return "join";
	}
}
