<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="memberNo" value="${sessionScope.memberNo }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript" src="../../js/jquery.js"></script>
	<script type="text/javascript">
		function chkMemberNo()
		{
			if(!frm40.memberNo.value)
			{ 
				alert("로그인을 해주세요")
				return false;
			}
		}
	</script>
</head>
<body>
	<table align="center">
		<c:if test="${ShowSize == 0}">
			<div style="font-size : 21px; font-weight : 484; margin-top : 28px; padding : 21px; text-align : center;">
				작성된 리뷰가 없습니다
			</div>
		</c:if>
		
		<c:if test="${ShowSize != 0}">
			<caption style="font-size : 21px; font-weight : 484; margin-top : 12px; padding : 21px;">리뷰 목록</caption>
			<tr>
				<th style="padding : 2px;">닉네임</th>
				<th style="padding : 2px;">제목</th>
				<th style="padding : 2px;">작성일</th>
			</tr>
		
		<c:forEach var="review" items="${list }">
			<tr>
				<td style="text-align : center; padding : 2px;">${review.memberNickname }</td>
				<td style="text-align : center; padding : 2px;"><a href="reviewContent.ho?reviewNo=${review.reviewNo }">${review.reviewSubject}</a></td>
				<td style="text-align : center; padding : 2px;">${review.reviewDate }</td>
			</tr>
		</c:forEach>
		</c:if>
	</table>
	<div align="center" style="padding : 12px;">
		<c:if test="${startPage > PAGE_PER_BLOCK }">
			<button onclick="location.href='reviewList.ho?pageNum=${startPage - 1}&movieNo=${movieNo }'">이전</button>
		</c:if>
		
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${currentPage == i }">
				<button onclick="location.href='reviewList.ho?pageNum=${i}&movieNo=${movieNo }'" style="background: blue; color: white;">${i }</button>
			</c:if>
			<c:if test="${currentPage != i }">
				<button onclick="location.href='reviewList.ho?pageNum=${i}&movieNo=${movieNo }'">${i }</button>
			</c:if>		
		</c:forEach>
		<c:if test="${totalPage > endPage }">
			<button onclick="location.href='reviewList.ho?pageNum=${endPage + 1}&movieNo=${movieNo }'">다음</button>
		</c:if>
	</div>	
	<div align="center" style="width : 39%; margin-left : 567px; margin-top : 91px; padding : 21px;">	
		<input type="button" style="background-color: purple; color: white;" onclick="location.href='contentPage.ho?movieNo=${movieNo}'" value="뒤로가기">
		<form action="reviewForm.ho" method="post" name="frm40" onsubmit="return chkMemberNo()">
			<input type="hidden" name="memberNo" value="${memberNo}">
			<input type="hidden" name="movieNo" value="${movieNo}">
			<input type="submit" style="background-color: purple; color: white;" value="리뷰작성">
		</form>	
	</div>
</body>
</html>