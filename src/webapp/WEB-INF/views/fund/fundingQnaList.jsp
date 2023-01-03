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
	 .qna-insertForm-button  {
 	background-color: #00c4c4;
	border: 1px solid #dddddd;
	height: 40px;
	width: 130px;
	color: #fff;
	border-radius: 10px;
 }
 
 	 .myQna-button  {
 	background-color: #00c4c4;
	border: 1px solid #dddddd;
	height: 40px;
	width: 140px;
	color: #fff;
	border-radius: 10px;
 }

	.go_productDetailView {
 	text-decoration: none;
  	padding:7px 20px 10px 20px;
 	background-color: #00c4c4;
	border: 1px solid #dddddd;
	height: 40px;
	width: 200px;
	border-radius: 10px;
	color: white;
	display:inline-block;
	text-align:center;
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
                        <li class="breadcrumb-item active">Q&A</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <br>
    <!-- Breadcumb Area End -->
    
    <!-- Funding Q&A -->
    <div class="shortcodes_area section_padding_100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="shortcodes_title mb-30">
                        <h4>Q&A</h4>
                    </div>
                     <div class="row">
	                     <div class="col-md-6">
		                     <div class="go_productDetailView">
		                     	<i class="fa fa-arrow-left"><a href="productDetailView.do?fundIdx=${productDetailView.fundIdx }" style="color: white">&nbsp;  상세페이지로 이동</a></i>
		                     </div>
	                     </div>
						<div class="col-md-6" >
							<div class="form-group">
								<form action="fundingQnaInsertForm.do?memberId=${user.memberId }&fundIdx=${productDetailView.fundIdx}" style="margin: 0 auto;text-align: right;float:right">
									<button type="submit" class="qna-insertForm-button"><i class="fa fa-pencil">&nbsp;문의 글 등록</i></button>
								</form>
								<form action="fundMyQnaList.do?" style="margin: 0 auto;text-align: right;float:right">
									<button type="submit" class="myQna-button" id="myQna-button" ><i class="fa fa-commenting-o">&nbsp;내가 쓴 글 보기</i></button>&nbsp;
									<input type="hidden" name="memberId" value="${user.memberId }">
									<input type="hidden" name="fundIdx" value="${productDetailView.fundIdx }">
								</form>
							</div>
						</div>
					</div>
                    <div class="shortcodes_content">
                        <div class="table-responsive">
                            <table class="table mb-0 table-bordered" style="text-align: center;">
                                <thead>
                                    <tr>
                                        <th scope="col" width="10%">문의 유형</th>
                                        <th scope="col" width="55%">제목</th>
                                        <th scope="col" width="15%">아이디</th>
                                        <th scope="col" width="20%">작성일</th>
                                    </tr>
                                </thead>
                                <c:forEach var="fundingQnaList"  items="${fundingQnaList }">
	                                <c:if test="${empty fundingQnaList }">
	                                		문의글이 없습니다.
	                                </c:if>
	                                <c:if test="${not empty fundingQnaList }">
	                                	<tr> 
	                                        <th scope="row" width="10%">${fundingQnaList.fundQnaCategory }</th>
	                                        <c:choose>
		                                        <c:when test="${fundingQnaList.statusChange == 0 }">
			                                        <c:choose>
				                                        <c:when test="${fn:length(fundingQnA.fundQnaTitle) >15 }">
				                                        	 <th scope="row" width="55%"><a href="fundingQnaView.do?fundQnaIdx=${fundingQnaList.fundQnaIdx }">${fn:substring(fundingQnaList.fundQnaTitle,0,15)}...</a></th>
				                                        </c:when>
				                                        <c:otherwise>
				                                        	<th scope="row" width="55%"><a href="fundingQnaView.do?fundQnaIdx=${fundingQnaList.fundQnaIdx }">${fn:substring(fundingQnaList.fundQnaTitle,0,15)}</a></th>
				                                        </c:otherwise>
		                                        	</c:choose>
		                                        </c:when>
		                                        <c:otherwise>
		                                        	<c:choose>
				                                        <c:when test="${fn:length(fundingQnaList.fundQnaTitle) >15 }">
				                                        	 <th scope="row" width="55%"><a href="fundingQnaView.do?fundQnaIdx=${fundingQnaList.fundQnaIdx }">${fn:substring(fundingQnaList.fundQnaTitle,0,15)}...<b style="color:red;">Re : </b>[ ${fundingQnaList.statusChange } ]</a></th>
				                                        </c:when>
				                                        <c:otherwise>
				                                        	<th scope="row" width="55%"><a href="fundingQnaView.do?fundQnaIdx=${fundingQnaList.fundQnaIdx }">${fn:substring(fundingQnaList.fundQnaTitle,0,15)} <b style="color:red;">Re : </b>[ ${fundingQnaList.statusChange } ]</a></th>
				                                        </c:otherwise>
		                                        	</c:choose>
		                                        </c:otherwise>
	                                        </c:choose>
	                                        <th scope="row" width="15%">${fundingQnaList.memberId }</th>
	                                        <th scope="row" width="20%">${fn:substring(fundingQnaList.fundQnaDate,0,16) }</th>
	                                    </tr>
                                     </c:if>
                                </c:forEach>
                            </table>
							<!-- Blog Area End -->
                        </div>
                    </div>

                    <!-- Pagination Area -->
						<div class="container" >
							<div class="shop_pagination_area mt-30">
								<nav aria-label="Page navigation">
									<ul class="pagination pagination-sm justify-content-center"  style="display: flex;" id="ajaxpageinsert" >
										<c:if test="${page.beginPage==1 }">
											<li class="page-item">
												<a class="page-link"><i class="fa fa-angle-left" aria-hidden="false"></i></a>
											</li>
										</c:if>
										<c:if test="${page.beginPage!=1 }">
											<li class="page-item">
												<a class="page-link" href="fundingQnaList.do?cPage=${page.beginPage-1}&fundIdx=${productDetailView.fundIdx }"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
											</li>
										</c:if>
										
										<c:forEach var="pageNo" begin="${page.beginPage }" end="${page.endPage }">
											<c:if test="${pageNo == page.nowPage }">
												<li class="page-item active">
													<a class="page-link">${pageNo }</a>
												</li>
						
											</c:if>
											<c:if test="${pageNo != page.nowPage }">
												<li class="page-item">
													<a class="page-link" href="fundingQnaList.do?cPage=${pageNo }&fundIdx=${productDetailView.fundIdx }">${pageNo }</a>
												</li>
											</c:if>
										</c:forEach>
										
										<c:if test="${page.endPage < page.totalPage }">
										<li class="page-item"> 
											<a class="page-link" href="fundingQnaList.do?cPage=${page.endPage +1 }&fundIdx=${productDetailView.fundIdx }"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
										</li>
										</c:if>
										<c:if test="${page.endPage >= page.totalPage  }">
											<li class="page-item">
												<a class="page-link"><i class="fa fa-angle-right" aria-hidden="false"></i></a>
											</li>
										</c:if>
									</ul>
								</nav>
							</div>
						</div>
						<!-- Pagination Area End-->
						
                </div>
            </div>
        </div>
    </div>	
    <!-- Funding Q&A End-->
    
<%@include file ="/common/Footer.jsp" %>