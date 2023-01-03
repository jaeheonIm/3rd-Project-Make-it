<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!doctype html>
<html lang="en">

<head>
<meta charset="UTF-8">

<!-- Title  -->
<title>회원가입</title>
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
					<h5>Register</h5>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="main.do">Home</a></li>
						<li class="breadcrumb-item active">Register</li>
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
						<h5 class="mb-3">회원가입</h5>
						<form action="insertMember.do" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<div class="box" id="preView" style="float: none; margin: 0 auto;"></div>
								<div class="smallbox" style="float: none; margin: 0 auto;" data-toggle="modal" data-target="#exampleModalCenter"></div>
								<input type="file" class="form-control" id="uploadPicture" name="uploadPicture" accept=".jpeg, .jpg," onchange="setThumbnail(event);" style="display:none">
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="memberName">이름</label> 
									<input type="text" class="form-control" id="memberName" name="memberName" placeholder="Name">
									<div class="check_font" id="name_check"></div>
								</div>
								<div class="form-group col-md-6">
									<label for="memberNickname">닉네임</label> 
									<input type="text" class="form-control" id="memberNickname" name="memberNickname" placeholder="Nickname">
									<div class="check_font" id="nickname_check"></div>
								</div>
							</div>
							<div class="form-group">
								<label for="memberId">아이디</label> 
								<input type="text" class="form-control" id="memberId" name="memberId" placeholder="ID">
								<div class="check_font" id="id_check"></div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="memberPwd">비밀번호</label> 
									<input type="password" class="form-control" id="memberPwd" name="memberPwd" placeholder="Password">
									<div id="pw_check"></div>
								</div>
								<div class="form-group col-md-6">
									<label for="memberPwdCheck">비밀번호확인</label> 
									<input type="password" class="form-control" id="memberPwdCheck" name="memberPwdCheck" placeholder="Password Check">
									<div id="pw2_check"></div>
								</div>
							</div>
							<div class="form-group">
								<label for="memberBirth">생년월일</label> 
								<input type="text" class="form-control" id="memberBirth" name="memberBirth" placeholder="ex) 19990415">
								<div class="check_font" id="birth_check"></div>
							</div>
							<div class="form-group">
								<label for="memberAddress">주소</label> 
								<input type="text" class="form-control" id="memberAddress" name="memberAddress" placeholder="ex) 서울시 강남구 역삼동...">
								<div class="check_font" id="address_check"></div>
							</div>
							<div class="form-group">
								<label for="memberPhone">전화</label> 
								<input type="text" class="form-control" id="memberPhone" name="memberPhone" placeholder="- 없이 번호만 입력해주세요">
								<div class="check_font" id="phone_check"></div>
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
							<div class="form-group" style="margin-left: -23px;">
								<input type="hidden" name="interestList" id="interestList">
								<div class="dropdown">
								  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
								    <b>관심사</b>
								    <span class="caret"></span>
								  </button>
								  <ul class="dropdown-menu checkbox-menu allow-focus" aria-labelledby="dropdownMenu1">
								    <li><label><input type="checkbox" name="memberInterest" value="전체"> 전 체 </label></li>
								    <li><label><input type="checkbox" name="memberInterest" value="뷰티"> 뷰 티</label></li>
								    <li><label><input type="checkbox" name="memberInterest" value="푸드"> 푸 드 </label></li>
								    <li><label><input type="checkbox" name="memberInterest" value="반려동물"> 반려동물</label></li>
								    <li><label><input type="checkbox" name="memberInterest" value="테크·가전"> 테크·가전 </label></li>
								    <li><label><input type="checkbox" name="memberInterest" value="패션·잡화"> 패션·잡화</label></li>
								    <li><label><input type="checkbox" name="memberInterest" value="리빙·베이비"> 리빙·베이비</label></li>
								    <li><label><input type="checkbox" name="memberInterest" value="여행·스포츠"> 여행·스포츠</label></li>
								  </ul>
								  <div class="check_font" id="checkbox_check"></div>
								</div>
							</div>
							<br>
							<button id="reg_submit" class="btn btn-primary btn-block" type="button">가입하기</button>
						</form>
						<div class="forget_pass mt-15" style="text-align: center;">
							<small><a href="memberFindId.do">아이디 찾기&nbsp;&nbsp;</a></small>|
                            <small><a href="memberFindPwd.do">비밀번호 찾기&nbsp;&nbsp;</a></small>|
                            <small><a href="loginForm.do">로그인</a></small>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLongTitle">프로필사진 등록</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" onclick="onClickDelete();">삭 제</button>
	        <button type="button" class="btn btn-primary" onclick="onClickUpload();">등 록</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- Login Area End -->
