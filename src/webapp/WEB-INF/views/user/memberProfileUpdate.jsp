<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!doctype html>
<html lang="en">

<head>
<meta charset="UTF-8">

<!-- Title  -->
<title>프로필 설정</title>
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
	/* background: url("img/user-img/profile.jpg"); */
	background-size: 150px 150px;
    width: 150px;
    height: 150px; 
    border-radius: 50%;
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
					<h5>Profile Update</h5>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="main.do?memberId=${user.memberId }">Home</a></li>
						<li class="breadcrumb-item active">Profile Update</li>
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
						<h5 class="mb-3">프로필 설정</h5>
						<form action="updateProfile.do?memberId=${user.memberId }" method="post" enctype="multipart/form-data">
							<div class="form-group">
								<div class="box" id="preView" style="float: none; margin: 0 auto;"></div>
								<div class="smallbox" style="float: none; margin: 0 auto;" data-toggle="modal" data-target="#exampleModalCenter"></div>
								<input type="file" class="form-control" id="uploadPicture" name="uploadPicture" accept=".jpeg, .jpg," onchange="setThumbnail(event);" style="display:none">
								<%-- <input type="hidden" name="memberPicture" value="${user.memberPicture }"> --%>
							</div>
							<div class="form-group" style="margin-left: -23px;">
								<input type="hidden" name="interestList" id="interestList">
								<div class="dropdown">
								  <button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
								    <b>관심사</b>
								    <span class="caret"></span>
								  </button>
								  <ul class="dropdown-menu checkbox-menu allow-focus" aria-labelledby="dropdownMenu1">
								    <li><label><input type="checkbox" name="memberInterest" value="스포츠·모빌리티"> 스포츠·모빌리티 </label></li>
								    <li><label><input type="checkbox" name="memberInterest" value="클래스·컨설팅"> 클래스·컨설팅 </label></li>
								    <li><label><input type="checkbox" name="memberInterest" value="컬쳐·아티스트"> 컬쳐·아티스트</label></li>
								    <li><label><input type="checkbox" name="memberInterest" value="캐릭터·굿즈"> 캐릭터·굿즈</label></li>
								    <li><label><input type="checkbox" name="memberInterest" value="베이비·키즈"> 베이비·키즈</label></li>
								    <li><label><input type="checkbox" name="memberInterest" value="기부·캠페인"> 기부·캠페인</label></li>
								    <li><label><input type="checkbox" name="memberInterest" value="테크·가전"> 테크·가전 </label></li>
								    <li><label><input type="checkbox" name="memberInterest" value="패션·잡화"> 패션·잡화</label></li>
								    <li><label><input type="checkbox" name="memberInterest" value="게임·취미"> 게임·취미</label></li>
								    <li><label><input type="checkbox" name="memberInterest" value="여행·레저"> 여행·레저</label></li>
								    <li><label><input type="checkbox" name="memberInterest" value="홈·리빙"> 홈·리빙</label></li>
								    <li><label><input type="checkbox" name="memberInterest" value="반려동물"> 반려동물 </label></li>
								    <li><label><input type="checkbox" name="memberInterest" value="뷰티"> 뷰 티</label></li>
								    <li><label><input type="checkbox" name="memberInterest" value="푸드"> 푸 드 </label></li>
								    <li><label><input type="checkbox" name="memberInterest" value="출판"> 출 판</label></li>
								    <li><label><input type="checkbox" name="memberInterest" value="후원"> 후 원 </label></li>
								    <li><label><input type="checkbox" name="memberInterest" value="모임"> 모 임</label></li>
								  </ul>
								  <div class="check_font" id="checkbox_check"></div>
								</div>
							</div>
							<br>
							<button id="reg_submit" class="btn btn-primary btn-block" type="button">저 장</button>
						</form>
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
var userImg = '${user.memberPicture}';
if (userImg == null || userImg == "") {
	$('#preView').css('background-image', 'url("img/user-img/profile.jpg")');
} else {
	$('#preView').css('background-image', 'url("img/user-img/${user.memberPicture}")');
}

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

//기존 체크값
var arr = '${user.memberInterest}';
arr = arr.split(',');
var arrLen = arr.length;

var chk = $('input:checkbox[name=memberInterest]');

for (var i = 0; i < arrLen; i++) { // arr
    var arrVal = arr[i]; // arr의 값 = i : 0, arrVal : 2
    chk.filter('[value=' + arrVal + ']').prop('checked', true); // arrVal 값 2, 4, 5에 의해 checkbox의 value의 값 2, 4, 5를 checked 처리
}

	var inval_Arr = new Array(1).fill(false);
	let go = document.forms[1];
	
	$('#reg_submit').click(function(){
		
		//체크박스 관련
        var chkArray = new Array();
 
        $('input:checkbox[name=memberInterest]:checked').each(function() { // 체크된 체크박스의 value 값
            chkArray.push(this.value);
        });
        $('#interestList').val(chkArray);
        
        if ($('#interestList').val() == "" || $('#interestList').val() == null) {
        	$('#checkbox_check').text('관심사를 한 개 이상 선택해주세요');
			$('#checkbox_check').css('color', 'red'); 
			inval_Arr[0] = false;
			return false;
        } else {
        	$('#checkbox_check').text('');
        	inval_Arr[0] = true;
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