<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/Header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!-- Favicon  -->
<link rel="icon" href="img/core-img/favicon.ico">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;500;700&display=swap" rel="stylesheet">
<!-- Style CSS -->
<link rel="stylesheet" href="style1.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<title>주문 및 결제</title>
<style>
.material-symbols-outlined {
	font-size: 1em;
	color: gray;
}

div > h2 {
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
#co {
	width: 100%;
	height: 37px;
	border-radius: 6px;
}
</style>
</head>
<body>
<form action="javascript:requestPay(this.form)">
		<section class="single_product_details_area section_padding_100">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-8">
                    <div class="single_product_thumb">
                        <div id="product_details_slider" class="carousel slide" data-ride="carousel">

                            <!-- Carousel Inner -->
                            <div class="carousel-inner">
                             <div>
							<h2>주문 및 결제</h2>
						</div>
			<div
				style="margin-left: 30px; font-size: 0.8em; font-weight: bold; background-color: f7fffb; margin-bottom: 12px;">
				<span class="material-symbols-outlined">info</span> 펀딩에 성공하여 상시 판매하는
				스토어 상품입니다.
				<div style="margin-left: 20px; color: silver; font-weight: 100;">*
					구매 즉시 결제가 진행됩니다.</div>
				<div style="margin-left: 20px; color: silver; font-weight: 100;">*
					본 상품은 구매 후 1일 내 발송됩니다. (주말, 공휴일 제외)</div>
			</div>
			<section class="StorePaymentSection_container__1SdwL">
				<div>
					<p class="StorePaymentSection_title__DLi4F">주문정보</p>
				</div>
				<div class="StorePaymentSection_sectionContent__1a3aW StorePaymentSection_active__2fVyM">
					<div class="StorePaymentInformation_storePaymentInformation__nBaVr">
						<div class="StorePaymentInformation_row__OF_TS">
							<span class="StorePaymentInformation_label__3Pxe0">주문자명</span> <span>${member.memberName }</span>
						</div>
						<div class="StorePaymentInformation_row__OF_TS">
							<span class="StorePaymentInformation_label__3Pxe0">휴대폰 번호</span>
							<span>${member.memberPhone }</span>
						</div>
						<div class="StorePaymentInformation_row__OF_TS">
							<span class="StorePaymentInformation_label__3Pxe0">이메일 주소</span>
							<span>${member.memberEmail }</span>
						</div>
					</div>
				</div>
				<hr>
				<!-- 배송지 -->
			
				<div>
					<p class="StorePaymentSection_title__DLi4F">배송 정보</p>
				</div>
				<div
					class="StorePaymentSection_sectionContent__1a3aW StorePaymentSection_active__2fVyM">
					<div class="StorePaymentInformation_storePaymentInformation__nBaVr">
							<label class="StorePaymentNewShippingAddress_label__3bBOI">받는분</label>
							<input class="form-control" type="text" name="ordersReceiver" placeholder="이름" value="${member.memberName }" id="name"> 
								<label></label> 
								<input class="form-control" type="text" placeholder="휴대폰 번호" value="${member.memberPhone }" id="phone"><br> 
																
								<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기" style="display: none;"><br>
								<input type="text" id="sample6_address" placeholder="주소" style="display: none;"><br>
								<input type="text" id="sample6_detailAddress" placeholder="상세주소" style="display: none;">
								<input type="text" id="sample6_extraAddress" placeholder="참고항목" style="display: none;">
								
								</script>	
								<label class="StorePaymentNewShippingAddress_label__3bBOI">배송지</label><br> 
								<input type="button" class="btn btn-secondary btn-sm" onclick="javascript:sample6_execDaumPostcode()" value="주소 검색"><br>
								<input class="form-control" type="text" id="add" placeholder="주소" value="${member.memberAddress }"> 
								<div id="map" style="width: 300px; height: 300px; margin-top: 10px; display: none"></div>
								<label></label> 
								<input class="form-control" type="text" name="ordersAddress" placeholder="상세주소" id="addDtail"><br> 
								<label>배송 요청사항(선택)</label> 
								<input class="form-control" type="text" name="ordersComment" placeholder="배송 요청사항을 입력해주세요."  id="orderComment">
					</div>


				</div>
				<hr>
				<p>주문정보</p>
				<div class="StorePaymentSection_sectionContent__1a3aW StorePaymentSection_active__2fVyM">
					<div class="StorePaymentInformation_storePaymentInformation__nBaVr">
						<div>
							<p style="font-size: 14px;">${detail.storeTitle }</p>
							<p class="StorePaymentProductInfo_productDescription__3-3a_">${option.storeOption }</p>
						<p class="StorePaymentProductInfo_productDescription__3-3a_1">* 배송안내사항 : 코로나로 인한 택배 배송(간선하차) 불가로 일부 지역은 배송이 제한될 수 있습니다. 자세한 내용은 공지사항을 참고 부탁드립니다.</p>
						</div>
				<hr>
				<div>
					<p>쿠폰</p>
				</div>
				<div class="StorePaymentSection_sectionContent__1a3aW StorePaymentSection_active__2fVyM">
					<div class="StorePaymentInformation_storePaymentInformation__nBaVr">
							<select id="co" onchange="coupon()"> 
								<option selected value="">쿠폰을 선택해주세요.</option>
					<c:forEach var="co" items="${coupon }">
								<option value="${co.couponPrice }">${co.couponTitle }</option>
					</c:forEach>
							</select>
					</div>
				</div>
					</div>
				</div>
				<br>
				<hr>
					<p>결제수단</p>
					<input type="radio" style="width: 18px; height: 18px;" checked="checked"> 카드결제<br>
					</section>
                            </div>

                            <!-- Carosel Indicators -->
                        </div>
                    </div>
                </div>

                <!-- Single Product Description -->
                <div class="col-12 col-lg-4">
                    <div class="single_product_desc">
                        <h4 class="title mb-2" style="font-weight: bold;">결제금액</h4>
						<div style="font-weight: 200;">
	            			<div style="float: left; font-size: 13px;" >
								<span>결제금액 </span><br>
								<span>쿠폰 할인 금액 </span><br>
								<span>배송비 </span><br>
							</div>
							<div style="float: right; font-size: 13px;">
								<span>${option.storeOptionprice }원 </span><br>
								<span id="coco" style="float: right;">0원</span><br>
								<span style="float: right;">${detail.storeDel } 원</span><br>
							</div>
						</div>
						<br><br><hr>
						<span style="float: left; font-size: 13px;">총금액</span>
						<span style="float: right; font-size: 13px;" id="orderPrice">${option.storeOptionprice + detail.storeDel }</span><br><br><br>
							<input type="checkbox" style="width: 18px; height: 18px;" class="Allchk" id="Allchk"> 결제 진행 필수 동의<br>
							<input type="checkbox" style="width: 15px; height: 15px; margin-left: 10px;" class="chk"> 
							<label style="font-size: 12px;">구매조건, 결제 진행 및 결제 대행 서비스 동의(동의)</label><br>
							<input type="checkbox" style="width: 15px; height: 15px;margin-left: 10px;"class="chk"><span style="font-size: 12px;"> 개인정보 제3자 제공 동의(필수)</span>
							

                        <!--  폼데이터 바꿔야됨!~! -->
                       	 	<br>

                            <button id="orderPrice1" name="ordersPrice" type="button" onclick="chk(this.form)" class="btn btn-primary btn-block"  style="background-color: #00B2B2;" value="${option.storeOptionprice + detail.storeDel }" >${option.storeOptionprice + detail.storeDel }원 결제하기</button>
                    </div>
                </div>
            </div>
        </div>
