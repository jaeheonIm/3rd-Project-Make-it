<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<title>Admin</title>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script src="js_jh/ko.js"></script>	
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css" />
<link href="css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js"
	crossorigin="anonymous"></script>
<style>
	.contact{
		padding: 4%;
		height: 400px;
	}
	.col-md-3{
		background: #FF7F50;
		padding: 4%;
		border-top-left-radius: 0.5rem;
		border-bottom-left-radius: 0.5rem;
	}
	.contact-info{
		margin-top:10%;
	}
	.contact-info img{
		margin-bottom: 15%;
	}
	.contact-info h2{
		margin-bottom: 10%;
	}
	.col-md-9{
		background: #fff;
		padding: 3%;
		border-top-right-radius: 0.5rem;
		border-bottom-right-radius: 0.5rem;
	}
	.contact-form label{
		font-weight:600;
	}
	.contact-form button{
		background: #25274d;
		color: #fff;
		font-weight: 600;
		width: 25%;
	}
	.contact-form button:focus{
		box-shadow:none;
	}
	#back {
		border: solid 1px #46D2D2;
		border-left: none;
	}
	#back1 {
		border: solid 1px #46D2D2;
		border-right: none;
	}
</style>	
</head>
<body class="sb-nav-fixed">
	<%@ include file="/common/AdminHeader.jsp"%>
	<div id="layoutSidenav_content">
		<main>
			<div class="container-fluid px-4">
				<h1 class="mt-4">펀딩 쿠폰 발급</h1>
				<ol class="breadcrumb mb-4">
					<li class="breadcrumb-item active">펀딩 상품에 대한 쿠폰을 발급할 수 있습니다</li>
				</ol>
				<div class="container contact">
					<div class="row">
						<div id="back1" class="col-md-3">
							<div class="contact-info">
								<img style="width: 200px;" src="img/admin-img/쿠폰.png" alt="image"/>
								<h2>Funding Coupon</h2>
								<h4>펀딩 쿠폰을 발급해보세요 !</h4>
							</div>
						</div>
						<div id="back" class="col-md-9">
							<form action="insertFundCoupon.do">
							<div class="contact-form">
								<div class="form-group">
								  <label class="control-label col-sm-2" for="couponTitle">쿠폰명</label>
								  <div class="col-sm-10">          
									<input type="text" class="form-control" id="couponTitle" placeholder="" name="couponTitle">
								  </div>
								</div><br>
								<div class="form-group">
								  <label class="control-label col-sm-2" for="couponContent">쿠폰 상세</label>
								  <div class="col-sm-10">          
									<textarea class="form-control" id="couponContent" name="couponContent" rows="2"></textarea>
								  </div>
								</div><br>
								<div class="form-group">
								  <label class="control-label col-sm-2" for="couponPrice">할인가</label>
								  <div class="col-sm-10">          
									<input type="text" class="form-control" id="couponPrice" placeholder="" name="couponPrice">
								  </div>
								</div><br>
								<div class="form-group">
								  <label class="control-label col-sm-2" for="couponStartDate">시작일</label>
								  <div class="col-sm-10">
									<div class="input-group date" id="datetimepicker1"
										data-target-input="nearest">
										<input type="text" id="couponStartDate" name="couponStartDate"
											class="form-control datetimepicker-input"
											data-target="#datetimepicker1" value="2022.12.15" oninput="change()">
										<div class="input-group-append" data-target="#datetimepicker1"
											data-toggle="datetimepicker">
											<div class="input-group-text">
												<i style="height: 25px;" class="fa fa-calendar"></i>
											</div>
										</div>
									</div>
								  </div>
								</div><br>
								<div class="form-group">
								  <label class="control-label col-sm-2" for="comment">종료일</label>
								  <div class="col-sm-10">
									<div class="input-group date" id="datetimepicker2"
										data-target-input="nearest">
										<input type="text" id="couponEndDate" name="couponEndDate"
											class="form-control datetimepicker-input"
											data-target="#datetimepicker2" value="2022.12.16" oninput="change()">
										<div class="input-group-append" data-target="#datetimepicker2"
											data-toggle="datetimepicker">
											<div class="input-group-text">
												<i style="height: 25px;" class="fa fa-calendar"></i>
											</div>
										</div>
									</div>
								  </div>
								</div><br>
								<div class="form-group">
								  <label class="control-label col-sm-2" for="comment">적용 상품</label>
								  <div class="col-sm-10">
									<select class="form-select" aria-label="Default select example" id="selectBox" name="fundIdx">
									  <c:if test="${ empty couponFund }">
										  <option value="" selected>등록된 상품이 없습니다</option>
									  </c:if>
									  <c:if test="${ not empty couponFund }">
									  	<option value="" selected disabled hidden>적용할 상품을 선택하세요</option>
									  	<c:forEach var="fund" items="${couponFund }">
									  		<option value="${fund.fundIdx }">${fund.fundTitle }</option>
									  	</c:forEach>
									  </c:if>
									</select>
								  </div>
								</div><br>
								<div class="form-group">        
								  <div class="col-sm-offset-2 col-sm-10 text-end">
									<button id="couponBtn" type="button" class="btn btn-default">쿠폰 생성</button>
								  </div>
								</div>
							</div>
							</form>
						</div>
					</div>
				</div>
				
			</div>
		</main>
	</div>
<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<!-- <script src="js_jh/scripts.js"></script> -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest"
		crossorigin="anonymous"></script>	
<script>
$('#datetimepicker1').datetimepicker({ format: 'L'});
$('#datetimepicker2').datetimepicker({
   format: 'L',
   useCurrent: false
});

function change(){
	var date1 = $('#couponStartDate').val();
	var date2 = $('#couponEndDate').val();
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
	
}

var inval_Arr = new Array(6).fill(false);
let go = document.forms[0];

$('#couponBtn').click(function(){
	if ($('#couponTitle').val() == "" || $('#couponTitle').val() == null) {
		$('#couponTitle').focus();
		return false;
	} else if ($('#couponContent').val() == "" || $('#couponContent').val() == null) {
		$('#couponContent').focus();
		return false;
	} else if ($('#couponPrice').val() == "" || $('#couponPrice').val() == null) {
		$('#couponPrice').focus();
		return false;
	} else if ($('#couponStartDate').val() == "" || $('#couponStartDate').val() == null) {
		$('#couponStartDate').focus();
		return false;
	} else if ($('#couponEndDate').val() == "" || $('#couponEndDate').val() == null) {
		$('#couponEndDate').focus();
		return false;
	} else if ($('#selectBox').val() == "" || $('#selectBox').val() == null) {
		alert('적용 상품을 선택해주세요');
		return false;
	} else {
		inval_Arr[0] = true;
		inval_Arr[1] = true;
		inval_Arr[2] = true;
		inval_Arr[3] = true;
		inval_Arr[4] = true;
		inval_Arr[5] = true;
	}
	
	for(var i = 0; i < inval_Arr.length; i++){	
		if(inval_Arr[i] == false){
			alert('입력한 정보들을 다시 한번 확인해주세요');
			return false;
		}
	}
	alert('쿠폰이 정상적으로 발행되었습니다');
	go.submit();
});

</script>
</body>
</html>