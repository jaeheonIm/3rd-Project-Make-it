<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">

<head>
<meta charset="UTF-8">

<!-- Title  -->
<title>마이페이지</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

<!-- Favicon  -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Style CSS -->
<link rel="stylesheet" href="style.css">

<style>
.box {
	width: 100px;
	height: 100px;
	border-radius: 50%;
	overflow: hidden;
	float: none;
	margin: 0 auto;
}

.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.fProfile {
	margin-top: 2px;
	width: 60px;
	height: 60px;
	object-fit: cover;
}

.sProfile {
	width: 57px;
	height: 60px;
	object-fit: cover;
}

.fundProfile {
	width: 70px;
	height: 70px;
	border-radius: 50%;
	overflow: hidden;
	float: none;
	margin: 0 auto;
	text-align: center;
}

.storeProfile {
	width: 70px;
	height: 70px;
	border-radius: 50%;
	overflow: hidden;
	float: none;
	margin: 0 auto;
	text-align: center;
}

ul {
	justify-content: center;
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
					<h5>Mypage</h5>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="main.do?memberId=${user.memberId }">Home</a></li>
						<li class="breadcrumb-item active">Mypage</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcumb Area -->

	<!-- Blog Area -->
	<section class="blog_area section_padding_100">
		<div class="container">
			<div class="row">
				<div class="col-12 col-md-5 col-lg-3">
					<br> <br>
					<div class="blog_sidebar">
						<div class="widget-area search_post mb-30">
							<div class="box">
								<c:if test="${ empty user.memberPicture}">
									<img class="profile" src="img/user-img/profile.jpg">
								</c:if>
								<c:if test="${ not empty user.memberPicture}"></c:if>
								<img class="profile" src="img/user-img/${user.memberPicture }">
							</div>
							<div style="text-align: center;">
								<p class="mb-0">${user.memberNickname }님</p>
							</div>
							<div style="text-align: center;">
								<a href="#">My Profile</a>
							</div>
							<hr>
							<div class="shortcodes_content" style="text-align: center;">
								<a href="logout.do" class="badge badge-light">로그아웃</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12 col-md-5 col-lg-8">
					<div class="container">
						<div class="row">
							<div class="col-12">
								<div class="product_details_tab section">
									<!-- Tabs -->
									<ul class="nav nav-tabs justify-content-end" role="tablist"
										id="product-details-tab">
										<li class="nav-item"><a href="#description"
											class="nav-link active" data-toggle="tab" role="tab">MY</a></li>
										<li class="nav-item"><a href="#reviews"
											class="nav-link" data-toggle="tab" role="tab">펀딩</a></li>
										<li class="nav-item"><a href="#addi-info"
											class="nav-link" data-toggle="tab" role="tab">스토어</a></li>
									</ul>
									<!-- Tab Content -->
									<div class="tab-content">
										<div role="tabpanel" class="tab-pane fade show active" id="description">
											<ul class="list-group list-group-horizontal-lg">
												<li class="list-group-item flex-fill">
													<div style="text-align: center;">
														<div>
															<h5>
																<a href="memberMyfunding.do?memberId=${user.memberId }"><b>${memberFundCnt }</b></a>
															</h5>
														</div>
														<div>펀 딩</div>
													</div>
												</li>
												<li class="list-group-item flex-fill">
													<div style="text-align: center;">
														<div>
															<h5>
																<a href="memberMystore.do?memberId=${user.memberId }"><b>${memberStoreCnt }</b></a>
															</h5>
														</div>
														<div>구 매</div>
													</div>
												</li>
												<li class="list-group-item flex-fill">
													<div style="text-align: center;">
														<div>
															<h5>
																<a href="memberMyAsk.do?memberId=${user.memberId }"><b>${memberFundAskCnt }</b></a>
															</h5>
														</div>
														<div>펀딩 문의</div>
													</div>
												</li>
												<li class="list-group-item flex-fill">
													<div style="text-align: center;">
														<div>
															<h5>
																<a href="memberMyStoreAsk.do?memberId=${user.memberId }"><b>${memberStoreAskCnt }</b></a>
															</h5>
														</div>
														<div>스토어 문의</div>
													</div>
												</li>
											</ul>
											<ul class="list-group-flush list-group-horizontal-lg">
												<li class="list-group-item flex-fill list-group-item-info"
													style="text-align: left;">
													<div style="text-align: center;">
														<div style="float: none; margin: 0 auto;"
															data-toggle="modal" data-target="#exampleModalCenter">
															<i class="fa fa-credit-card-alt"></i>&nbsp;카드
																등록
														</div>
													</div>
												</li>
											</ul>
											<br>
											<ul class="list-group-flush list-group-horizontal-lg">
												<li class="list-group flex-fill">
													<a href="makeitAdvertisement.do?memberId=${user.memberId }"><img src="img/user-img/makeitMypage.jpg"></a>
												</li>
											</ul>
											<br> <br>
											<ul class="list-group list-group-horizontal-lg">
												<li class="list-group flex-fill" style="text-align: left;">
													<a href="makeitMypageCoupon.do?memberId=${user.memberId }">&nbsp;&nbsp;<i class="fa fa-barcode"></i>&nbsp;&nbsp;쿠폰
												</a>
													<hr>
												</li>
												<li class="list-group-flush flex-fill"
													style="text-align: left;"><a href="#">&nbsp;&nbsp;<i
														class="fa fa-envelope-open"></i>&nbsp;&nbsp;메세지
												</a>
													<hr></li>
											</ul>
											<br>
											<div>
												<h5>
													&nbsp;<b>나의활동</b>
												</h5>
											</div>
											<br>
											<ul class="list-group list-group-horizontal-lg">
												<li class="list-group flex-fill" style="text-align: left;">
													<a href="makeitMypageLike.do?memberId=${user.memberId }">&nbsp;&nbsp;<i class="fa fa-star"></i>&nbsp;&nbsp;찜하기
												</a>
													<hr>
												</li>
												<li class="list-group-flush flex-fill"
													style="text-align: left;"><a href="#">&nbsp;&nbsp;
														<i class="fa fa-signing"></i>&nbsp;&nbsp;지지서명한
												</a>
													<hr></li>
											</ul>
											<br>
											<div>
												<h5>
													&nbsp;<b>서포터 팁</b>
												</h5>
											</div>
											<br>
											<ul class="list-group list-group-horizontal-lg">
												<li class="list-group flex-fill" style="text-align: left;">
													<a href="follow.do?memberId=${user.memberId }">&nbsp;&nbsp;<i class="fa fa-group"></i>&nbsp;&nbsp;팔로우
												</a>
													<hr>
												</li>
												<li class="list-group-flush flex-fill"
													style="text-align: left;"><a href="#">&emsp;&emsp;&emsp;&nbsp;<i
														class="fa fa-wifi"></i>&nbsp;&nbsp;메이크잇 캐스트
												</a>
													<hr></li>
											</ul>
											<br> <br>
											<ul class="list-group list-group-horizontal-lg">
												<li class="list-group flex-fill" style="text-align: left;">
													<a href="notice.do">&nbsp;&nbsp;공지사항</a>
													<hr>
												</li>
												<li class="list-group-flush flex-fill"
													style="text-align: left;"><a href="#">&nbsp;&nbsp;&nbsp;이용가이드</a>
													<hr></li>
											</ul>
											<ul class="list-group list-group-horizontal-lg">
												<li class="list-group flex-fill" style="text-align: left;">
													<a href="Mainqna.do?memberId=${user.memberId }">&nbsp;&nbsp;문의하기</a> <br>
												</li>
												<li class="list-group-flush flex-fill"
													style="text-align: left;"><a href="makeitMemberUpdate.do">정보설정</a> <br>
												</li>
											</ul>
										</div>

										<div role="tabpanel" class="tab-pane fade" id="reviews">
											<div class="reviews_area">
												<div class="single_user_review mb-15">
													<div>
														<div class="blog_post_content">
															<c:if test="${ empty fundList }">
															<div class="fundProfile">
																<img class="fProfile" src="img/user-img/fundbox.jpg">
															</div>
															<br>
															<div style="text-align: center;">
																<b>펀딩한 서포터에게 제품이나<br></b> <b>서비스를 제공합니다</b><br>
																<br>
																<p>메이크잇 펀딩으로 처음을 만들어보세요</p>
															</div>
															</c:if>
															
															<c:if test="${ not empty fundList }">
																<a href="fundMyList.do?memberId=${user.memberId }">더보기</a>
																<div class="row row-cols-1 row-cols-md-4 g-4">
																<c:forEach var="fundOne" items="${fundList }" begin="0" end="3">
																  <div class="col">
																    <div class="card h-100" onclick="location.href='productDetailView.do?fundIdx=${fundOne.fundIdx}'">
																      <img style="height: 100px;" src="img/fundingMainImg/${fundOne.fundMainImg }" class="card-img-top" alt="...">
																      <div class="card-body" style="float:none; margin:0 auto">
																        <small class="card-title">
																        <c:choose>
        																	<c:when test="${fn:length(fundOne.fundTitle) gt 7}">
																        		<c:out value="${fn:substring(fundOne.fundTitle, 0, 7)}..."></c:out>
																        	</c:when>
																        </c:choose>	
																        </small>
																      </div>
																    </div>
																  </div>
																</c:forEach>
																</div>
															</c:if>
															<ul class="list-group-flush list-group-horizontal-lg">
																<li
																	class="list-group-item flex-fill list-group-item-info">
																	<div style="text-align: center;">
																		<div>
																			<a href="create_Main.do?memberId=${user.memberId }">펀딩 신청하기</a>
																		</div>
																	</div>
																</li>
															</ul>
															<br> <br>
															<ul class="list-group list-group-horizontal-lg">
																<li class="list-group flex-fill"
																	style="text-align: left;"><a href="#">&nbsp;&nbsp;<i
																		class="fa fa-envelope-open"></i>&nbsp;&nbsp;메세지
																</a>
																	<hr></li>
																<li class="list-group-flush flex-fill"
																	style="text-align: left;"><a href="#">&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<i
																		class="fa fa-envelope-open">&nbsp;&nbsp;</i>프로젝트 개설 안내
																</a>
																	<hr></li>
															</ul>
															<br> <br>
															<div>
																<h5>
																	&nbsp;<b>메이커 팁</b>
																</h5>
															</div>
															<br>
															<ul class="list-group list-group-horizontal-lg">
																<li class="list-group flex-fill"
																	style="text-align: left;"><a href="#">&nbsp;&nbsp;<i
																		class="fa fa-group"></i>&nbsp;&nbsp;메이커 뉴스레터
																</a>
																	<hr></li>
																<li class="list-group-flush flex-fill"
																	style="text-align: left;"><a href="#">&nbsp;&nbsp;<i
																		class="fa fa-wifi"></i>&nbsp;&nbsp;메이크잇 캐스트
																</a>
																	<hr></li>
															</ul>
															<ul class="list-group list-group-horizontal-lg">
																<li class="list-group flex-fill"
																	style="text-align: left;"><a href="#">&nbsp;&nbsp;<i
																		class="fa fa-group"></i>&nbsp;&nbsp;메이크잇 스쿨
																</a>
																	<hr></li>
																<li class="list-group-flush flex-fill"
																	style="text-align: left;"><a href="#">&nbsp;&nbsp;<i
																		class="fa fa-wifi"></i>&nbsp;&nbsp;협력 프로그램
																</a>
																	<hr></li>
															</ul>
															<br> <br>
															<ul class="list-group list-group-horizontal-lg">
																<li class="list-group flex-fill"
																	style="text-align: left;"><a href="notice.do">&nbsp;&nbsp;공지사항</a>
																	<hr></li>
																<li class="list-group-flush flex-fill"
																	style="text-align: left;"><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이용가이드</a>
																	<hr></li>
															</ul>
															<ul class="list-group list-group-horizontal-lg">
																<li class="list-group flex-fill"
																	style="text-align: left;"><a href="qna.do?memberId=${user.memberId }">&nbsp;&nbsp;문의하기</a>
																	<br></li>
																<li class="list-group-flush flex-fill"
																	style="text-align: left;"><a href="makeitMemberUpdate.do">&nbsp;&nbsp;정보설정</a>
																	<br></li>
															</ul>
														</div>
													</div>
												</div>
											</div>

										</div>
										<div role="tabpanel" class="tab-pane fade" id="addi-info">
											<div class="additional_info_area">
												<div class="single_user_review mb-15">
													<div>
														<div class="blog_post_content">
															<c:if test="${ empty storeList }">
															<div class="storeProfile">
																<img class="sProfile" src="img/user-img/storebox.jpg">
															</div>
															<br>
															<div style="text-align: center;">
																<b>펀딩 성공한 리워드<br></b> <b>상시 판매 하세요</b><br> <br>
																<p>
																	펀딩하기 메이커 스튜디오에서<br>스토어 프로젝트를 시작할 수 있어요!
																</p>
															</div>
															</c:if>
															<c:if test="${ not empty storeList }">
																<a href="storeMyList.do?memberId=${user.memberId }">더보기</a>
																<div class="row row-cols-1 row-cols-md-4 g-4">
																<c:forEach var="storeOne" items="${storeList }" begin="0" end="3">
																  <div class="col">
																    <div class="card h-100" onclick="location.href='detail.do?storeIdx=${storeOne.storeIdx}'">
																      <img style="height: 100px;" src="imgs/${storeOne.storeImg }" class="card-img-top" alt="...">
																      <div class="card-body" style="float:none; margin:0 auto;">
																       	<small class="card-title">
																       	<c:choose>
        																	<c:when test="${fn:length(storeOne.storeTitle) gt 7}">
																        		<c:out value="${fn:substring(storeOne.storeTitle, 0, 7)}..."></c:out>
																        	</c:when>
																        </c:choose>	
																        </small>
																      </div>
																    </div>
																  </div>
																</c:forEach>
																</div>
															</c:if>
															<br> <br>
															<ul class="list-group list-group-horizontal-lg">
																<li class="list-group-flush flex-fill"
																	style="text-align: left;"><a href="#">&nbsp;&nbsp;<i
																		class="fa fa-envelope-open">&nbsp;&nbsp;</i>프로젝트 개설 안내
																</a>
																	<hr></li>
															</ul>
															<br> <br>
															<div>
																<h5>
																	&nbsp;<b>메이커 팁</b>
																</h5>
															</div>
															<br>
															<ul class="list-group list-group-horizontal-lg">
																<li class="list-group flex-fill"
																	style="text-align: left;"><a href="#">&nbsp;&nbsp;<i
																		class="fa fa-group"></i>&nbsp;&nbsp;메이커 뉴스레터
																</a>
																	<hr></li>
																<li class="list-group-flush flex-fill"
																	style="text-align: left;"><a href="#">&nbsp;&nbsp;<i
																		class="fa fa-wifi"></i>&nbsp;&nbsp;메이크잇 캐스트
																</a>
																	<hr></li>
															</ul>
															<ul class="list-group list-group-horizontal-lg">
																<li class="list-group flex-fill"
																	style="text-align: left;"><a href="#">&nbsp;&nbsp;<i
																		class="fa fa-group"></i>&nbsp;&nbsp;메이크잇 스쿨
																</a>
																	<hr></li>
																<li class="list-group-flush flex-fill"
																	style="text-align: left;"><a href="#">&nbsp;&nbsp;<i
																		class="fa fa-wifi"></i>&nbsp;&nbsp;협력 프로그램
																</a>
																	<hr></li>
															</ul>
															<br> <br>
															<ul class="list-group list-group-horizontal-lg">
																<li class="list-group flex-fill"
																	style="text-align: left;"><a href="notice.do">&nbsp;&nbsp;공지사항</a>
																	<hr></li>
																<li class="list-group-flush flex-fill"
																	style="text-align: left;"><a href="#">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;이용가이드</a>
																	<hr></li>
															</ul>
															<ul class="list-group list-group-horizontal-lg">
																<li class="list-group flex-fill"
																	style="text-align: left;"><a href="qna.do?memberId=${user.memberId }">&nbsp;&nbsp;문의하기</a>
																	<br></li>
																<li class="list-group-flush flex-fill"
																	style="text-align: left;"><a href="makeitMemberUpdate.do">&nbsp;&nbsp;정보설정</a>
																	<br></li>
															</ul>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered modal-lg"
			role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalCenterTitle">
						<i class="icofont-mastercard-alt"></i> Credit Card
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="panel panel-default">
						<div aria-expanded="false" id="collapse_one"
							class="panel-collapse collapse show" role="tabpanel"
							aria-labelledby="one">
							<div class="panel-body">
								<div class="pay_with_creadit_card">
									<form action="insertMemberCard.do" method="post">
										<div class="row">
											<div class="col-12 mb-3">
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" name="cardCategory" id="inlineRadio" value="BC"> 
													<label class="form-check-label" for="inlineRadio1">BC</label>
												</div>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" name="cardCategory" id="inlineRadio" value="국민"> 
													<label class="form-check-label" for="inlineRadio1">국민</label>
												</div>
												<div class="form-check form-check-inline">
													<input class="form-check-input" type="radio" name="cardCategory" id="inlineRadio" value="신한"> 
													<label class="form-check-label" for="inlineRadio1">신한</label>
												</div>
												<div id="radio_font"></div>
											</div>
											<div class="col-12 col-md-6 mb-3">
												<label for="cardNumber">카드 번호</label> 
												<input type="text" class="form-control" id="cardNumber" name="cardNumber" placeholder="" value="" required>
											</div>
											<div class="col-12 col-md-3 mb-3">
												<label for="expiration">만료 기간</label> 
												<input type="text" class="form-control" id="expiration" name="cardExpiration" placeholder="MM / YY" value="" required>
											</div>
											<div class="col-12 col-md-3 mb-3">
												<label for="security_code">보안 번호 </label> 
												<input type="text" class="form-control" id="security_code" name="cardSecurity" placeholder="XXX" value="" required>
											</div>
												<input type="hidden" name="memberId" value="${user.memberId }">
											<div class="col-12">
												<button type="button" class="btn btn-secondary" data-dismiss="modal">취 소</button>
												<button type="button" id="card_submit" class="btn btn-primary">저 장</button>
											</div>
										</div>
									</form>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		let go = document.forms[1];
		$('#card_submit').click(function(){
			if ($("#inlineRadio").is(":checked") == false) {
				$('#radio_font').text('카드사를 선택해주세요');
				$('#radio_font').css('color', 'red');
			} else if ($('#cardNumber').val() == null || $('#cardNumber').val() == "") {
				$('#cardNumber').focus();
			} else if ($('#expiration').val() == null || $('#expiration').val() == "") {
				$('#expiration').focus();
			} else if ($('#security_code').val() == null || $('#security_code').val() == "") {
				$('#security_code').focus();
			} else {
				go.submit();
			}
		});
	</script>
	<!-- Blog Area End -->
	<%@ include file="/common/Footer.jsp"%>