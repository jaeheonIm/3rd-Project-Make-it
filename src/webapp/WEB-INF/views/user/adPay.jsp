<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!-- Favicon  -->
<link rel="icon" href="img/core-img/favicon.ico">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;500;700&display=swap"
	rel="stylesheet">
<!-- Style CSS -->
<link rel="stylesheet" href="style.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<title>광고 결제</title>
<style>
.material-symbols-outlined {
	font-size: 1em;
	color: gray;
}

div>h2 {
	line-height: 38px;
	letter-spacing: +.6px;
	font-size: 25px;
	font-weight: bold;
	font-style: normal;
	padding: 0 16px 24px;
}

body {
	font-family: 'Noto Sans KR', sans-serif;
}

.StorePaymentInformation_storePaymentInformation__nBaVr .StorePaymentInformation_row__OF_TS span.StorePaymentInformation_label__3Pxe0
	{
	width: 90px;
}

.StorePaymentInformation_storePaymentInformation__nBaVr .StorePaymentInformation_row__OF_TS span
	{
	line-height: 20px;
	letter-spacing: 0;
	font-size: 12px;
	font-weight: 400;
	font-style: normal;
	display: inline-block;
	font-weight: bold;
}

span {
	margin: 0;
	border: 0;
	padding: 0;
	vertical-align: baseline;
	font: inherit;
	box-sizing: border-box;
}

.StorePaymentSection_container__1SdwL .StorePaymentSection_titleContainer__gkoqg .StorePaymentSection_title__DLi4F
	{
	line-height: 30px;
	letter-spacing: -.6px;
	font-size: 20px;
	font-weight: 700;
	font-style: normal;
}

.StorePaymentSection_container__1SdwL {
	margin-bottom: 12px;
	background-color: #fff;
	padding: 16px;
}

.StorePaymentInformation_storePaymentInformation__nBaVr {
	background-color: #f9fafb;
	padding: 16px;
}

.StorePaymentSection_container__1SdwL .StorePaymentSection_titleContainer__gkoqg
	{
	position: relative;
}

.StorePaymentNewShippingAddress_storePaymentNewDelivery__Izd2f .StorePaymentNewShippingAddress_label__3bBOI
	{
	line-height: 20px;
	letter-spacing: 0;
	font-size: 14px;
	font-weight: 400;
	font-style: normal;
	margin-top: 24px;
	color: #212529;
}

.StorePaymentInformation_storePaymentInformation__nBaVr label {
	font-size: 14px;
}

.Button_button__341ce.Button_md__3IA0_ {
	padding: 9px 16px;
	line-height: 1.45;
	font-size: 14px;
}

hr {
	border: 0;
	height: 2px;
	background-color: silver;
}

.psamll {
	font-size: 12px;
}

.StorePaymentProductInfo_productDescription__3-3a_ {
	line-height: 18px;
	letter-spacing: 0;
	font-size: 12px;
	font-weight: 400;
	font-style: normal;
	margin-top: 8px;
}

