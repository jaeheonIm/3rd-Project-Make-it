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
	
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <!-- Style CSS -->
    <link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="icon" href="img/core-img/favicon.ico">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;700&display=swap" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	
</head>
<style>
.short-box {
	border: 1px solid #f7fffb  ;
	height: 70px;
	width: 650px;
	border-radius: 10px;
	background-color: #f7fffb  ;
	color: #00c4c4;
	margin:auto;
}

.fund_coupon_selectBox {
  position: relative;
  width: 350px;
  height: 40px;
  border-radius: 4px;
  border: 2px solid #00c4c4;
   -moz-appearance: none;
  -webkit-appearance: none;
  appearance: none;
}
.fund_coupon_selectBox .select {
  width: inherit;
  height: inherit;
  background: transparent;
  border: 0 none;
  outline: 0 none;
  padding: 0 5px;
  position: relative;
  z-index: 3; // select가 위로 올라와야 함
}
.fund_coupon_selectBox .select option {
  background: #00c4c4;
  color: #fff;
  padding: 3px 0;
  font-size: 16px;
}

.fund_coupon_selectBox .icoArrow {
  position: absolute; 
  top: 0; 
  right: 0; 
  z-index: 1; 
  width: 35px; 
  height: inherit;
  border-left: 2px solid #00c4c4;
  display: flex;
  justify-content: center;
  align-items: center;
}

.fund_coupon_selectBox .icoArrow img {
  width: 50%;
  transition: .3s; 
}

select:hover {
  border-color: #00c4c4;
}

select:focus {
  border-color: #00c4c4;
  color: #00c4c4;
  outline: none;
}

#couponInput{
	border:none;
	width: 45px;
	float : left;
}

