<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="icon" href="img/core-img/favicon.ico">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;700&display=swap" rel="stylesheet">
<title>스토어홈</title>
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
	.single-product-area {
		height: 85%;
	}
	.single-product-area .product_image img{
		height: 180px;
	}
	.pagination {
 		 display: inline-block;
	}
	
	.pagination a {
	  color: black;
	  float: left;
	  padding: 8px 16px;
	  text-decoration: none;
	  border-radius:50%;
	}
	.pagination a:hover, .pagination a:focus {background-color: silver;}
	#index_wrap {
	background-color: #fff;
    top: 0px;
    position: sticky;
    z-index: 101;
	}
#index_wrap,#fromInsideOut {
	display: inline-flex;
    justify-content: center;
    width: 100%;
    height: 40px;
	}
</style>
</head>
<body>
<%@include file ="/common/Header.jsp" %>
<div class="id">
</div>
    <!-- 스토어홈 베스트 -->
	<div id="index_wrap">
		<ul id="fromInsideOut">
			<li>
				<a href="store.do?memberId=${memberId }" style="text-decoration: underline;text-underline-position: under;">스토어홈</a>
			</li>
			<li>
				<a href="best.do?memberId=${memberId }">베스트</a>
			</li>
		</ul>
	</div>

	<!-- Welcome Slides Area 슬라이드 배너 시작 -->
    <section class="welcome_area">
        <div class="welcome_slides owl-carousel">
            <!-- Single Slide -->

            <!-- Single Slide -->
            <div class="single_slide bg-img" style="background-image: url(imgs/main4.png);">
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12 col-md-8">
                            <div class="welcome_slide_text">
                                <h3 data-animation="fadeInUp" data-delay="300ms" style="color: white;">개츠비 키보드 클래식 타자기를 닮은</h3>
                                <h3 data-animation="fadeInUp" data-delay="600ms" style="color: white;">낭만 무선키보드</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Single Slide -->
            <div class="single_slide bg-img" style="background-image: url(imgs/main2.jpg);">
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12 col-md-8">
                            <div class="welcome_slide_text">
                                 <h3 data-animation="fadeInUp" data-delay="300ms" style="color: white;">[꿀당도 고구마 1초컷?]</h3>
                                <h3 data-animation="fadeInUp" data-delay="600ms" style="color: white;"> 삶고굽고찌고 이제 그만! 불로구마!</h3>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Slide -->
            <div class="single_slide bg-img" style="background-image: url(imgs/main1.png);">
                <div class="container h-100">
                    <div class="row h-100 align-items-center">
                        <div class="col-12 col-md-6">
                            <div class="welcome_slide_text">
                             
                                 <h3 data-animation="fadeInUp" data-delay="300ms" style="color: white;">[누적 11,600%]</h3>
                                <h3 data-animation="fadeInUp" data-delay="600ms" style="color: white;">진짜 그릭요거트, 그릭오</h3>
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
                            <a href="javascript:all()">
                                <img src="imgs/all.png" alt="" style="border-color: #3fe8d9" id="cate" class="img" name="all">
                            </a>
                            <p>전체</p>
                        </div>

                        <!-- Single Slide -->
                        <div class="single_catagory_slide">
                            <a href="javascript:category('푸드')">
                                <img src="imgs/food.png" alt="" id="food" class="img" name="food">
                            </a>
                            <p>푸드</p>
                        </div>

                        <!-- Single Slide -->
                        <div class="single_catagory_slide">
                            <a href="javascript:category('패션')">
                                <img src="imgs/fashion.png" alt="" id="cate" class="img" name="fashion">
                            </a>
                            <p>패션·잡화</p>
                        </div>

                        <!-- Single Slide -->
                        <div class="single_catagory_slide">
                            <a href="javascript:category('테크')">
                                <img src="imgs/tech.png" alt="" id="cate" class="img" name="tech">
                            </a>
                            <p>테크·가전</p>
                        </div>

                        <!-- Single Slide -->
                        <div class="single_catagory_slide">
                            <a href="javascript:category('뷰티')">
                                <img src="imgs/beauty.png" alt="" id="cate" class="img" name="beauty">
                            </a>
                            <p>뷰티</p>
                        </div>

                        <!-- Single Slide -->
                        <div class="single_catagory_slide">
                            <a href="javascript:category('리빙')">
                                <img src="imgs/baby.png" alt="" id="cate" class="img" name="baby">
                            </a>
                            <p>리빙·베이비</p>
                        </div>

                        <!-- Single Slide -->
                        <div class="single_catagory_slide">
                            <a href="javascript:category('여행')">
                                <img src="imgs/travel.png" alt="" id="cate" class="img" name="trip">
                            </a>
                            <p>여행·스포츠</p>
                        </div>

                        <!-- Single Slide -->
                        <div class="single_catagory_slide">
                            <a href="javascript:category('반려')">
                                <img src="imgs/animal.png" alt="" id="cate" class="img" name="pet">
                            </a>
                            <p>반려동물</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br><br>
     <div class="container">
        <div class="ulli">
        	<ul>
        		<li><a href="javascript:all('p')" class="p" id="p">인기순</a></li>
        		<li><a href="javascript:all('s')" class="s"  id="s">만족도 높은순</a></li>
        		<li><a href="javascript:all('c')" class="c"  id="c">최신순</a></li>
        	</ul>
        </div>
        </div>
     <section class="best-selling-products-area mb-70" id="sss">
        <div class="container">
        <br>

            <div class="row justify-content-center" id="aaa">
                <!-- Single Product -->
            
            <c:forEach var="list" items="${getlist }" varStatus="Status" >    
                <div class="col-9 col-sm-6 col-md-4 col-lg-4">
                    <div class="single-product-area mb-30">
                        <div class="product_image">
                        <!-- 여기서 부터 -->
                        <!-- Product Image -->
                            <img id="img" class="normal_img" src="imgs/${list.storeImg }" alt="" style="height: 220px;">
                            <c:if test="${fn:contains(bool,list.storeIdx)}">
                            		<div class="product_wishlist">
			                 		<a href="javascript:storeLikeUpdate(${list.storeIdx })"><i id="heart${list.storeIdx }" class="fa-solid fa-heart-circle-minus"></i></a>
			         			</div>
                            </c:if>
                    		<c:if test="${not fn:contains(bool,list.storeIdx)}">
                    			<div class="product_wishlist">
			                 		<a href="javascript:storeLikeUpdate(${list.storeIdx })"><i id="heart${list.storeIdx }" class="fa-solid fa-heart-circle-plus"></i></a>
			         			</div>
                    		</c:if>
                        </div>

                        <!-- Product Description -->
                        <div class="product_description">
                            <a id="title" href="detail.do?memberId=${memberId}&storeIdx=${list.storeIdx}">${list.storeTitle }</a>
                            <h6 id="price" class="product-price">${list.storePrice}원</h6> 
                        </div>
                    </div>
                    
                </div>
                <script>
//Ajax 요청처리로 찜하기
function storeLikeUpdate(data1) {
	if('${memberId}' == null || '${memberId}' == '' ) {
		 location.href = 'loginForm.do';
	} else if('${memberId}' != null || '${memberId}' != '') {
		 $.ajax("storeLikeUpdate.do", {
			type: "post",
			data: JSON.stringify({storeIdx: data1, memberId: '${list.memberId}'}), // 서버쪽으로 JSON 문자열 전달
			contentType: "application/json",
			dataType: "json",
			traditional : true, //배열 넘기기
			success: function(data){
				 if(data == 1){
					alert('찜 목록에 추가되었습니다.');
					$("#heart" +data1).attr('class','fa-solid fa-heart-circle-minus');
				} else{
					alert('찜 목록에서 삭제되었습니다.');
					$("#heart" + data1).attr('class','fa-solid fa-heart-circle-plus'); 
				} 
			},
			error: function(){
			}
		}); 
	}
}
</script>
			 </c:forEach>
            </div>
        </div>
    </section>
</body>
<%@include file ="/common/category.jsp" %>
<%@include file ="/common/Footer.jsp" %>
</html>