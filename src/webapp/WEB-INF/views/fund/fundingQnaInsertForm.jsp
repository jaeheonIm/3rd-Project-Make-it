<%@page import="com.makeit.fund.FundVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
    <!-- Style CSS -->
    <link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="icon" href="img/core-img/favicon.ico">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;700&display=swap" rel="stylesheet">
</head>
<style>

	 .qna-insert-button  {
 	background-color: #00c4c4;
	border: 1px solid #dddddd;
	height: 40px;
	width: 130px;
	color: #fff;
	border-radius: 10px;
 }
 
 	.go_fundingQnA {
 	text-decoration: none;
  	padding:7px 20px 10px 20px;
 	background-color: #00c4c4;
	border: 1px solid #dddddd;
	height: 40px;
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
	                        <p><i class="fa fa-quora"></i>&nbsp;&nbsp;&nbsp;펀딩 상품에 대해 궁금한 사항이 있다면 문의를 남겨주세요.</p>
	                    </div>
	                </div>
	            </div>
	            <div class="row">
	                <div class="col-12">
	                    <div class="contact_from mb-50">
	                        <form action="fundingQnaInsert.do">
	                            <div class="contact_input_area">
	                                <div>
	                               		<i class="fa fa-quora"></i>&nbsp;&nbsp;&nbsp; 문의 유형 선택  &nbsp; &nbsp; <br><br>
	                               		<i class="fa fa-gift"></i><label>&nbsp; <input type="radio" name="fundQnaCategory" value="상품">&nbsp; 상품</label>&nbsp; &nbsp; &nbsp; &nbsp; 
	                               		<i class="fa fa-bus"></i><label>&nbsp; <input type="radio" name="fundQnaCategory" value="배송">배송</label>&nbsp; &nbsp; &nbsp; &nbsp; 
	                               		<i class="fa fa-close"></i><label>&nbsp; <input type="radio" name="fundQnaCategory" value="반품/취소">반품/ 취소</label>&nbsp; &nbsp; &nbsp; &nbsp; 
	                               		<i class="fa fa-exchange"></i><label>&nbsp; <input type="radio" name="fundQnaCategory" value=교환/변경>교환/변경</label>&nbsp; &nbsp; &nbsp; &nbsp; 
	                               		<i class="fa fa-reorder"></i><label>&nbsp; <input type="radio" name="fundQnaCategory" value="기타">기타</label><br>
	                               	</div>
	                                <div class="row">
	                                 	<div class="col-12">
	                                        <div class="form-group">
	                                       		<br><div>작성자 : ${user.memberId }</div><br>
	                                        </div>
	                                    </div>
	                                    <table>
	                                    	<tr>
	                                    		<th></th>
	                                    		<td>
	                                    			<input type="text" class="form-control" id="fundQnaTitle" name="fundQnaTitle" placeholder="제목"><br>
	                                    		</td>
	                                    	</tr>
	                                    	
	                                    	<tr>
	                                    		<th></th>
	                                    		<td>
	                                    			<textarea class="form-control" id="fundQnaContent" name="fundQnaContent" rows="30" cols="150" placeholder="문의글 작성"></textarea><br>
	                                    		</td>
	                                    	</tr>
	                                    </table>
	                                    <div class="container">
	                                    	<div class="row">
		                                    	<div class="col-12">
			                                    	<div class="row">
				                                    	<div class="col-md-4" style="text-align:left;">
					                                    	<div class="go_fundingQnA">
					                                    		<i class="fa fa-arrow-left"><a style="color:white" href="fundingQnaList.do?fundIdx=${productDetailView.fundIdx }">&nbsp;  글목록 가기</a></i>
					                                    	</div>
					                                    </div>
					                                     <div class="col-md-4" style="text-align:center;">
						                                     <div class="form-group">
						                                        <button type="button" onclick="insertQna_go()" class="qna-insert-button"><i class="fa fa-comment">&nbsp;문의 남기기</i></button>
						                                        <input type="hidden" name="memberId" value="${user.memberId }">
						                                        <input type="hidden" name="fundIdx" value="${productDetailView.fundIdx }">
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
		if(!confirm("문의를 남기시겠습니까? Y/N")) {
			alert("문의글 작성을 취소하였습니다.");
		} else {
			go.submit();
		}
	}
</script>
<%@include file ="/common/Footer.jsp" %>