#totalPrice {
	border:none;
	width: 100px;
	float : left;
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
                        <li class="breadcrumb-item"><a href="main.dol">HOME</a></li>
                        <li class="breadcrumb-item"><a href="fundingPageAll.do">FUNDING</a></li>
                        <li class="breadcrumb-item active">펀딩하기</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <br>
    <!-- Breadcumb Area End -->
    
	<form action="javascript:requestPay(this.form)">	
		<section class="single_product_details_area section">
			<div class="container">
				<div class="row" style="hight:500px;">
					<div class="col-12 col-md-7 col-lg-8">
						<div class="single_product_thumb">
							<div id="product_details_slider" class="carousel slide" data-ride="carousel">
							
							<!-- Carousel Inner -->
								<div class="carousel-inner">
									<div>
										<h2>펀딩</h2>
									</div>
									<div class="short-box">
	                            		<b class="ftitle mb-2">&nbsp;&nbsp;&nbsp;펀딩해주시는 금액에 따라 감사의 의미로 리워드를 제공해 드립니다.</b><br>
		                            	<b style="color: grey; font-size:14px;">&nbsp;&nbsp;&nbsp;&nbsp;* 본 상품은 펀딩 종료 후 1일 내 발송됩니다. (주말, 공휴일 제외)</b>
		                            </div>
								<section class="FundingPaymentSection_container__1SdwL">
									<div>
										<hr style="border: solid 1px #00c4c4">
										<p class="FundingPaymentSection_title__DLi4F"><b style="color:#00c4c4;">- 주문정보 -</b></p>
									</div>	
									<div class="FundingPaymentSection_sectionContent__1a3aW FundingPaymentSection_active__2fVyM">
										<div class="FundingPaymentInformation_FundingPaymentInformation__nBaVr">
											<div class="FundingPaymentInformation_row__OF_TS">
												<span class="FundingPaymentInformation_label__3Pxe0"><b>주문자명 : </b></span> 
												<span>${user.memberName }</span>
											</div>
											<div class="FundingPaymentInformation_row__OF_TS">
												<span class="FundingPaymentInformation_label__3Pxe0"><b>휴대폰 번호 : </b></span>
												<span>${user.memberPhone }</span>
											</div>
											<div class="FundingPaymentInformation_row__OF_TS">
												<span class="FundingPaymentInformation_label__3Pxe0"><b>이메일 주소 : </b></span>
												<span>${user.memberEmail }</span>
											</div>
										</div>
									</div>
									<hr style="border: solid 1px #00c4c4">
									
									<!-- 배송지 -->
									<div>
										<p class="FundingPaymentSection_title__DLi4F"><b style="color:#00c4c4;">- 배송 정보 -</b></p>
									</div>
									<div class="FundingPaymentSection_sectionContent__1a3aW FundingPaymentSection_active__2fVyM">
										<div class="FundingPaymentInformation_storePaymentInformation__nBaVr">
											<label class="FundingPaymentNewShippingAddress_label__3bBOI"><b>받는분</b></label>
											<input class="form-control" type="text" name="ordersReceiver" placeholder="이름" value="${user.memberName }" id="name"> 
											<label></label> 
											<input class="form-control" type="text" placeholder="휴대폰 번호" value="${user.memberPhone }" id="phone"><br> 
											<label class="FundingPaymentNewShippingAddress_label__3bBOI"><b>배송지</b></label>
																		
											<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="display: none;"><br>
											<input type="text" id="sample6_address" placeholder="주소" style="display: none;"><br>
											<input type="text" id="sample6_detailAddress" placeholder="상세주소" style="display: none;">
											<input type="text" id="sample6_extraAddress" placeholder="참고항목" style="display: none;">

											<input type="button" class="btn btn-secondary btn-sm" onclick="javascript:sample6_execDaumPostcode()" value="주소 검색" style="background-color:#00c4c4">
											<br><br>
											<input class="form-control" type="text" name="ordersAddress"  id="ordersAddress" placeholder="주소" value="${user.memberAddress }"> 
											<div id="map" style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>
											<label></label> 
											<input class="form-control" type="text" name="ordersAddressDetail" placeholder="상세주소" id="addDetail"><br> 
											<label><b>배송 요청사항(선택)</b></label> 
											<input class="form-control" type="text" name="ordersComment" placeholder="배송 요청사항을 입력해주세요."  id="orderComment">
										</div>
									</div>
									<hr style="border: solid 1px #00c4c4">
								
									<!-- 주문정보 -->
									<div>
										<p class="FundingPaymentSection_title__DLi4F"><b style="color:#00c4c4;">- 옵션 정보 -</b></p>
									</div>
									<div class="option-view">
										<b>선택한 옵션 : ${rewardFunding.fundOptionTitle }</b><br>
										<p style="font-size:15px;"><b>옵션 상세 내용 : </b>${rewardFunding.fundOptionContent }</p>
									</div>
									<hr style="border: solid 1px #00c4c4">
									<br>
								</section>
								</div>
							<!-- Carosel Indicators -->
							</div>
						</div>
					</div>
					<br>
					<br>
					
					<!-- Single Product Description -->
					<div class="col-12 col-md-6 col-lg-4">
						<p><b style="color:#00c4c4;">- 결제 -</b></p>
							<div class="order-box">
								<div>
									<h4 class="title mb-2" style="font-weight: bold;">쿠폰</h4>
								</div>
								<div class="fund_coupon_selectBox">
									<select name="option" class="select" id="select" onchange="selectBox(this.value)">
										<c:if test="${empty couponList }">
											<option value="0" > 쿠폰을 선택해주세요.</option>
											<option value="0" > 사용 가능한 쿠폰이 없습니다.</option>
										</c:if>
										<c:if test="${not empty couponList }">
											<option value="0" > 쿠폰을 선택해주세요.</option>
												<c:forEach var="couponList" items="${couponList }">
													<option value="${couponList.couponPrice}" value2="${couponList.couponIdx }">
														쿠폰 : ${couponList.couponTitle} <small>(<fmt:formatNumber value="-${couponList.couponPrice}"/> 원)</small>
													</option>
												</c:forEach>
											</c:if>
										</select>
									</div>
									<div class="fund_order-box">
										<br>
										<br>
										<br>
										<h4 class="title mb-2" style="font-weight: bold;">결제금액</h4>
										<div style="font-weight: 200;">
											<div style="float: left; font-size: 13px;" >
												<span>결제금액 </span><br>
												<span>쿠폰 할인 금액 </span><br>
												<span>배송비 </span><br>
											</div>
											<div style="float: right; font-size: 13px;">
												<span><b style="float: right;" id="optionPrice"><fmt:formatNumber value="${rewardFunding.fundOptionPrice }"/>&nbsp;<b style="float: right;">원</b></b> </span><br>
												<span >-<b style="float: right;"><input id="couponInput" style="text-align: right;"><b >&nbsp;원</b></b></span><br>
												<span><b style="float: right;" id="deliveryPrice"><fmt:formatNumber value="${rewardFunding.fundOptionDelivery }"/>&nbsp;<b style="float: right;">원</b></b></span><br>
											</div>
										</div>
									</div>
									<br>
									<br>
									<hr style="border: solid 1px #00c4c4">
									<div >	
										<span style="float: left; font-size: 15px; text-aligh: center; justify-content: center; ">수량</span>
									</div>
									<div class="count" style="width: 80px; float: right;">
		                                <input type="number" class="qty-text form-control" id="count" step="0" min="0" max="5" name="count" value="0" >
		                           		<div id="result"></div>
		                            </div>
									<br>
									<br>
									<hr style="border: solid 1px #00c4c4">
									<div style="float: left; font-size: 13px;" >	
										<span style="float: left; font-size: 15px;">총금액</span>
									</div>
									<div style="float: right; font-size: 15px;">
										<c:if test="${empty couponList }">
											<span><b><input id="totalPrice" name="totalPrice" style="font-weight: bold;text-align: right;" <fmt:formatNumber value="${rewardFunding.fundOptionPrice +  rewardFunding.fundOptionDelivery}" />><b>원</b></b></span><br>
										</c:if>
										<c:if test="${not empty couponList }">
											<span><b><input id="totalPrice"  name="totalPrice" style="font-weight: bold;text-align: right;"  <fmt:formatNumber value="${rewardFunding.fundOptionPrice +  rewardFunding.fundOptionDelivery}"/> >&nbsp;<b>원</b></b></span><br>
										</c:if>
									</div>
									<br>
									<br>
									<br>
									<b><input type="checkbox"  style="width: 18px; height: 18px; margin-left: 8px;" class="Allchk">&nbsp;결제 진행 필수 동의</b><br>
									<input type="checkbox" style="width: 15px; height: 15px; margin-left: 8px;" class="chk"><span style="font-size: 11px;">&nbsp;구매조건, 결제 진행 및 결제 대행 서비스 동의(필수)</span><br>
									<input type="checkbox" style="width: 15px; height: 15px; margin-left: 8px;" class="chk"><span style="font-size: 11px;">&nbsp;개인정보 제3자 제공 동의(필수)</span>
									<br>
									<br>
								  <button type="submit" class="btn btn-primary btn-block"  style="background-color: #00c4c4;"><i class="fa fa-credit-card-alt"></i>&nbsp; 결제하기</button>
							</div>
						</div>
					</div>
				</div>
			</section>
		</form>
		<br>
		<br>
		<br>
