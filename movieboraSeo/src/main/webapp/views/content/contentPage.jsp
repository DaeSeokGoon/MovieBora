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
	@import url("star.css")
</style>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript">
		function chkMemberNo() {
			if (!frm9.memberNo.value) {
				alert("로그인을 해주세요")
				return false;
			}
		};
		
		$(function() {
	         $('div p#star a').click(function() {
	        	 var memberNo ="${empty memberNo}";
	        	 if (memberNo=='true') {
	 				alert("로그인을 해주세요")
	 				return false;
	 			}
	            var a = $('#star').children("a").removeClass("on");
	            $(this).addClass("on").prevAll("a").addClass("on");
	            console.log($(this).attr("value"));
	            var value = $(this).attr("value");
	            $('input[name="stars"]').val(value);	          
	            location.href= "score.ho?score="+value+"&memberNo=${memberNo}"+"&movieNo=${movie.movieNo}";	
	            return value;	         
	         });
	      });
	</script>
</head>
<body>
	<div id="content">
		<div class="pic">
			<img src="../../mb_image/${movie.movieNo}.jpg" alt="포스터">
		</div>
		<div class="info">
			<h2>기본정보</h2><br>
			<p style="padding : 7px; font-size : 21px; font-weight : 555;">${ movie.movieName}</p>
			<p style="padding : 4px;">감독 : ${movie.movieDirector}</p>
			<p style="padding : 4px;">출연 : ${movie.movieActor1} / ${ movie.movieActor2}</p>
			<p style="padding : 4px;">장르 : ${ movie.movieGenre}</p>
			<p style="padding : 4px;">${ movie.movieDate}</p>
			<p style="padding : 4px;">${ movie.movieStory}</p>
			<p style="padding : 7px; font-weight : 500">평점 : ${ movie.score}</p>
		</div>	
		<div class="stst">
			<p id="star" class="sta">
				<a href="#" value="1">★</a><a href="#" value="2">★</a><a href="#" value="3">★</a><a href="#" value="4">★</a><a href="#" value="5">★</a>
			<p>	
		</div>
	</div>
	<br>
		<form action="reviewForm.ho" method="post" name="frm9" onsubmit="return chkMemberNo()">
			<div class="subm">
				<input type="hidden" name="memberNo" value="${memberNo}"> 
				<input type="hidden" name="movieNo" value="${movie.movieNo}"> 
				<input type="submit" value="리뷰작성" class="btn2">
			</div>
			<div class="subm">
				<input type="button" class="btn2" onclick="location.href='reviewList.ho?movieNo=${movie.movieNo}'" value="리뷰목록보기">
			</div>
		</form>
</body>
</html>