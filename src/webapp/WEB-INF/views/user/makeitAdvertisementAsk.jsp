<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!doctype html>
<html lang="en">

<head>
<meta charset="UTF-8">

<!-- Title  -->
<title>광고 문의</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/emailjs-com@2/dist/email.min.js"></script>

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
					<h5>Advertisement Ask</h5>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="main.do?memberId=${user.memberId }">Home</a></li>
						<li class="breadcrumb-item active">Advertisement Ask</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<div class="message_now_area section_padding_100" id="contact">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-6">
                    <div class="popular_section_heading mb-50 text-center">
                        <h5 class="mb-3">문의사항 보내기</h5>
                        <p>광고 서비스에 대해 궁금한 사항이 있다면 메일을 보내주세요</p>
                    </div>
                </div>
            </div>

            <div class="row">

                <div class="col-12">
                    <div class="contact_from mb-50">
                        <form method="post">
                            <div class="contact_input_area">
                                <div id="success_fail_info"></div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="email" id="email" value="${user.memberEmail }" placeholder="Email" required>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="name" id="name" value="${user.memberName }" placeholder="Name" required>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <textarea name="message" class="form-control" id="message" cols="30" rows="10" placeholder="Your Message *" required></textarea>
                                        </div>
                                    </div>
                                    <div class="col-12 text-center">
                                        <button id="submit" type="button" class="btn btn-primary w-100">Send Message</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </div>
<script>
	$(document).ready(function() {
		emailjs.init("kB6wChghCK5haVmMl");

       $('#submit').click(function(){
    	   if ($('#email').val() == "" || $('#email').val() == null) {
    		   alert('이메일을 입력해주세요');
    		   return false;
    	   } else if ($('#name').val() == "" || $('#name').val() == null) {
    		   alert('이름을 입력해주세요');
    		   return false;
    	   } else if ($('#message').val() == "" || $('#message').val() == null) {
    		   alert('문의 할 내용을 입력해주세요');
    		   return false;
    	   }
    	   
         var Params = {
               name: $('#name').val(),
               email : $('#email').val(),
               message : $('#message').val()};

        emailjs.send('makeit', 'template_58zfhww', Params)
        	    .then(function(response) {
        	       alert('메일이 성공적으로 전송되었습니다.');
        	       window.location.reload();
        	    }, function(error) {
        	       alert('정상적인 제출이 이루어지지 않았습니다. 다시 시도해주세요!');
        	    });
       });

	  });
</script>
	<%@ include file="/common/Footer.jsp"%>