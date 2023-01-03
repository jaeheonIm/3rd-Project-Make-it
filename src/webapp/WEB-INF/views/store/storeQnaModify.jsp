<%@page import="com.makeit.fund.FundVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file ="/common/Header.jsp" %>
<!doctype html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>Make-It 펀딩</title>
    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Style CSS -->
    <link rel="stylesheet" href="style1.css">
	
	<!--  Bootstrap 4 --> 
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<!-- Start Rating -->
	<link href="css/star-rating.css" media="all" rel="stylesheet" type="text/css" />
	
	<!-- jQuery -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"> </script>
	
	<!-- Bootstrap 4  -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
	
	<!-- Star Rating -->
	<script src="js/star-rating.js" type="text/javascript"></script>
	
</head>
<style>

	 .qna-insert-button  {
 	background-color: #00c4c4;
	border: 1px solid #dddddd;
	height: 50px;
	width: 130px;
	color: #fff;
	border-radius: 10px;
 }
 
 	.go_fundingQnA {
 	text-decoration: none;
  	padding:10px 20px 10px 20px;
 	background-color: #00c4c4;
	border: 1px solid #dddddd;
	height: 50px;
	width: 150px;
	border-radius: 10px;
	color: white;
	display:inline-block;
 }
 
 table, th, td {
		margin: 0 auto;
	}

</style>
<body>
    <!-- Breadcumb Area -->
    <div class="breadcumb_area">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <h5>PRODUCT DETAILS</h5>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">HOME</a></li>
                        <li class="breadcrumb-item"><a href="fundingPageAll.do">FUNDING</a></li>
                        <li class="breadcrumb-item active">문의 하기</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <br>
    <!-- Breadcumb Area End -->
    
    <!-- Funding Q&A Insert -->
		<div class="message_now_area section_padding_100" id="contact">
	        <div class="container">
	            <div class="row justify-content-center">
	                <div class="col-12 col-lg-6">
	                    <div class="popular_section_heading mb-50 text-center">
	                        <h5 class="mb-3">문의사항</h5>
	                    </div>
	                </div>
	            </div>
	            <div class="row">
	                <div class="col-12">
	                    <div class="contact_from mb-50">
	                        <form action="Qnaupdate.do">
	                            <div class="contact_input_area">
	                                <div class="row">
	                                 	<div class="col-12">
	                                        <div class="form-group">
	                                       		<br><div>작성자 : ${view.memberId }</div><br>
	                                        </div>
	                                    </div>
	                                    <table>
	                                    	<tr>
	                                    		<th></th>
	                                    		<td>
	                                    			<input type="text" class="form-control" id="qnaTitle" name="qnaTitle" placeholder="${view.qnaTitle}"><br>
	                                    		</td>
	                                    	</tr>
	                                    	
	                                    	<tr>
	                                    		<th></th>
	                                    		<td>
	                                    			<textarea class="form-control" id="qnaContent" name="qnaContent" rows="30" cols="150" placeholder="문의글 작성">${view.qnaContent}</textarea><br>
	                                    		</td>
	                                    	</tr>
	                                    </table>
	                                    <div class="container">
	                                    	<div class="row">
		                                    	<div class="col-12">
			                                    	<div class="row">
				                                    	<div class="col-md-4" style="text-align:left;">
					                                    	<div class="go_fundingQnA">
					                                    		<i class="fa fa-arrow-left"><a style="color:white" href="fundingQnaList.do?fundIdx=${storeIdx }">&nbsp;  글목록 가기</a></i>
					                                    	</div>
					                                    </div>
					                                     <div class="col-md-4" style="text-align:center;">
						                                     <div class="form-group">
						                                        <button type="button" onclick="insertQna_go()" class="qna-insert-button"><i class="fa fa-comment">&nbsp;문의 남기기</i></button>
						                                        <input type="hidden" name="memberId" value="${vo.memberId }">
						                                        <input type="hidden" name="storeIdx" value="${vo.storeIdx }">
						                                        <input type="hidden" name="qnaIdx" value="${vo.qnaIdx }">
						                                    </div>
					                                    </div>
					                                    <div class="col-md-4" style="text-align:left;">
					                                    	<div class="form-group">
					                                    	</div>
					                                    </div>
				                                    </div>
			                                    </div>
		                                    </div>
	                                    </div>
	                                </div>
	                            </div>
	                        </form>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
    <!-- Funding Q&A Insert End-->
    <script>
    let go = document.forms[1];
	function insertQna_go() {
		if(!confirm("문의를 수정하시겠습니까? Y/N")) {
			alert("문의글 수정을 취소하였습니다.");
		} else {
			go.submit();
		}
	}
</script>
<%@include file ="/common/Footer.jsp" %>