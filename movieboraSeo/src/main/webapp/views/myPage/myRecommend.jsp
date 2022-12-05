<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<%@ include file="../member/sessionChk.jsp"%>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" type="text/css" href="../../css/myPage/MyPageContent.css">
<style type="text/css">	
	.list
	{ 
		float: left; 
		padding: 10px;
	}
</style>
</head>
<body>
	<div class="container_middle">
		<!-- 프로필, 메뉴 -->
		<jsp:include page="myPageMain.jsp"></jsp:include>
		<!-- 내용 -->
		<div class="content">
			<c:if test="${recommendPageList.size() == 0}">
				<ul class="noItems">
					<li>
						<span class="txt_title"> 추천 목록이 없습니다 </span>
					</li>
				</ul>
			</c:if>
			<c:if test="${recommendPageList.size() != 0}">
				<h3> 추천 목록 ${total} </h3>
				<ul>
					<c:forEach var="recommendP" items="${recommendPageList}">
						<li class="list">
							<a href="../content/contentPage.ho?movieNo=${recommendP.movieNo}">
							<!-- movieNo에 해당하는 영화 상세페이지로 링크 -->
								<img alt="포스터" src="../../mb_image/${recommendP.movieNo}.jpg"> 
								<!-- 이미지는 movieNo에 따른 영화포스터로 연결 -->
							</a>
							<div class="txt_area">
								<a class="cursor">
									<span class="txt_title">${recommendP.movieName}</span>
									<br>
									<span class="txt"><span>감독  </span> ${recommendP.movieDirector}</span>
									<br>
									<span class="txt"><span>장르  </span> ${recommendP.movieGenre}</span>
									<br>
									<span class="txt"><span>평균별점  </span> ${recommendP.score} 점 </span>
									<br>
								</a>
							</div>
						</li>
					</c:forEach>
				</ul>
			</c:if>
		</div>

		<!-- paging -->
		<div class="paging">
			<div class="items">
				<div class="prev_btn">
					<c:if test="${startPage > PAGE_PER_BLOCK}">
						<button class="first" onclick="location.href='myRecommend.yo?pageNum=${startPage - 1}'">
							<img alt="이전" src="../../images/icons/arrow_left1.png">
							<img alt="이전" src="../../images/icons/arrow_left1.png">
						</button> 
					</c:if>
					<c:if test="${pageNum > 1}">
						<button class="prev" onclick="location.href='myRecommend.yo?pageNum=${currentPage - 1}'">
							<img alt="이전" src="../../images/icons/arrow_left1.png">
						</button>
					</c:if>
				</div>
				<c:forEach var="i" begin="${startPage}" end="${endPage}">
					<span id="page${i}" class="page_num" onclick="location.href='myRecommend.yo?pageNum=${i}'">${i}</span>
				</c:forEach>
				<div class="next_btn">
					<c:if test="${currentPage < totalPage}">
						<button class="next" onclick="location.href='myRecommend.yo?pageNum=${currentPage + 1}'">
							<img alt="다음" src="../../images/icons/arrow_right.png">
						</button>
					</c:if>
					<c:if test="${endPage < totalPage}">
						<button class=last onclick="location.href='myRecommend.yo?pageNum=${endPage + 1}'">
							<img alt="다음" src="../../images/icons/arrow_right.png">
							<img alt="다음" src="../../images/icons/arrow_right.png">
						</button> 
					</c:if>
				</div> <!-- next_btn -->
			</div> <!-- number -->
		</div> <!-- paging -->
	</div>
</body>
</html>