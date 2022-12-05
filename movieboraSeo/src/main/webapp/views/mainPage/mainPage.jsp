<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	ul { list-style: none; display: flex;}
	h2 { font-size: 30px; text-align: center; padding:10px;}
	img{ padding: 10px; }
	p { padding: 10px; }
	
	.all_list{
	display: flex;
    flex-direction: column;
	}    
	.div1{
	display: flex;
    justify-content: center;
    flex-direction: row;
	}
</style>
</head>
<body>
		<section>
			<h2> 전체 영화 목록 </h2>
			<div class="all_list">
			<div class="div1">
			<ul>
				<li class="title" id="tab1" onclick="location.href='mainPage.yo'"><br>
						<!-- 전체 영화 -->
						<c:if test="${not empty TotalMoviePageList}">
							<c:forEach var="TMPL" items="${TotalMoviePageList}">
								<li> <!-- 이미지 누르면 영화 상세페이지로 이동 -->
									<a href="/movieboraSeo/views/content/contentPage.ho?movieNo=${TMPL.movieNo}">
										<img src="../../mb_image/${TMPL.movieNo}.jpg" alt="영화포스터">
										<div>
											<p>${TMPL.movieName}<br>
											   ${TMPL.movieGenre}<br>
											   평균★${TMPL.score}점</p>
										</div>
									</a>
								</li>
							</c:forEach>
						</c:if>
					</div>
					<div class="div2">
						<div class="paging">
							<div class="items">
								<div class="prev_btn">
									<c:if test="${startPage > PAGE_PER_BLOCK}">
										<button class="first" onclick="location.href='mainPage.yo?pageNum=${startPage-1}&pageNum1=${pageNum1}&pageNum2=${pageNum2}&pageNum3=${pageNum3}&pageNum4=${pageNum4}'">
											<img alt="이전" style="padding : 6px; padding-top : 0px; max-width : 100%; width : auto; height : auto; margin-left : 10px;" src="../../mb_image/arrow_left2.png">
										</button> 
									</c:if>
									<c:if test="${pageNum > 1}">
										<button class="prev" onclick="location.href='mainPage.yo?pageNum=${currentPage-1}&pageNum1=${currentPage1}&pageNum2=${currentPage2}&pageNum3=${currentPage3}&pageNum4=${currentPage4}'">
											<img alt="이전" style="padding : 8px; padding-top : 2px; max-width : 100%; width : auto; height : auto;" src="../../mb_image/arrow_left.png">
										</button>
									</c:if>
								</div>
								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:if test="${currentPage == i }">
									<span id="page${i}" class="page_num" style="color: white; background: purple;"
									 onclick="location.href='mainPage.yo?pageNum=${i}&pageNum1=${pageNum1}&pageNum2=${pageNum2}&pageNum3=${pageNum3}&pageNum4=${pageNum4}'">${i}</span>
									 </c:if>
									 <c:if test="${currentPage != i }">
									<span id="page${i}" class="page_num" onclick="location.href='mainPage.yo?pageNum=${i}&pageNum1=${pageNum1}&pageNum2=${pageNum2}&pageNum3=${pageNum3}&pageNum4=${pageNum4}'">${i}</span>
									 </c:if>
								</c:forEach>
								<div class="next_btn">
									<c:if test="${currentPage < totalPage}">
										<button class="next" onclick="location.href='mainPage.yo?pageNum=${currentPage+1}&pageNum1=${currentPage1}&pageNum2=${currentPage2}&pageNum3=${currentPage3}&pageNum4=${currentPage4}'">
											<img alt="이전" style="padding : 8px; padding-top : 2px; max-width : 100%; width : auto; height : auto;" src="../../mb_image/arrow_right.png">
										</button>
									</c:if>
									<c:if test="${endPage < totalPage}">
										<button class=last onclick="location.href='mainPage.yo?pageNum=${endPage+1}&pageNum1=${pageNum1}&pageNum2=${pageNum2}&pageNum3=${pageNum3}&pageNum4=${pageNum4}'">
											<img alt="이전" style="padding : 6px; padding-top : 0px; max-width : 100%; width : auto; height : auto; margin-left : -10px;" src="../../mb_image/arrow_right2.png">
										</button> 
									</c:if>
								</div> <!-- next_btn -->
							</div> <!-- number -->
						</div>
					</div>
				</li>
				</ul>
			</div>
				<h2> 인기 영화 목록 </h2>
				<div class="all_list">
				<div class="div1">
				<ul><li class="title" id="tab2" onclick="location.href='mainPage.yo'"><br>
						<c:if test="${not empty TopPageList}">
							<c:forEach var="TPL" items="${TopPageList}">
								<li>
									<a href="/movieboraSeo/views/content/contentPage.ho?movieNo=${TPL.movieNo}">
										<img src="../../mb_image/${TPL.movieNo}.jpg" alt="영화포스터">
										<div>
											<p>${TPL.movieName}<br>
										   	   ${TPL.movieGenre}<br>
											   평균★${TPL.score}점</p>
										</div>
									</a>
								</li>
							</c:forEach>
						</c:if>
					</div>
					<div class="paging">
						<div class="items">
							<div class="prev_btn">
								<c:if test="${startPage1 > PAGE_PER_BLOCK}">
									<button class="first" onclick="location.href='mainPage.yo?pageNum=${pageNum}&pageNum1=${startPage1-1}&pageNum2=${pageNum2}&pageNum3=${pageNum3}&pageNum4=${pageNum4}'">
										<img alt="이전" style="padding : 6px; padding-top : 0px; max-width : 100%; width : auto; height : auto; margin-left : 10px;" src="../../mb_image/arrow_left2.png">
									</button> 
								</c:if>
								<c:if test="${pageNum1 > 1}">
									<button class="prev" onclick="location.href='mainPage.yo?pageNum=${currentPage}&pageNum1=${currentPage1-1}&pageNum2=${currentPage2}&pageNum3=${currentPage3}&pageNum4=${currentPage4}'">
										<img alt="이전" style="padding : 8px; padding-top : 2px; max-width : 100%; width : auto; height : auto;" src="../../mb_image/arrow_left.png">
									</button>
								</c:if>
							</div>
							<c:forEach var="i1" begin="${startPage1}" end="${endPage1}">
								<c:if test="${currentPage1 == i1 }">
								<span id="page${i1}" class="page_num" style="color: white; background: purple;"
								onclick="location.href='mainPage.yo?pageNum=${pageNum}&pageNum1=${i1}&pageNum2=${pageNum2}&pageNum3=${pageNum3}&pageNum4=${pageNum4}'">${i1}</span>
								</c:if>
								<c:if test="${currentPage1 != i1 }">
								<span id="page${i1}" class="page_num" onclick="location.href='mainPage.yo?pageNum=${pageNum}&pageNum1=${i1}&pageNum2=${pageNum2}&pageNum3=${pageNum3}&pageNum4=${pageNum4}'">${i1}</span>
								</c:if>
							</c:forEach>
							<div class="next_btn">
								<c:if test="${currentPage1 < totalPage1}">
									<button class="next" onclick="location.href='mainPage.yo?pageNum=${currentPage}&pageNum1=${currentPage1+1}&pageNum2=${currentPage2}&pageNum3=${currentPage3}&pageNum4=${currentPage4}'">
										<img alt="이전" style="padding : 8px; padding-top : 2px; max-width : 100%; width : auto; height : auto;" src="../../mb_image/arrow_right.png">
									</button>
								</c:if>
								<c:if test="${endPage1 < totalPage1}">
									<button class=last onclick="location.href='mainPage.yo?pageNum=${pageNum}&pageNum1=${endPage1+1}&pageNum2=${pageNum2}&pageNum3=${pageNum3}&pageNum4=${pageNum4}'">
										<img alt="이전" style="padding : 6px; padding-top : 0px; max-width : 100%; width : auto; height : auto; margin-left : -10px;" src="../../mb_image/arrow_right2.png">
									</button> 
								</c:if>
							</div> <!-- next_btn -->
						</div> <!-- number -->
					</div>
				</li>
				</ul> 
				</div>
				<h2> 남성 인기 영화 </h2>
				<div class="all_list">
				<div class="div1">
				<ul>
				<li class="title" id="tab3" onclick="location.href='mainPage.yo'"><br>				
						<c:if test="${not empty ManPageList}">
							<c:forEach var="MPL" items="${ManPageList}">
								<li>
									<a href="/movieboraSeo/views/content/contentPage.ho?movieNo=${MPL.movieNo}">
										<img src="../../mb_image/${MPL.movieNo}.jpg" alt="영화포스터">
										<div>
											<p>${MPL.movieName}<br>
											   ${MPL.movieGenre}<br>
											   평균★${MPL.score}점</p>
										</div>
									</a>
								</li>
							</c:forEach>
						</c:if>
					</div>
					<div class="paging">
						<div class="items">
							<div class="prev_btn">
								<c:if test="${startPage2 > PAGE_PER_BLOCK}">
									<button class="first" onclick="location.href='mainPage.yo?pageNum=${pageNum}&pageNum1=${pageNum1}&pageNum2=${startPage2-1}&pageNum3=${pageNum3}&pageNum4=${pageNum4}'">
										<img alt="이전" style="padding : 6px; padding-top : 0px; max-width : 100%; width : auto; height : auto; margin-left : 10px;" src="../../mb_image/arrow_left2.png">
									</button> 
								</c:if>
								<c:if test="${pageNum2 > 1}">
									<button class="prev" onclick="location.href='mainPage.yo?pageNum=${currentPage}&pageNum1=${currentPage1}&pageNum2=${currentPage2-2}&pageNum3=${currentPage3}&pageNum4=${currentPage4}'">
										<img alt="이전" style="padding : 8px; padding-top : 2px; max-width : 100%; width : auto; height : auto;" src="../../mb_image/arrow_left.png">
									</button>
								</c:if>
							</div>
							<c:forEach var="i2" begin="${startPage2}" end="${endPage2}">
								<c:if test="${currentPage2 == i2 }">
								<span id="page${i2}" class="page_num" style="color: white; background: purple;"
								onclick="location.href='mainPage.yo?pageNum=${pageNum}&pageNum1=${pageNum1}&pageNum2=${i2}&pageNum3=${pageNum3}&pageNum4=${pageNum4}'">${i2}</span>
								</c:if>
								<c:if test="${currentPage2 != i2 }">
								<span id="page${i2}" class="page_num" onclick="location.href='mainPage.yo?pageNum=${pageNum}&pageNum1=${pageNum1}&pageNum2=${i2}&pageNum3=${pageNum3}&pageNum4=${pageNum4}'">${i2}</span>
								</c:if>
							</c:forEach>
							<div class="next_btn">
								<c:if test="${currentPage2 < totalPage2}">
									<button class="next" onclick="location.href='mainPage.yo?pageNum=${currentPage}&pageNum1=${currentPage1}&pageNum2=${currentPage2+1}&pageNum3=${currentPage3}&pageNum4=${currentPage4}'">
										<img alt="이전" style="padding : 8px; padding-top : 2px; max-width : 100%; width : auto; height : auto;" src="../../mb_image/arrow_right.png">
									</button>
								</c:if>
								<c:if test="${endPage2 < totalPage2}">
									<button class=last onclick="location.href='mainPage.yo?pageNum=${pageNum}&pageNum1=${pageNum1}&pageNum2=${endPage2+1}&pageNum3=${pageNum3}&pageNum4=${pageNum4}'">
										<img alt="이전" style="padding : 6px; padding-top : 0px; max-width : 100%; width : auto; height : auto; margin-left : -10px;" src="../../mb_image/arrow_right2.png">
									</button> 
								</c:if>
							</div> <!-- next_btn -->
						</div> <!-- number -->
					</div>
				</li>
				</ul>
				</div>
				<h2> 여성 인기 영화 </h2>
				<div class="all_list">
				<div class="div1">
				<ul>
				<li class="title" id="tab2" onclick="location.href='mainPage.yo'"><br>
						<c:if test="${not empty WomanPageList}">
							<c:forEach var="WPL" items="${WomanPageList}">
								<li>
									<a href="/movieboraSeo/views/content/contentPage.ho?movieNo=${WPL.movieNo}">
										<img src="../../mb_image/${WPL.movieNo}.jpg" alt="영화포스터">
										<div>
											<p>${WPL.movieName}<br>
											   ${WPL.movieGenre}<br>
											   평균★${WPL.score}점</p>
										</div>
									</a>
								</li>
							</c:forEach>
						</c:if>
					</div>
					<div class="paging">
						<div class="items">
							<div class="prev_btn">
								<c:if test="${startPage3 > PAGE_PER_BLOCK}">
									<button class="first" onclick="location.href='mainPage.yo?pageNum=${pageNum}&pageNum1=${pageNum1}&pageNum2=${pageNum2}&pageNum3=${startPage3-1}&pageNum4=${pageNum4}'">
										<img alt="이전" style="padding : 6px; padding-top : 0px; max-width : 100%; width : auto; height : auto; margin-left : 10px;" src="../../mb_image/arrow_left2.png">
									</button> 
								</c:if>
								<c:if test="${pageNum3 > 1}">
									<button class="prev" onclick="location.href='mainPage.yo?pageNum=${currentPage}&pageNum1=${currentPage1}&pageNum2=${currentPage2}&pageNum3=${currentPage3-1}&pageNum4=${currentPage4}'">
										<img alt="이전" style="padding : 8px; padding-top : 2px; max-width : 100%; width : auto; height : auto;" src="../../mb_image/arrow_left.png">
									</button>
								</c:if>
							</div>
							<c:forEach var="i3" begin="${startPage3}" end="${endPage3}">
								<c:if test="${currentPage3 == i3 }">
									<span id="page${i3}" class="page_num" style="color: white; background: purple;"
									onclick="location.href='mainPage.yo?pageNum=${pageNum}&pageNum1=${pageNum1}&pageNum2=${pageNum2}&pageNum3=${i3}&pageNum4=${pageNum4}'">${i3}</span>
								</c:if>
								<c:if test="${currentPage3 != i3 }">
									<span id="page${i3}" class="page_num" onclick="location.href='mainPage.yo?pageNum=${pageNum}&pageNum1=${pageNum1}&pageNum2=${pageNum2}&pageNum3=${i3}&pageNum4=${pageNum4}'">${i3}</span>
								</c:if>
							</c:forEach>
							<div class="next_btn">
								<c:if test="${currentPage3 < totalPage3}">
									<button class="next" onclick="location.href='mainPage.yo?pageNum=${currentPage}&pageNum1=${currentPage1}&pageNum2=${currentPage2}&pageNum3=${currentPage3+1}&pageNum4=${currentPage4}'">
										<img alt="이전" style="padding : 8px; padding-top : 2px; max-width : 100%; width : auto; height : auto;" src="../../mb_image/arrow_right.png">
									</button>
								</c:if>
								<c:if test="${endPage3 < totalPage3}">
									<button class=last onclick="location.href='mainPage.yo?pageNum=${pageNum}&pageNum1=${pageNum1}&pageNum2=${pageNum2}&pageNum3=${endPage3+1}&pageNum4=${pageNum4}'">
										<img alt="이전" style="padding : 6px; padding-top : 0px; max-width : 100%; width : auto; height : auto; margin-left : -10px;" src="../../mb_image/arrow_right2.png">
									</button> 
								</c:if>
							</div> <!-- next_btn -->
						</div> <!-- number -->
					</div>
				</li>
				</ul>
				</div>
				<h2> 인기 장르 </h2>
				<div class="all_list">
				<div class="div1">
				<ul>
				<li class="title" id="tab3" onclick="location.href='mainPage.yo'"><br>				
						<c:if test="${not empty GenreTotalMoviePageList}">
							<c:forEach var="GTMPL" items="${GenreTotalMoviePageList}">
								<li>
									<a href="/movieboraSeo/views/content/contentPage.ho?movieNo=${GTMPL.movieNo}">
										<img src="../../mb_image/${GTMPL.movieNo}.jpg" alt="영화포스터">
										<div>
											<p>${GTMPL.movieName}<br>
											   ${GTMPL.movieGenre}<br>
											   평균★${GTMPL.score}점</p>
										</div>
									</a>
								</li>
							</c:forEach>
						</c:if>
					</div>
					<div class="paging">
						<div class="items">
							<div class="prev_btn">
								<c:if test="${startPage4 > PAGE_PER_BLOCK}">
									<button class="first" onclick="location.href='mainPage.yo?pageNum=${pageNum}&pageNum1=${pageNum1}&pageNum2=${pageNum2}&pageNum3=${pageNum3}&pageNum4=${startPage4-1}'">
										<img alt="이전" style="padding : 6px; padding-top : 0px; max-width : 100%; width : auto; height : auto; margin-left : 10px;" src="../../mb_image/arrow_left2.png">
									</button> 
								</c:if>
								<c:if test="${pageNum4 > 1}">
									<button class="prev" onclick="location.href='mainPage.yo?pageNum=${currentPage}&pageNum1=${currentPage1}&pageNum2=${currentPage2}&pageNum3=${currentPage3}&pageNum4=${currentPage4-1}'">
										<img alt="이전" style="padding : 8px; padding-top : 2px; max-width : 100%; width : auto; height : auto;" src="../../mb_image/arrow_left.png">
									</button>
								</c:if>
							</div>
							<c:forEach var="i4" begin="${startPage4}" end="${endPage4}">
								<c:if test="${currentPage == i4 }">
									<span id="page${i4}" class="page_num" style="color: white; background: purple;"
									onclick="location.href='mainPage.yo?pageNum=${pageNum}&pageNum1=${pageNum1}&pageNum2=${pageNum2}&pageNum3=${pageNum3}&pageNum4=${i4}'">${i4}</span>
								</c:if>
								<c:if test="${currentPage != i4 }">
									<span id="page${i4}" class="page_num" onclick="location.href='mainPage.yo?pageNum=${pageNum}&pageNum1=${pageNum1}&pageNum2=${pageNum2}&pageNum3=${pageNum3}&pageNum4=${i4}'">${i4}</span>
								</c:if>
							</c:forEach>
							<div class="next_btn">
								<c:if test="${currentPage4 < totalPage4}">
									<button class="next" onclick="location.href='mainPage.yo?pageNum=${currentPage}&pageNum1=${currentPage1}&pageNum2=${currentPage2}&pageNum3=${currentPage3}&pageNum4=${currentPage4+1}'">
										<img alt="이전" style="padding : 8px; padding-top : 2px; max-width : 100%; width : auto; height : auto;" src="../../mb_image/arrow_right.png">
									</button>
								</c:if>
								<c:if test="${endPage4 < totalPage4}">
									<button class=last onclick="location.href='mainPage.yo?pageNum=${pageNum}&pageNum1=${pageNum1}&pageNum2=${pageNum2}&pageNum3=${pageNum3}&pageNum4=${endPage4+1}'">
										<img alt="이전" style="padding : 6px; padding-top : 0px; max-width : 100%; width : auto; height : auto; margin-left : -10px;" src="../../mb_image/arrow_right2.png">
									</button> 
								</c:if>
							</div> <!-- next_btn -->
						</div> <!-- number -->
					</div>
				</li>
				</ul>
				</div>
		</section>
</body>
</html>