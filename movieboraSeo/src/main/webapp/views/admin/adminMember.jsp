<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
/* common CSS */
select {
	border: none;
    width: 80px;
    height: 40px;
    border-bottom: 1px solid #000;
}

input {
	width: 170px;
	height: 40px;
	border: none;
	border-bottom: 1px solid #000;
}

</style>
<script type="text/javascript">
	function del(delMno) {
		var con = confirm("탈퇴처리 하시겠습니까?");
		if(con) {
			location.href="../member/delete.do?memberNo="+delMno;
		}
	}
	function chk(){
		if(!frm.searchValue.value){
			alert("검색어를 입력하세요");
			frm.searchValue.focus();
			return false;
		}
	}
</script>
</head>
<body>
<section class="container_wide">
	<div class="top">
		<div class="searchForm">
			<form action="adminFindMember.do" name="frm" onsubmit="return chk();" >
				<select name="searchKey" class="searchTab">
					<option value="memberId" >아이디</option>
					<option value="memberName">이름</option>
					<option value="memberNickname">별명</option>
				</select>
				<input type="text" name="searchValue" class="searchTab" placeholder="검색어를 입력해주세요.">
				<input type="submit" value="검색" class="searchTab">
			</form>
		</div>
		<div class="btn_box">
			<a class="btn_stroke" href="/movieboraSeo/views/member/joinForm.do">등록</a>	
		</div>
	</div>
	<div class="container-table">
		<table>
			<tr>
				<th>회원번호</th><th>아이디</th><th>비밀번호</th><th>이메일</th><th>이름</th><th>별명</th><th>성별</th><th>회원가입일</th><th>프로필</th><th>탈퇴여부</th><th>수정</th><th>탈퇴</th>
			</tr>
			<c:if test="${empty list} ">
				<tr><th colspan="14">회원 데이터가 존재하지 않습니다</th></tr>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="member" items="${list }">
					<tr>
						<td>${member.memberNo}</td>
						<td>${member.memberId}</td>
						<td>${member.memberPass}</td>
						<td>${member.memberEmail}</td>
						<td>${member.memberName}</td>
						<td>${member.memberNickname}</td>
						<td>${member.memberGender}</td>
						<td>${member.reg_date}</td>						
						<td>${member.memberProfile}</td>
						<td>${member.memberDel}</td>
						<td><a href="../member/updateForm.do?memberNo=${member.memberNo}" class="btn btn_small">수정</a></td>
						<td><a onclick="del(${member.memberNo})" class="btn btn_small">탈퇴</a></td>
					</tr>
				</c:forEach>
			</c:if>			
		</table>
</div>
<div align="center">
	<c:if test="${startPage > PAGE_PER_BLOCK }">
		<button onclick="location.href='adminMember.do?pageNum=${startPage - 1}'">이전</button>
	</c:if>
	<c:forEach var="i" begin="${startPage }" end="${endPage }">
		<c:if test="${currentPage == i }">
			<button onclick="location.href='adminMember.do?pageNum=${i}'">${i }</button>
		</c:if>
		<c:if test="${currentPage != i }">
			<button onclick="location.href='adminMember.do?pageNum=${i}'">${i }</button>
		</c:if>		
	</c:forEach>
	<c:if test="${totalPage > endPage }">
		<button onclick="location.href='adminMember.do?pageNum=${endPage + 1}'">다음</button>
	</c:if>
</div>
	<div>
		<input type="button" class ="btn3" onclick="location.href='/movieboraSeo/views/admin/adminMain.do'" value="뒤로가기">
	</div>
</section>
</body>
</html>