<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.list
	{ 
		float : left; 
		padding : 10px;
	}
</style>
</head>
<body>
	<div class="container_middle">
		<div class="content">
			<c:if test="${resultMoviePageList.size() == 0}">
				<ul class="noItems">
					<li>
						<span style="font-size : 21px; font-weight : 484; margin-top : 28px; padding : 21px; text-align : center;"> 검색 결과가 없습니다 </span>
					</li>
				</ul>
			</c:if>
			<c:if test="${resultMoviePageList.size() != 0}">
				<h3> 검색 결과 </h3>
				<ul>
					<c:forEach var="RSMPL" items="${resultMoviePageList}">
						<li class="list">
							<a href="../content/contentPage.ho?movieNo=${RSMPL.movieNo}">
								<img alt="포스터" src="../../mb_image/${RSMPL.movieNo}.jpg"> 
							</a>
							<div class="txt_area">
								<a class="cursor">
									<span class="txt_title" style="font-size : 18px; font-weight : 678; padding : 8px;">${RSMPL.movieName}</span>
									<br>
									<span class="txt"><span>감독  </span>${RSMPL.movieDirector}</span>
									<br>
									<span class="txt"><span>배우1  </span>${RSMPL.movieActor1}</span>
									<br>
									<span class="txt"><span>배우2  </span>${RSMPL.movieActor2}</span>
									<br>
									<span class="txt"><span>장르  </span>${RSMPL.movieGenre}</span>
									<br>
									<span class="txt"><span>점수  </span>${RSMPL.score}</span>
									<br>
								</a>
							</div>
						</li>
					</c:forEach>
				</ul>	
				<div class="paging">
					<div class="items">
						<div class="prev_btn">
							<c:if test="${startPage > PAGE_PER_BLOCK}">
								<button class="first" onclick="location.href='searchResult.yo?pageNum=${startPage-1}&searchKey=${searchKey}&searchValue=${searchValue}'">
									<img alt="이전" src="../../images/icons/arrow_left1.png">
									<img alt="이전" src="../../images/icons/arrow_left1.png">
								</button> 
							</c:if>
							<c:if test="${pageNum > 1}">
								<button class="prev" onclick="location.href='searchResult.yo?pageNum=${currentPage - 1}&searchKey=${searchKey}&searchValue=${searchValue}'">
									<img alt="이전" src="../../images/icons/arrow_left1.png">
								</button>
							</c:if>
						</div>
						<c:forEach var="i" begin="${startPage}" end="${endPage}">
							<span id="page${i}" class="page_num" onclick="location.href='searchResult.yo?pageNum=${i}&searchKey=${searchKey}&searchValue=${searchValue}'">${i}</span>
						</c:forEach>
						<div class="next_btn">
							<c:if test="${currentPage < totalPage}">
								<button class="next" onclick="location.href='searchResult.yo?pageNum=${currentPage + 1}&searchKey=${searchKey}&searchValue=${searchValue}'">
									<img alt="다음" src="../../images/icons/arrow_right.png">
									</button>
							</c:if>
							<c:if test="${endPage < totalPage}">
								<button class=last onclick="location.href='searchResult.yo?pageNum=${endPage+1}&searchKey=${searchKey}&searchValue=${searchValue}'">
									<img alt="다음" src="../../images/icons/arrow_right.png">
									<img alt="다음" src="../../images/icons/arrow_right.png">
								</button> 
							</c:if>
						</div> <!-- next_btn -->
					</div> <!-- number -->
				</div> <!-- paging -->
			</c:if>
		</div>
	</div>
</body>
</html>