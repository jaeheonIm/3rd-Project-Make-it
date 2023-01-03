<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file ="/common/Header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Style CSS -->
    <link rel="stylesheet" href="style1.css">
<link rel="icon" href="img/core-img/favicon.ico">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;700&display=swap" rel="stylesheet">
<title>Makt It 스토어홈</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
	#index_wrap ul, #index_wrap li {
		list-style: none; 
		display: inline; 
		margin-left: 10px;	
		font-size: 1em;
		text-align: center;
	}
	.ulli a:hover {
		font-weight: bold;
	}
	.ulli ul, .ulli li{
		list-style: none; 
		display: inline; 
		margin-left: 10px;	
		font-size: 1.0em;
		float: right;
	}
</style>
</head>
<body>

    <!-- 스토어홈 베스트 -->
	<div id="index_wrap">
		<ul id="fromInsideOut">
			<li>
				<a href="store.do?memberId=${memberId }" style="text-decoration: underline;text-underline-position: under;">스토어홈</a>
			</li>
			<li>
				<a href="best.do">베스트</a>
			</li>
		</ul>
	</div>

	<!-- Welcome Slides Area 슬라이드 배너 시작 -->
    <section class="welcome_area">
        <div class="welcome_slides owl-carousel">
            <!-- Single Slide -->
            <div class="single_slide bg-img">
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-7 col-md-8 singleb">
                            <div class="welcome_slide_text">
                                <p style="font-weight:bold;" data-animation="fadeInUp" data-delay="0">스토어에<br>이제와-쑈?</p>
                                <a href="#" class="btn btn-primary" data-animation="fadeInUp" data-delay="1s">이번주 신상프로젝트를 소개합니다.</a>
                            </div>
                        </div>
                        <div class="col-5 col-md-4">
                            <div class="welcome_slide_image">
                                <img src="imgs/catcat.png" alt="" data-animation="bounceInUp" data-delay="500ms">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Slide -->
            <div class="single_slide bg-img" style="background-image: url(img/bg-img/7.jpg);">
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12 col-md-8">
                            <div class="welcome_slide_text">
                                <p data-animation="fadeInUp" data-delay="0">Sustainable Clock</p>
                                <h2 data-animation="fadeInUp" data-delay="300ms">Smart Watch</h2>
                                <h4 data-animation="fadeInUp" data-delay="600ms">Only $31 <span class="regular-price">$43</span></h4>
                                <a href="#" class="btn btn-primary" data-animation="fadeInUp" data-delay="600ms">Check Collection</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Slide -->
            <div class="single_slide bg-img" style="background-image: url(img/bg-img/6.jpg);">
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12 col-md-6">
                            <div class="welcome_slide_text">
                                <p class="text-white" data-animation="fadeInUp" data-delay="0">100% Cotton</p>
                                <h2 class="text-white" data-animation="fadeInUp" data-delay="300ms">Hot Shoes</h2>
                                <h4 class="text-white" data-animation="fadeInUp" data-delay="600ms">Now $19</h4>
                                <a href="#" class="btn btn-primary" data-animation="fadeInUp" data-delay="900ms">Add to cart</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <br><br>
    <div class="top_catagory_area mt-50 clearfix">

        <div class="container">
            	<h4 style="font-weight: bold;">이벤트</h4>
            <div class="row">
                <!-- Single Catagory -->
                <div class="col-12 col-md-4">
                    <div class="single_catagory_area mt-50">
                        <a href="#">
                            <img style="hight:200px;" src="imgs/coupon5.png" alt="">
                        </a>
                    </div>
                </div>

                <!-- Single Catagory -->
                <div class="col-12 col-md-4">
                    <div class="single_catagory_area mt-50">
                        <a href="#">
                            <img src="imgs/firstOrder.png" alt="">
                        </a>
                    </div>
                </div>

                <!-- Single Catagory -->
                <div class="col-12 col-md-4">
                    <div class="single_catagory_area mt-50">
                        <a href="#">
                            <img src="imgs/tenpercentCoupon.png" alt="">
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- 카테고리 ~!~1 -->
<!-- Shop Catagory Area -->
    <div class="shop_by_catagory_area section_padding_100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="section-heading mb-50">
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="shop_by_catagory_slides owl-carousel">
                        <!-- Single Slide -->
                        <div class="single_catagory_slide">
                            <a href="#">
                                <img src="imgs/all.png" alt=""  style="border-color: #3fe8d9;">
                            </a>
                            <p">전체</p>
                        </div>

                        <!-- Single Slide -->
                        <div class="single_catagory_slide">
                            <a href="#">
                                <img src="imgs/food.png" alt="">
                            </a>
                            <p>푸드</p>
                        </div>

                        <!-- Single Slide -->
                        <div class="single_catagory_slide">
                            <a href="#">
                                <img src="imgs/fashion.png" alt="">
                            </a>
                            <p>패션·잡화</p>
                        </div>

                        <!-- Single Slide -->
                        <div class="single_catagory_slide">
                            <a href="#">
                                <img src="imgs/tech.png" alt="">
                            </a>
                            <p>테크·가전</p>
                        </div>

                        <!-- Single Slide -->
                        <div class="single_catagory_slide">
                            <a href="#">
                                <img src="imgs/beauty.png" alt="">
                            </a>
                            <p>뷰티</p>
                        </div>

                        <!-- Single Slide -->
                        <div class="single_catagory_slide">
                            <a href="#">
                                <img src="imgs/baby.png" alt="">
                            </a>
                            <p>리빙·베이비</p>
                        </div>

                        <!-- Single Slide -->
                        <div class="single_catagory_slide">
                            <a href="#">
                                <img src="imgs/travel.png" alt="">
                            </a>
                            <p>여행·스포츠</p>
                        </div>

                        <!-- Single Slide -->
                        <div class="single_catagory_slide">
                            <a href="#">
                                <img src="imgs/animal.png" alt="">
                            </a>
                            <p>반려동물</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br><br>
     <section class="best-selling-products-area mb-70">
        <div class="container">
        <div class="ulli">
        	<ul>
        		<li><a href="#">인기순</a></li>
        		<li><a href="#">만족도 높은순</a></li>
        		<li><a href="#">최신순</a></li>
        	</ul>
        </div><br>
            <div class="row">
                <div class="col-12">
                </div>
            </div>

            <div class="row justify-content-center">
                <!-- Single Product -->
            <c:forEach var="list" items="${getlist }">                           
                <div class="col-9 col-sm-6 col-md-4 col-lg-3">
                    <div class="single-product-area mb-30">
                        <div class="product_image">
                        <!-- 여기서 부터 -->
                        <!-- Product Image -->
                            <img class="normal_img" src="imgs/${list.storeImg }.png" alt="">

                            <!-- 찜하기..ㅎ -->
                            <div class="product_wishlist">
                                <a href="javascript:storeLikeUpdate()"><i class="icofont-heart"></i></a>
                           </div>
<script>

	//Ajax 요청처리로 찜하기
	function storeLikeUpdate() {
		alert("좋아요 실행~~~");
		
		 $.ajax("storeLikeUpdate.do", {
			type: "post",
			data: JSON.stringify({storeIdx: ${list.storeIdx}, memberId: '${list.memberId}'}), // 서버쪽으로 JSON 문자열 전달
			contentType: "application/json",
			dataType: "json",
			traditional : true,
			success: function(data){
				 if(data == 1){
					alert('찜 목록에 추가되었습니다!~!' + data);
				} else if(data == 2){
					alert('찜 목록에서 삭제되었습니다!~!' + data);
				} 
			},
			error: function(){
				alert("실패~~");
			}
		}); 
	}
</script>
                        </div>

                        <!-- Product Description -->
                        <div class="product_description">

                            <a href="#">${list.storeTitle }</a>
                            <h6 class="product-price">${list.storePrice}원</h6> 
                        </div>
                    </div>
                    
                </div>
              </c:forEach>
	
            </div>
        </div>
    </section>
</body>

<%@include file ="/common/Footer.jsp" %>
</html>