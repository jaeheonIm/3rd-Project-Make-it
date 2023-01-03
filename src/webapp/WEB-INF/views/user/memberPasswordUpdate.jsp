<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!doctype html>
<html lang="en">

<head>
<meta charset="UTF-8">

<!-- Title  -->
<title>비밀번호 설정</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

<style>
	.checkbox-menu li label {
	    display: block;
	    padding: 3px 10px;
	    clear: both;
	    font-weight: normal;
	    line-height: 1.42857143;
	    color: #333;
	    white-space: nowrap;
	    margin:0;
	    transition: background-color .4s ease;
	}
	.checkbox-menu li input {
	    margin: 0px 5px;
	    top: 2px;
	    position: relative;
	}
	
	.checkbox-menu li.active label {
	    background-color: #cbcbff;
	    font-weight:bold;
	}
	
	.checkbox-menu li label:hover,
	.checkbox-menu li label:focus {
	    background-color: #f5f5f5;
	}
	
	.checkbox-menu li.active label:hover,
	.checkbox-menu li.active label:focus {
	    background-color: #b8b8ff;
	}
	
	.box {
	background: url("img/user-img/profile.jpg");
	background-size: 150px 150px;
    width: 150px;
    height: 150px; 
    border-radius: 47%;
    overflow: hidden;
	}
	
	.smallbox {
	background: url("img/user-img/camera.jpg");
	background-size: 50px 50px;
    width: 50px;
    height: 50px; 
    border-radius: 70%;
    overflow: hidden;
    position: relative;
    left: 45px; top: -55px;
	}
	
	.profile {
	    width: 100%;
	    height: 100%;
	    object-fit: cover;
	}
</style>
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
					<h5>Password Update</h5>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="main.do?memberId=${user.memberId }">Home</a></li>
						<li class="breadcrumb-item active">Password Update</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcumb Area -->

	<!-- Login Area -->
	<div class="bigshop_reg_log_area section_padding_100_50">
		<div class="container">
			<div class="row" style="float: none; margin: 100 auto;">
				<div class="col-12 col-md-6" style="float: none; margin: 0 auto;">
					<div class="login_form mb-50">
						<h5 class="mb-3">비밀번호 설정</h5><br>
							<div class="form-group">
								<label for="memberPassword">현재 비밀번호</label> 
								<input type="password" class="form-control" id="memberPassword" name="memberPwd" placeholder="현재 비밀번호">
								<div class="check_font" id="password_check"></div>
							</div>
						<form action="updatePassword.do?memberId=${user.memberId }" method="post" enctype="multipart/form-data">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="memberPwd">새 비밀번호</label> 
									<input type="password" class="form-control" id="memberPwd" name="memberPwd" placeholder="새 비밀번호">
									<div id="pw_check"></div>
								</div>
								<div class="form-group col-md-6">
									<label for="memberPwdCheck">새 비밀번호 확인</label> 
									<input type="password" class="form-control" id="memberPwdCheck" name="memberPwdCheck" placeholder="새 비밀번호 확인">
									<div id="pw2_check"></div>
								</div>
							</div>
							<div class="form-group">
								<label for="memberEmail">본인확인</label> 
								<div class="input-group mb-3">
									<input type="text" class="form-control" id="memberEmail" name="memberEmail" value="${user.memberEmail }" placeholder="ex) itwill@itwill.com">
									<button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
								</div>
								<div class="check_font" id="email_check"></div>
							</div>
							<div class="form-group">
								<input id="codeNum" class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
								<div id="mail-check-warn"></div>
							</div>
							<br>
							<button id="reg_submit" class="btn btn-primary btn-block" type="button">저 장</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<script>
//정규식
//모든 공백 체크 정규식
var empJ = /\s/g;
//아이디
var idJ = /^[a-z0-9]{4,12}$/;
//닉네임
var nickJ =  /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,10}$/;
// 비밀번호
var pwJ = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
// 이름
var nameJ = /^[가-힣]{2,6}$/;
// 이메일
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
// 휴대폰
var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

