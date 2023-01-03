<%@page import="com.makeit.fund.FundVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@include file ="/common/Header.jsp" %>
<!doctype html>

<head>
    <meta charset="UTF-8">
    <meta name="description" content="">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    <!-- Title  -->
    <title>Make-It 스토어</title>
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
	 .qna-insertForm-button  {
 	background-color: #00c4c4;
	border: 1px solid #dddddd;
	height: 50px;
	width: 130px;
	color: #fff;
	border-radius: 10px;
 }
 
 	 .myQna-button  {
 	background-color: #00c4c4;
	border: 1px solid #dddddd;
	height: 50px;
	width: 140px;
	color: #fff;
	border-radius: 10px;
 }

	.go_productDetailView {
 	text-decoration: none;
  	padding:10px 20px 10px 20px;
 	background-color: #00c4c4;
	border: 1px solid #dddddd;
	height: 50px;
	width: 200px;
	border-radius: 10px;
	color: white;
	display:inline-block;
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
                        <li class="breadcrumb-item"><a href="fundingPageAll.do">STORE</a></li>
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
		                     	<i class="fa fa-arrow-left"><a href="detail.do?storeIdx=${storeIdx }&memberId=${memberId}" style="color: white">&nbsp;  상세페이지로 이동</a></i>
		                     </div>
	                     </div>
						<div class="col-md-6" >
							<div class="form-group">
								<form action="QnaInsertForm.do" style="margin: 0 auto;text-align: right;float:right">
									<button type="submit" class="qna-insertForm-button"><i class="fa fa-pencil">&nbsp;문의 글 등록</i></button>
									<input type="hidden" value="${memberId }" name="memberId">
									<input type="hidden" value="${storeIdx }" name="storeIdx">
								</form>
								<form action="myQnaList.do" style="margin: 0 auto;text-align: right;float:right">
									<button type="submit" class="myQna-button" id="myQna-button" ><i class="fa fa-commenting-o">&nbsp;내가 쓴 글 보기</i></button>&nbsp;
									<input type="hidden" value="${memberId }" name="memberId">
									<input type="hidden" value="${storeIdx }" name="storeIdx">
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
                                <c:forEach var="list"  items="${getlist }">
	                                <c:if test="${empty list }">
	                                		문의글이 없습니다.
	                                </c:if>
	                                <c:if test="${not empty list }"> 
	                                	<tr> 
	                                        <th scope="row" width="10%">${list.qnaCategory }</th>
	                                        <c:choose>
		                                        <c:when test="${list.qnaChange == 0 }">
			                                        <c:choose>
				                                        <c:when test="${fn:length(list.qnaTitle) >15 }">
				                                        	 <th scope="row" width="55%"><a href="qnaView.do?qnaIdx=${list.qnaIdx }&memberId=${memberId}&storeIdx=${storeIdx}">${fn:substring(list.qnaTitle,0,15)}...</a></th>
				                                        </c:when>
				                                        <c:otherwise>
				                                        	<th scope="row" width="55%"><a href="qnaView.do?qnaIdx=${list.qnaIdx }&memberId=${memberId}&storeIdx=${storeIdx}">${fn:substring(list.qnaTitle,0,15)}</a></th>
				                                        </c:otherwise>
		                                        	</c:choose>
		                                        </c:when>
		                                        <c:otherwise>
		                                        	<c:choose>
				                                        <c:when test="${fn:length(list.qnaTitle) >15 }">
				                                        	 <th scope="row" width="55%"><a href="qnaView.do?qnaIdx=${list.qnaIdx }&memberId=${memberId}&storeIdx=${storeIdx}">${fn:substring(list.qnaTitle,0,15)}...<b style="color:red;">Re : </b>[ ${list.qnaChange } ]</a></th>
				                                        </c:when>
				                                        <c:otherwise>
				                                        	<th scope="row" width="55%"><a href="qnaView.do?qnaIdx=${list.qnaIdx }&memberId=${memberId}&storeIdx=${storeIdx}">${fn:substring(list.qnaTitle,0,15)} <b style="color:red;">Re : </b>[ ${list.qnaChange } ]</a></th>
				                                        </c:otherwise>
		                                        	</c:choose>
		                                        </c:otherwise>
	                                        </c:choose>
	                                        <th scope="row" width="15%">${list.memberId }</th>
	                                        <th scope="row" width="20%">${fn:substring(list.qnaDate,0,16) }</th>
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
										<c:if test="${vo.beginPage==1 }">
											<li class="page-item">
												<a class="page-link"><i class="fa fa-angle-left" aria-hidden="false"></i></a>
											</li>
										</c:if>
										<c:if test="${vo.beginPage!=1 }">
											<li class="page-item">
												<a class="page-link" href="qna.do?cPage=${vo.beginPage-1}&storeIdx=${vo.storeIdx }&memberId=${memberId}"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
											</li>
										</c:if>
										
										<c:forEach var="pageNo" begin="${vo.beginPage }" end="${vo.endPage }">
											<c:if test="${pageNo == vo.nowPage }">
												<li class="page-item active">
													<a class="page-link">${pageNo }</a>
												</li>
						
											</c:if>
											<c:if test="${pageNo != vo.nowPage }">
												<li class="page-item">
													<a class="page-link" href="qna.do?cPage=${pageNo }&storeIdx=${vo.storeIdx }&memberId=${memberId}">${pageNo }</a>
												</li>
											</c:if>
										</c:forEach>
										
										<c:if test="${vo.endPage < vo.totalPage }">
										<li class="page-item"> 
											<a class="page-link" href="qna.do?cPage=${vo.endPage +1 }&storeIdx=${vo.storeIdx }&memberId=${memberId}"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
										</li>
										</c:if>
										<c:if test="${vo.endPage >= vo.totalPage  }">
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