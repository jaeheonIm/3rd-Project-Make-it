<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>비밀번호 찾기</title>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

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
                    <h5>Login</h5>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="main.do?memberId=${user.memberId }">Home</a></li>
                        <li class="breadcrumb-item active">Login</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcumb Area -->
	<br>
	<br>
	<div class="container">
		<h4 style="font-weight: bold;">비밀번호 찾기</h4>
		<hr style="color: silver;">
	</div>
    
    <div class="bigshop_reg_log_area section_padding_100_50">
        <div class="container">
            <div class="row" style="float: none; margin:100 auto;">
                <div class="col-12 col-md-6" style="float: none; margin:0 auto;">
                    <div class="login_form mb-50" id="findInsert">
                    <h5 class="mb-3"></h5>

                        <form method="post">
                        	<div class="form-group">
								<label for="memberId">아이디</label> 
								<input type="text" class="form-control" id="memberId" name="memberId" placeholder="ID">
								<div class="check_font" id="id_check"></div>
							</div>
                            <div class="form-group">
								<label for="memberEmail">이메일</label> 
								<div class="input-group mb-3">
									<input type="text" class="form-control" id="memberEmail" name="memberEmail" placeholder="ex) itwill@itwill.com">
									<button type="button" class="btn btn-primary" id="mail-Check-Btn">본인인증</button>
								</div>
								<div class="check_font" id="email_check"></div>
							</div>
							<div class="form-group">
								<input id="codeNum" class="form-control mail-check-input" placeholder="인증번호 6자리를 입력해주세요!" disabled="disabled" maxlength="6">
								<div id="mail-check-warn"></div>
							</div>
                            <button id="find_submit" class="btn btn-primary btn-block" type="button">다음</button>
                        </form>
                        
                        <!-- Forget Password -->
                        <div class="forget_pass mt-15" style="text-align: right;">
                            <small><a href="loginForm.do">로그인&nbsp;&nbsp;</a></small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
  
<script>
var idJ = /^[a-z0-9]{4,12}$/;
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

$('#memberId').keyup(function() {
	let vo = {};
	vo.memberId = $('#memberId').val();
	
	$.ajax("getmemberId.do", {
		type: "post",
		data: JSON.stringify(vo),
		contentType: "application/json",
		dataType: "json",
		async:false,
		success: function(data){
			console.log(data);
			if(data == 1) {
				$('#id_check').text('사용중인 아이디입니다.');
				$('#id_check').css('color', 'red');
			} else {
				if (idJ.test($('#memberId').val())) {
					$('#id_check').text('사용가능한 아이디 입니다.');
					$('#id_check').css('color', 'blue');
				} else if ($('#memberId').val() == "") {
					$('#id_check').text('아이디를 입력해주세요');
					$('#id_check').css('color', 'red');
				} else {
					$('#id_check').text('숫자 또는 문자로 4~12자리 입력');
					$('#id_check').css('color', 'red');
				}
			}
		},
		error: function(){
			alert("실패~~");
		}
	});
});

$('#memberEmail').keyup(function(){
	if(mailJ.test($(this).val())){
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
	});
}); 

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
	
	var inval_Arr = new Array(2).fill(false);
	let go = document.forms[1];
	$('#find_submit').click(function(){
		if (mailJ.test($('#memberEmail').val())){
			inval_Arr[0] = true;
		} else {
			inval_Arr[0] = false;
			$("#memberEmail").focus();
			return false;
		}
		
		if ($('#codeNum').val() == "") {
			inval_Arr[1] = false;
			$('#codeNum').focus();
		} else {
			inval_Arr[1] = true;
		}
		
		for(var i = 0; i < inval_Arr.length; i++){	
			if(inval_Arr[i] == false){
				alert('입력한 정보를 다시 한번 확인해주세요 :)');
				return false;
			}
		}
		
		let vo = {};
		vo.memberEmail = $('#memberEmail').val();
		$.ajax("memberEmail.do", {
			type: "post",
			data: JSON.stringify(vo),
			contentType: "application/json",
			async:false,
			success: function(data){
				console.log(data);
				let findHtml="";
				
				findHtml += "<h5 class='mb-3'>비밀번호 설정</h5><br>";
				findHtml += "<form action='updatePassword.do' method='post' enctype='multipart/form-data'>";
				findHtml += "<div class='form-row'>";
				findHtml += "<div class='form-group col-md-6'>";
				findHtml += "<label for='memberPwd'>새 비밀번호</label>";
				findHtml += "<input type='password' class='form-control' id='memberPwd' name='memberPwd' placeholder='새 비밀번호'>";
				findHtml += "<div id='pw_check'></div>";
				findHtml += "</div>";
				findHtml += "<div class='form-group col-md-6'>";
				findHtml += "<label for='memberPwdCheck'>새 비밀번호 확인</label>";
				findHtml += "<input type='password' class='form-control' id='memberPwdCheck' name='memberPwdCheck' placeholder='새 비밀번호 확인'>";
				findHtml += "<div id='pw2_check'></div>";
				findHtml += "<input type='hidden' name='memberId' id='memberId' value='" + data.memberId + "'>";
				findHtml += "</div>";
				findHtml += "</div>";
				findHtml += "<br>";
				findHtml += "<button id='reg_submit' class='btn btn-primary' type='button'>확 인</button>";
				findHtml += "</form>"
				
				$('#findInsert').html(findHtml);
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
				var pwJ = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
				var inval_Arr = new Array(1).fill(false);
				let go1 = document.forms[1];
				$('#reg_submit').click(function(){
					
					// 비밀번호가 같은 경우 && 비밀번호 정규식
					if (($('#memberPwd').val() == ($('#memberPwdCheck').val())) && pwJ.test($('#memberPwd').val())) {
						inval_Arr[0] = true;
					} else {
						inval_Arr[0] = false;
						$("#memberPwd").focus();
						return false;
					}
					
					for(var i = 0; i < inval_Arr.length; i++){	
						if(inval_Arr[i] == false){
							alert('입력한 정보들을 다시 한번 확인해주세요 :)');
							return false;
						}
					}	
					go1.submit();
				});
			},
			error: function(){
				alert("실패~~");
			}
		});
		
	});
	
	
</script>
<%@ include file="/common/Footer.jsp" %>