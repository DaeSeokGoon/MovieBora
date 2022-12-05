<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#member_icon
{
	width: 100%;
	margin-right : 60px;
}
#but{
	width:33%;
}
.main{
	font-size: 0;
}

.mng{
	margin-left : 424px;
	display:inline-block;
	width:33.33333333%;
	text-align: center;
}

.txt{
	font-size: 16px;
}

a{
	display: inline-grid;
}

.back
{
	width : 100%;
	margin-left : 400px;
	padding : 44px;
}
</style>
</head>
<body>
	<div class="container_middle">
		<h1 class="title2">관리자님 환영합니다</h1>
			<div class="main">		
				<div class="mng">
					<a class="txt" href="adminMember.do">
						<img id = "member_icon" alt="" src="../../images/icons/user.png" width="90">회원 관리
					</a>
				</div>
			<div class="back">
			<input type="button" onclick="location.href='/movieboraSeo/views/mainPage/mainPage.yo'" value="뒤로가기" id="but">
			</div>
		</div>
	</div>
</body>
</html>