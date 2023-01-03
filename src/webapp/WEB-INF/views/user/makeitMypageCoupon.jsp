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
<title>마이페이지 쿠폰</title>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

<!-- Favicon  -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Style CSS -->
<link rel="stylesheet" href="style.css">
<style>
.coupon .kanan {
    border-left: 1px dashed #ddd;
    width: 40% !important;
    position:relative;
}

.coupon .kanan .info::after, .coupon .kanan .info::before {
    content: '';
    position: absolute;
    width: 20px;
    height: 20px;
    background: white;
    border-radius: 100%;
}
.coupon .kanan .info::before {
    top: -10px;
    left: -10px;
}

.coupon .kanan .info::after {
    bottom: -10px;
    left: -10px;
}
.coupon .time {
    font-size: 0.8rem;
}
</style>
</head>
<script>
//myPageCouponList클릭시 출력
function myPageCouponList(Page) {
	console.log("couponList실행");
	var memberId = '${user.memberId}';
	$.ajax("myPageCouponList.do",{
		type:"get",
		data : {"cPage": Page},
		dataType:"json",
		async:false,
		success:function(data){
			console.log("쿠폰전체"+data);	
			let couponHtml="";
			let pageHtml="";
			let page=data.page;
			if(data.list.length==0){
				couponHtml += "<div class='row justify-content-center'>데이터가 없습니다</div>";	
			}else{
				$.each(data.list,function(index,list){
					let couponPrice = list.couponPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
					couponHtml += "<div class='row justify-content-center'>";
					couponHtml += "<div class='col-sm-6'>";
					couponHtml += "<div class='coupon bg-light rounded mb-3 d-flex justify-content-between'>";
					couponHtml += "<div class='kiri p-3'></div>";
					couponHtml += "<div class='tengah py-3 d-flex w-100 justify-content-start'>";
					couponHtml += "<div><span class='badge badge-success'>Valid</span>";
					couponHtml += "<h3 class='lead'>" + list.couponTitle + "</h3>";
					couponHtml += "<p class='text-muted mb-0'>" + couponPrice + " 할인</p></div></div>";
					couponHtml += "<div class='kanan'>";
					couponHtml += "<div class='info m-3 d-flex align-items-center'>";
					couponHtml += "<div class='w-100'>";
					couponHtml += "<div class='block'>";
					couponHtml += "<span class='time font-weight-light'>";
					couponHtml += "<span>" + list.couponEndDate + "까지</span>";
					couponHtml += "<span class='time font-weight-light'></span>";
					couponHtml += "</div>";
					couponHtml += "<a onclick='javascript:couponDownload(";
					couponHtml += '"'+memberId + '"'+',0 ,' + '"'+ list.couponIdx +'"';
					couponHtml += ")'";
					couponHtml += "class='btn btn-sm btn-outline-danger btn-block'>";
					couponHtml += "다운로드</a>";
					couponHtml += "</div></div></div></div></div></div>";
					
				});
				
			}
			let beginpage = page.beginPage-1;
			let endpage = page.endPage+1;
			if(page.beginPage==1){
				pageHtml+="<li class='page-item'><a class='page-link'><i class='fa fa-angle-left' aria-hidden='false'></i></a></li>";
			}else{
				pageHtml+="<li class='page-item'><a class='page-link' href='javascript:myPageCouponList("+beginpage+")'><i class='fa fa-angle-left' aria-hidden='true'></i></a></li>";
			}
			for(var pageNo=page.beginPage; pageNo<=page.endPage; pageNo++){
				if(pageNo==page.nowPage){
					pageHtml+="<li class='page-item active'><a class='page-link'>"+pageNo+"</a></li>";
				}else{
					pageHtml+="<li class='page-item'><a class='page-link' href='javascript:myPageCouponList("+pageNo+")'>"+pageNo+"</a></li>";
				}
			}
			if(page.endPage<page.totalPage){
				pageHtml+="<li class='page-item'><a class='page-link' href='javascript:myPageCouponList("+endpage+")'><i class='fa fa-angle-right' aria-hidden='true'></i></a></li>";
			}else{
				pageHtml+="<li class='page-item'><a class='page-link'><i class='fa fa-angle-right' aria-hidden='false'></i></a></li>";
			}
			$("#ajaxinsertpart").html(couponHtml);
			$("#ajaxpageinsert").html(pageHtml);
		},
		error:function(){
			alert("ajax실패");
		}
	});	
	
}

