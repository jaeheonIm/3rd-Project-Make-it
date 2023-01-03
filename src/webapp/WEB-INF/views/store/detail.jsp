<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="/css/nice-select.css" />
<style> @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;500;700&display=swap'); </style>
<title>${detail.storeTitle }</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style type="text/css">
	#star {
		width: 100%;
		display: inline-flex;
		justify-content: left;
		margin-top: 10px;
	}
	hr {
		color: silver;
	}
	.score {
		display: inline-flex;
	    justify-content: left;
	    flex-direction: column;
	    align-items: left;
	    color: #212529;
	}
	#title	{
		line-height: 20px;
	    letter-spacing: 0;
	    font-size: 14px;
	    font-weight: 700;
	    font-style: normal;
	}
	.container {
		margin-top: 10px;
	}
	.profile {
		width: 40px;
	    height: 40px; 
	    border-radius: 70%;
	    overflow: hidden;
	   	float: left;
	}
	.profile img {
		object-fit: cover;
		style=width: 100%; 
		height: 100%
	}
	.storeNick {
		margin: 7px 5px 19px 11px;
	    float: left;
	    width: 53%;
	}
	.bbox {
		border: 1px solid #ececec;
	    border-radius: 3px;
	    padding: 19px;
	    background-color: #ffffff;
	}
	body {
		font-family: 'Noto Sans KR', sans-serif;
	}
	#insertFollow, #deleteFollow {
		display: inline-block;
		color: #fff;
		background-color: #00c4c4;
		cursor: pointer;
		height: 39px;
		width: 124px;
		border-radius: 10px;
		text-align:center;
		padding: 8px;
}
	#order {
		width: 100%;
	    height: 37px;
	    border-radius: 6px;
	}
