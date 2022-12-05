<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="model.*, dao.*"%>
<!DOCTYPE html>
<html>
<head> 
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	MemberDao md = MemberDao.getInstance();
	
	for (int i = 1; i <= 200; i++) {
		Member member = new Member();
		
		member.setMemberNo(i);
		member.setMemberId("memberId"+i);
		member.setMemberPass("1234");
		member.setMemberName("memberName"+i);
		member.setMemberNickname("memberNickname"+i);
		member.setMemberEmail(i+"@"+i);
		member.setMemberProfile("memberProfile"+i);
		member.setMemberGender("m");
		
		md.insert(member);
	}
%>
</body>
</html>