<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>		
<!doctype html>
<html lang="en">

<head>
<meta charset="UTF-8">

<!-- Title  -->
<title>광고센터</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

<!-- Favicon  -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Style CSS -->
<link rel="stylesheet" href="style.css">


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
					<h5>Advertisement</h5>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="main.do?memberId=${user.memberId }">Home</a></li>
						<li class="breadcrumb-item active">Advertisement</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<div class="row gx-5 justify-content-center">
		<div class="col-lg-8 col-xl-6">
			<div class="text-center">
				<h2 class="fw-bolder">메이크잇 광고 서비스는</h2>
				<p class="lead fw-normal text-muted mb-5">프로젝트 요건 확인(1차 심사) 승인
					이후, 광고를 만들 수 있습니다.</p>
				<div class="d-grid gap-2 col-6 mx-auto">
					<c:if test="${ empty myfundProject }">
					<a href="create_Main.do?memberId=${user.memberId }" class="btn btn-primary" type="button">신청하기</a> <!-- 프로젝트 만들기로 보내기 -->
					</c:if>
					<c:if test="${ not empty myfundProject }">
					<a href="makeitAdvertisementPay.do?memberId=${user.memberId }" class="btn btn-primary" type="button">신청하기</a> <!-- 광고 결제 페이지로 이동 -->
					</c:if>
				</div>	
			</div>
		</div>
	</div>
	<!-- Breadcumb Area -->
	<!-- Content section 1-->
	<section>
		<div class="container px-5">
			<div class="row gx-5 align-items-center">
				<div class="col-lg-6 order-lg-2">
					<div class="p-5">
						<img class="img-fluid"
							src="img/admin-img/makeitAdvertisement1.png" alt="..." />
					</div>
				</div>
				<div class="col-lg-6 order-lg-1">
					<div class="p-5">
						<h2 class="display-4">
							메이크잇<br> 홈 배너
						</h2>
						<p>메이크잇 각 홈 최상단에 노출되어 서포터에게 가장 주목도가 높은 영역입니다.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Content section 2-->
	<section>
		<div class="container px-5">
			<div class="row gx-5 align-items-center">
				<div class="col-lg-6">
					<div class="p-5">
						<img class="img-fluid"
							src="img/admin-img/makeitAdvertisement2.png" alt="..." />
					</div>
				</div>
				<div class="col-lg-6">
					<div class="p-5">
						<h2 class="display-4">
							메이크잇<br> 리스트 배너
						</h2>
						<p>프로젝트 리스트 상위에 고정적으로 노출하여 서포터의 클릭을 유도할 수 있습니다.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Content section 3-->
	<section>
		<div class="container px-5">
			<div class="row gx-5 align-items-center">
				<div class="col-lg-6 order-lg-2">
					<div class="p-5">
						<img class="img-fluid"
							src="img/admin-img/makeitAdvertisement3.png" alt="..." />
					</div>
				</div>
				<div class="col-lg-6 order-lg-1">
					<div class="p-5">
						<h2 class="display-4">
							메이크잇<br> 광고 보고서
						</h2>
						<p>집행된 광고에 대한 결과 리포트를 메이커님의 메일로 제공해드리고 있습니다.</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<div class="py-5 bg-light">
		<div class="container px-5 my-5">
			<div class="row gx-5 justify-content-center">
				<div class="col-lg-10 col-xl-7">
					<div class="text-center">
						<h1 class="fw-bolder">
							광고 서비스 이용 가이드
						</h1>
						<div class="d-flex align-items-center justify-content-center">
							<div class="fw-bold">
								상품 소개서에서 메이크잇의 다양한 광고 상품을 알아보세요.<br> 
								이용 가이드를 다운로드하여 광고 진행 방법을 확인할 수 있습니다.<br><br>
								<div class="d-grid gap-2 col-6 mx-auto">
									<a href="img/admin-img/makeitGuide.pdf" class="btn btn-primary" type="button">이용 가이드</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<section class="py-5">
		<div class="container px-5 my-5">
			<div class="text-center mb-5">
				<h1 class="fw-bolder">광고 진행 프로세스</h1>
				<p class="lead fw-normal text-muted mb-0">메이크잇 광고 서비스는 다음의 프로세스로
					진행됩니다.</p>
			</div>
			<div class="row gx-5 justify-content-center">
				<!-- Pricing card free-->
				<div class="col-lg-6 col-xl-4">
					<div class="card mb-5 mb-xl-0">
						<div class="card-body p-5">
							<div class="mb-3">
								<img class="img-fluid"
									src="img/admin-img/AdvertisementProcess1.png" alt="..." />
							</div>
							<ul class="list-unstyled mb-4">
								<li class="mb-2"><i class="bi bi-check text-primary"></i> <strong>1.
										광고 등록</strong></li>
								<li class="mb-2"><i class="bi bi-check text-primary"></i>
									프로젝트 정보와 광고가 연동되어 있어, 먼저 프로젝트를 만들어야 합니다. 1차 심사 후, 광고센터에서 광고를 만들
									수 있습니다.</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- Pricing card pro-->
				<div class="col-lg-6 col-xl-4">
					<div class="card mb-5 mb-xl-0">
						<div class="card-body p-5">
							<div class="mb-3">
								<img class="img-fluid"
									src="img/admin-img/AdvertisementProcess2.png" alt="..." />
							</div>
							<ul class="list-unstyled mb-4">
								<li class="mb-2"><i class="bi bi-check text-primary"></i> <strong>2.
										광고 심사 & 승인</strong></li>
								<li class="mb-2"><i class="bi bi-check text-primary"></i>
									광고 진행에 문제가 없을 경우, 담당자가 광고를 승인하며 광고비가 결제됩니다. 이후 광고 명세서가 메일로
									발송됩니다.</li>
							</ul>
						</div>
					</div>
				</div>
				<!-- Pricing card enterprise-->
				<div class="col-lg-6 col-xl-4">
					<div class="card">
						<div class="card-body p-5">
							<div class="mb-3">
								<img class="img-fluid"
									src="img/admin-img/AdvertisementProcess3.png" alt="..." />
							</div>
							<ul class="list-unstyled mb-4">
								<li class="mb-2"><i class="bi bi-check text-primary"></i> <strong>3.
										광고 진행 & 보고</strong></li>
								<li class="mb-2"><i class="bi bi-check text-primary"></i>
									광고는 게재일의 0시부터 24시까지 노출됩니다. 광고 종료 후, 진행 내역을 정리한 결과 리포트를 전달합니다.</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<div class="py-5 bg-light">
		<div class="container px-5 my-5">
			<div class="row gx-5 justify-content-center">
				<div class="col-lg-10 col-xl-7">
					<div class="text-center">
						<h1 class="fw-bolder">문의사항이 있으신가요?</h1>
						<div class="d-flex align-items-center justify-content-center">
							<div class="fw-bold">
								광고 서비스에 대해 궁금한 사항이 있다면 아래의 E-MAIL 문의하기를 눌러<br>
								wpghrkWkd@gmail.com로 메일을 보내주세요.<br>
								<br>
								<div class="d-grid gap-2 col-6 mx-auto">
									<a href="makeitAdvertisementAsk.do" class="btn btn-primary" type="button">E-MAIL
										문의하기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="/common/Footer.jsp"%>