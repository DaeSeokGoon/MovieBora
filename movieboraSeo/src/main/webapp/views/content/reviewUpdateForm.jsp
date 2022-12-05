<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="reviewUpdate.ho">
		<input type="hidden" name="movieNo" value="${review.movieNo}">
		<input type="hidden" name="memberNo" value="${review.memberNo}">
		<input type="hidden" name="reviewNo" value="${review.reviewNo}">
		<!-- 처음 입력하면 ref/re_step/re_level 0인데 답변 게시글은 원본글의 ref/re_step/re_level을 값을 가지고 처리 -->

		<table style="margin-top : 12px; margin-left : 600px; width : 33%">
			<caption style="font-size : 21px; font-weight : 444; margin-top : 64px; padding : 8px;">리뷰 수정하기</caption>
			<tr><th style="padding : 7px;">제목</th>	<td style="padding : 7px;"><input type="text" name="reviewSubject"	value="${ review.reviewSubject}"></td></tr>
			<tr><th style="padding : 7px;">내용</th>	<td style="padding : 7px;"><textarea rows="5" cols="40" name="reviewContent">${ review.reviewContent}</textarea></td></tr>
			<tr><th colspan="2" style="padding : 7px;"><input type="submit" style="background-color: purple; color: white; padding : 7px;" value="작성완료"></th></tr>
		</table>

	</form>
</body>
</html>