</style>
</head>
<body>
<%@include file ="/common/Header.jsp" %>
<!-- Single Product Details Area -->
    <section class="single_product_details_area section_padding_100">
        <div class="container">
            <div class="row">
                <div class="col-12 col-lg-7">
                    <div class="single_product_thumb">
                        <div id="product_details_slider" class="carousel slide" data-ride="carousel">

                            <!-- Carousel Inner -->
                            <div class="carousel-inner">
                                <div class="carousel-item active">
                                    <a class="gallery_img" href="img/product-img/pd-big-thumb-1.png" title="First Slide">
                                        <img class="d-block w-100" src="imgs/${detail.storeImg }" alt="First slide">
                                    </a>
                                    <!-- Product Badge -->
                                    <div class="product_badge">
                                        <span class="badge-new">New</span>
                                    </div>
                                </div>
                            </div>

                            <!-- Carosel Indicators -->
                            <ol class="carousel-indicators">
                                <li class="active" data-target="#product_details_slider" data-slide-to="0" style="background-image: url(imgs/${detail.storeImg});">
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>

                <!-- Single Product Description -->
                <div class="col-12 col-lg-5">
                    <div class="bbox">
                        <h4 class="title mb-2">${detail.storeTitle }</h4>
                        <div class="single_product_ratings mb-2">
                            <i class="fa fa-star" aria-hidden="true"></i>
                            <span class="text-muted"><fmt:formatNumber pattern=".00" value="${cnt.sum }"/>(${cnt.cnt } Reviews)</span>
                        </div>
                        <h4 class="price mb-4"><fmt:formatNumber value="${detail.storePrice }" type="number"/> 원</h4>
						<hr>
						<!-- 배송안내 -->
						<div>
							<span style="font-weight: bold; color: #a6a6a6; font-size: 13px; margin-right: 10px;">배송</span>
							<span style="font-size: 13px;">구매 후 ${detail.storeDel2 } 내 발송</span>
							<p style="font-weight: bold; color: #a6a6a6; font-size: 9px; margin-left: 45px;">배송비 : ${detail.storeDel }원</p>
						</div>
                        <!-- Size Option -->
                        <form method="post" action="order.do">
                               <select name="storeOption" id="order" style="" class="selectbox"  onchange="price()">
                               <option value="" >상품을 선택해주세요</option>
		                            <c:forEach var="option" items="${option }"> 
		                               		<option value="${option.storeOption}">
		                               			<h4>${option.storeOption } - ${option.storeOptionprice }</h4>
		                               		</option>
		                            </c:forEach>
                               </select>
                        <!-- 주문하기 -->
                            <div class="quantity">
                            </div>
                            <input type="hidden" name="memberId" value="${memberId }">
                            <input type="hidden" name="storeIdx" value="${detail.storeIdx }">
                            <button type="button" onclick="chk(this.form)" class="btn btn-primary" style="width: 100%; margin-top: 10px;'">구매하기</button>
                        </form>

                        <!-- Others Info -->
                        <div class="others_info_area mb-3 d-flex flex-wrap">
                            <a class="add_to_compare" href="qna.do?memberId=${memberId }&storeIdx=${detail.storeIdx }"><i class="fa fa-th" aria-hidden="true"></i> 문의하기</a>
                        </div>
                    </div>
                    <div class="bbox" style="margin-top: 10px;">
                        <div class="profile"><img alt="" src="img/user-img/${storeMem.memberPicture }"></div>
                       	<div class="storeNick"><span class="title mb-2">${storeMem.memberNickname }</span></div>
						<div>
							<a id="insertFollow" onclick="javascript:follow('${detail.memberId }')" href="#"> 
								<c:if test="${follow == 0 }">
								<i id="follow" class="fa fa-user-plus"></i>&nbsp; 팔로우
								</c:if>
								<c:if test="${follow != 0 }">
								팔로우취소
								</c:if>
							</a>
						</div>
						<!-- 배송안내 -->
						<div style="margin-top: 24px;">
							<span style="font-weight: bold; color: #a6a6a6; font-size: 13px; margin-right: 21px;">이메일</span>
							<span style="font-size: 13px;">${storeMem.memberEmail }</span><br>
							<span style="font-weight: bold; color: #a6a6a6; font-size: 13px; margin-right: 10px;">문의전화</span>
							<span style="font-size: 13px;">${storeMem.memberPhone }</span>
						</div>
                </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="product_details_tab clearfix">
                        <!-- Tabs -->
                        <ul class="nav nav-tabs" role="tablist" id="product-details-tab" style="margin-top: 45px;">
                            <li class="nav-item">
                                <a href="#description" class="nav-link active" data-toggle="tab" role="tab">스토리</a>
                            </li>
                            <li class="nav-item">
                                <a href="#reviews" class="nav-link" data-toggle="tab" role="tab">만족도 <span class="text-muted">(${cnt.cnt })</span></a>
                            </li>
                            <li class="nav-item">
                                <a href="#addi-info" class="nav-link" data-toggle="tab" role="tab">반품·교환</a>
                            </li>
                        </ul>
                        <!-- Tab Content -->
                        <div class="tab-content">
                            <div role="tabpanel" class="tab-pane fade show active" id="description">
                                <div class="description_area">
                                	<c:forTokens items="${detail.storeImgDetail }" delims=";" var="img">
                                		<img alt="" src="imgs/${img }" width="80%" height="" style="margin-left: 100px">  <br>
                                	</c:forTokens>
                                </div>
                            </div>

                            <div role="tabpanel" class="tab-pane fade" id="reviews">
                            <div id="star">
                            	<div class="score">
                            		<div class="review-rating" style="margin-bottom: 5px;">
                            			<i class="fa fa-star" aria-hidden="true" style="font-size: 2em;"></i><span style="font-size: 1.5em;" id="cnt"><fmt:formatNumber pattern=".00" value="${cnt.sum }"/></span><span style="font-size: 0.5em; color: silver;" >/5.0</span><span  style="color: black; font-weight:lighter;">(${cnt.cnt })</span>
                            		</div>
                            	</div>
                            </div>
                            	<hr>  
                            	
                                <c:forEach var="re" items="${review }">
                                <c:if test="${re == null || re == '' }"> 
                            	<div class="reviews_area">
                            		등록된 리뷰가 없습니다!
                                </div>
                                </c:if>
                                </c:forEach>
                                <div class="reviews_area" id="aaa">
                                <c:forEach var="re" items="${review }">
                                
                                    <ul>
                                        <li>
                                            <div class="single_user_review mb-15">
                                                <div class="review-rating">
                                                <c:if test="${re.storeReviewScore == '1'}">
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                </c:if>
                                                <c:if test="${re.storeReviewScore == '2'}">
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                </c:if>
                                                <c:if test="${re.storeReviewScore == '3'}">
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                </c:if>
                                                <c:if test="${re.storeReviewScore == '4'}">
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                </c:if>
                                                <c:if test="${re.storeReviewScore == '5'}">
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                    <i class="fa fa-star" aria-hidden="true"></i>
                                                </c:if>
                                                </div>
                                                <div class="review-details" style="margin-top: 0;">
                                                <c:if test="${re.storeReviewImg != null}">
                                                	<img alt="" src="img/store-img/${re.storeReviewImg }" style="width: 60px;height: 60px;">
                                                </c:if> 
                                                	<p style="font-weight: bold; font-size: 1em;"> ${re.storeReviewContent }</p>
                                                    <p>by ${re.memberId } on <span>${re.storeReviewRegdate }</span></p>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
							</c:forEach>
                                </div>
							<div class="submit_a_review_area mt-50">
                                    <form action="javascript:reviewIn()" method="post" id="frm" enctype="multipart/form-data">
                                        <div class="form-group" style="margin-bottom: 6;">
                                            <div class="stars">
                                                <input type="radio" name="storeReviewScore" class="star-1" id="star-1" value="1">
                                                <label class="star-1" for="star-1">1</label>
                                                <input type="radio" name="storeReviewScore" class="star-2" id="star-2" value="2">
                                                <label class="star-2" for="star-2">2</label>
                                                <input type="radio" name="storeReviewScore" class="star-3" id="star-3" value="3">
                                                <label class="star-3" for="star-3">3</label>
                                                <input type="radio" name="storeReviewScore" class="star-4" id="star-4" value="4"> 
                                                <label class="star-4" for="star-4">4</label>
                                                <input type="radio" name="storeReviewScore" class="star-5" id="star-5" value="5">
                                                <label class="star-5" for="star-5">5</label>
                                                <span></span>
                                            </div>
                                          
                                            <span>ID : ${memeber.memberNickname }<span style="font-size: 10px; color: silver;">(${memeber.memberId })</span></span>
                                        </div>
                                        <input type="file" name="uploadFile">
                                 
                                        <div class="form-group">
                                            <textarea class="form-control" id="comments" rows="5" data-max-length="150" title="리뷰" name="storeReviewContent" required></textarea>
                                        </div>
                                        <button type="submit" class="btn btn-primary">리뷰작성</button>
                                        <input type="hidden" name="storeIdx" value="${detail.storeIdx}">
                                        <input type="hidden" name="memberId" value="${memeber.memberId}">
                                    </form>
                                </div>
                            </div>

                            <div role="tabpanel" class="tab-pane fade" id="addi-info">
                                <div class="additional_info_area">
                                    <h5>반품 보내실 주소</h5>
                                    <p>${storeMem.memberAddress }</p>
                                    <h5>교환/환불 정책</h5>
                                    <p>· 서포터 단순 변심에 의한 교환/반품은 상품 수령 후 7일 이내에 신청할 수 있습니다.(반품 배송비 서포터 부담)
                                        <br> <span>· 상품의 내용이 표시∙광고 내용과 다르거나 계약내용과 다르게 이행된 경우에는 해당 상품 등을 수령한 날부터 3개월 이내, 그 사실을 안 날 또는 알 수 있었던 날부터 30일 이내에 교환/반품을 신청할 수 있습니다.(반품 배송비 메이커 부담)</span></p>
                                    <h5>A/S 안내사항</h5>
                                    <p>- 교환/반품 신청은 배송 완료 후 7일 이내 가능합니다
                                        <br> <span></span></p>
                                    <p class="mb-0">How do I cancel my order?</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</body>
