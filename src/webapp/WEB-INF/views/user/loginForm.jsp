<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <!-- Title  -->
    <title>로그인</title>
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
                        <li class="breadcrumb-item"><a href="main.do">Home</a></li>
                        <li class="breadcrumb-item active">Login</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcumb Area -->

    <!-- Login Area -->
    <div class="bigshop_reg_log_area section_padding_100_50">
        <div class="container">
            <div class="row" style="float: none; margin:100 auto;">
                <div class="col-12 col-md-6" style="float: none; margin:0 auto;">
                    <div class="login_form mb-50">
                        <h5 class="mb-3">로그인</h5>

                        <form action="memberLogin.do" method="post">
                            <div class="form-group">
                                <input type="text" class="form-control" id="memberId" name="memberId" value="jaeheon" placeholder="ID">
                                <div class="check_font" id="id_check"></div>
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" id="memberPwd" name="memberPwd" value="1" placeholder="Password">
                                <div class="check_font" id="pw_check"></div>
                            </div>
                            <button id="login_submit" class="btn btn-primary btn-block" type="button">로그인</button>
                        </form>
                        
                        <!-- Forget Password -->
                        <div class="forget_pass mt-15" style="text-align: center;">
                            <small><a href="memberFindId.do">아이디 찾기&nbsp;&nbsp;</a></small>|
                            <small><a href="memberFindPwd.do">비밀번호 찾기&nbsp;&nbsp;</a></small>|
                            <small><a href="insertMemberForm.do">회원가입</a></small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Login Area End -->
<script>
	$('#memberId').keyup(function(){
		$('#pw_check').text('');
	});
	
	$('#memberPwd').keyup(function(){
		$('#pw_check').text('');
	});

	let go = document.forms[1];
	$('#login_submit').click(function(){
		let vo = {};
		vo.memberId = $('#memberId').val();
		vo.memberPwd = $('#memberPwd').val();
		
		$.ajax("loginCheck.do", {
			type: "post",
			data: JSON.stringify(vo),
			contentType: "application/json",
			async:false,
			success: function(data){
				console.log(data);
				if(data == '' || data.memberNickname == 'disable') {
					$('#pw_check').text('메이크잇에 등록되지 않은 아이디거나, 아이디 또는 비밀번호가 회원정보와 일치하지 않습니다.');
					$('#pw_check').css('color', 'red');
				} else {
					go.submit();
				}
			},
			error: function(){
				alert("실패~~");
			}
		});
	});
</script>
<%@ include file="/common/Footer.jsp" %>