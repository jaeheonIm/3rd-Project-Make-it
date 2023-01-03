<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!doctype html>
<html lang="en">

<head>
<meta charset="UTF-8">

<!-- Title  -->
<title>회원탈퇴</title>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

<!-- Favicon  -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Style CSS -->
<link rel="stylesheet" href="style.css">


</head>

<body>
<c:if test="${user.memberId ne ''}">
	<%@include file ="/common/Header.jsp" %>
</c:if>
<c:if test="${user.memberId eq ''}">
	<%@include file ="/common/Header_N.jsp" %>
</c:if>
	<!-- Breadcumb Area -->
	<div class="breadcumb_area">
		<div class="container h-100">
			<div class="row h-100 align-items-center">
				<div class="col-12">
					<h5>Unregister</h5>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="main.do?memberId=${user.memberId }">Home</a></li>
						<li class="breadcrumb-item active">Unregister</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<div class="row gx-5 justify-content-center">
		<div class="col-lg-8 col-xl-6">
			<div>
				<h2 class="fw-bolder">회원탈퇴</h2>
				<br>
				<br>
				<h4>탈퇴 전, 꼭 확인하세요!</h4>
				<p>탈퇴 전 반드시 아래 유의 사항을 확인하시기 바랍니다.</p>
				<hr>
				<strong>탈퇴 후 3개월 내 재가입 불가</strong><br> <small>탈퇴 후 3개월
					내 동일 아이디(이메일)로 재가입 불가</small>
				<hr>
				<strong>탈퇴 후 재가입 시 신규 회원혜택 제한</strong><br> <small>재가입 후
					신규 회원혜택 및 제휴 프로모션 관련 혜택 지급 불가</small>
				<hr>
				<strong>탈퇴 후 개인 정보 일괄 삭제</strong><br> <small>참여한/찜 한/개설
					중인 프로젝트 및 쿠폰, 포인트 등 개인 정보 일괄 삭제</small>
				<hr>
				<strong>메이크잇 내 모든 서비스에서 탈퇴</strong><br> <small>펀딩,투자 등
					메이크잇 회원으로서 이용하던 서비스 모두 이용 불가</small>
				<hr>
				<strong>탈퇴 후 작성한 게시물은 삭제 불가</strong><br> <small>게시글,
					댓글, 펀딩한 프로젝트의 투자 리스트에 남겨진 이름 등 삭제 불가</small>
				<hr>
				<div class="form-check">
					<input class="form-check-input" type="checkbox" value=""
						id="flexCheckDefault" name="flexCheckDefault"> <label class="form-check-label"
						for="flexCheckDefault">탈퇴 시 유의 사항을 확인하였습니다.</label>
				</div>
				<br>
				<br>
				<div>
					<h4>본인 확인</h4>
					<p>안전한 탈퇴를 위해 본인 인증 절차를 진행합니다.</p>
				</div>
				<div class="form-group">
					<label for="memberEmail">이메일</label>
					<div class="input-group mb-3">
						<input type="text" class="form-control" id="memberEmail"
							name="memberEmail" value="${user.memberEmail }" placeholder="ex) itwill@itwill.com">
						<button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
					</div>
					<div class="check_font" id="email_check"></div>
				</div>
				<div class="form-group">
					<input id="codeNum" class="form-control mail-check-input"
						placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
					<div id="mail-check-warn"></div>
				</div>
				<hr>
				<button id="reg_submit" class="btn btn-primary btn-block" type="button">탈퇴하기</button>
			</div>
		</div>
	</div><br><br>
<script>
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

$('#memberEmail').keyup(function(){
	if(mailJ.test($(this).val())){
		console.log(nameJ.test($(this).val()));
		$("#email_check").text('');
	} else {
		$('#email_check').text('이메일 형식을 확인해주세요');
		$('#email_check').css('color', 'red');
	}
});

$('#mail-Check-Btn').click(function() {
	const email = $('#memberEmail').val();
	console.log('완성된 이메일 : ' + email);
	const checkInput = $('.mail-check-input'); 
	
	$.ajax("mailCheck.do",{
		type : "post",
		data: JSON.stringify(email),
		contentType: "application/json",
		dataType: "json",
		async:false,
		success : function (data) {
			console.log("data : " +  data);
			checkInput.attr('disabled',false);
			code =data;
			alert('인증번호가 전송되었습니다.');
		}			
	}); // end ajax
}); // end send eamil

//인증번호 비교 
// blur -> focus가 벗어나는 경우 발생
$('.mail-check-input').blur(function () {
	const inputCode = $(this).val();
	const $resultMsg = $('#mail-check-warn');
	
	if(inputCode == code){
		$resultMsg.html('인증번호가 일치합니다.');
		$resultMsg.css('color','blue');
		$('#mail-Check-Btn').attr('disabled',true);
		$('#memberEmail').attr('readonly',true);
	}else{
		$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
		$resultMsg.css('color','red');
	}
});

var inval_Arr = new Array(3).fill(false);
$('#reg_submit').click(function(){
	
	if ($("input:checkbox[name='flexCheckDefault']").is(":checked") == false){
		alert('탈퇴 전 유의사항을 확인해주세요');
		inval_Arr[0] = false;
	} else if ($("input:checkbox[name='flexCheckDefault']").is(":checked") == true){
		inval_Arr[0] = true;
	}
	
	if (mailJ.test($('#memberEmail').val())){
		inval_Arr[1] = true;
	} else {
		inval_Arr[1] = false;
		$("#memberEmail").focus();
	}
	
	if ($('#codeNum').val() == "") {
		inval_Arr[2] = false;
		$('#codeNum').focus();
	} else {
		inval_Arr[2] = true;
	}
	
	for(var i = 0; i < inval_Arr.length; i++){	
		if(inval_Arr[i] == false){
			alert('입력한 정보들을 다시 한번 확인해주세요 :)');
			return false;
		}
	}
	alert('회원탈퇴가 완료되었습니다.');
	location.href="makeitMemberDelete.do?memberId=${user.memberId}";
	
});
</script>	
	<%@ include file="/common/Footer.jsp"%>