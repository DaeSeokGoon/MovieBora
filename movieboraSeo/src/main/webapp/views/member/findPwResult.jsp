rkwur<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
		p { font-size: 22px; color: #333333;}
</style>
</head>
<body>
<div class="container">
	<h2 class="title">비밀번호 찾기 결과</h2>
		<c:if test="${member != null }">
			<p> 비밀번호는 [ ${member.memberPass } ] 입니다. </p>
			<input type="button" class="btn3" onclick="location.href='loginForm.do'" value="로그인 화면으로 돌아가기">	
		</c:if>
		<c:if test="${member == null }">
			<p> 존재하지 않는 회원정보 입니다. </p>
			<input type="button" class="btn3" onclick="location.href='findForm.do'"value="아이디찾기">
		</c:if>
	</div>
</body>
</html>