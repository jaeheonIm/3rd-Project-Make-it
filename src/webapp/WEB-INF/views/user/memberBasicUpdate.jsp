<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!doctype html>
<html lang="en">

<head>
<meta charset="UTF-8">

<!-- Title  -->
<title>기본 정보 설정</title>
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
					<h5>Basic Update</h5>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="main.do?memberId=${user.memberId }">Home</a></li>
						<li class="breadcrumb-item active">Basic Update</li>
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
						<h5 class="mb-3">기본 정보 수정</h5><br>
						<form action="updateMember.do?memberId=${user.memberId }" method="post" enctype="multipart/form-data">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="memberName">이름</label> 
									<input type="text" class="form-control" id="memberName" name="memberName" value="${user.memberName }" placeholder="Name">
									<div class="check_font" id="name_check"></div>
								</div>
								<div class="form-group col-md-6">
									<label for="memberNickname">닉네임</label> 
									<input type="text" class="form-control" id="memberNickname" name="memberNickname" value="${user.memberNickname }" placeholder="Nickname">
									<div class="check_font" id="nickname_check"></div>
								</div>
							</div>
							<div class="form-group">
								<label for="memberBirth">생년월일</label> 
								<input type="text" class="form-control" id="memberBirth" name="memberBirth" value="${user.memberBirth }" placeholder="ex) 19990415">
								<div class="check_font" id="birth_check"></div>
							</div>
							<div class="form-group">
								<label for="memberAddress">주소</label> 
								<input type="text" class="form-control" id="memberAddress" name="memberAddress" value="${user.memberAddress }" placeholder="ex) 서울시 강남구 역삼동...">
								<div class="check_font" id="address_check"></div>
							</div>
							<div class="form-group">
								<label for="memberPhone">전화</label> 
								<input type="text" class="form-control" id="memberPhone" name="memberPhone" value="${user.memberPhone }" placeholder="- 없이 번호만 입력해주세요">
								<div class="check_font" id="phone_check"></div>
							</div>
							<div class="form-group">
								<label for="memberEmail">이메일</label> 
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

//이름 특수문자 불가
$("#memberName").keyup(function() {
	if (nameJ.test($(this).val())) {
			console.log(nameJ.test($(this).val()));
			$("#name_check").text('');
	} else {
		$('#name_check').text('이름을 확인해주세요');
		$('#name_check').css('color', 'red');
	}
});

//닉네임
$('#memberNickname').keyup(function() {
	let vo = {};
	vo.memberNickname = $('#memberNickname').val();
	
	$.ajax("getmemberNickname.do", {
		type: "post",
		data: JSON.stringify(vo),
		contentType: "application/json",
		dataType: "json",
		async:false,
		success: function(data){
			console.log(data);
			if(data == 1) {
				$('#nickname_check').text('사용중인 닉네임입니다.');
				$('#nickname_check').css('color', 'red');
			} else {
				if (nickJ.test($('#memberNickname').val())) {
					$('#nickname_check').text('사용가능한 닉네임 입니다.');
					$('#nickname_check').css('color', 'blue');
				} else if ($('#memberNickname').val() == "") {
					$('#nickname_check').text('닉네임을 입력해주세요');
					$('#nickname_check').css('color', 'red');
				} else {
					$('#nickname_check').text('2~10자리 이내의 닉네임을 입력해주세요');
					$('#nickname_check').css('color', 'red');
				}
			}
		},
		error: function(){
			alert("실패~~");
		}
	});
});



//생일 유효성 검사
var birthJ = true;

// 생년월일
$('#memberBirth').keyup(function(){
	var dateStr = $(this).val();		
    var year = Number(dateStr.substr(0,4)); // 입력한 값의 0~4자리까지 (연)
    var month = Number(dateStr.substr(4,2)); // 입력한 값의 4번째 자리부터 2자리 숫자 (월)
    var day = Number(dateStr.substr(6,2)); // 입력한 값 6번째 자리부터 2자리 숫자 (일)
    var today = new Date(); // 날짜 변수 선언
    var yearNow = today.getFullYear(); // 올해 연도
	
    if (dateStr.length <=8) {
		// 연도의 경우 1900 보다 작거나 yearNow 보다 크다면 false를 반환
	    if (1900 > year || year > yearNow){
	    	
	    	$('#birth_check').text('생년월일을 확인해주세요');
			$('#birth_check').css('color', 'red');
			birthJ = false;
	    }else if (month < 1 || month > 12) {
	    		
	    	$('#birth_check').text('생년월일을 확인해주세요');
			$('#birth_check').css('color', 'red'); 
			birthJ = false;
	    }else if (day < 1 || day > 31) {
	    	
	    	$('#birth_check').text('생년월일을 확인해주세요');
			$('#birth_check').css('color', 'red'); 
			birthJ = false;
	    }else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
	    	 
	    	$('#birth_check').text('생년월일을 확인해주세요');
			$('#birth_check').css('color', 'red'); 
			birthJ = false;
	    }else if (month == 2) {
	    	 
	       	var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
	       	
	     	if (day>29 || (day==29 && !isleap)) {
	     		
	     		$('#birth_check').text('생년월일을 확인해주세요');
				$('#birth_check').css('color', 'red'); 
				birthJ = false;
			}else{
				$('#birth_check').text('');
				birthJ = true;
			}
	     	
	    }else{
	    	
	    	$('#birth_check').text(''); 
			birthJ = true;
		}
		
		}else{
			//1.입력된 생년월일이 8자 초과할때 :  auth:false
			$('#birth_check').text('생년월일을 확인해주세요 :)');
			$('#birth_check').css('color', 'red');  
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


// 휴대전화
$('#memberPhone').keyup(function(){
	if(phoneJ.test($(this).val())){
		console.log(nameJ.test($(this).val()));
		$("#phone_check").text('');
	} else {
		$('#phone_check').text('휴대폰번호를 확인해주세요');
		$('#phone_check').css('color', 'red');
	}
});
	
	var inval_Arr = new Array(7).fill(false);
	let go = document.forms[1];
	
	$('#reg_submit').click(function(){
		
		// 이름 정규식
		if (nameJ.test($('#memberName').val())) {
			inval_Arr[0] = true;	
		} else {
			inval_Arr[0] = false;
			$("#memberName").focus();
			return false;
		}
		
		// 닉네임 정규식
		if (nickJ.test($('#memberNickname').val())) {
			inval_Arr[1] = true;	
		} else {
			inval_Arr[1] = false;
			$("#memberNickname").focus();
			return false;
		}
		
		// 생년월일 정규식
		
		if (birthJ) {
			inval_Arr[2] = true;
		} else {
			inval_Arr[2] = false;
			$("#memberBirth").focus();
			return false;
		} 
		
		
		// 주소 빈칸
		var adressChk = $("#memberAddress").val();
		if (adressChk == "") {
			inval_Arr[3] = false;
			$("#memberAddress").focus();
			return false;
		} else {
			inval_Arr[3] = true;
		}
		
		// 휴대폰번호 정규식
		if (phoneJ.test($('#memberPhone').val())) {
			inval_Arr[4] = true;
		} else {
			inval_Arr[4] = false;
			$("#memberPhone").focus();
			return false;
		}
		
		// 이메일 정규식
		if (mailJ.test($('#memberEmail').val())){
			inval_Arr[5] = true;
		} else {
			inval_Arr[5] = false;
			$("#memberEmail").focus();
			return false;
		}
		
		if ($('#codeNum').val() == "") {
			inval_Arr[6] = false;
			$('#codeNum').focus();
		} else {
			inval_Arr[6] = true;
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