</section>
</form>
<script>
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
</script>
<script>
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

function requestPay(data) {
	
		// getter
		var IMP = window.IMP;
		IMP.init('imp38150256');

		IMP.request_pay({
			pg : 'html5_inicis',
			merchant_uid : new Date().getTime(), //주문번호
			name : '${detail.storeTitle}', //
			amount : 100,	
			buyer_email : '${member.memberEmail}',
			buyer_name : $("#name").val(),
			buyer_tel : $("#phone").val(),
			buyer_addr : $("#addDtail").val(),
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
						"ordersIdx" : new Date().getTime(),
						"memberId" : '${member.memberId}',
						"storeIdx" : '${detail.storeIdx}',
						"ordersAddress" : $("#add").val(),
						"ordersAddressdtail" : $("#addDtail").val(),
						"ordersReceiver" : $("#name").val(),
						"ordersComment" : $("#orderComment").val(),
						"ordersPrice" : $("#orderPrice1").val(),
					},
				});
				location.href = 'orderok.do?memberId=${member.memberId}&ordersIdx=' + ordersIdx;
			} else {
				var msg = '결제에 실패하였습니다.';
				msg += '에러내용 : ' + rsp.error_msg;
			}
			alert(msg);
			
		});
	}
	
	function chk(frm) {
		var add = document.getElementById('addDtail').value;
		
		if(add == '' || add == null){
			alert("상세주소를 입력해주세요.");
			document.getElementById('addDtail').focus();
			return;
		} else if($('#Allchk').is(":checked") == false){
			alert("필수동의 사항에 체크해주세요");
			return;
		}
		frm.submit();
	}
	function coupon() {
		let total = '';
		let co = $("#co option:selected").val();
		if(co != ""){
			total = '${option.storeOptionprice + detail.storeDel }' -co;
			$("#coco").text(co);
			$("#orderPrice").text(total);
			$("#orderPrice1").text(total + "원 결제하기");
			$("#orderPrice1").attr("value",total);
		} else if(co == ""){
			total = '${option.storeOptionprice + detail.storeDel }' -co;
			$("#coco").text(0+"원");
			$("#orderPrice").text(total);
			$("#orderPrice1").text(total + "원 결제하기");
			$("#orderPrice1").attr("value",total);
		}
		
	}
	
</script>
  
</body>
<%@include file="/common/Footer.jsp"%>
</html>