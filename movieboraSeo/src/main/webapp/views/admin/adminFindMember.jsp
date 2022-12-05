<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.container-table{
		height: 300px;
		overflow-x: auto;
		overflow-y: auto;
		margin: 75px auto 0 auto;	
	}
</style>
<script type="text/javascript">
	function del(memberNo) {
		var con = confirm("탈퇴처리 하시겠습니까?");
		if(con) {
			location.href="../member/delete.do?memberNo="+memberNo;
		}
	}
	
</script>
</head>
<body>
<section class="container_wide">
	<div class="container-table">	
		<table>
			<tr>
				<th>회원번호</th><th>아이디</th><th>비밀번호</th><th>이메일</th><th>이름</th><th>별명</th><th>성별</th><th>회원가입일</th><th>프로필</th><th>탈퇴여부</th><th>수정</th><th>탈퇴</th>
			</tr>
			<c:if test="${empty list}">
				<tr><td colspan="14">검색된 회원정보가 없습니다</td></tr>
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
	<div class="backDiv">
		<a href="adminMember.do" class="btn btn_stroke">이전</a>
	</div>
</section>
</body>
</html>