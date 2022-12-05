<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${result != 0}">
		<div style="font-size : 22px; font-weight : 444; margin-top : 123px; margin-left : 747px;">
			이미 작성된 리뷰가 존재합니다
		</div>
		<form action="reviewUpdateForm.ho">
			<div style="margin-top : 202px;">
				<input type="submit" class = "btn2" value="수정하기" style="width:39%;">
				<input type="hidden" value="${reviewNo}" name="reviewNo">
				<input type="hidden" value="${memberNo}" name="memberNo">
				<input type="hidden" value="${movieNo}" name="movieNo">
			</div>
			<div>
				<input type="button" class = "btn2" onclick="history.back()" value="뒤로가기" style="width:39%;">
			</div>
		</form>
	</c:if>
	
	<c:if test="${result == 0}">
		<form action="reviewWrite.ho">
			<input type="hidden" name="movieNo" value="${movieNo}">
			<input type="hidden" name="memberNo" value="${memberNo}">
			
			<!-- 처음 입력하면 ref/re_step/re_level 0인데 답변 게시글은 원본글의 ref/re_step/re_level을 값을 가지고 처리 -->
			<div align="center" style="margin-top : 123px;"> 
				<table>
					<caption style="font-size : 21px; font-weight : 456; padding : 8px;">리뷰 작성</caption>
				
					<tr style="padding : 6px;">
						<th>제목</th>
						<td><input type="text" name="reviewSubject" required="required" autofocus="autofocus"></td>
					</tr>
					<tr style="padding : 6px;">
						<th>내용</th>
						<td><textarea rows="5" cols="40" name="reviewContent" required="required"></textarea></td>
					</tr>
					<tr style="padding : 6px;">
						<th colspan="2"><input type="submit"style="background-color: purple; color: white;" value="작성완료"></th>
					</tr>
				</table>
				<div align="center" style="padding : 6px;">
					<input type="button" style="background-color: purple; color: white; width:334px;" onclick="history.back()" value="뒤로가기">
				</div>
			</div>
		</form>
	</c:if>
</body>
</html>