<script>

//쿠폰창에 선택된 쿠폰의 할인값 가져오기
var selectBox = function (value) {
	var opPrice = value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	console.log("값변경 테스트 : " + opPrice);
	$("#couponInput").val(value);

	let fundOptionPrice = '${rewardFunding.fundOptionPrice}';
	let fundOptionDelivery = '${rewardFunding.fundOptionDelivery}';
	let optionPrice = opPrice;

	console.log(fundOptionPrice);
	console.log(optionPrice);
	console.log(fundOptionDelivery);
	
	fundOptionPrice = parseInt(fundOptionPrice);
	optionPrice = parseInt(optionPrice);
	fundOptionDelivery = parseInt(fundOptionDelivery); 

	var fundTotalPrice = fundOptionPrice - value + fundOptionDelivery 
	
	var price = fundTotalPrice;
	
	var Price = fundTotalPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');

	console.log(Price);

	$('#totalPrice').val(Price);
}

$('#count').change(function(){
	var quantity = $('#count').val();
	var coupon = $('#select').val();
	console.log("값변경 테스트 : " + quantity);
	
	var optionPrice2 = '${rewardFunding.fundOptionPrice}';
	var deliveryPrice2 =  '${rewardFunding.fundOptionDelivery}';
	
	deliveryPrice2 = parseInt(deliveryPrice2);
	console.log(optionPrice2);
	console.log(coupon);

	var optionTotal = (optionPrice2 * quantity ) - coupon + deliveryPrice2;
	
	var Price = optionTotal.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	

	// 콤마 제거
	const number = Price.replace(",", "");
	console.log(number);
	

	$('#totalPrice').val(Price);
	
});



	
//주소 찾기 api
function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("add").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addDtail").focus();
        }
    }).open();
}

