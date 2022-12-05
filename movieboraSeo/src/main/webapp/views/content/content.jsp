<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="memberNo" value="${sessionScope.memberNo }"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
@import url("star.css");
</style>
<style type="text/css">
.button {
	background-color: blue;
	border: none;
	color: white;
	padding: 30px 25px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

.subm {
	background-color: blue;
	border: none;
	color: white;
	padding: 30px 25px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}
</style>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript">
	function chkMemberNo() {
		if (!frm.memberNo.value) {
			alert("로그인을 해주세요")
			return false;
		}
	};

	function chkMnStar() {
		if (!star.memberNo.value) {
			alert("로그인을 해주세요")
			return false;
		}
	}
	$(function() {
		$('#star a').click(function() {

			var a = $('#star').children("a").removeClass("on");
			$(this).addClass("on").prevAll("a").addClass("on");
			console.log($(this).attr("value"));
			var value = $(this).attr("value");
			$('input[name="stars"]').val(value);
			return value;
		});
	});
</script>
</head>
<body>
	멤버넘버 는 : ${memberNo}
	<br> ${movie.movieNo} ${ movie.movieName} ${ movie.movieDirector}
	${ movie.movieActor1} ${ movie.movieActor2} ${ movie.movieDate} ${ movie.movieScore}
	${ movie.movieGenre} ${ movie.movieStory}
	<br>

	<form action="contentPage.ho" method="post">
		<input type="hidden" name="movieNo" value="${movie.movieNo}">
	</form>

	<p id="star">
		<!-- 부모 -->
		<a href="#" value="1">★</a>
		<!-- 자식들-->
		<a href="#" value="2">★</a> <a href="#" value="3">★</a> <a href="#"
			value="4">★</a> <a href="#" value="5">★</a>
	<p>
	<div align="center">
		<form action="movieStars.ho?" method="post" name="star"
			onsubmit="return chkMnStar()">
			<input type="text" name="stars"> <input type="hidden"
				name="memberNo" value="${memberNo}"> <input type="hidden"
				name="movieNo" value="${movie.movieNo}"> <input
				type="submit" value="평점등록">
		</form>
	</div>
	<div align="center">
		<button class="button"
			onclick="location.href='contentPage.ho?movieNo=${movie.movieNo}'">
			상세보기</button>

		<button class="button"
			onclick="location.href='reviewList.ho?movieNo=${movie.movieNo}'">
			리뷰목록보기</button>

		<form action="reviewform.ho" method="post" name="frm" onsubmit="return chkMemberNo()">
			<div class="subm">
				<input type="hidden" name="memberNo" value="${memberNo}"> <input
					type="hidden" name="movieNo" value="${movie.movieNo}"> <input
					type="submit" value="리뷰작성">
			</div>
		</form>
	</div>
</body>
</html>