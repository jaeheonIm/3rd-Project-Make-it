<%@page import="com.makeit.fund.FundVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
                        <li class="breadcrumb-item"><a href="main.do">HOME</a></li>
                        <li class="breadcrumb-item"><a href="fundingPageAll.do">FUNDING</a></li>
                        <li class="breadcrumb-item active">서포터</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <br>
    <!-- Breadcumb Area -->

    <!-- Supporter Area -->
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="product_details_tab section">
                        <!-- Tabs -->
                        <ul class="nav nav-tabs" role="tablist" id="product-details-tab">
							<li class="nav-item">
									<a href="productDetailView.do?fundIdx=${productDetailView.fundIdx }&memberId=${user.memberId}" class="nav-link" >스토리</a>
							</li>
                            <li class="nav-item">
                                <a href="getCommentList.do?fundIdx=${productDetailView.fundIdx }&memberId=${user.memberId}" class="nav-link" >커뮤니티 (${productDetailView.communityCnt })<span class="text-muted"></span></a>
                            </li>
                            <li class="nav-item">
                                <a href="returnAndCancel.do" class="nav-link" >반환 · 정책</a>
                            </li>
                            <li class="nav-item">
                                <a href="getSupporter.do?fundIdx=${productDetailView.fundIdx }&memberId=${user.memberId}" class="nav-link active" >서포터 (${productDetailView.supporterCnt })</a>
                            </li>
                        </ul>
                        
                        <!-- Tab Content -->
                        <div class="tab-content">
              			  <!--  Supporter -->
              			   <div role="tabpanel" class="tab-pane fade show active" id="refund">
	              			  <c:if test="${empty getSupporter }">
		              			  	<br>
		              			  		<p>현재 이 프로젝트에 0명의 참여가 이루어졌습니다.</p>
		              			  	<br>
	              			  </c:if>
	              			  <c:if test="${not empty getSupporter }">
	              			  	<div class="supporter_area">
	              			  		<c:forEach var="getSupporter" items="${getSupporter }">
	              			  			<p>${getSupporter.memberId } 님이 <fmt:formatNumber value="${getSupporter.fundPrice }"/>원 펀딩으로 참여하였습니다. </p>
	              			  			<hr style="border: solid 1px #00c4c4">
	              			  		</c:forEach>
	              			  	</div>
	              			  </c:if>
              			  	</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>
    <!-- Supporter End -->
<%@include file ="/common/Footer.jsp" %>