<%@page import="com.makeit.fund.FundVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	
    <!-- Style CSS -->
    <link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="icon" href="img/core-img/favicon.ico">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;700&display=swap" rel="stylesheet">
	
</head>

<style>
	.box {
	background-size: 100px 100px;
	width: 100px;
	height: 100px;
	border-radius: 50%;
	overflow: hidden;
	float: none;
	margin: 0 auto;
}

.short-box {
	border: 1px solid #f7fffb  ;
	height: 80px;
	width: 650px;
	border-radius: 10px;
	background-color: #f7fffb  ;
	color: #00c4c4;
	margin:auto;
}

	.profile {
	width : 100%;
	height: 100%;
	object-fit: cover;
}

 button[type="submit"] {
	 background-color: #00c4c4;
	border: 1px solid #00c4c4;
	height: 40px;
	width: 120px;
	color: #fff;
	border-radius: 10px;
 }
 
 button[type="button"] {
	 background-color: #00c4c4;
	border: 1px solid #00c4c4;
	height: 40px;
	width: 120px;
	color: #fff;
	border-radius: 10px;
 }
 
 #insertFollow {
	display: inline-block;
	color: #fff;
	background-color: #00c4c4;
	cursor: pointer;
	height: 40px;
	width: 150px;
	border-radius: 10px;
	text-align:center;
	padding:7px 20px 7px 20px;
}

