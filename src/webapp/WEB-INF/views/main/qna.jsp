<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
    
    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">
    <!-- Style CSS -->
    <link rel="stylesheet" href="style.css">
	 <link rel="stylesheet" href="css/main/main.css" type="text/css"> 
<title>Q&A</title>
<style>
#cc_main{
    z-index: 10000000 !important;
    box-shadow: rgb(255 255 255 / 12%) 0px 0px 2px 0px inset, rgb(0 0 0 / 5%) 0px 0px 2px 1px, rgb(0 0 0 / 30%) 0px 12px 60px;
    position: fixed;
    right:20px;
    bottom: 100px !important;
	width: 450px;
    height: 650px;
    min-height: 520px !important;
    max-height: 680px !important;
    overflow: hidden !important;
    background-color: transparent !important;
    border-radius: 30px !important;
    animation: 0.25s ease-out 0s 1 normal none running jZyQVL !important;
    }
    #cc_main_none{
    	display: none;
    }
</style>
</head>

<body>
<!-- Header -->
<c:if test="${user.memberId ne ''}">
<%@include file ="/common/Header.jsp" %>
</c:if>
<c:if test="${user.memberId eq ''}">
<%@include file ="/common/Header_N.jsp" %>
</c:if>
<!-- Header -->
 <!-- Breadcumb Area -->
    <div class="breadcumb_area">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
    			<div class="col-12" style="text-align: center; ">
                    <h5 style="font-size: 1.5em;">Q&A</h5>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcumb Area -->

    <!-- Message Now Area -->
    <div class="message_now_area section_padding_100" id="contact">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12 col-lg-6">
                    <div class="popular_section_heading mb-50 text-center">
                        <h5 class="mb-3">Stay Conneted with us</h5>
                        <p>문의사항을 작성하세요.</p>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12 col-lg-4">
                    <div class="single-contact-info mb-30">
                        <i class="icofont-phone"></i>
                        <p>+00 88 1125263 <br> +00 88 1125264</p>
                    </div>
                </div>
                <div class="col-12 col-lg-4">
                    <div class="single-contact-info mb-30">
                        <i class="icofont-ui-email"></i>
                        <p>support@makeit.com <br> help@makeit.com</p>
                    </div>
                </div>
                <div class="col-12 col-lg-4">
                    <div class="single-contact-info mb-30">
                        <i class="icofont-fax"></i>
                        <p>+00 88 96874 <br> +00 88 96875</p>
                    </div>
                </div>


                <div class="col-12">
                    <div class="contact_from mb-50">
                        <form action="mail.do" method="post" id="main_contact_form" enctype="multipart/form-data">
                            <div class="contact_input_area">
                                <div id="success_fail_info"></div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="memid" id="id" value="${memberId }" disabled>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="Name" id="Name" placeholder="Name *" required>
                                        </div>
                                        <div class="form-group">
                                            <input type="email" class="form-control" name="email" id="email" placeholder="Your E-mail *" required>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="title" id="title" placeholder="Insert Title *" required>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <div class="form-group">
                                            <textarea name="message" class="form-control" id="message" cols="30" rows="10" placeholder="Insert Message *" required></textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="file" class="form-control" name="fileupload" id="file">
                                        </div>
                                    </div>
                                    <div class="col-12 text-center">
                                        <button type="submit" class="btn btn-primary w-100" style="background-color: #00c4c4;">Send Message</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-12" >
                    <div class="cannot_find_text text-center">
                        <h5 class="mb-3">실시간 채팅을 원하면 아래 "Chat"버튼을 클릭하세요.</h5>
                        <i class="icofont-live-support"></i>
                        <button type="button"  id="chatbtnn" class="btn btn-primary" onclick="chatopen()" style="background-color: #00c4c4;">Chat</button>
                    </div>
                    <div class="con" id="cc_main_none"></div>
                </div>
            </div>
        </div>
    </div>
<script>
function chatopen(){
	var chat="<iframe class='chatopen' id='chatopeniframe' src='chat_go_client.do'></iframe>";
	$(".con").html(chat);
	$(".con").attr("id","cc_main");
	$("#chatbtnn").attr("disabled","disabled");
}

function chatclose(){
	var targetObj = document.getElementById("chatopeniframe");
	targetObj.parentNode.removeChild(targetObj);
	$(".con").attr("id","cc_main_none");
	$("#chatbtnn").removeAttr("disabled");
	}

</script>
    <!-- Message Now Area End-->
    <!-- jQuery (Necessary for All JavaScript Plugins) -->
    <script src="js/jquery.min.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/jquery.easing.min.js"></script>
    <script src="js/default/classy-nav.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/default/scrollup.js"></script>
    <script src="js/waypoints.min.js"></script>
    <script src="js/jquery.countdown.min.js"></script>
    <script src="js/jquery.counterup.min.js"></script>
    <script src="js/jquery-ui.min.js"></script>
    <script src="js/jarallax.min.js"></script>
    <script src="js/jarallax-video.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="js/default/active.js"></script>
    
<%@include file="/common/Footer.jsp"%>
</body>
</html>