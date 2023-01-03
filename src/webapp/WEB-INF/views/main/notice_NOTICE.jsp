<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title  -->
<title>notice</title>

<!-- Favicon  -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Style CSS -->
<link rel="stylesheet" href="style.css">

<style>
.board-main {
	border-bottom: 1px solid DarkGray;
	padding:30px 0 20px 0;
}
.info{display: inline-flex;
    flex-direction: row;
    align-content: space-around;
    justify-content: center;
    align-items: flex-end;
}
.title{font-size: 1.5em;}
.img_div { width:300px; display: inline-block; vertical-align: top; text-align: center; height:170px; overflow: hidden; order:2;}
#notice_photo {height: 100%; width:100%; object-fit: cover;}
.notice_category{ color:black; font-style: italic; margin: 0; padding: 0;}
#row {display:grid; }
</style>
</head>

<body>
<!-- Header -->
<c:if test="${user.memberId ne ''}">
<%@include file ="/common/Header.jsp" %>
</c:if>
<c:if test="${user.memberId eq ''}">
<%@include file ="/common/Header_N.jsp" %>
</c:if>
<!-- Header -->	
	 <!-- Breadcumb Area -->
    <div class="breadcumb_area">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12" style="text-align: center; ">
                    <h5 style="font-size: 1.5em;">Notice</h5>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcumb Area -->

	<!-- Total Area-->
	<div class="container" style="margin-bottom: 200px;">
		<div class="row" id="row">
			<div class="col-12">
				<div class="product_details_tab section_padding_100_0 clearfix">
					<!-- Tabs -->
					<ul class="nav nav-tabs" role="tablist" id="product-details-tab">
						<li class="nav-item">
							<a href="#" onclick="javascript:location.href='notice.do'" class="nav-link" data-toggle="tab" role="tab" style="color: #00c4c4;">Total<span class="text-muted">(${page.totalRecord})</span></a> 
						</li>
						<li class="nav-item">
							<a href="#" onclick="javascript:location.href='notice_NOTICE.do?category=NOTICE'" class="nav-link active" data-toggle="tab" role="tab" style="color: #00c4c4;">Notice <span class="text-muted">(${noticeCnt})</span></a>
						</li>
						<li class="nav-item">
							<a href="#" onclick="javascript:location.href='notice_EVENT.do?category=EVENT'" class="nav-link" data-toggle="tab" role="tab" style="color: #00c4c4;">Event<span class="text-muted">(${eventCnt})</span></a>
						</li>
					</ul>
					<!-- Tab
					<!-- Tab Content -->
					<div class="tab-content">
						<div role="tabpanel" class="tab-pane fade show active" id="description">
							<div class="description_area" id="ajaxsearchHtml"></div> 
								<!-- FAQ Area -->
								<div class="container" id="ajaxinsertpart" >
								<c:choose>
									<c:when test="${empty list }">
										<div class="board-main">
											<ul>
												<li><h2>현재 등록된 게시글이 없습니다.</h2></li>
											</ul>
										</div>
									</c:when>
								<c:otherwise>
									<c:forEach var="nlist" items="${list}">
										<div class="board-main">
											<ul>
												<li>
													<a class="article no-thumb" href="notice_detail.do?csIdx=${nlist.csIdx }&category=NOTICE">
														<c:choose>	
															<c:when test="${nlist.csSmallImg ne null }">													
																<div class="info">	
																	<div style="display: inline-block; width: 700px; order:1;">
																		<h6 class="notice_category">${nlist.csCategory }</h6>
																		<h3 class="title">${nlist.csTitle }</h3>
																		<span class="author">make-it</span>
																		<p class="created-at">${nlist.csDate }</p>
																	</div>
																	<div class="img_div">
																		<img alt="사진" src="img/main/${nlist.csSmallImg }" id="notice_photo">
																	</div>
																</div>
															</c:when>
															<c:otherwise>
																<div class="info">	
																	<div style="display: inline-block; width: auto; order:1;">
																		<h6 class="notice_category">${nlist.csCategory }</h6>
																		<h3 class="title">${nlist.csTitle }</h3>
																		<span class="author">make-it</span>
																		<p class="created-at">${nlist.csDate }</p>
																	</div>
																</div>
															</c:otherwise>
														</c:choose>
													</a>
												</li>
											</ul>
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
														<a class="page-link" href="notice_NOTICE.do?cPage=${page.beginPage-1}&category=NOTICE"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
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
															<a class="page-link" href="notice_NOTICE.do?cPage=${pageNo }&category=NOTICE">${pageNo }</a>
	 													</li>
													</c:if>
												</c:forEach>
												
												<c:if test="${page.endPage < page.totalPage }">
												<li class="page-item"> 
													<a class="page-link" href="notice_NOTICE.do?cPage=${page.endPage +1 }&category=NOTICE"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
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
	<!-- Total Area End -->

	<!-- jQuery (Necessary for All JavaScript Plugins) -->
	<script src="js/jquery.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.min.js"></script>
	<script src="js/default/classy-nav.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/default/scrollup.js"></script>
	<script src="js/waypoints.min.js"></script>
	<script src="js/jquery.countdown.min.js"></script>
	<script src="js/jquery.counterup.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jarallax.min.js"></script>
	<script src="js/jarallax-video.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/wow.min.js"></script>
	<script src="js/default/active.js"></script>

</body>
<%@include file="/common/Footer.jsp"%>
</html>