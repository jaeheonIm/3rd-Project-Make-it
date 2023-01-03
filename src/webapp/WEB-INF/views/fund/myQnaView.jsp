<%@page import="com.makeit.fund.FundVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

 	.go_myQnA {
 	text-decoration: none;
  	padding:10px 20px 10px 20px;
 	background-color: #00c4c4;
	border: 1px solid #dddddd;
	height: 40px;
	width: 170px;
	border-radius: 10px;
	color: white;
	display:inline-block;
}

	.update_btn[type="submit"] {
	background-color: #00c4c4;
	border: 1px solid #dddddd;
	height: 40px;
	width: 90px;
	color: white;
	border-radius: 10px;
}

	.go_delete {
	text-decoration: none;
  	padding:10px 20px 10px 20px;
 	background-color: #00c4c4;
	border: 1px solid #dddddd;
	height: 40px;
	width: 110px;
	border-radius: 10px;
	color: white;
	display:inline-block;
	text-align: center;
}

.insertQnaRe[type="submit"] {
	background-color: #00c4c4;
	border: 1px solid #dddddd;
	height: 40px;
	width: 70px;
	color: white;
	border-radius: 10px;
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
                        <li class="breadcrumb-item active">My Q&A</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <br>
    <!-- Breadcumb Area End -->
    
    <!-- Funding Q&A View -->
    <section class="faq--area section_padding_100_70" style="text-align: center;">
		<div class="container" id="con1">
			<div class="board-main">
				<ul>
					<li>
						<div class="info">
							<h3 class="title">제목 : ${myQnaView.fundQnaTiltle }</h3><hr>
							<div style="text-align: center;">
								<div class="writer">
									<span class="author">작성자 : ${myQnaView.memberId } </span><br><hr>
								</div>
								<div class="writer">
									<span class="created-at">작성일 : ${fn:substring(myQnaView.fundQnaDate,0,16) } </span>
								</div>
							</div>
						</div>
					</li>					
				</ul>
				<hr>
				<ul>
				<c:if test="${empty myQnaView}">
						<li>
							내용이 없습니다.
						</li>
				</c:if>
				<c:if test="${not empty myQnaView }">
					<li>
						<p style="color: black; text-align: left; white-space:pre-line; margin-bottom: 150px;  padding: 0 50px;">${fundingQnaView.fundQnaContent }</p>
					</li>
				</c:if>
				</ul>
				<br>
				<hr style="border: solid 1px #00c4c4">
				
				<!-- admin 답글 보여지는 부분 -->
				<ul>
					<li>
					<br>
					<c:if test="${empty fundingQnaView}">
						<div class="info">
							<h3 class="title">아직 답변이 없습니다. </h3><hr>
						</div>
					</c:if>
					<c:if test="${not empty fundingQnaView }">
						<div class="info">
							<h3 class="title">Re : ${fundingQnaView.fundQnaTitle } 문의에 대한 답변입니다. </h3><hr>
							<div style="text-align: center;">
								<div class="writer">
									<span class="author">프로젝트 제작자 : ${productDetailView.fundMakerId}</span><br><hr>
								</div>
								<div class="writer">
									<span class="created-at">작성일 : ${fn:substring(fundingQnaRe.fundQnaReDate,0,16) } </span>
								</div>
							</div>
						</div>
					</c:if>
					</li>					
				</ul>
				<hr>
				<div  style="color: black; text-align: left; white-space:pre-line; margin-bottom: 150px;  padding: 0 50px;">
					<span><br>${fundingQnaRe.fundQnaReContent }</span>
				</div>
				<hr>
				<!-- admin 답글 보여지는 부분 끝-->
				
				<!-- admin 계정의 답글 작성 부분 -->
				<div class="submit_a_review_area mt-50">
					<div class="form-group">
						<div class="QnaRe">
							<form action="insertQnaRe.do">
								<c:if test="${user.memberId == productDetailView.fundMakerId }">
									<div class="row">
										<div class="col-12">
											<div class="form-group">
												<table>
													<tr>
														<td>
															<textarea class="form-control" name="fundQnaReContent"  rows="10"  cols="150" data-max-length="2000"></textarea>
														</td>
													</tr>
												</table>
											</div>
										</div>
									</div>
									<button type="submit" onclick="insertQnaRe_go()" class="insertQnaRe">작성</button>
									<input type="hidden" name="fundQnaIdx" value="${myQnaView.fundQnaIdx }">
									<input type="hidden" name="fundQnaTitle" value="${myQnaView.fundQnaTitle }">
									<input type="hidden" name="fundIdx" value="${myQnaView.fundIdx }"> 
								</c:if>
							</form>
						</div>
					</div>
				</div>
				<!-- admin 계정의 답글 작성 부분 끝 -->
				
				<br>
				<hr>
			</div>
		</div>
		<!-- 글목록가기, 수정하기, 삭제하기 버튼 -->
		<div class="container" >
			<div class="row">
				<div class="col-12">
					<div class="row">
						<div class="col-md-4" style="text-align:left;">
                        	<div class="go_myQnA">
                           		<a style="color:white" href="myQnaList.do?memberId=${user.memberId }&fundIdx=${myQnaView.fundIdx }"><i class="fa fa-arrow-left"></i>&nbsp;  내 글목록 가기</a>
                           	</div>
                        </div>
						<c:if test="${myQnaView.memberId == user.memberId || user.memberId == 'admin'}">
						<div class="col-md-4" style="text-align:center">
							<div class="form-group">
								<form action="fundingQnaUpdateForm.do">
									<button type="submit" class="update_btn" onclick="update_go()">수정하기</button>
									<input type="hidden" name="memberId" value="${user.memberId }">
									<input type="hidden" name="fundQnaIdx" value="${myQnaView.fundQnaIdx }">
									<input type="hidden" name="fundIdx" value="${myQnaView.fundIdx }">
								</form>
							</div>
						</div>
						<div class="col-md-4"  style="text-align:right">
							<div class="go_delete">
								<a style="color:white" id="delete_btn" href="deleteQnA.do?fundQnaIdx=${myQnaView.fundQnaIdx }&memberId=${user.memberId}&fundIdx=${productDetailView.fundIdx }" onclick="return confirm('삭제하시겠습니까?');">삭제하기</a>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>	
	</div>
		<!-- 글목록가기, 수정하기, 삭제하기 버튼 끝 -->
</section>
    
    <script>	
	
	function insertQnaRe_go() {
		if (!confirm ("답글을 작성하시겠습니까? Y/N")) {
			alert("답글 작성을 취소하였습니다.");
		} else {
			location.href="insertQnaRe.do}"
		}
	}
		
	</script>
<%@include file ="/common/Footer.jsp" %>