function myCoupon(memberId,Page) {
	console.log({"memberId":memberId,"cPage": Page});
	$.ajax("myCoupon.do",{
		type:"post",
		data:{"memberId":memberId,"cPage": Page},
		dataType:"json",
		async:false,
		success:function(data){
			console.log("내쿠폰"+data);
			let memberId = data.memberId;
			let myCouponHtml="";
			let pageHtml="";
			let page=data.page;
			let beginpage = page.beginPage-1;
			let endpage = page.endPage+1;
			if(data.list.length==0){
				myCouponHtml += "<div class='row justify-content-center'>데이터가 없습니다</div>";	
			}else{
				$.each(data.list,function(index,list){
					let couponPrice = list.couponPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
					myCouponHtml += "<br><div class='info'>"	
					myCouponHtml += "<div style='display: inline-block; width: auto; order:1;'>"
					myCouponHtml +=	"<h6 class='notice_category'><span class='badge badge-success'>Valid</span></h6>"
					myCouponHtml +=	"<h5 class='title'>" + couponPrice + " 원</h5>"
					myCouponHtml +=	"<span class='author'>" + list.couponTitle + "</span>"
					myCouponHtml +=	"<p class='created-at'>유효기간 : " + list.couponEndDate + "</p>"
					myCouponHtml += "</div>"
					myCouponHtml += "</div><hr>"
				});
				
			}
			if(page.beginPage==1){
				pageHtml+="<li class='page-item'><a class='page-link'><i class='fa fa-angle-left' aria-hidden='false'></i></a></li>";
			}else{
				pageHtml+="<li class='page-item'><a class='page-link' href='javascript:myCoupon('" + memberId + "'," + beginPage +")'><i class='fa fa-angle-left' aria-hidden='true'></i></a></li>";
			}
			for(var pageNo=page.beginPage; pageNo<=page.endPage; pageNo++){
				if(pageNo==page.nowPage){
					pageHtml+="<li class='page-item active'><a class='page-link'>"+pageNo+"</a></li>";
				}else{
					pageHtml+="<li class='page-item'><a class='page-link' href='javascript:myCoupon('" + memberId + "'," + pageNo +")\">"+pageNo+"</a>";
				}
			}
			if(page.endPage<page.totalPage){
				pageHtml+="<li class='page-item'><a class='page-link' href='javascript:myCoupon('" + memberId + "'," + endPage +")'><i class='fa fa-angle-right' aria-hidden='true'></i></a></li>";
			}else{
				pageHtml+="<li class='page-item'><a class='page-link'><i class='fa fa-angle-right' aria-hidden='false'></i></a></li>";
			}
			$("#ajaxinsertpart").html(myCouponHtml);
			$("#ajaxpageinsert").html(pageHtml);
		},
		error:function(){
			alert("ajax실패");
		}
	});
}

function myCouponHistory(memberId,Page) {
	console.log({"memberId":memberId,"cPage": Page});
	$.ajax("myCouponHistory.do",{
		type:"post",
		data:{"memberId":memberId,"cPage": Page},
		dataType:"json",
		async:false,
		success:function(data){
			console.log(data);	
			let memberId = data.memberId;
			let CouponHisHtml="";
			let pageHtml="";
			let page=data.page;
			let beginpage = page.beginPage-1;
			let endpage = page.endPage+1;
			if(data.list.length==0){
				CouponHisHtml += "<div class='row justify-content-center'>데이터가 없습니다</div>";	
			}else{
				$.each(data.list,function(index,list){
					let couponPrice = list.couponPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
					CouponHisHtml +="<br><div class='info'>"	
					CouponHisHtml +="<div style='display: inline-block; width: auto; order:1;'>"
					CouponHisHtml +="<h6 class='notice_category'><span class='badge badge-secondary'>Invalid</span></h6>"
					CouponHisHtml +="<h5 class='title'>" + couponPrice + " 원</h5>"
					CouponHisHtml +="<span class='author'>" + list.couponTitle + "</span>"
					CouponHisHtml +="<p class='created-at'>기간만료 : " + list.couponEndDate + "</p>"
					CouponHisHtml +="</div>"
					CouponHisHtml +="</div><hr>"		
				});
				
			}
			if(page.beginPage==1){
				pageHtml+="<li class='page-item'><a class='page-link'><i class='fa fa-angle-left' aria-hidden='false'></i></a></li>";
			}else{
				pageHtml+="<li class='page-item'><a class='page-link' href='javascript:myCouponHistory('" + memberId + "'," + beginPage +")'><i class='fa fa-angle-left' aria-hidden='true'></i></a></li>";
			}
			for(var pageNo=page.beginPage; pageNo<=page.endPage; pageNo++){
				if(pageNo==page.nowPage){
					pageHtml+="<li class='page-item active'><a class='page-link'>"+pageNo+"</a></li>";
				}else{
					pageHtml+="<li class='page-item'><a class='page-link' href='javascript:myCouponHistory('" + memberId + "'," + pageNo +")\">"+pageNo+"</a>";
				}
			}
			if(page.endPage<page.totalPage){
				pageHtml+="<li class='page-item'><a class='page-link' href='javascript:myCouponHistory('" + memberId + "'," + endPage +")'><i class='fa fa-angle-right' aria-hidden='true'></i></a></li>";
			}else{
				pageHtml+="<li class='page-item'><a class='page-link'><i class='fa fa-angle-right' aria-hidden='false'></i></a></li>";
			}
			$("#ajaxinsertpart").html(CouponHisHtml);
			$("#ajaxpageinsert").html(pageHtml);
		},
		error:function(){
			alert("ajax실패");
		}
	});
}