</style>
<script>
	
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
                    <h5>PRODUCT DETAILS</h5>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="main.do">HOME</a></li>
                        <li class="breadcrumb-item"><a href="fundingPageAll.do">FUNDING</a></li>
                        <li class="breadcrumb-item active">펀딩 상품 상세보기</li>
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
                                <a href="productDetailView.do?fundIdx=${productDetailView.fundIdx }&memberId=${user.memberId}" class="nav-link active" >스토리</a>
                            </li>
                            <li class="nav-item">
                                <a href="getCommentList.do?fundIdx=${productDetailView.fundIdx }&memberId=${user.memberId}" class="nav-link" >커뮤니티 (${productDetailView.communityCnt })<span class="text-muted"></span></a>
                            </li>
                            <li class="nav-item">
                                <a href="returnAndCancel.do" class="nav-link" >반환 ·  정책</a>
                            </li>
                            <li class="nav-item">
                                <a href="getSupporter.do?fundIdx=${productDetailView.fundIdx }&memberId=${user.memberId}" class="nav-link" >서포터 (${productDetailView.supporterCnt })  </a>
                            </li>
                        </ul>
                        
                        <!-- Tab Content -->
                        <div class="tab-content">
                        <!-- Stroy -->
                            <div role="tabpanel" class="tab-pane fade show active" id="description">
                            	<div class="container">
						            <div class="row">
						                <div class="col-12 col-md-7 col-lg-8">
						                    <div class="single_product_thumb">
						                        <div id="product_details_slider" class="carousel slide" data-ride="carousel">
						
						                            <!-- Carousel Inner -->
						                            <div class="carousel-inner">
						                                <div class="carousel-item active">
						                                    <a class="gallery_img" href="img/fundingMainImg/${productDetailView.fundMainImg }" title="First Slide">
						                                        <img class="d-block w-100" src="img/fundingMainImg/${productDetailView.fundMainImg }" alt="First slide">
						                                    </a>
						                                </div>
						                            </div>
						
						                            <!-- Carosel Indicators -->
						                            <br>
						                            <div class="short-box">
					                               		<b class="ftitle mb-2">&nbsp;&nbsp;목표 금액 :</b>
				                       					<b class="ftitle mb-2"><fmt:formatNumber value="${productDetailView.fundTargetPrice}"/> 원</b><br>
					                            		<b class="ftitle mb-2">&nbsp;&nbsp;펀딩 기간 :</b>
						                       			<b class="ftitle mb-2">${fn:substring(productDetailView.fundStartDate,0,10) } ~ ${fn:substring(productDetailView.fundEndDate,0,10) }</b><br>
						                            	<b style="color: grey; font-size:11px;">&nbsp;&nbsp;&nbsp;100% 이상 모이면 펀딩이 성공되며, 펀딩 마감일까지 목표 금액이 100% 모이지 않으면 결제가 진행되지 않습니다.</b>
						                            </div>
						                              <br>
						                        </div>
						                    </div>
						                     <!-- Detail-Img -->
											<c:if test="${empty productDetailView }">
												<tr>
													<td>아직 내용이 없습니다.</td>
												</tr>
											</c:if>
											<c:if test="${not empty productDetailView }">
				                                <div class="description_area">
				                                <br>
					                               	 <c:forEach items="${map }" var="map">
					                                    <img src="img/fundingStoryImg/${map.value}">
				                                    </c:forEach>
				                                </div>
				                            </c:if>
						                </div>
						
						                <!-- Single Product Description -->
						          		<div class="col-12 col-md-6 col-lg-4">
						          			<!-- First Box -->
						                    <div class="single_product_desc">
						                       <h4 class="title mb-2"> <b>${productDetailView.fundTitle }</b></h4>
						                        <h4 class="price mb-2"><fmt:formatNumber value="${productDetailView.fundPrice }"/> 원 펀딩</h4>
						                        <h4 class="price mb-2"><fmt:formatNumber value="${productDetailView.fundTotalPricePercent }"/> %</h4>
					                       	 	<div class="progress mb-3">
					                            	<div class="progress-bar" role="progressbar" style="width: ${productDetailView.fundTotalPricePercent }%; background-color:#00c4c4;" aria-valuenow="${getBoardListAll.fundTotalPricePercent }" aria-valuemin="0" aria-valuemax="100"></div>
					                       	 	</div>
						                       <div>
						                     		<p><b style="font-size:20px;">${productDetailView.supporterCnt } </b>명의 서포터</p>
						                       </div>
						                       <div>
						                       <c:choose>
						                       	<c:when test="${productDetailView.fundDday > 10 }">
						                       		<b class="title mb-2">${productDetailView.fundDday } 일 남음</b>
					                       		</c:when>
					                       		<c:otherwise>
						                       		<p><b class="title mb-2" style="color:red; font-size: 20px;">${productDetailView.fundDday } </b>일 남음</p>
					                       		</c:otherwise>
					                       		</c:choose>
						                        </div><br>
						                        
						                        <!-- Like  -->
						                        <div class="likeBtn" > 
			                            			<a id="insertLike" onclick="javascript:like('${productDetailView.fundIdx }')" href="#"> 
														<c:if test="${like == 0 || like == null }">
															<img src="img/fund/black-Heart.png">&nbsp;좋아요
														</c:if>
														<c:if test="${like != 0 && like != null }">
															<img src="img/fund/red-Heart.png">&nbsp;좋아요&nbsp;취소 
														</c:if>
													</a>
													<p>${like }</p>
			                            		</div>

						                        <!-- Q&A  -->
						                        <c:if test="${empty user.memberId }">
				                            		<div style="text-align:center;">	
				                            		<br>
				                            			<button type="button" onclick="loginForm_Go()" name="doFunding" class="doFunding"><i class="fa fa-credit-card-alt"></i>&nbsp; 문의 하기</button>
				                            		</div>
				                            	</c:if>
				                            	<c:if test="${not empty user.memberId }">
							                        <div class="go_to_QnA" style="text-align: center;">
								                        <br>
								                        <form action="fundingQnaList.do?fundIdx=${productDetailView.fundIdx }" method="post">
								                        	 <button type="submit" name="go_to_QnA" class="go_to_QnA"><i class="fa fa-pencil"></i>&nbsp; 문의 하기</button>
								                        </form>
							                        </div>
						                        </c:if>
						                    </div>
						                    <br>
						                    
						                    <!-- Second Box -->
						                    <div class="single_product_desc">
						                        <h4 class="title mb-2" style="text-align: center; font-weight: bold"><i class="fa fa-id-card"></i>&nbsp; 메이커 정보</h4>
						                        <!-- Maker Information -->
						                        <div class="others_info_area mb-3 d-flex flex-wrap">
						                          <div class="maker-information">
						                          		<br>
						                            	<div class="box">
						                            		<img src="img/makerImg/${productDetailView.fundMakerImg }" class="profile">
						                            	</div>
						                            	<br>
						                            	<div>
						                            		<p><i class="fa fa-user-circle"></i>&nbsp;  메이커 : ${productDetailView.fundMakerName }</p>
					                            		</div>
						                            	<br>
						                            	<div>
						                            		<p><i class="fa fa-at"></i>&nbsp;  이메일 : ${productDetailView.fundMakerEmail }</p>
					                            		</div>
						                            	<br>
						                            	<div>
						                            		<p ><i class="fa fa-fax"></i>&nbsp;  문의 전화 : ${productDetailView.fundMakerCallNumber }</p>
					                            		</div>
						                            	<br>
						                            	<div>
						                            		<p ><i class="fa fa-internet-explorer"></i>&nbsp;  홈페이지 : ${productDetailView.fundMakerHomepage }</p>
					                            		</div>
					                            		<br>
					                            		<div class="followBtn" style="text-align: center;"> 
					                            			<a id="insertFollow" onclick="javascript:follow('${productDetailView.fundMakerId }')" href="#"> 
																<c:if test="${follow == 0 || follow == null}">
																	<i id="follow" class="fa fa-user-plus"></i>&nbsp;팔로우
																</c:if>
																<c:if test="${follow != 0 && follow != null }">
																	<i id="follow" class="fa-solid fa-check"></i>&nbsp;팔로우&nbsp;취소
																</c:if>
															</a>
					                            		</div>
						                            </div>
						                        </div>
						                    </div>
						                    <br>
						                    
						                    <!-- Third  Box -->
						                    <c:forEach items="${fundOptionView }" var="fundOptionView">
							                    <div class="single_product_desc" style="text-align: left;">
							                        <h4 class="title mb-2" style="text-align: center; font-weight: bold;"><i class="fa fa-cart-arrow-down"></i>&nbsp; 리워드 선택</h4>
							                        <c:if test="${empty fundOptionView }">
							                        	<tr>
							                        		<td > 옵션이 없습니다.</td>
							                        	</tr>
							                        </c:if>
							                        <!-- Option Box -->
							                        <c:if test="${not empty fundOptionView }">
							                          <div class="maker-information">
									                        <br>
							                            	<div >
							                            		<p ><i class="fa fa-check-square"></i>&nbsp;  옵션명 : ${fundOptionView.fundOptionTitle }</p><br>
							                            	</div>
									                        <div >
							                            		<p><i class="fa fa-money"></i>&nbsp; <fmt:formatNumber value="${fundOptionView.fundOptionPrice}"/> 원 펀딩</p><br>
							                            	</div>
							                            	<div>
							                            		<p><i class="fa fa-bus"></i>&nbsp; 배송비 : <fmt:formatNumber value="${fundOptionView.fundOptionDelivery }"/> 원</p><br>
							                            	</div>
							                            	<c:if test="${empty user.memberId }">
							                            		<div style="text-align:center;">	
							                            			<button type="button" onclick="loginForm_Go()" name="doFunding" class="doFunding"><i class="fa fa-credit-card-alt"></i>&nbsp; 펀딩 하기</button>
							                            		</div>
							                            	</c:if>
							                            	<c:if test="${not empty user.memberId }">
								                            	<div style="text-align:center;">
							                            			<form action="rewardFunding.do?fundIdx=${productDetailView.fundIdx }&fundOptionTitle=${fundOptionView.fundOptionTitle }&memberId=${user.memberId }" method="post">
											                            <button type="submit" name="doFunding" class="doFunding"><i class="fa fa-credit-card-alt"></i>&nbsp; 펀딩 하기</button>
											                        </form>
							                            		</div>
						                            		</c:if>
							                            </div>
							                        </c:if>
							                    </div>
							                    <hr style="border: solid 1px #00c4c4">
					                     	</c:forEach>
						                </div>
						            </div>
						        </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <br>
    <!-- Single Product Details Area End -->

