<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="UTF-8">

<!-- Title  -->
<title>광고 신청</title>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script src="js_jh/ko.js"></script>	
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.css" />
<style>
.parent>.row {
	align-items: center;
}

.col img {
	cursor: pointer;
	object-fit: cover;
}

.col label {
	overflow: hidden;
	position: relative;
}

.imgbgchk:checked+label>.tick_container {
	opacity: 1;
}

.imgbgchk:checked+label>img {
	opacity: 0.3;
}

.tick_container {
	transition: .5s ease;
	opacity: 0;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	-ms-transform: translate(-50%, -50%);
	cursor: pointer;
	text-align: center;
}

.tick {
	background-color: #4CAF50;
	color: white;
	font-size: 16px;
	padding: 6px 12px;
	height: 40px;
	width: 40px;
	border-radius: 100%;
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
				<h2 class="fw-bolder">광고 신청하기</h2>
				<p class="lead fw-normal text-muted mb-5">희망하는 광고 영역을 선택해주세요</p>
			</div>
		</div>
	</div>
	<!-- Breadcumb Area -->
	<!-- Content section 1-->
	<div class="container parent" style="width: 800px;">
	<form action="advertise.do" method="post">
		<div class="row">
			<div class='col text-center'>
				<input type="hidden" name="adPosition" value="">
				<input type="hidden" name="adPrice" value="">
				<input type="hidden" name="memberId" value="${user.memberId }">
				<input type="radio" name="imgbackground" id="img1"
					class="d-none imgbgchk" value="메인 홈 배너"> <label for="img1">
					<img src="img/admin-img/홈 배너 광고.png" alt="Image 1">
					<div class="tick_container">
						<div class="tick">
							<i class="fa fa-check"></i>
						</div>
					</div>
				</label> <small>메인 홈 배너</small>
			</div>
			<div class='col text-center'>
				<input type="radio" name="imgbackground" id="img2"
					class="d-none imgbgchk" value="펀딩 추천"> <label for="img2">
					<img src="img/admin-img/펀딩 추천 광고.png" alt="Image 2">
					<div class="tick_container">
						<div class="tick">
							<i class="fa fa-check"></i>
						</div>
					</div>
				</label> <small>펀딩 추천</small>
			</div>
			<div class='col text-center'>
				<input type="radio" name="imgbackground" id="img3"
					class="d-none imgbgchk" value="취향 추천"> <label for="img3">
					<img src="img/admin-img/취향 추천 광고.png" alt="Image 3">
					<div class="tick_container">
						<div class="tick">
							<i class="fa fa-check"></i>
						</div>
					</div>
				</label> <small>취향 추천</small>
			</div>
			<div class='col text-center'>
				<input type="radio" name="imgbackground" id="img4"
					class="d-none imgbgchk" value="트랜드 추천"> <label for="img4">
					<img src="img/admin-img/트랜드 추천 광고.png" alt="Image 4">
					<div class="tick_container">
						<div class="tick">
							<i class="fa fa-check"></i>
						</div>
					</div>
				</label> <small>트랜드 추천</small>
			</div>
		</div>
		<br>
		<br>
		<div class="row gx-5 justify-content-center">
			<div class="col-lg-8 col-xl-6">
				<div class="text-center">
					<p class="lead fw-normal text-muted mb-5">희망하는 광고 기간을 선택해주세요<br> -1일 기준 70,000원-</p>
				</div>
			</div>
		</div>
		<div class="row gx-5 justify-content-center">
			<div class='col-md-6 col-xs-4'>
				<div class="form-group">
					<label>시작일</label>
					<div class="input-group date" id="datetimepicker1"
						data-target-input="nearest">
						<input type="text" id="adStartDate" name="adStartDate"
							class="form-control datetimepicker-input"
							data-target="#datetimepicker1" value="2022.12.15" oninput="change()">
						<div class="input-group-append" data-target="#datetimepicker1"
							data-toggle="datetimepicker">
							<div class="input-group-text">
								<i class="fa fa-calendar"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class='col-md-6 col-xs-4'>
				<div class="form-group">
					<label>종료일</label>
					<div class="input-group date" id="datetimepicker2"
						data-target-input="nearest">
						<input type="text" id="adEndDate" name="adEndDate"
							class="form-control datetimepicker-input"
							data-target="#datetimepicker2" value="2022.12.16" oninput="change()">
						<div class="input-group-append" data-target="#datetimepicker2"
							data-toggle="datetimepicker">
							<div class="input-group-text">
								<i class="fa fa-calendar"></i>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<br>
		<br>
		<div class="row gx-5 justify-content-center">
			<div class="col-lg-8 col-xl-6">
				<div class="text-center">
					<p class="lead fw-normal text-muted mb-5">광고를 희망하는 나의 펀딩 프로젝트를<br>
						선택해주세요</p>
				</div>
			</div>
		</div>
		<div class="row justify-content-between">
			<div class="col-12">
				<div class="cart-table">
					<div class="table-responsive">
						<table class="table table-bordered mb-30">
							<thead>
								<tr>
									<th scope="col"><i class="fa fa-check"></i></th>
									<th scope="col">Product</th>
									<th scope="col">Category</th>
									<th scope="col">Price</th>
									<th scope="col">Supporter</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${ empty fundMyList }">
									<tr>
										<th colspan="6">펀딩 목록이 없습니다</th>
									</tr>
								</c:if>
								<c:if test="${ not empty fundMyList }">
									<c:forEach var="order" items="${fundMyList }">
										<tr>
											<th scope="row"><input type="radio"
												value="${order.fundIdx }" name="fundIdx"></th>
											<td><a href="#">${order.fundTitle }</a></td>
											<td>${order.fundCategory }</td>
											<td>${order.fundPrice }</td>
											<td>${order.fundSupporter }명</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- Pagination Area -->
			<div class="container">
				<div class="shop_pagination_area mt-30">
					<nav aria-label="Page navigation">
						<ul class="pagination pagination-sm justify-content-center"
							style="display: flex;" id="ajaxpageinsert">
							<c:if test="${page.beginPage==1 }">
								<li class="page-item"><a class="page-link"><i
										class="fa fa-angle-left" aria-hidden="false"></i></a></li>
							</c:if>
							<c:if test="${page.beginPage!=1 }">
								<li class="page-item"><a class="page-link"
									href="makeitAdvertisementPay.do?cPage=${page.beginPage-1}&memberId=${user.memberId}"><i
										class="fa fa-angle-left" aria-hidden="true"></i></a></li>
							</c:if>

							<c:forEach var="pageNo" begin="${page.beginPage }"
								end="${page.endPage }">
								<c:if test="${pageNo == page.nowPage }">
									<li class="page-item active"><a class="page-link">${pageNo }</a>
									</li>

								</c:if>
								<c:if test="${pageNo != page.nowPage }">
									<li class="page-item"><a class="page-link"
										href="makeitAdvertisementPay.do?cPage=${pageNo }&memberId=${user.memberId}">${pageNo }</a>
									</li>
								</c:if>
							</c:forEach>

							<c:if test="${page.endPage < page.totalPage }">
								<li class="page-item"><a class="page-link"
									href="makeitAdvertisementPay.do?cPage=${page.endPage +1 }&memberId=${user.memberId}"><i
										class="fa fa-angle-right" aria-hidden="true"></i></a></li>
							</c:if>
							<c:if test="${page.endPage >= page.totalPage  }">
								<li class="page-item"><a class="page-link"><i
										class="fa fa-angle-right" aria-hidden="false"></i></a></li>
							</c:if>
						</ul>
					</nav>
				</div><br><br>
				<div class="row gx-5 justify-content-center">
					<div>
						<div class="text-center">
							<h5 class="fw-bolder">제출 전 반드시 확인해주세요!</h5>
							<p id="pay_text" class="lead fw-normal text-muted mb-5"></p>
						</div>
					</div>
				</div>
			<button id="reg_submit" class="btn btn-primary btn-block" type="button">신청하기</button>
			</div>
			<!-- Pagination Area End-->
		</div>
	</form>
	</div>
	<br>
	<br>
	<div class="py-5 bg-light">
		<div class="container px-5 my-5">
			<div class="row gx-5 justify-content-center">
				<div class="col-lg-10 col-xl-7">
					<div class="text-center">
						<h1 class="fw-bolder">문의사항이 있으신가요?</h1>
						<div class="d-flex align-items-center justify-content-center">
							<div class="fw-bold">
								광고 서비스에 대해 궁금한 사항이 있다면 아래의 E-MAIL 문의하기를 눌러<br>
								wpghrkWkd@gmail.com로 메일을 보내주세요.<br> <br>
								<div class="d-grid gap-2 col-6 mx-auto">
									<a href="makeitAdvertisementAsk.do" class="btn btn-primary"
										type="button">E-MAIL 문의하기</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
	$('#datetimepicker1').datetimepicker({ format: 'L'});
	$('#datetimepicker2').datetimepicker({
	   format: 'L',
	   useCurrent: false
	});

function change(){
	var date1 = $('#adStartDate').val();
	var date2 = $('#adEndDate').val();
	console.log(date1);
	console.log(date2);
	
	date1 = date1.split('.');
	date2 = date2.split('.');
	console.log(date1);
	console.log(date2);
	
	date1 = new Date(date1[0],date1[1],date1[2]);
	date2 = new Date(date2[0],date2[1],date2[2]);
	console.log(date1);
	console.log(date2);
	
	var btMs = date2.getTime() - date1.getTime();
	console.log(btMs);
	
	var btDay = btMs/(1000*3600*24);
	
	console.log(btDay);
	
	var adPrice = btDay * 70000;
	
	var Price = adPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	console.log(adPrice);
	console.log(Price);
	$('input[name=adPrice]').attr('value', Price);
	var memberName = '${user.memberName}';
	
	$('#pay_text').text(memberName + '님의 광고진행비용은  '+ Price + '원 입니다');
}

var inval_Arr = new Array(4).fill(false);
$('#reg_submit').click(function(){
	let go = document.forms[1];
	
	if($(':radio[name="imgbackground"]:checked').length < 1){
	    alert('희망 광고 영역을 선택해주세요');
	    inval_Arr[0] = false;
	    return false;
	} else {
		var adPosition = $(':radio[name="imgbackground"]:checked').val();
		$('input[name=adPosition]').attr('value', adPosition);
		inval_Arr[0] = true;
	}
	
	if($('#adStartDate').val() == null || $('#adStartDate').val() == "") {
		alert('광고 시작일을 지정해주세요');
	    inval_Arr[1] = false;
	    return false;
	} else {
		inval_Arr[1] = true;
	}
	
	if($('#adEndDate').val() == null || $('#adEndDate').val() == "") {
		alert('광고 종료일을 지정해주세요');
	    inval_Arr[2] = false;
	    return false;
	} else {
		inval_Arr[2] = true;
	}
	
	if($(':radio[name="fundIdx"]:checked').length < 1){
	    alert('펀딩 프로젝트를 선택해주세요');
	    inval_Arr[3] = false;
	    return false;
	} else {
		inval_Arr[3] = true;
	}
	
    //값 체크 후 전송
	for(var i = 0; i < inval_Arr.length; i++){	
		if(inval_Arr[i] == false){
			alert('입력한 정보들을 다시 한번 확인해주세요 :)');
			return false;
		}
	}
    
	if (!confirm('제출하시겠습니까?')) {
        alert('취소되었습니다.');
    } else {
        alert('1차 심사 승인 후 결제가 진행됩니다 \n 영업일 기준 3일 가량 소요될 수 있습니다');
		go.submit();
    }
    
	
});
</script>
	<%@ include file="/common/Footer.jsp"%>