function couponDownload(memberId,Page,couponIdx) {
	console.log({"memberId":memberId,"cPage": Page, "couponIdx":couponIdx});
	$.ajax("couponDownload.do",{
		type:"post",
		data:{"memberId":memberId,"cPage": Page, "couponIdx":couponIdx},
		dataType:"json",
		async:false,
		success:function(data){
			alert('다운로드 완료');
			console.log(data);
			let memberId = data.memberId;
			let CouponHtml="";
			let headHtml="";
			let pageHtml="";
			let page=data.page;
			let beginpage = page.beginPage-1;
			let endpage = page.endPage+1;
			if(data.list.length==0){
				CouponHisHtml += "<div class='row justify-content-center'>데이터가 없습니다</div>";	
			}else{
					headHtml += "<li class='nav-item'><a href='#' onclick='javascript:myPageCouponList(0)'";
					headHtml += "class='nav-link active' data-toggle='tab'>쿠폰존<span class='text-muted'>";
					headHtml += "(" + data.couponTotalCnt + ")</span></a></li>";

					headHtml += "<li class='nav-item'><a href='#' onclick='javascript:myCoupon(";
					headHtml += '"'+memberId + '"'+',0';
					headHtml += ")'";
					headHtml += "class='nav-link' data-toggle='tab'>나의쿠폰<span class='text-muted'>";
					headHtml += "(" + data.myCouponCnt + ")</span></a></li>";
					
					headHtml += "<li class='nav-item'><a href='#' onclick='javascript:myCouponHistory(";
					headHtml += '"'+memberId + '"'+',0';
					headHtml += ")'";
					headHtml += "class='nav-link' data-toggle='tab'>지난 쿠폰 내역<span class='text-muted'>";
					headHtml += "(" + data.couponHistoryTotalCnt + ")</span></a></li>";
					
				$.each(data.list,function(index,list){
					let couponPrice = list.couponPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
					CouponHtml += "<div class='row justify-content-center'>";
					CouponHtml += "<div class='col-sm-6'>";
					CouponHtml += "<div class='coupon bg-light rounded mb-3 d-flex justify-content-between'>";
					CouponHtml += "<div class='kiri p-3'></div>";
					CouponHtml += "<div class='tengah py-3 d-flex w-100 justify-content-start'>";
					CouponHtml += "<div><span class='badge badge-success'>Valid</span>";
					CouponHtml += "<h3 class='lead'>" + list.couponTitle + "</h3>";
					CouponHtml += "<p class='text-muted mb-0'>" + couponPrice + "할인</p></div></div>";
					CouponHtml += "<div class='kanan'>";
					CouponHtml += "<div class='info m-3 d-flex align-items-center'>";
					CouponHtml += "<div class='w-100'>";
					CouponHtml += "<div class='block'>";
					CouponHtml += "<span class='time font-weight-light'>";
					CouponHtml += "<span>" + list.couponEndDate + "까지</span>";
					CouponHtml += "<span class='time font-weight-light'></span>";
					CouponHtml += "</div>";
					CouponHtml += "<a href='#' onclick='javascript:couponDownload(";
					CouponHtml += '"'+memberId + '"'+',0 ,' + '"'+ list.couponIdx +'"';
					CouponHtml += ")'";
					CouponHtml += "class='btn btn-sm btn-outline-danger btn-block'>";
					CouponHtml += "다운로드</a>";
					CouponHtml += "</div></div></div></div></div></div><hr>";
					
				});
				
			}
			if(page.beginPage==1){
				pageHtml+="<li class='page-item'><a class='page-link'><i class='fa fa-angle-left' aria-hidden='false'></i></a></li>";
			}else{
				pageHtml+="<li class='page-item'><a class='page-link' href='javascript:myPageCouponList('" + memberId + "'," + beginPage +")'><i class='fa fa-angle-left' aria-hidden='true'></i></a></li>";
			}
			for(var pageNo=page.beginPage; pageNo<=page.endPage; pageNo++){
				if(pageNo==page.nowPage){
					pageHtml+="<li class='page-item active'><a class='page-link'>"+pageNo+"</a></li>";
				}else{
					pageHtml+="<li class='page-item'><a class='page-link' href='javascript:myPageCouponList('" + memberId + "'," + pageNo +")\">"+pageNo+"</a>";
				}
			}
			if(page.endPage<page.totalPage){
				pageHtml+="<li class='page-item'><a class='page-link' href='javascript:myPageCouponList('" + memberId + "'," + endPage +")'><i class='fa fa-angle-right' aria-hidden='true'></i></a></li>";
			}else{
				pageHtml+="<li class='page-item'><a class='page-link'><i class='fa fa-angle-right' aria-hidden='false'></i></a></li>";
			}
			$("#product-details-tab").html(headHtml);
			$("#ajaxinsertpart").html(CouponHtml);
			$("#ajaxpageinsert").html(pageHtml);
		},
		error:function(){
			alert("ajax실패");
		}
	});
}
</script>
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
					<h5>Coupon</h5>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="main.do?memberId=${user.memberId }">Home</a></li>
						<li class="breadcrumb-item active">Coupon</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<!-- Breadcumb Area -->
	<div class="container" style="margin-bottom: 200px;">
		<div class="row" id="row">
			<div class="col-12">
				<div class="product_details_tab section_padding_100_0 clearfix">
					<!-- Tabs -->
					<ul class="nav nav-tabs" role="tablist" id="product-details-tab">
						<li class="nav-item">
							<a href="#" onclick="myPageCouponList(0)" class="nav-link active" data-toggle="tab" role="tab">쿠폰존<span class="text-muted">(${couponTotalCnt})</span></a> 
						</li>
						<li class="nav-item">
							<a href="#" onclick="myCoupon('${user.memberId}',0)" class="nav-link" data-toggle="tab" role="tab">나의쿠폰<span class="text-muted">(${myCouponCnt})</span></a>
						</li>
						<li class="nav-item">
							<a href="#" onclick="myCouponHistory('${user.memberId}',0)" class="nav-link" data-toggle="tab" role="tab">지난 쿠폰 내역<span class="text-muted">(${couponHistoryTotalCnt})</span></a>
						</li>
					</ul>
					<!-- Tab Content -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane fade show active" id="description">
							<div class="description_area" id="ajaxHtml">
								</div> 
								<!-- FAQ Area -->
								<div class="container" id="ajaxinsertpart" >
								<c:choose>
									<c:when test="${empty couponList }">
										<div class="row justify-content-center">
											데이터가 없습니다
										</div>
									</c:when>
								<c:otherwise>
									<c:forEach var="list" items="${couponList}">
										<div class="row justify-content-center">
											<div class="col-sm-6">
											    <div class="coupon bg-light rounded mb-3 d-flex justify-content-between">
									                <div class="kiri p-3">
									                </div>
									                <div class="tengah py-3 d-flex w-100 justify-content-start">
									                    <div>
									                        <span class="badge badge-success">Valid</span>
									                        <h3 class="lead">${list.couponTitle } </h3>
									                        <p class="text-muted mb-0"><fmt:formatNumber value="${list.couponPrice }"/> 할인</p>
									                    </div>
									                </div>
									                <div class="kanan">
									                    <div class="info m-3 d-flex align-items-center">
									                        <div class="w-100">
									                            <div class="block">
									                                <span class="time font-weight-light">
									                                    <span>${list.couponEndDate } 까지</span>
									                                </span>
									                            </div>
									                            <a href="#" onclick="couponDownload('${user.memberId}',0 ,'${list.couponIdx }')" class="btn btn-sm btn-outline-danger btn-block">
									                                다운로드
									                            </a>
									                        </div>
									                    </div>
									                </div>
									            </div>
											</div>
										</div>
									</c:forEach>
								</c:otherwise>
								</c:choose>
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
														<a class="page-link" href="makeitMypageCoupon.do?cPage=${page.beginPage-1}&memberId=${user.memberId}"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
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
															<a class="page-link" href="makeitMypageCoupon.do?cPage=${pageNo }&memberId=${user.memberId}">${pageNo }</a>
	 													</li>
													</c:if>
												</c:forEach>
												
												<c:if test="${page.endPage < page.totalPage }">
												<li class="page-item"> 
													<a class="page-link" href="makeitMypageCoupon.do?cPage=${page.endPage +1 }&memberId=${user.memberId}"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
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
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	<br>
	<br>
<%@ include file="/common/Footer.jsp"%>