<script>
function reviewIn() {
	var formData = new FormData(document.getElementById('frm'));
	var score = $("input[name=storeReviewScore]:checked").val();
	if(score == null){
		alert("별점!을 주세요..");
		return;
	} else if('${memberId}' == null || '${memberId}'== ''){
		alert("로그인 후 이용가능합니다.");
		location.href = 'loginForm.do';
		return;
	} 
	
		 $.ajax({
			 type: "POST",
	         enctype: "multipart/form-data",
	         url: "reviewIn.do",
	         data : formData,
	         processData: false,
	         contentType: false,
	         async: true,
	         cache: false,
	        success: function (data) {
			let sco = data.cnt.sum;
			let sco1 = sco.substring(0, 4);
			let add = "";
			$.each(data.list, function(index, obj){
				add += '<ul>';
				add += '<li>';
				add += '<div class="single_user_review mb-15">';
				add += '<div class="review-rating">';
                if(this.storeReviewScore == 1){
                    add += '<i class="fa fa-star" aria-hidden="true"></i>';
               	} else if(this.storeReviewScore == 2){
                    add += '<i class="fa fa-star" aria-hidden="true"></i>';
                    add += '<i class="fa fa-star" aria-hidden="true"></i>';
               	} else if(this.storeReviewScore == 3){
                    add += '<i class="fa fa-star" aria-hidden="true"></i>';
                    add += '<i class="fa fa-star" aria-hidden="true"></i>';
                    add += '<i class="fa fa-star" aria-hidden="true"></i>';
               	} else if(this.storeReviewScore == 4){
                    add += '<i class="fa fa-star" aria-hidden="true"></i>';
                    add += '<i class="fa fa-star" aria-hidden="true"></i>';
                    add += '<i class="fa fa-star" aria-hidden="true"></i>';
                    add += '<i class="fa fa-star" aria-hidden="true"></i>';
               	} else if(this.storeReviewScore == 4){
                    add += '<i class="fa fa-star" aria-hidden="true"></i>';
                    add += '<i class="fa fa-star" aria-hidden="true"></i>';
                    add += '<i class="fa fa-star" aria-hidden="true"></i>';
                    add += '<i class="fa fa-star" aria-hidden="true"></i>';
               	} else if(this.storeReviewScore == 5){
                    add += '<i class="fa fa-star" aria-hidden="true"></i>';
                    add += '<i class="fa fa-star" aria-hidden="true"></i>';
                    add += '<i class="fa fa-star" aria-hidden="true"></i>';
                    add += '<i class="fa fa-star" aria-hidden="true"></i>';
                    add += '<i class="fa fa-star" aria-hidden="true"></i>';
               	}
               		add += '</div>';
                    add += '<div class="review-details">';
                    add += '<p style="font-weight: bold; font-size: 1em;">'+ this.storeReviewContent +'</p>';
                    add += '<p>by ' + this.memberId + ' on <span>' + this.storeReviewRegdate + '</span></p>';
                    add += '</div>';
	               	add += '</div>';
	                add += '</li>';
	                add += '</ul>';
			});
				$("#aaa").html(add);
				$('input[name=storeReviewScore]').removeAttr('checked');
				$('input[name=uploadFile]').val('');
				$('textarea[name=storeReviewContent]').val('');
				$('#cnt').html(sco1);
			},
			error: function(){
				alert("실패~~");
			}
		}); 
	
}

	function chk(frm) {
		var select = (order.options[order.selectedIndex].value);
		if('${memberId}' == null || '${memberId}'  == ''){
			location.href = 'loginForm.do';
		} else if(select == null || select == '' ){
			alert("상품을 선택해주세요!");
			return;
		} else{
			frm.submit();
		}
	}
  // 팔로우
  function follow(data) {
  	if('${memberId}' == null || '${memberId}' == '' ) {
  		 location.href = 'loginForm.do';
  	} else if('${memberId}' != null || '${memberId}' != '') {
  		 $.ajax("storefollow.do", {
  			type: "post",
  			data: JSON.stringify({followingId: data, followerId: '${memberId}'}), // 서버쪽으로 JSON 문자열 전달
  			contentType: "application/json",
  			dataType: "json",
  			traditional : true, //배열 넘기기
  			success: function(data){
  				if(data == 1){
  					alert("팔로우가 추가되었습니다");
	  				 $("#insertFollow").text('팔로우취소');
  				} else {
  					alert("팔로우가 취소되었습니다.");
	  				 $("#insertFollow").html('<i id="follow" class="fa fa-user-plus"></i>&nbsp; 팔로우');
  				}
  				 },
  			error: function(){
  				alert("실패~~");
  			}
  		}); 
  	}
  }
</script>
<%@include file ="/common/Footer.jsp" %>
</html>