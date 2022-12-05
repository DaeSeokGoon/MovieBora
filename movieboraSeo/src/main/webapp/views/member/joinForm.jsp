<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript">
function chkId(){
	if(!frm2.memberId.value) {
		alert("아이디를 입력하세요");
		frm2.memberId.focus();
		return false;
	}else{
			$.post("confirmId.do", "memberId="+frm2.memberId.value, function(data){
				$('#err_Id').html(data);
			});
		} 
	}

function chkEmail(){
	if(!frm2.memberEmail.value) {
		alert("이메일을 입력하세요")
		frm2.memberEmail.focus();
		return false;
		}else{
			$.post("confirmEmail.do", "memberEmail="+frm2.memberEmail.value, function(data){
				$('#err_Email').html(data);
			});
		} 
	}

function chkPass(){
	var pw = $("#memberPass").val();
	if(pw.length<8) {
		$('#err_pass').html("8자리 이상 입력해주세요");
		frm2.memberPass.focus();
		frm2.memberPass.value="";
		return false;
	}else {
		$('#err_pass').html("사용가능한 비밀번호입니다");
	}
}

/* 비밀번호 확인 일치여부 체크 */
function chkPassword() {
	if(frm2.memberPass.value!=frm.confirmPassword.value){
		alert("비밀번호가 일치하지 않습니다")
		frm2.memberPass.focus();
		frm2.memberPass.value="";
		frm2.confirmPassword.value="";
		return false;
	}
}

/* 별명 중복체크 */
function chkNick_nm(){
	if(!frm2.memberNickname.value) {
		alert("별명을 입력하세요")
		frm2.memberNickname.focus();
		return false;
		}else {
	$.post("confirmNick_nm.do", "memberNickname="+frm2.memberNickname.value, function(data){
		$('#err').html(data);	
		});	
	}
}

</script>
</head>
<body>
	<form action="join.do" method="post" name="frm2" onsubmit="return chkPassword()">
		<!-- 엔터키 전송 막기 -->
	 	<div style="display:none">
			<input type="submit" onclick="return false">
			<input type="text">
		</div> 		
		<div class="container">
			<h1 class="title">회원가입하기</h1>						
			<!-- 아이디 -->
			<div>
				<input type="text" name="memberId" class="inputBox-left" placeholder="아이디"  autofocus="autofocus" required="required" > 
				<input type="button" value="아이디 확인" onclick="chkId()">
				<div class="chk-msg" id="err_Id"></div>
			</div>		
				<!-- 이메일 -->
			<div class="check">
				<input type="email" name="memberEmail" class="inputBox-left" placeholder="이메일" required="required"> 
				<input type="button" value="이메일 확인" onclick="chkEmail()">
			<div class="chk-msg" id="err_Email"></div>
			</div> 			
			<!-- 비밀번호 -->
			<div class="check">
				<input type="password" name="memberPass" id="memberPass" placeholder="비밀번호" required="required" onChange="chkPass()"> 
				<div class="chk-msg" id="err_pass"></div>
			</div>
				<input type="password" name="confirmPassword" id="confirmPassword" placeholder="비밀번호 확인" required="required" > 
			<!-- 이름 -->
			<div>
				<input type="text" name="memberName" placeholder="이름" required="required">
			</div>
			<!-- 별명 -->
			<div class="check">
				<input type="text" name="memberNickname" placeholder="별명">
				<input type="button" onclick="chkNick_nm()" value="별명 확인">
				<div class="chk-msg" id="err"></div>
			</div>
			<!-- 성별 -->
			<div class= "select-gender">
				<input class="magic-radio" type="radio" name="memberGender" id="mal" value="m" checked="checked">
				<label for="mal" class="radio-left">남자</label>
				<input class="magic-radio" type="radio" name="memberGender" id="fem" value="w">
				<label for="fem" >여자</label>
			</div><br>			
			<!-- 프로필 -->
			<div class="check">				
				<textarea rows="5" cols="40" placeholder="프로필 적기" name="memberProfile" required="required"></textarea>
			</div>
			</div>
			<!-- 회원가입 버튼 -->
			<input type="submit" class="btn submit-btn" value="회원가입">
	</form>
</body>
</html>