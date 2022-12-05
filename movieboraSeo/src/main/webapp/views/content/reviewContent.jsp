<%@ page language="java" contentType="text/html;charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style type="text/css">
		@import url("star.css")
	</style>
	<c:set var="memberNo" value="${sessionScope.memberNo }"></c:set>
	<script type="text/javascript" src="../../js/jquery.js"></script>
	<script type="text/javascript">
		function memberNoChk(){
			if(frm20.memberNo.value != frm20.memberNoSe.value ){ 
				alert("접근권한이 없습니다.") 
				return false;
				}
			}
		function del(reviewNo,movieNo){
			if(frm20.memberNo.value != frm20.memberNoSe.value){
				alert("삭제 권한이 없습니다.")
				return false;
			} else {
				location.href="reviewDelete.ho?reviewNo="+reviewNo+"&movieNo="+movieNo;
			}
		}
	</script>
</head>
<body>
	<div id="content">
		<div class="pic">
			<img src="../../mb_image/${review.movieNo}.jpg" alt="포스터">
		</div>
		<div class="info">
			<p style="padding : 8px; font-size : 21px; font-weight : 555;"> ${review.movieName} </p>
			<p style="padding : 4px;"> 작성자 : ${review.memberNickname} </p>
			<p style="padding : 4px;"> 번호 : ${review.reviewNo} </p>
			<p style="padding : 4px;"> 제목 : ${review.reviewSubject} </p>
			<p style="padding : 4px;"> 내용 : ${review.reviewContent} </p>
			<p style="padding : 4px;"> 작성일 : ${review.reviewDate} </p>
		</div>
		<div class ="info2">
			<button style="background-color: purple; color: white; width:55%; height : 28px; padding : 2px; border : none;" onclick="location.href='reviewList.ho?movieNo=${review.movieNo}'">
				리뷰 목록으로 가기
			</button>
		</div>
		<div style="width: 39%; text-align:center;">
			<form action="reviewUpdateForm.ho" method="post" name="frm20" onsubmit="return memberNoChk()">
				<div class="subm">
					<input type="hidden" value="${memberNo}" name="memberNoSe">
				</div>
				<div class="subm">
					<input type="hidden" value="${review.memberNo}" name="memberNo">
					<input type="hidden" value="${review.movieNo}" name="movieNo">
					<input type="hidden" value="${review.reviewNo}" name="reviewNo">
				</div>
				<div>
					<input type="submit" class="btn2" value="수정하기">
				</div>
				<div>
					<input type="button" onclick="del(${review.reviewNo},${review.movieNo})" class="btn2" value="삭제하기">
				</div>
			</form>
		</div>
	</div>
</body>
</html>