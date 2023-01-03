<%@page import="com.makeit.fund.FundVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>

<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title  -->
<title>Make-It 펀딩</title>
<!-- Favicon  -->
<link rel="icon" href="img/core-img/favicon.ico">

<!--  Bootstrap 4 -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">

<!-- Start Rating -->
<link href="css/star-rating.css" media="all" rel="stylesheet"
	type="text/css" />

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<!-- Bootstrap 4  -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>

    <!-- Style CSS -->
    <link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="icon" href="img/core-img/favicon.ico">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;700&display=swap" rel="stylesheet">

<!-- Star Rating -->
<script src="js/star-rating.js" type="text/javascript"></script>

<style>


.insertReview[type="submit"] {
	background-color: #00c4c4;
	border: 1px solid #dddddd;
	height: 40px;
	width: 70px;
	color: white;
	border-radius: 10px;
}

#deleteButton {
	display: inline-block;
	padding: 5px 15px;
	color: #fff;
	vertical-align: middle;
	background-color: #00c4c4;
	cursor: pointer;
	height: 35px;
	margin-left: 5px;
	border-radius: 10px;
}

.star-ratings {
  color: #00c4c4; 
  position: relative;
  unicode-bidi: bidi-override;
  width: max-content;
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 1px;
  -webkit-text-stroke-color: orange;
}
 
.star-ratings-fill {
  color: orange;
  padding: 0;
  position: absolute;
  z-index: 1;
  display: flex;
  top: 0;
  left: 0;
  overflow: hidden;
  -webkit-text-fill-color: orange;
}
 
.star-ratings-base {
  z-index: 0;
  padding: 0;
}

  

.filebox input[type="file"] {
  position: absolute;
  width: 0;
  height: 0;
  padding: 0;
  overflow: hidden;
  border: 0;
}


.filebox label {
  display: inline-block;
  padding:12px 20px 10px 20px;
  height:50px;
  color: white;
  vertical-align: middle;
  background-color: #00c4c4;
  cursor: pointer;
  border: 1px solid #ebebeb;
  border-radius: 10px;
}

/* named upload */
.filebox .upload-name {
  display: inline-block;
  height: 60px;
  font-size:18px; 
  padding: 0 10px;
  vertical-align: middle;
  background-color: white;
  border: 2px solid #00c4c4;
  border-radius: 10px;
  width: 78%;	
}




