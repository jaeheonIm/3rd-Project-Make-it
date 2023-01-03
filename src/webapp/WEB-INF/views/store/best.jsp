<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Favicon  -->
<link rel="icon" href="img/core-img/favicon.ico">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- Style CSS -->
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<title>베스트</title>
<style type="text/css">
	.container span {
		font-size: 0.8em;
		color: silver;
	}
	.jb-text {
        padding: 15px 20px;
        background-color: #444444;
        border-radius: 5px;
        color: #ffffff;
        display: none;
        position: absolute;
      }
	.container span:hover + .jb-text{
		display: block;
	}
		#index_wrap ul, #index_wrap li {
		list-style: none; 
		display: inline; 
		margin-left: 10px;	
		font-size: 1em;
		text-align: center;
	}
	.single-product-area {
		height: 85%;
	}
	.single-product-area .product_image img{
		height: 180px;
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
	<div id="index_wrap">
		<ul id="fromInsideOut">
			<li>
				<a href="store.do?memberId=${memberId }">스토어홈</a>
			</li>
			<li>
				<a href="best.do?memberId=${memberId }" style="text-decoration: underline;text-underline-position: under;">베스트</a>
			</li>
		</ul>
	</div>
	
        <div class="container">
            <div class="row">
            </div>
        <div class="row">
                <div class="col-12">
                    <div class="shop_by_catagory_slides owl-carousel">
                        <!-- Single Slide -->
                        <div class="single_catagory_slide">
                            <a href="javascript:now()">
                                <img src="imgs/time.png" alt="실시간" style="border-color: #3fe8d9;" class="img" name="now">
                            </a>
                            <p>실시간</p>
                        </div>

                        <!-- Single Slide -->
                        <div class="single_catagory_slide">
                            <a href="javascript:food()">
                                <img src="imgs/food.png" alt="" class="img" name="food">
                            </a>
                            <p>푸드</p>
                        </div>

                        <!-- Single Slide -->
                        <div class="single_catagory_slide">
                            <a href="javascript:fashion()">
                                <img src="imgs/fashion.png" alt="" class="img" name="fashion">
                            </a>
                            <p>패션·잡화</p>
                        </div>

                        <!-- Single Slide -->
                        <div class="single_catagory_slide">
                            <a href="javascript:tech()">
                                <img src="imgs/tech.png" alt="" class="img" name="tech">
                            </a>
                            <p>테크·가전</p>
                        </div>

                        <!-- Single Slide -->
                        <div class="single_catagory_slide">
                            <a href="javascript:beauty()">
                                <img src="imgs/beauty.png" alt="" class="img" name="beauty">
                            </a>
                            <p>뷰티</p>
                        </div>

                        <!-- Single Slide -->
                        <div class="single_catagory_slide">
                            <a href="javascript:baby()">
                                <img src="imgs/baby.png" alt="" class="img" name="baby">
                            </a>
                            <p>리빙·베이비</p>
                        </div>

                        <!-- Single Slide -->
                        <div class="single_catagory_slide">
                            <a href="javascript:trip()">
                                <img src="imgs/travel.png" alt="" class="img" name="trip">
                            </a>
                            <p>여행·스포츠</p>
                        </div>

                        <!-- Single Slide -->
                        <div class="single_catagory_slide">
                            <a href="javascript:pet()">
                                <img src="imgs/animal.png" alt="" class="img" name="pet">
                            </a>
                            <p>반려동물</p>
                        </div>
                    </div>
                </div>
            </div>
		</div>
		<br>
	<div class="container">
		<h5 style="font-weight: bold;">실시간 <span class="material-symbols-outlined">info</span></h5>
		<div class="jb-text">dsdfsdfd</div>
	<hr style="color: silver;">
	</div>
	<section class="best-selling-products-area mb-70">
        <div class="container">

            <div class="row justify-content-center" id="best">
                <!-- Single Product -->
                <c:forEach var="list" items="${getlist }" begin="0" end="100">
				<div class="col-9 col-sm-6 col-md-4 col-lg-4">
                    <div class="single-product-area mb-30">
                        <div class="product_image">
                        <!-- 여기서 부터 -->
                        <!-- Product Image -->
                            <img id="img" class="normal_img" src="imgs/${list.storeImg }" alt="" style="height: 190px;">
                            <c:if test="${fn:contains(bool,list.storeIdx)}">
                            		<div class="product_wishlist">
			                 		<a href="javascript:storeLikeUpdate(${list.storeIdx })"><i id="heart" class="fa-solid fa-heart-circle-minus"></i></a>
			         			</div>
                            </c:if>
                    		<c:if test="${not fn:contains(bool,list.storeIdx)}">
                    			<div class="product_wishlist">
			                 		<a href="javascript:storeLikeUpdate(${list.storeIdx })"><i id="heart1" class="fa-solid fa-heart-circle-plus"></i></a>
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
function storeLikeUpdate(data) {
	if('${memberId}' == null || '${memberId}' == '' ) {
		 location.href = 'loginForm.do';
	} else if('${memberId}' != null || '${memberId}' != '') {
		 $.ajax("storeLikeUpdate.do", {
			type: "post",
			data: JSON.stringify({storeIdx: data, memberId: '${list.memberId}'}), // 서버쪽으로 JSON 문자열 전달
			contentType: "application/json",
			dataType: "json",
			traditional : true, //배열 넘기기
			success: function(data){
				 if(data == 1){
					alert('찜 목록에 추가되었습니다!~!' + data);
					$("#heart1").attr('class','fa-solid fa-heart-circle-minus');
				} else{
					alert('찜 목록에서 삭제되었습니다!~!' + data);
					$("#heart").attr('class','fa-solid fa-heart-circle-plus');
				} 
			},
			error: function(){
				alert("실패~~");
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
</html>
<%@include file ="/common/bestcategory.jsp" %>
<%@include file ="/common/Footer.jsp" %>