<%@include file ="/common/Footer.jsp" %>
<script>

function loginForm_Go() {
		alert("로그인 화면으로 이동합니다.");
		location.href="loginForm.do"
}

function fundLikeUpdate(data1) {
	//alert("좋아요 실행~~~ ");
	if('${user.memberId}' == null || '${user.memberId}' == '' ) {
		alert("로그인 화면으로 이동합니다.")
		 location.href = 'loginForm.do';
	} else if('${user.memberId}' != null || '${user.memberId}' != '') {
		 $.ajax("fundLikeUpdate.do", {
			type: "post",
			data: JSON.stringify({
				fundIdx: data1, 
				memberId: '${user.memberId}'
				}), // 서버쪽으로 JSON 문자열 전달
			contentType: "application/json",
			dataType: "json",
			traditional : true, //배열 넘기기
			success: function(data){
				 if(data == 1){
					alert('좋아요가 추가되었습니다');
					$("#heart1"+ data1).attr('class','fa-solid fa-heart-circle-minus');
				} else {
					alert('좋아요가 취소되었습니다.');
					$("#heart" + data1).attr('class','fa-solid fa-heart-circle-plus');
				} 
				 location.href = 'redirect:productDetailView.do?fundIdx=${productDetailView.fundIdx}';
			},
			error : function(request, status, error){

				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		}); 
	}
}

//팔로우
function follow(data) {
	if('${user.memberId}' == null || '${user.memberId}' == '' ) {
		alert("로그인 화면으로 이동합니다.")
		 location.href = 'loginForm.do';
	} else if('${user.memberId}' != null || '${user.memberId}' != '') {
		 $.ajax("fundFollow.do", {
			type: "post",
			data: JSON.stringify({followingId: data, followerId: '${user.memberId}'}), // 서버쪽으로 JSON 문자열 전달
			contentType: "application/json",
			dataType: "json",
			traditional : true, //배열 넘기기
			success: function(data){
				if(data == 1){
					alert("팔로우 성공");
	  				 $("#insertFollow").html('<i id="follow" class="fa-solid fa-check"></i>&nbsp;팔로우&nbsp;취소');
				} else {
					alert("팔로우 취소");
	  				 $("#insertFollow").html('<i id="follow" class="fa fa-user-plus"></i>&nbsp; 팔로우');
				}
				 },
			error: function(){
				alert("실패~~");
			}
		}); 
	}
}

//좋아요
function like(data) {
	if('${user.memberId}' == null || '${user.memberId}' == '' ) {
		alert("로그인 화면으로 이동합니다.")
		 location.href = 'loginForm.do';
	} else if('${user.memberId}' != null || '${user.memberId}' != '') {
		 $.ajax("fundDetailViewLike.do", {
			type: "post",
			data: JSON.stringify({fundIdx: data, memberId: '${user.memberId}'}), // 서버쪽으로 JSON 문자열 전달
			contentType: "application/json",
			dataType: "json",
			traditional : true, //배열 넘기기
			success: function(data){
				if(data == 1){
					alert("좋아요가 추가되었습니다.");
	  				 $("#insertLike").html('<img src="img/fund/red-Heart.png">&nbsp;좋아요&nbsp;취소');
				} else {
					alert("좋아요가 취소되었습니다.");
	  				 $("#insertLike").html('<img src="img/fund/black-Heart.png">&nbsp;좋아요');
				}
				 },
			error: function(){
				alert("실패~~");
			}
		}); 
	}
}

</script>