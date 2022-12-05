<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="container">
	<h2 class="title">아이디 찾기 결과</h2>
		<c:if test="${member != null }">
			<p style="font-size : 22px; color: #333333;"> 아이디는 [ ${member.memberId } ] 입니다. </p>
			<input type="button" class="btn3" onclick="location.href='loginForm.do'" value="로그인 화면으로 돌아가기">	
		</c:if>
		<c:if test="${member == null }">
			<p style="font-size : 22px; color: #333333;"> 존재하지 않는 회원정보 입니다. </p>
			<input type="button" class="btn3" onclick="location.href='findForm.do'"value="아이디찾기">
		</c:if>
</div>
		
</body>
</html>