//결제 진행 전체 동의
$(document).ready(function() {
	$(".Allchk").click(function() {
		if($(".Allchk").is(":checked")) $("input[class=chk]").prop("checked", true);
		else $("input[class=chk]").prop("checked", false);
	});

	$("input[class=chk]").click(function() {
		var total = $("input[class=chk]").length;
		var checked = $("input[class=chk]:checked").length;

		if(total != checked) $(".Allchk").prop("checked", false);
		else $(".Allchk").prop("checked", true); 
	});
});

//결제 api
function requestPay(data) {
		// getter
		var IMP = window.IMP;
		IMP.init('imp38150256');
		
		var totalPrice = $('#totalPrice').val();
		console.log(totalPrice);
		
		// 콤마 제거
		const totalPrice2 = totalPrice.replace(",", "");
		console.log(totalPrice2);


		IMP.request_pay({
			pg : 'html5_inicis',
			merchant_uid : new Date().getTime(), //주문번호
			name : '${rewardFunding.fundOptionTitle}', //
			amount : 10,
			buyer_email : '${user.memberEmail}',
			buyer_name : $("#name").val(),
			buyer_tel : $("#phone").val(),
			buyer_addr : $("#addDetail").val(),
			buyer_postcode : $("#add").val()
		}, function(rsp) {
			console.log(rsp);
			let ordersIdx = new Date().getTime();
			if (rsp.success) {
				var msg = '결제가 완료되었습니다.';
				msg += '고유ID : ' + rsp.imp_uid;
				msg += '상점 거래ID : ' + rsp.merchant_uid;
				msg += '결제 금액 : ' + rsp.paid_amount;
				msg += '카드 승인번호 : ' + rsp.apply_num;
				$.ajax({
					type : "get",
					url : "orderDtail.do", //충전 금액값을 보낼 url 설정
					data : {
						"memberId" : '${user.memberId}',
						"fundIdx" : '${productDetailView.fundIdx}',
						"ordersAddress" : $("#add").val(),
						"ordersAddressDetail" : $("#addDtail").val(),
						"ordersReceiver" : '${user.memberName}',
						"ordersComment" : $("#orderComment").val(),
						"ordersPrice" : totalPrice2,
					},
				
				});
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			
			var couponIdx = $("#select > option:selected").attr("value2");
			console.log("couponIdx : " + couponIdx);
			
			alert(msg);
			if (couponIdx == null) {
				location.href = 'rewardInsertNoCoupon.do?memberId=${user.memberId}&' +
											 'fundIdx=${rewardFunding.fundIdx}&' + 
											 'ordersAddress=${user.memberAddress}&' + 
											 'ordersReceiver=${user.memberName}&' + 
											 'ordersComment=${rewardFunding.ordersComment}&' +
											 'ordersAddressDetail=${rewardFunding.ordersAddressDetail}&' +
											 'ordersPhone=${user.memberPhone}&'+
											 'ordersOptionTitle=${rewardFunding.fundOptionTitle }&' + 
											 'couponIdx=' + couponIdx +
											 '&totalPrice=' + totalPrice2
											 ;
			} else {
			location.href = 'rewardInsert.do?memberId=${user.memberId}&' +
										 'fundIdx=${rewardFunding.fundIdx}&' + 
										 'ordersAddress=${user.memberAddress}&' + 
										 'ordersReceiver=${user.memberName}&' + 
										 'ordersComment=${rewardFunding.ordersComment}&' +
										 'ordersAddressDetail=${rewardFunding.ordersAddressDetail}&' +
										 'ordersPhone=${user.memberPhone}&'+
										 'ordersOptionTitle=${rewardFunding.fundOptionTitle }&' + 
										 'couponIdx=' + couponIdx +
										 '&totalPrice=' + totalPrice2
										 ;

			}
		});
	}




</script>

<%@ include file="/common/Footer.jsp" %>