.StorePaymentProductInfo_productDescription__3-3a_1 {
	line-height: 18px;
	letter-spacing: 0;
	font-size: 10px;
	font-weight: 400;
	font-style: normal;
	margin-top: 8px;
	color: red;
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
	<div class="breadcumb_area">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12" style="text-align: center; ">
                    <h5 style="font-size: 1.5em;">Advertisement Pay</h5>
                </div>
            </div>
        </div>
    </div>
	<form action="javascript:requestPay(this.form)">
		<section class="single_product_details_area section_padding_100">
			<div class="container">
				<div class="row">
					<div class="col-12 col-lg-8">
						<div class="single_product_thumb">
							<div id="product_details_slider" class="carousel slide"
								data-ride="carousel">

								<!-- Carousel Inner -->
								<div class="carousel-inner">
									<div>
										<h2>광고 결제</h2>
									</div>
									<div
										style="margin-left: 30px; font-size: 0.8em; font-weight: bold; background-color: f7fffb; margin-bottom: 12px;">
										<span class="material-symbols-outlined">info</span> 결제 후 진행되는 광고 상품입니다.
										<div
											style="margin-left: 20px; color: silver; font-weight: 100;">*
											결제 후 신청하신 광고일자에 맞춰 광고가 진행됩니다.</div>
									</div>
									<section class="StorePaymentSection_container__1SdwL">
										<div>
											<p class="StorePaymentSection_title__DLi4F">신청자정보</p>
										</div>
										<div
											class="StorePaymentSection_sectionContent__1a3aW StorePaymentSection_active__2fVyM">
											<div
												class="StorePaymentInformation_storePaymentInformation__nBaVr">
												<div class="StorePaymentInformation_row__OF_TS">
													<span class="StorePaymentInformation_label__3Pxe0">신청자명</span>
													<span>${adp.memberName }</span>
												</div>
												<div class="StorePaymentInformation_row__OF_TS">
													<span class="StorePaymentInformation_label__3Pxe0">휴대폰
														번호</span> <span>${adp.memberPhone }</span>
												</div>
												<div class="StorePaymentInformation_row__OF_TS">
													<span class="StorePaymentInformation_label__3Pxe0">이메일
														주소</span> <span>${adp.memberEmail }</span>
												</div>
											</div>
										</div>
										<hr>
										<br>
										<div>
											<p class="StorePaymentSection_title__DLi4F">상품정보</p>
										</div>
										<div
											class="StorePaymentSection_sectionContent__1a3aW StorePaymentSection_active__2fVyM">
											<div
												class="StorePaymentInformation_storePaymentInformation__nBaVr">
												<div class="StorePaymentInformation_row__OF_TS">
													<span class="StorePaymentInformation_label__3Pxe0">광고상품명</span>
													<span>${adp.adPosition }</span>
												</div>
												<div class="StorePaymentInformation_row__OF_TS">
													<span class="StorePaymentInformation_label__3Pxe0">프로젝트명</span> 
													<span>${adp.fundTitle }</span>
												</div>
												<div class="StorePaymentInformation_row__OF_TS">
													<span class="StorePaymentInformation_label__3Pxe0">광고시작일</span> 
													<span>${adp.adStartDate }</span>
												</div>
												<div class="StorePaymentInformation_row__OF_TS">
													<span class="StorePaymentInformation_label__3Pxe0">광고종료일</span> 
													<span>${adp.adEndDate }</span>
												</div>
											</div>
										</div>
									</section>
								</div>

								<!-- Carosel Indicators -->
							</div>
						</div>
					</div>

					<div class="col-12 col-md-6 col-lg-4">
							<div class="order-box">
									<div class="fund_order-box">
										<h4 class="title mb-2" style="font-weight: bold;">결제금액</h4>
										<div style="font-weight: 200;">
											<div style="float: left; font-size: 13px;" >
												<span>결제금액 </span><br>
												<span>쿠폰 할인 금액 </span><br>
											</div>
											<div style="float: right; font-size: 13px;">
												<span><b style="float: right;" id="optionPrice">${adp.adPrice }&nbsp;<b style="float: right;">원</b></b> </span><br>
												<span ><b style="float: right;"><b >0 원</b></b></span><br>
											</div>
										</div>
									</div>
									<br>
									<br>
									<hr style="border: solid 1px #00c4c4">
									<div style="float: left; font-size: 13px;" >	
										<span style="float: left; font-size: 15px;">총금액</span>
									</div>
									<div style="float: right; font-size: 15px;">
											<span><b>&nbsp;${adp.adPrice }&nbsp;<b>원</b></b></span><br>
									</div>
									<br>
									<br>
									<br>
									<b><input type="checkbox"  style="width: 18px; height: 18px; margin-left: 8px;" class="Allchk">&nbsp;결제 진행 필수 동의</b><br>
									<input type="checkbox" style="width: 15px; height: 15px; margin-left: 8px;" class="chk"><span style="font-size: 11px;">&nbsp;구매조건, 결제 진행 및 결제 대행 서비스 동의(필수)</span><br>
									<input type="checkbox" style="width: 15px; height: 15px; margin-left: 8px;" class="chk"><span style="font-size: 11px;">&nbsp;개인정보 제3자 제공 동의(필수)</span>
									<br>
									<br>
								  <button name="ordersPrice" type="submit" class="btn btn-primary btn-block"  style="background-color: #00c4c4;">결제하기</button>
							</div>
						</div>
				</div>
			</div>
		</section>
	</form>
	<script>
		$(document).ready(function() {
			$(".Allchk").click(function() {
				if ($(".Allchk").is(":checked"))
					$("input[class=chk]").prop("checked", true);
				else
					$("input[class=chk]").prop("checked", false);
			});

			$("input[class=chk]").click(function() {
				var total = $("input[class=chk]").length;
				var checked = $("input[class=chk]:checked").length;

				if (total != checked)
					$(".Allchk").prop("checked", false);
				else
					$(".Allchk").prop("checked", true);
			});
		});
		function requestPay(data) {
			// getter
			var IMP = window.IMP;
			IMP.init('imp38150256');

			IMP.request_pay({
				pg : 'html5_inicis',
				merchant_uid : new Date().getTime(), //주문번호
				name : '${adp.adPosition}', //
				amount : 100,
				buyer_email : '${adp.memberEmail}',
				buyer_name : '${adp.memberName}',
				buyer_tel : '${adp.memberPhone}'
			}, function(rsp) {
				console.log(rsp);
				let adOrdersIdx = new Date().getTime();
				if (rsp.success) {
					alert('완료');
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
					$.ajax({
						type : "get",
						url : "adOrderPay.do", //충전 금액값을 보낼 url 설정
						data : {
							adOrdersIdx : adOrdersIdx,
							memberId : '${adp.memberId}',
							adOrdersPrice : 10,
							adOrdersTitle : '${adp.adPosition}',
							adOrdersPhone : '${adp.memberPhone}',
							adIdx : '${adp.adIdx}' 
						},
					});
					alert(msg);
					
					location.href = 'mypageGo.do';
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
					alert(msg);
					location.href = 'adPay.do?adIdx=${adp.adIdx}';
				}
			});
		}
	</script>

</body>
<%@include file="/common/Footer.jsp"%>
</html>