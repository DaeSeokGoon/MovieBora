package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service1.CommandProcess;

public class Confirm2 implements CommandProcess {
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String memberId = request.getParameter("memberId");
		MemberDao md = MemberDao.getInstance();
		Member member = md.selectId(memberId);
		String msg = "";
		if (member == null ) msg = "사용가능한 아이디입니다!";
		else msg = "사용중인 아이디 입니다 다른 아이디를 쓰세요~";
		
		request.setAttribute("msg", msg);
		return "confirm2";
	}

}