<script>

// 프로필관련
function onClickUpload() {
    let myInput = document.getElementById("uploadPicture");
    myInput.click();
}

function onClickDelete() {
	$('#preView').empty();
	$('#preView').css('background-image', 'url("img/user-img/profile.jpg")');
}

function setThumbnail(event){
	
	var reader = new FileReader();
	
	reader.onload = function(event){
		$('#preView').empty();
		$('#preView').css('background-image', 'url("")');
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
		img.setAttribute("class", "profile");
		document.querySelector("div#preView").appendChild(img);
	};
	
	reader.readAsDataURL(event.target.files[0]);
}

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

//아이디
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

//비밀번호
$('#memberPwd').keyup(function() {
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

//비밀번호 확인
$('#memberPwdCheck').keyup(function() {
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

//생일 유효성 검사
var birthJ = false;

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
	    	
	    }else if (month < 1 || month > 12) {
	    		
	    	$('#birth_check').text('생년월일을 확인해주세요');
			$('#birth_check').css('color', 'red'); 
	    
	    }else if (day < 1 || day > 31) {
	    	
	    	$('#birth_check').text('생년월일을 확인해주세요');
			$('#birth_check').css('color', 'red'); 
	    	
	    }else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
	    	 
	    	$('#birth_check').text('생년월일을 확인해주세요');
			$('#birth_check').css('color', 'red'); 
	    	 
	    }else if (month == 2) {
	    	 
	       	var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
	       	
	     	if (day>29 || (day==29 && !isleap)) {
	     		
	     		$('#birth_check').text('생년월일을 확인해주세요');
				$('#birth_check').css('color', 'red'); 
	    	
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
	
	var inval_Arr = new Array(10).fill(false);
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
		
		// 아이디 정규식
		if (idJ.test($('#memberId').val())) {
			inval_Arr[2] = true;	
		} else {
			inval_Arr[2] = false;
			$("#memberId").focus();
			return false;
		}
		
		// 비밀번호가 같은 경우 && 비밀번호 정규식
		if (($('#memberPwd').val() == ($('#memberPwdCheck').val())) && pwJ.test($('#memberPwd').val())) {
			inval_Arr[3] = true;
		} else {
			inval_Arr[3] = false;
			$("#memberPwd").focus();
			return false;
		}
		
		// 생년월일 정규식
		if (birthJ) {
			inval_Arr[4] = true;
		} else {
			inval_Arr[4] = false;
			$("#memberBirth").focus();
			return false;
		}
		
		// 주소 빈칸
		var adressChk = $("#memberAddress").val();
		if (adressChk == "") {
			inval_Arr[5] = false;
			$("#memberAddress").focus();
			return false;
		} else {
			inval_Arr[5] = true;
		}
		
		// 휴대폰번호 정규식
		if (phoneJ.test($('#memberPhone').val())) {
			inval_Arr[6] = true;
		} else {
			inval_Arr[6] = false;
			$("#memberPhone").focus();
			return false;
		}
		
		// 이메일 정규식
		if (mailJ.test($('#memberEmail').val())){
			inval_Arr[7] = true;
		} else {
			inval_Arr[7] = false;
			$("#memberEmail").focus();
			return false;
		}
		
		if ($('#codeNum').val() == "") {
			inval_Arr[8] = false;
			$('#codeNum').focus();
		} else {
			inval_Arr[8] = true;
		}
		
		//체크박스 관련
        var chkArray = new Array();
 
        $('input:checkbox[name=memberInterest]:checked').each(function() { // 체크된 체크박스의 value 값
            chkArray.push(this.value);
        });
        $('#interestList').val(chkArray);
        
        if ($('#interestList').val() == "" || $('#interestList').val() == null) {
        	$('#checkbox_check').text('관심사를 한 개 이상 선택해주세요');
			$('#checkbox_check').css('color', 'red'); 
			inval_Arr[9] = false;
			return false;
        } else {
        	$('#checkbox_check').text('');
        	inval_Arr[9] = true;
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