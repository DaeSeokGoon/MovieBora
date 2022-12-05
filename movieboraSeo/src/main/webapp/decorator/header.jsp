<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<c:set var="id" value='${sessionScope.memberId}'></c:set>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/movieboraSeo/css/common.css">
<script type="text/javascript" src="/movieboraSeo/js/jquery.js"></script>
<script type="text/javascript">
	// nav active control
	$(document).ready(function() 
	{ 
		// window.onload보다 document.ready가 더 빠르고 안정적!
		var curUrl = window.location.href; // 현재 url가져오기
		var sliceUrl = curUrl.split("/"); // 필요한 부분만 슬라이스
		
		//$('.nav_main a').removeClass("active");
		$('#'+sliceUrl[5]).addClass("active");
		// alert(curUrl+" : "+sliceUrl[5]);
		// modal open
		$('#search').click(function () 
		{
			$('.modal_search').show();
			$('html body').css('overflow', 'hidden');
			$('input[name=srch]').val('');
		});
		
		// modal close
		$('.close, .dim_box').on('click', function() {
			$('.modal_search').hide();
			$('html body').css('overflow', 'auto');
		});
	});
	
	function ssChk(name) {
		if (${empty memberId}) {
			var con = confirm("로그인 후 이용해 주시기 바랍니다.");			
			if (con) {
				if (name == 'main') {
					location.href = "/movieboraSeo/views/mainPage/mainPage.yo";
				} 
			} 
		} else {	
				location.href = "/movieboraSeo/views/myPage/myPage.yo";
			}			
		
	}
</script>
</head>
<body>   
<header>
      <div class='header_inner'>
         <div class='header_logo'>
            <a href="/movieboraSeo/views/mainPage/mainPage.yo">
            <img alt="header이미지" src="/movieboraSeo/images/mainBanner.jpg"></a>            
         </div>
         <nav>
            <ul class='nav_sub'>
               <c:if test="${empty id }">
                  <li><a href="/movieboraSeo/views/member/loginForm.do">로그인</a></li>
                  <li><a href="/movieboraSeo/views/member/joinForm.do">회원가입</a></li>
               </c:if>
               <c:if test="${not empty id }">
                  <c:if test="${id != 'admin'}">
                     <li><a href="/movieboraSeo/views/member/logout.do">로그아웃</a></li>
                  </c:if>
                  <c:if test="${id == 'admin'}">
                     <li><a href="/movieboraSeo/views/member/logout.do">로그아웃</a></li>
                     <li><a href="/movieboraSeo/views/admin/adminMain.do">관리자페이지</a></li>
                  </c:if>
               </c:if>
            </ul>
            <ul class='nav_main'>
               <li><a id="display" href="/movieboraSeo/views/mainPage/mainPage.yo">메인페이지</a></li>
               <li><a id="myPage" onclick="return ssChk('main')">마이페이지</a></li>
            </ul>
         </nav>
         <div class="header_search">
            <form action="searchResult.yo" name="frm" onsubmit="return emptyChk();" >
               <select name="searchKey" class="header_search2">
                  <option value="movieName"> 영화</option>
                  <option value="movieDirector"> 감독</option>
                  <option value="movieActor"> 배우</option>
                  <option value="movieGenre"> 장르</option>
               </select>
               <input type="text" name="searchValue" class="header_search3" required="required" placeholder="검색어를 입력해주세요.">
               <input type="submit" value="검색" class="header_search4">
            </form>
         </div>
      </div>
   </header>
	</body>
</html>