$('#memberPassword').keyup(function() {
	$("#password_check").text('');
	
	let vo = {};
	vo.memberPwd = $('#memberPassword').val();
	vo.memberId = '${user.memberId}';
	
	$.ajax("getmemberPassword.do", {
		type: "post",
		data: JSON.stringify(vo),
		contentType: "application/json",
		dataType: "json",
		async:false,
		success: function(data){
			console.log(data);
			if(data == 1) {
				$('#password_check').text('비밀번호가 일치합니다');
				$('#password_check').css('color', 'blue');
			} else {
				$('#password_check').text('비밀번호가 일치하지 않습니다');
				$('#password_check').css('color', 'red');
			}
		},
		error: function(){
			alert("실패~~");
		}
	});
});

//새 비밀번호
$('#memberPwd').keyup(function() {
	$("#pw_check").text('');
	
	if (pwJ.test($('#memberPwd').val())) {
		console.log('true');
		$('#pw_check').text('사용가능한 비밀번호 입니다.');
		$('#pw_check').css('color', 'blue');
	} else {
		console.log('false');
		$('#pw_check').text('최소 8 자, 최소 하나의 문자, 하나의 숫자 및 하나의 특수 문자');
		$('#pw_check').css('color', 'red');
	}

});

//새 비밀번호 확인
$('#memberPwdCheck').keyup(function() {
	$("#pw2_check").text('');
	
	if ($('#memberPwd').val() != $(this).val()) {
		console.log('false');
		$('#pw2_check').text('비밀번호가 일치하지 않습니다.');
		$('#pw2_check').css('color', 'red');
	} else {
		console.log('true');
		$('#pw2_check').text('비밀번호가 일치합니다.');
		$('#pw2_check').css('color', 'blue');
	}

});

// 이메일
$('#memberEmail').keyup(function(){
	$("#email_check").text('');
	
	let vo = {};
	vo.memberEmail = $('#memberEmail').val();
	
	$.ajax("getmemberEmail.do", {
		type: "post",
		data: JSON.stringify(vo),
		contentType: "application/json",
		dataType: "json",
		async:false,
		success: function(data){
			console.log(data);
			if(data >= 1) {
				$('#email_check').text('사용중인 이메일입니다.');
				$('#email_check').css('color', 'red');
			} else {
				if (mailJ.test($('#memberEmail').val())) {
					$('#email_check').text('사용가능한 이메일 입니다.');
					$('#email_check').css('color', 'blue');
				} else if ($('#memberEmail').val() == "") {
					$('#email_check').text('이메일을 입력해주세요');
					$('#email_check').css('color', 'red');
				} else {
					$('#email_check').text('이메일 형식을 확인해주세요');
					$('#email_check').css('color', 'red');
				}
			}
		},
		error: function(){
			alert("실패~~");
		}
	});
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

	var inval_Arr = new Array(4).fill(false);
	let go = document.forms[1];
	
	$('#reg_submit').click(function(){
		
		if($('#memberPassword').val() == "") {
			inval_Arr[0] = false;
			$("#memberPassword").focus();
			return false;
		} else {
			inval_Arr[0] = true;
		}
		
		// 이메일 정규식
		if (mailJ.test($('#memberEmail').val())){
			inval_Arr[1] = true;
		} else {
			inval_Arr[1] = false;
			$("#memberEmail").focus();
			return false;
		}
		
		if ($('#codeNum').val() == "") {
			inval_Arr[2] = false;
			$('#codeNum').focus();
		} else {
			inval_Arr[2] = true;
		}
		
		// 비밀번호가 같은 경우 && 비밀번호 정규식
		if (($('#memberPwd').val() == ($('#memberPwdCheck').val())) && pwJ.test($('#memberPwd').val())) {
			inval_Arr[3] = true;
		} else {
			inval_Arr[3] = false;
			$("#memberPwd").focus();
			return false;
		}
		
        //값 체크 후 전송
		for(var i = 0; i < inval_Arr.length; i++){	
			if(inval_Arr[i] == false){
				alert('입력한 정보들을 다시 한번 확인해주세요 :)');
				return false;
			}
		}	
		go.submit();
		
	});
</script>
<%@ include file="/common/Footer.jsp" %>