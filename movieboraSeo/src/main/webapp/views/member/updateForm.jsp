<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript">
	/* 별명 중복체크 */
	function chkNick_nm(){
		if(!frm.memberNickname.value) {
			alert("별명을 입력하세요")
			frm.memberNickname.focus();
			return false;
		}else{
			$.post("confirmNick_nm.do", "memberNickname="+frm.memberNickname.value, function(data){
				$('#err').html(data);
				var substring = "사용중인";
				if(data.includes(substring)){
				frm.memberNickname.value="";
				return false;
				}
			});
		}
	}
	
	/* 비밀번호 일치여부 확인 */
	function chkPassword() {
		if(frm.memberPass.value!=frm.confirmPassword.value){
			alert("비밀번호가 일치하지 않습니다")
			frm.memberPass.focus();
			frm.memberPass.value="";
			frm.confirmPassword.value="";
			return false;
		}
	}
	
	/* 회원탈퇴 */
	function del() {
		var con = confirm("탈퇴 하시겠습니까?");
		if(con) location.href="delete.do";
		else alert("탈퇴가 취소 되었습니다.");
	}
</script>
</head>
<body>
<div class="container">
	<h1 class="title">회원정보 수정</h1>
	<form action="updateResult.do" method="post" name="frm" onsubmit="chkPassword()">
		<!-- 엔터키 전송 막기 -->
		<div style="display:none">
			<input type="submit" onclick="return false"/>
			<input type="text"/>
		</div>
			
			<!-- 아이디 -->
			<div>
				<input type="text" name="memberId" readonly="readonly" value="${member.memberId }" placeholder="${member.memberId }">
			</div>
			<!-- 이메일 -->
			<div class="check">
				<input type="email" name="memberEmail" class="inputBox-left" readonly="readonly"  value="${member.memberEmail }" placeholder="${member.memberEmail }"> 
			</div>
			<!-- 비밀번호 -->
			<div>
				<input type="password" name="memberPass" placeholder="비밀번호" required="required" > 
			</div>
			<div>
				<input type="password" name="confirmPassword" placeholder="비밀번호 확인" required="required" onChange="chkPassword()"> 
			</div>
			<!-- 이름 -->
			<div>
				<input type="text" name="memberName" value="${member.memberName }" placeholder="${member.memberName }">
			</div>
			<!-- 별명 -->
			<div class="check">
				<input type="text" name="memberNickname" value="${member.memberNickname }" placeholder="${member.memberNickname }" onChange="chkNick_nm()" required="required">
				<input type="hidden" name="checked_nick" value="">
				<div class="chk-msg" id="err"></div>
			</div>			
			<!-- 성별 -->
			<div class= "select-gender">
				<input class="magic-radio" type="radio" name="memberGender" id="mal" value="m" checked="<c:if test="${member.memberGender=='m'}">checked</c:if>">
				<label for="mal" class="radio-left">남자</label>
				<input class="magic-radio" type="radio" name="memberGender" id="fem" value="f" checked="<c:if test="${member.memberGender=='f'}">checked</c:if>">
				<label for="fem" >여자</label>
			</div><br>
			<!-- 프로필 -->
			<div class="profile">				
				<textarea rows="5" cols="40" placeholder="프로필 적기" name="memberProfile" required="required"></textarea>
			</div>
			<!-- button -->
			<div>
				<input type="submit" class="btn submit-btn" value="회원정보 수정">
			</div>
			<div>
			<input type="button" value="회원 탈퇴" onclick="del()">
			</div>
	</form>
</div>
</body>
</html>