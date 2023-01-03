<%@page import="com.makeit.fund.FundVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
    <!-- Style CSS -->
    <link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="icon" href="img/core-img/favicon.ico">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;700&display=swap" rel="stylesheet">
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
                    <h5>PRODUCT DETAILS</h5>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="main.do">HOME</a></li>
                        <li class="breadcrumb-item"><a href="fundingPageAll.do">FUNDING</a></li>
                        <li class="breadcrumb-item active">펀딩 반환 정책</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <br>
    <!-- Breadcumb Area -->
    
    <!-- Single Product Details Area -->
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="product_details_tab section">
                        <!-- Tabs -->
                        <ul class="nav nav-tabs" role="tablist" id="product-details-tab">
                            <li class="nav-item">
                                <a href="productDetailView.do?fundIdx=${productDetailView.fundIdx }&memberId=${user.memberId}" class="nav-link" >스토리</a>
                            </li>
                            <li class="nav-item">
                                <a href="getCommentList.do?fundIdx=${productDetailView.fundIdx }&memberId=${user.memberId}" class="nav-link" >커뮤니티 (${productDetailView.communityCnt })<span class="text-muted"></span></a>
                            </li>
                            <li class="nav-item">
                                <a href="returnAndCancel.do" class="nav-link active" >반환 ·  정책</a>
                            </li>
                            <li class="nav-item">
                                <a href="getSupporter.do?fundIdx=${productDetailView.fundIdx }&memberId=${user.memberId}" class="nav-link" >서포터 (${productDetailView.supporterCnt })</a>
                            </li>
                        </ul>
                        <!-- Tab Content -->
                        <div class="tab-content">
                        	<!-- Return & Cancellation -->
                            <div role="tabpanel" class="tab-pane fade show active" id="refund">
                                <div>
                                    <h4><br><br>펀딩 취소 및 리워드 옵션 변경, 배송지 변경 안내</h4>
                                    <br>
                                    <p>
                             펀딩 결제는 예약 상태로 유지되다가, 
                             펀딩 마감일 다음 영업일 2023.01.01 17시에 모두 함께 진행됩니다.<br>
                             결제 정보 변경은 결제가 진행되기 전까지 언제나 가능합니다. 
                             참여한 펀딩 정보 변경은 펀딩 내역에서 진행해주세요. <br>
                             마감일 이후에는 펀딩에 대한 리워드 제작 및 배송이 시작되어, 
                             취소와 더불어 배송지 및 리워드 옵션 변경은 2022.12. 31 이후로는 
                             불가합니다.
                             		</p>
									
									<br>
                                    <h5>반품 기준</h5>
                                    <br>
                                    <ul class="mb-10 ml-10">
                                        <li><i class="icofont-check"></i> 패키지 파손</li>
                                        <li><i class="icofont-check"></i> 제품의 물리적 손상</li>
                                        <li><i class="icofont-check"></i> 소프트웨어/하드웨어 문제</li>
                                        <li><i class="icofont-check"></i> 액세서리 누락 또는 손상 등</li>
                                    </ul>
                                    <br>
                                    
                                    <h5>펀딩금 반환 안내</h5>
                                    <br>
                                    <p>
                             펀딩 종료 후, 아래 정책에 따라 펀딩금 반환 신청을 할 수 있습니다. <br>
                             펀딩금 반환은 서포터가 펀딩한 결제 건을 취소하는 방식으로 이뤄집니다.<br>
						             펀딩금 반환은 나의 펀딩 > 펀딩 내역에서 신청하실 수 있습니다.
					               </p>
									<br>
									
                                    <h5>1) 리워드가 지연될 경우</h5>
                                    <br>
                                    <p>
                             메이커가 리워드 발송 시작 예정일까지 리워드를 발송하지 않을 경우, 
                             서포터는 펀딩금 반환 신청을 할 수 있습니다.<br>
											리워드 별 발송 시작 예정일은 다를 수 있으니, 나의 펀딩 - 펀딩 내역에서 
											펀딩한 리워드의 발송 시작 예정일을 확인하세요.
									</p>
									<br>
									
                                    <h5>2) 리워드에 하자가 있을 경우</h5>
                                    <br>
                                    <p>
                             서포터가 수령한 리워드가 아래 하자 기준에 해당할 경우, 
                             배송 완료일로부터 14일 이내에 펀딩금 반환 신청을 할 수 있습니다. <br>
                             이때 메이커는 하자 판단을 위한 증빙자료, 
                             리워드 반송을 서포터에게 요청할 수 있습니다.
                             		</p>
									<br>
									
                                    <h5>3) 기타 주의 사항</h5>
                                    <br>
                                    <p>
                             크라우드펀딩의 특성상 프로젝트 종료 후 
                                    		서포터의 단순변심으로 인한 펀딩금 반환은 불가합니다.<br>
											회사는 메이커와 상호 협의 하에 프로젝트를 취소할 수 있으며, 
											펀딩 종료 후 프로젝트가 취소될 경우에는 펀딩금이 반환됩니다.<br>
											하자가 있는 경우, 리워드 반송을 위한 배송비는 
											메이커가 부담하여야 하고 하자가 없는 경우에는 
											리워드 반송 및 재반송에 대한 배송비를 서포터에게 청구될 수 있습니다.
									</p>
									<br>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>
    <!-- Return & Cancellation Area End -->

<%@include file ="/common/Footer.jsp" %>