</style>

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
						<li class="breadcrumb-item active">펀딩 상품 후기</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<br>
	<!-- Breadcumb Area -->

	<!-- Review Area -->
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="product_details_tab section">
					<!-- Tabs -->
					<ul class="nav nav-tabs" role="tablist" id="product-details-tab">
						<li class="nav-item">
							<a href="productDetailView.do?fundIdx=${productDetailView.fundIdx }&memberId=${user.memberId}"class="nav-link">스토리</a>
						</li>
						<li class="nav-item">
							<a href="getCommentList.do?fundIdx=${productDetailView.fundIdx }&memberId=${user.memberId}"class="nav-link active">커뮤니티 (${productDetailView.communityCnt })<span class="text-muted"></span></a>
						</li>
						<li class="nav-item">
							<a href="returnAndCancel.do" class="nav-link">반환 · 정책</a>
						</li>
						<li class="nav-item">
							<a href="getSupporter.do?fundIdx=${productDetailView.fundIdx }&memberId=${user.memberId}" class="nav-link">서포터 (${productDetailView.supporterCnt })</a>
						</li>
					</ul>

					<!-- Tab Content -->
					<div class="tab-content">
						<!--  Review -->
						<div role="tabpanel" class="tab-pane fade show active"id="reviews">
							<div class="reviews_area">
								<span class="star-rating">
									<span style="width:50%"></span>
								</span>
								
								<div class="single_user_review mb-15">
									<div class="review-rating">
										<div class="star-rating">
											<div class="star-ratings">
												<div class="star-ratings-fill space-x-2 text-lg" style=" width: ${productDetailView.fundReviewAvg * 10 * 2}% ">
													<span>★&nbsp;</span><span>★&nbsp;</span><span>★&nbsp;</span><span>★&nbsp;</span><span>★&nbsp;</span>
												</div>
												<div class="star-ratings-base space-x-2 text-lg">
													<span>★&nbsp;</span><span>★&nbsp;</span><span>★&nbsp;</span><span>★&nbsp;</span><span>★&nbsp;</span>
												</div>
											</div>
											<br>
												<div><h5><b>평균 별점 : ${productDetailView.fundReviewAvg } 점</b></h5></div>
											<br>
											<hr style="border: solid 3px #00c4c4">
										</div>
									</div>
								</div>
								<c:if test="${empty getCommentList }">
									<tr>
										<td>아직 댓글이 없습니다.</td>
									</tr>
								</c:if>
								<c:if test="${not empty getCommentList }">
									<c:forEach var="fundCommentList" items="${getCommentList }">
										<div class="single_user_review mb-15">
											<div class="review-rating">
												<c:if test="${fundCommentList.fundReviewScore == 0 }">
												</c:if>
												<c:if test="${fundCommentList.fundReviewScore == 1 }">
													<i class="fa fa-star" aria-hidden="true"></i>&nbsp;&nbsp;<b>별 1개</b>
												</c:if>
												<c:if test="${fundCommentList.fundReviewScore == 2 }">
													<i class="fa fa-star" aria-hidden="true"></i>
													<i class="fa fa-star" aria-hidden="true"></i>&nbsp;&nbsp;<b>별 2개</b>
												</c:if>
												<c:if test="${fundCommentList.fundReviewScore == 3 }">
													<i class="fa fa-star" aria-hidden="true"></i>
													<i class="fa fa-star" aria-hidden="true"></i>
													<i class="fa fa-star" aria-hidden="true"></i>&nbsp;&nbsp;<b>별 3개</b>
												</c:if>
												<c:if test="${fundCommentList.fundReviewScore == 4 }">
													<i class="fa fa-star" aria-hidden="true"></i>
													<i class="fa fa-star" aria-hidden="true"></i>
													<i class="fa fa-star" aria-hidden="true"></i>
													<i class="fa fa-star" aria-hidden="true"></i>&nbsp;&nbsp;<b>별 4개</b>
												</c:if>
												<c:if test="${fundCommentList.fundReviewScore == 5 }">
													<i class="fa fa-star" aria-hidden="true"></i>
													<i class="fa fa-star" aria-hidden="true"></i>
													<i class="fa fa-star" aria-hidden="true"></i>
													<i class="fa fa-star" aria-hidden="true"></i>
													<i class="fa fa-star" aria-hidden="true"></i>&nbsp;&nbsp;<b>별 5개</b>
												</c:if>
												<c:if test="${empty fundCommentList.fundReviewImg }">
												</c:if>
												<c:if test="${not empty fundCommentList.fundReviewImg }">
													<div class="reviewImg">
														<br>
															<img src="img/reviewImg/${fundCommentList.fundReviewImg }" style="width:30%; height: 30%;">
														<br>
													</div>
												</c:if>
												<div class="reviewContent">
													<span><br> ${fundCommentList.fundReviewContent }</span>
												</div>
												<br>
												<div class="deleteReview">
													<c:if test="${fundCommentList.memberId == user.memberId}">
														<a id="deleteButton" href="deleteReview.do?fundReviewIdx=${fundCommentList.fundReviewIdx }&memberId=${user.memberId}&fundIdx=${productDetailView.fundIdx}" onclick="return confirm('삭제하시겠습니까?');"><i class="fa fa-eraser" style="color:white;"></i>&nbsp;삭제</a>
													</c:if>
												</div>
											</div>
											<div class="review-details">
												<p>
													by ${fundCommentList.memberId } on <span>${fn:substring(fundCommentList.fundReviewRegdate,0,16)}</span>
												</p>
											</div>
										</div>
									<hr style="border: solid 0.5px #00c4c4">
								</c:forEach>
							</c:if>
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
												<a class="page-link" href="getCommentList.do?cPage=${page.beginPage-1}&fundIdx=${productDetailView.fundIdx }"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
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
													<a class="page-link" href="getCommentList.do?cPage=${pageNo }&fundIdx=${productDetailView.fundIdx }">${pageNo }</a>
												</li>
											</c:if>
										</c:forEach>
										
										<c:if test="${page.endPage < page.totalPage }">
										<li class="page-item"> 
											<a class="page-link" href="getCommentList.do?cPage=${page.endPage +1 }&fundIdx=${productDetailView.fundIdx }"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
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
								
						<div class="submit_a_review_area mt-50">
							<c:if test="${empty user.memberId  }">
								<tr>
									<td>로그인 회원이 없습니다.<br></td>
								</tr>
							</c:if>
							<c:if test="${not empty user.memberId }">
							<h4>- 후기 작성하기 -</h4>
							<form action="insertReview.do?fundIdx=${productDetailView.fundIdx }&memberId=${user.memberId}" method="post" enctype="multipart/form-data">
								<div class="form-group">
									<div class="stars">
										<input type="radio" name="fundReviewScore" class="star-1" id="star-1" value="1">
                                        <label class="star-1" for="star-1">1</label>
                                        <input type="radio" name="fundReviewScore" class="star-2" id="star-2" value="2">
                                        <label class="star-2" for="star-2">2</label>
                                        <input type="radio" name="fundReviewScore" class="star-3" id="star-3" value="3">
                                        <label class="star-3" for="star-3">3</label>
                                        <input type="radio" name="fundReviewScore" class="star-4" id="star-4" value="4">
                                        <label class="star-4" for="star-4">4</label>
                                        <input type="radio" name="fundReviewScore" class="star-5" id="star-5" value="5">
                                        <label class="star-5" for="star-5">5</label>
                                        <span></span>
									</div>
								</div>
								<div class="form-group">
									<label for="name">ID : ${user.memberId }</label>
								</div>
								<div class="filebox"> 
								  <label for="file"><i class="fa fa-photo"></i>&nbsp; 업로드</label> 
								  <input type="file" id="file" accept=".jpeg, .jpg, .png" name="uploadFile"> 
								  <input class="upload-name" value="파일선택">
								</div>
								<br>
								<div class="form-group">
									<textarea class="form-control" name="fundReviewContent"
										id="fundReviewContent" rows="5" data-max-length="2000"></textarea>
								</div>
								<button type="submit" class="insertReview"><i class="fa fa-pencil"></i>&nbsp;작성</button>
								</form>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<br>
	<!-- Review End -->
	<%@include file="/common/Footer.jsp"%>
	<script>	
		function insertReview_go() {
			if (!confirm("후기를 작성하시겠습니까? Y/N")) {
				alert("후기 작성을 취소하였습니다.");
			} else {
				submit();
			}
		}

	$("#file").on('change',function(){
		  var fileName = $("#file").val();
		  $(".upload-name").val(fileName);
		});
	
	</script>