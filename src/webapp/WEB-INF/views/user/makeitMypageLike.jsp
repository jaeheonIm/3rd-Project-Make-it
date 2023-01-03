<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="UTF-8">
<link rel="icon" href="img/core-img/favicon.ico">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;700&display=swap" rel="stylesheet">
<!-- Title  -->
<title>마이페이지 찜목록</title>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

<!-- Favicon  -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Style CSS -->
<link rel="stylesheet" href="style.css">
<style>
.single-product-area {
	height: 85%;
}

.single-product-area .product_image img {
	height: 180px;
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
					<h5>Like</h5>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="main.do?memberId=${user.memberId }">Home</a></li>
						<li class="breadcrumb-item active">Like</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcumb Area -->
	<div class="container">
		<div class="row">
			<div class="col-12">
				<div class="product_details_tab section_padding_100_0 clearfix">
					<!-- Tabs -->
					<ul class="nav nav-tabs" role="tablist" id="product-details-tab">
						<li class="nav-item"><a href="#description"
							class="nav-link active" data-toggle="tab" role="tab">펀딩 찜</a></li>
						<li class="nav-item"><a href="#reviews" class="nav-link"
							data-toggle="tab" role="tab">스토어 찜</a></li>
					</ul>
					<!-- Tab Content -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane fade show active"
							id="description">
							<div class="container">
								<br>
								<div class="row row-cols-1 row-cols-md-3 g-4">
									<!-- Single Product -->
									<c:if test="${ empty getfundLike }">
										<p>찜 목록이 없습니다.</p>
									</c:if>
									<c:if test="${ not empty getfundLike }">
										<c:forEach var="list" items="${getfundLike }"
											varStatus="Status">
											<div class="col-9 col-sm-6 col-md-4 col-lg-3">
												<div class="single-product-area mb-30">
													<div class="product_image">
														<!-- 여기서 부터 -->
														<!-- Product Image -->
														<img id="img" class="normal_img"
															src="img/fundingMainImg/${list.fundMainImg }" alt=""
															style="height: 180px;">
														<c:if test="${not fn:contains(bool,list.fundIdx)}">
															<div class="product_wishlist">
																<a href="javascript:fundLikeUpdate(${list.fundIdx })"><i
																	id="fundheart${list.fundIdx }" class="fa-solid fa-heart-circle-minus"></i></a>
															</div>
														</c:if>
													</div>

													<!-- Product Description -->
													<div class="product_description">
														<a id="title"
															href="productDetailView.do?fundIdx=${list.fundIdx}">${list.fundTitle }</a>
														<h6 id="price" class="product-price"><fmt:formatNumber value="${list.fundPrice}"/>원</h6>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:if>
								</div>
							</div>
						</div>

						<div role="tabpanel" class="tab-pane fade" id="reviews">
							<div class="container">
								<br>
								<div class="row row-cols-1 row-cols-md-3 g-4">
									<!-- Single Product -->
									<c:if test="${ empty getStoreLike }">
										<p>찜 목록이 없습니다.</p>
									</c:if>
									<c:if test="${ not empty getStoreLike }">
										<c:forEach var="list" items="${getStoreLike }"
											varStatus="Status">
											<div class="col-9 col-sm-6 col-md-4 col-lg-3">
												<div class="single-product-area mb-30">
													<div class="product_image">
														<!-- 여기서 부터 -->
														<!-- Product Image -->
														<img id="img" class="normal_img"
															src="imgs/${list.storeImg }" alt=""
															style="height: 180px;">
														<c:if test="${not fn:contains(bool,list.storeIdx)}">
															<div id="heartList" class="product_wishlist">
																<a href="javascript:storeLikeUpdate(${list.storeIdx })"><i
																	id="storeheart${list.storeIdx }" class="fa-solid fa-heart-circle-minus"></i></a>
															</div>
														</c:if>
													</div>

													<!-- Product Description -->
													<div class="product_description">
														<a id="title"
															href="detail.do?memberId=${user.memberId}&storeIdx=${list.storeIdx}">${list.storeTitle }</a>
														<h6 id="price" class="product-price"><fmt:formatNumber value="${list.storePrice}"/>원</h6>
													</div>
												</div>
											</div>
										</c:forEach>
									</c:if>
								</div>
							</div>
						</div>



					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>

	<script>
		function storeLikeUpdate(data1) {
			alert("찜하기 실행 " + data1);
			if ('${user.memberId}' == null || '${user.memberId}' == '') {
				location.href = 'loginForm.do';
			} else if ('${user.memberId}' != null || '${user.memberId}' != '') {
				$.ajax("storeLikeUpdate.do", {
					type : "post",
					data : JSON.stringify({
						storeIdx : data1,
						memberId : '${user.memberId}'
					}), // 서버쪽으로 JSON 문자열 전달
					contentType : "application/json",
					dataType : "json",
					traditional : true, //배열 넘기기
					success : function(data) {
						if (data == 1) {
							alert('찜 목록에 추가되었습니다' + data);
							$('#storeheart'+data1).attr('class', 'fa-solid fa-heart-circle-minus');
						} else {
							alert('찜 목록에서 삭제되었습니다' + data);
							$('#storeheart'+data1).attr('class', 'fa-solid fa-heart-circle-plus');
						}
					},
					error : function() {
						alert("실패~~");
					}
				});
			}
		}
		
		
		function fundLikeUpdate(data2) {
			alert("찜하기 실행 " + data2);
			if ('${user.memberId}' == null || '${user.memberId}' == '') {
				location.href = 'loginForm.do';
			} else if ('${user.memberId}' != null || '${user.memberId}' != '') {
				$.ajax("fundLikeUpdate1.do", {
					type : "post",
					data : JSON.stringify({
						fundIdx : data2,
						memberId : '${user.memberId}'
					}), // 서버쪽으로 JSON 문자열 전달
					contentType : "application/json",
					dataType : "json",
					traditional : true, //배열 넘기기
					success : function(data) {
						if (data == 1) {
							alert('찜 목록에 추가되었습니다' + data);
							$('#fundheart'+data2).attr('class', 'fa-solid fa-heart-circle-minus');
						} else {
							alert('찜 목록에서 삭제되었습니다' + data);
							$('#fundheart'+data2).attr('class', 'fa-solid fa-heart-circle-plus');
						}
					},
					error : function(request, status, error){

						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					}
				});
			}
		}
	</script>
	<%@ include file="/common/Footer.jsp"%>