<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title  -->
<title>Make it</title>

<!-- Favicon  -->
<link rel="icon" href="img/core-img/favicon.ico">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500;700&display=swap" rel="stylesheet">

<!-- Style CSS -->
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="css/main/main.css">
<style>
 @keyframes fadeInUp {
        0% {
            opacity: 0;
            transform: translate3d(0, 100%, 0);
        }
        to {
            opacity: 1;
            transform: translateZ(0);
        }
    }
  .single_1 {
      position: relative;
      animation: fadeInUp 2s; 

  }
  .single_2 {
      position: relative;
      animation: fadeInUp 2s; 
      animation-delay: 0.2s;
  }
  .single_3 {
      position: relative;
      animation: fadeInUp 2s; 
      animation-delay: 0.4s;
  }
  .single_4 {
      position: relative;
      animation: fadeInUp 2s; 
      animation-delay: 0.6s;
  }
  .single_5 {
      position: relative;
      animation: fadeInUp 2s; 
      animation-delay: 0.8s;
  }
@keyframes blink-effect { 50% { opacity: 0; } } 
#bling { 
	color: #CD5C5C;
	font-weight:bold;
    animation: blink-effect 0.8s step-end infinite; 
}
.review_content{
    overflow: hidden;
    -webkit-line-clamp: 3;
    margin-top: 40px;
    margin-bottom: 1em;
    color: black;
    }
#ss{ height: 70px; width: 30%; display: inline-block; }
#aa{ display: inline-block;height: 100%; width: 68%; font-size: 0.8em; vertical-align: middle; }
@font-face {
    font-family: 'GangwonEdu_OTFBoldA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2201-2@1.0/GangwonEdu_OTFBoldA.woff') format('woff');
    font-weight: 700;
    font-style: normal;
}
@font-face {
    font-family: 'OTWelcomeRA';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2105_2@1.0/ONE-Mobile-POP.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
</style>
</head>
<script>
//??????
function feedcategory(category) {
	console.log({"category":category});
	$.ajax("mainFeedAjax.do",{
		type:"post",
		data:{"category":category},
		dataType:"json",
		success:function(data){
			let mainFeedHtml="";			
			let category = data.category;
			if(category=="STORE"){
				$.each(data.feedlist,function(index,list){
					mainFeedHtml += "<div class='col-12' id='single_3' onclick=\"javascript:location.href='detail.do?storeIdx="+list.storeIdx+"'\">";
					mainFeedHtml += "<div class='single-product-area mb-30' style='height: 270px;'>";
					mainFeedHtml += "<div class='product_image'>";
					if(list.storeReviewImg == null){
						mainFeedHtml += "<img class='normal_img' src='imgs/"+list.storeImg+"' alt='???????????????' style='height: 270px;'></div>";
					}else{
						mainFeedHtml += "<img class='normal_img' src='img/store-img/"+list.storeReviewImg+"' alt='???????????????' style='height: 270px;'></div>";
					}
					mainFeedHtml += "<div class='product_description'>";
					mainFeedHtml += "<p class='brand_name'>"+list.memberId+"</p>";
					mainFeedHtml += "<p class='review_content'>"+list.storeReviewContent+"</p><br><br>";
					mainFeedHtml += "<p class='product-short-desc'>"+list.storeTitle+"</p>";
					mainFeedHtml += "</div></div></div>";
				});
			} else{
				$.each(data.feedlist,function(index,list){
					console.log("else??? ?????????"+list);
					mainFeedHtml += "<div class='col-12' id='single_3'  onclick=\"javascript:location.href='productDetailView.do?memberId=${memberId}&fundIdx="+list.fundIdx+"'\">";
					mainFeedHtml += "<div class='single-product-area mb-30' style='height: 270px;'>";
					mainFeedHtml += "<div class='product_image'>";
					if(list.fundReviewImg ==  null || list.fundReviewImg ==''){
						mainFeedHtml += "<img class='normal_img' src=\"img/reviewImg/"+list.fundMainImg+"\" alt='????????????' style='height: 270px;'></div>";
					}else{
						mainFeedHtml += "<img class='normal_img' src=\"img/reviewImg/"+list.fundReviewImg+"\" alt='???????????????' style='height: 270px;'></div>";
					}
					mainFeedHtml += "<div class='product_description'>";
					mainFeedHtml += "<p class='brand_name'>"+list.fundMakerName+"</p>";
					mainFeedHtml += "<p class='review_content'>"+list.fundReviewContent+"</p><br><br>";
					mainFeedHtml += "<p class='product-short-desc'>"+list.fundTitle+"</p>";
					mainFeedHtml += "</div></div></div>";
				});
				console.log("else???:"+mainFeedHtml);
			}
			$("#feedajaxinsert").html(mainFeedHtml);	
		},			
		error:function(){
			alert("ajax??????");
		}
	});
}
//????????? ??????
let storetimer;
let fundtimer;
function stopClock(timer) {
  clearTimeout(timer);
}
function rank(category) {
	stopClock(fundtimer);
	if(category=="STORE"){
		$.ajax("mainrankAjax.do",{
			type:"post",
			data:{"category":category},
			dataType:"json",
			success:function(data){
				let mainrankHtml="";			
				let category = data.category;
					$.each(data.ranklist,function(index,list){
						let storeprice = list.storePrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
						mainrankHtml += "<div id='single_3' class=\"single_"+(index+1)+"\" onclick=\"location.href='detail.do'\" style='margin-top: 20px;'>";
						mainrankHtml += "<div id='inline_block' class='rank' style='width: 30px;'>";
						mainrankHtml += "<p>"+(index+1)+"</p></div>";
						mainrankHtml += "<div id='inline_block' style='width: 175px;'>";
						mainrankHtml += "<p style='margin: 0;overflow: hidden;text-overflow: ellipsis; white-space: nowrap;'>"+list.storeTitle+"</p>";
						mainrankHtml += "<p style='margin: 0;'>"+storeprice+"???&nbsp;&nbsp;&nbsp;"+list.storeCategory+"</p></div>";
						mainrankHtml += "<div id='inline_block' class='img'>";
						mainrankHtml += "<img class='normal_img' src='imgs/"+list.storeImg+"' alt='???????????????' id='img' style='margin-left: 15px;'>";
						mainrankHtml += "</div></div>";	
					});
				$("#rankajaxinsert").html(mainrankHtml);	
				storetimer = setTimeout(rank,5000,'STORE');
			},			
			error:function(){
				alert("ajax??????");
			}
		});
	}else{
		stopClock(storetimer);
		$.ajax("mainrankAjax.do",{
			type:"post",
			data:{"category":category},
			dataType:"json",
			success:function(data){
				let mainrankHtml="";			
				let category = data.category;
					$.each(data.ranklist,function(index,list){
					let fundPrice = parseInt(list.fundPrice);
					let fundTargetPrice = parseInt(list.fundTargetPrice);
					let targetrate = (fundPrice/fundTargetPrice*100);
					let totalrate = Math.round(targetrate);
					mainrankHtml += "<div id='single_3' class=\"single_"+(index+1)+"\" onclick=\"location.href='detail.do'\" style='margin-top: 20px;'>";
					mainrankHtml += "<div id='inline_block' class='rank' style='width: 30px;'>";
					mainrankHtml += "<p>"+(index+1)+"</p></div>";
					mainrankHtml += "<div id='inline_block' style='width: 175px;'>";
					mainrankHtml += "<p style='margin: 0;overflow: hidden;text-overflow: ellipsis; white-space: nowrap;'>"+list.fundTitle+"</p>";
					mainrankHtml += "<p style='margin: 0;'>"+totalrate+"%&nbsp;&nbsp;/&nbsp;&nbsp;"+ list.fundCategory+"</p></div>";
					mainrankHtml += "<div id='inline_block' class='img'>";
					mainrankHtml += "<img class='normal_img' src=\"img/fundingMainImg/"+list.fundMainImg+"\" alt='???????????????' id='img' style='margin-left: 15px;'>";
					mainrankHtml += "</div></div>";	
				});
			$("#rankajaxinsert").html(mainrankHtml);
			fundtimer = setTimeout(rank,5000,'FUND');
		},			
		error:function(){
			alert("ajax??????");
		}
		});
	}
}

//?????????
function LikeAjax(data,category,memberId) {
	if(category=='STORE'){
		if(memberId == null || memberId == '' ) {
			 location.href = 'loginForm.do';
		} else if(memberId != null || memberId != '') {
			 $.ajax("storeLikeUpdate.do", {
				type: "post",
				data: JSON.stringify({storeIdx: data, memberId: memberId}), // ??????????????? JSON ????????? ??????
				contentType: "application/json",
				dataType: "json",
				traditional : true, //?????? ?????????
				success: function(data){
					 if(data == 1){
						alert('??? ????????? ?????????????????????!~!' + data);
						$("#heart1").attr('class','fa-solid fa-heart-circle-minus');
					} else{
						alert('??? ???????????? ?????????????????????!~!' + data);
						$("#heart").attr('class','fa-solid fa-heart-circle-plus');
					} 
				},
				error: function(){
					alert("??????~~");
				}
			}); 
		}
	}else if(category=='FUND'){
		if(memberId == null || memberId == '' ) {
		 location.href = 'loginForm.do';
		}else{
		 $.ajax("mainFundLikeAjax.do", {
				type: "post",
				data: {"fundIdx": data, "memberId": memberId}, 
				dataType: "json",
				success: function(data){
					 if(data ==0){
						alert('?????????????????? ??? ????????? ?????????????????????~!');
					} else{
						alert('?????? ?????? ???????????????~! ');
					} 
				},
				error: function(){
					alert("??????~~");
				}
			});
		}
	}
}
</script>

<body onload="javascript:rank('FUND')">
<!-- Header -->
<c:if test="${user.memberId ne ''}">
<%@include file ="/common/Header.jsp" %>
</c:if>
<c:if test="${user.memberId eq ''}">
<%@include file ="/common/Header_N.jsp" %>
</c:if>
<!-- Header -->
<!-- Welcome Slides Area -->
<section class="welcome_area" style="margin: 55px 0;">
<div class="welcome_slides owl-carousel">
	<c:forEach var="blist" items="${banner }">
	<fmt:parseDate value="${blist.fundEndDate }" var="endDate" pattern="yyyy-MM-dd"/>
	<fmt:parseDate value="${blist.fundStartDate }" var="startdate" pattern="yyyy-MM-dd"/>
	<fmt:parseDate value="${blist.fundEndDate }" var="enddate" pattern="yyyy-MM-dd"/>
	<fmt:formatDate value="${startdate}" pattern="yyyy-MM-dd" var="startDate" />
	<fmt:formatDate value="${enddate}" pattern="yyyy-MM-dd" var="endDate" />
		<!-- Single Slide -->
		<a href="productDetailView.do?memberId=${memberId}&fundIdx=${blist.fundIdx}" data-animation="fadeInUp">
			<div class="single_slide bg-img" style="background-image: url(img/fundingMainImg/${blist.fundMainImg}); background-size:cover;">
				<div class="container h-100" >
					<div>
						<p style="animation:shake 2s infinite; font-size: 3.5em; font-family: GangwonEdu_OTFBoldA ">Special Fund</p>
						<h2 data-animation="fadeInUp" data-delay="500ms" style="font-size: 5em;font-weight: 700; text-align: center; color: lavender; font-family: GangwonEdu_OTFBoldA;">${blist.fundTitle }</h2>
					</div>
					<h4 data-animation="fadeInUp" data-delay="700ms" style="color: #dc3545;float: right; font-family: 'GangwonEdu_OTFBoldA'; font-size: xx-large;">${startDate} &nbsp;~&nbsp; ${endDate}</h4>
				</div>
			</div>
		</a>
	</c:forEach>
</div>
</section>
<!-- Welcome Slides Area -->


<!-- Main -->
<!-- ???????????? Area -->
<div class="container">
<section class="sec_pad" style="height: 530px;">
	<div style="width: 750px; display: inline-block; vertical-align: top; padding-right: 30px;">
		<div class="row" style="margin-bottom: 20px;">
			<div class="col-12">
				<div style="display: inline-block;">
					<h3>?????? ?????? ?????? ???????????? 
						<a data-toggle="tooltip" data-placement="top" title="????????? ???????????? ?????? ????????? ???????????????.">
						<span class="fa-regular fa-comment-dots"></span>
						</a>
					</h3>
					<h6>?????? ?????? ????????? ??????</h6>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<c:if test="${empty picklist }">
					<div style="height: 150px; text-align: center;">
						<p style="font-size:2em; margin:50px;">?????? ?????? ????????? ?????? ??? ????????????.</p>
					</div>		
				</c:if>
				<c:if test="${not empty picklist }">
				<!-- Single Product -->
					<c:forEach var="picklist" items="${picklist }">
					<fmt:parseNumber var="targetprice" value="${picklist.fundTargetPrice }"/>
					<fmt:parseNumber var="price" value="${picklist.fundPrice }"/>
					<fmt:parseNumber var="integer" value="${price / targetprice *100 }" integerOnly="true"/>
					<c:set var="targetrate3" value="${integer}"/>
						<div class="single-product-area" id="single_1">
							<div class="product_image" style="height: 60%;">
								<!-- Product Image -->
								<img class="normal_img" src="img/fundingMainImg/${picklist.fundMainImg }" alt="???????????????" style="height: 120px;"> 
								<img class="hover_img" src="img/fundingMainImg/${picklist.fundMainImg }" alt="???????????????" style="height: 120px;">
								<!-- Wishlist -->
								<div class="product_wishlist">
									<a href="javascript:LikeAjax(${picklist.fundIdx },'FUND','${memberId }');"><i class="icofont-heart"></i></a>
								</div>
							</div>
		
							<!-- Product Description -->
							<div style="height: 40%; padding: 10px;" onclick="javascript:location.href='productDetailView.do?memberId=${memberId}&fundIdx=${picklist.fundIdx}';">
								<h6 id="sample">${picklist.fundTitle }</h6>
								<span class="product-price"><fmt:formatNumber value="${targetrate3 }"/>%</span> &nbsp;&nbsp;/&nbsp;&nbsp;
								 <span class="product-price" style="font-size: 0.8em; margin: 0;">${picklist.fundCategory }</span>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
	<div id="ranking_1" style="width: 350px">
		<div class="row">
			<div class="col-12">
				<div>
					<h3>???????????????
						<a data-toggle="tooltip" data-placement="top" title="??????????????? ??????????????? ?????? ???????????? ?????????????????? ???????????????.">
						<span class="fa-regular fa-comment-dots"></span>
						</a>
					</h3>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div>
					<ul class="nav nav-tabs">
					    <li class="nav-item">
					      <a class="nav-link active" data-toggle="tab" onclick="rank('FUND')" style="pointer-events:auto;">Fund</a>
					    </li>
					    <li class="nav-item">
					      <a class="nav-link" data-toggle="tab" onclick="rank('STORE')">Store</a>
					    </li>
					  </ul>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<div id="rankajaxinsert">
				</div>
			</div>
		</div>
	</div>
</section>
</div>
<!-- ???????????? Area End-->
<hr>
<!-- ????????????????????? Area -->
<section class="sec_pad">
<div class="container">
	<div class="row" style="margin-bottom: 20px;">
		<div class="col-12">
			<div>
				<h3>????????? ?????? ??????
						<a data-toggle="tooltip" data-placement="top" title="'?????????'??? ?????? ?????? ????????? ??????????????? ???????????????.">
						<span class="fa-regular fa-comment-dots"></span>
						</a>
				</h3>
				<h6>????????? ????????? ?????? ?????? ?????????</h6>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-12">
			<div class="new_arrivals_slides owl-carousel" style="height: 550px;">
				<!-- Single Product -->
				<c:if test="${empty popularlist }">
					<div style="height: 150px; text-align: center;">
						<p style="font-size:2em; margin:50px;">????????? ??????????????? ?????? ??? ????????????.</p>
					</div>		
				</c:if>
				<c:if test="${not empty popularlist }">
					<c:forEach var="plist" items="${popularlist }">
					<div class="single-product-area" id="single_2" >
						<div class="product_image" style="height: 50%;">
							<!-- Product Image -->
							<img class="normal_img" src="imgs/${plist.storeImg }" alt="???????????????" style="height: 380px;">
							<img class="hover_img" src="imgs/${plist.storeImg }" alt="???????????????" style="height:380px;">
	
							<!-- Wishlist -->
	                       	<c:if test="${fn:contains(bool,plist.storeIdx)}">
	                       		<div class="product_wishlist">
			                 		<a href="javascript:LikeAjax(${plist.storeIdx },'STORE','${memberId }')"><i id="heart" class="fa-solid fa-heart-circle-minus"></i></a>
			         			</div>
	                        </c:if>
	                   		<c:if test="${not fn:contains(bool,plist.storeIdx)}">
	                   			<div class="product_wishlist">
			                 		<a href="javascript:LikeAjax(${plist.storeIdx },'STORE','${memberId }')"><i id="heart1" class="fa-solid fa-heart-circle-plus"></i></a>
			         			</div>
	                   		</c:if>
						</div>
	
						<!-- Product Description -->
						<div class="product_description" style="height: 140px; padding: 20px;'" onclick="javascript:location.href='detail.do?memberId=${memberId}&storeIdx=${plist.storeIdx}';">
							<h6 id="sample">${plist.storeTitle }</h6>
							<p class="product-price"><fmt:formatNumber value="${plist.storePrice }"/>???</p>
							<span class="product-price" style="vertical-align: middle;">
								<img src="img/main/star_point_icon.png" style="width: 20px; display: inline-block;vertical-align: sub;"> &nbsp;${plist.storeReviewScore }
							</span>
						</div>
					</div>
				</c:forEach>
			</c:if>
			</div>
		</div>
	</div>
</div>
</section>
<!-- ????????? ???????????? Area -->
<hr>
<!-- ?????? Area -->
<section class="sec_pad">
<div class="container">
	<div class="row" >
		<div class="col-12">
			<div>
				<h3>??????
					<a data-toggle="tooltip" data-placement="top" title="??????????????? ????????? ??????????????? ?????? ????????? ????????? ???????????????.">
					<span class="fa-regular fa-comment-dots"></span>
					</a>
				</h3>
				<h6>?????? ???????????? ?????????????</h6>
			</div>
		</div>
	</div>
	<div class="row" style="margin-bottom: 20px;">
			<div class="col-12">
				<div>
				  <ul class="nav nav-tabs">
				    <li class="nav-item">
				      <a class="nav-link active" data-toggle="tab" href="#" onclick="feedcategory('FUND');">Fund</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" data-toggle="tab" href="#" onclick="feedcategory('STORE');">Store</a>
				    </li>
				  </ul>
				</div>
			</div>
		</div>
	<div class="shop_list_product_area">
		<div class="row" id="feedajaxinsert">
			<!-- Single Product -->
			<c:forEach var="flist" items="${fundFeed }">
				<div class="col-12" id="single_3" onclick="location.href='productDetailView.do?memberId=${memberId}&fundIdx=${flist.fundIdx }'">
					<div class="single-product-area mb-30" style="height: 270px;">
						<div class="product_image">
							<!-- Product Image -->
							<c:choose>
								<c:when test="${flist.fundReviewImg eq null || flist.fundReviewImg eq '' }">
									<img class="normal_img" src="img/fundingMainImg/${flist.fundMainImg }" alt="???????????????" style="height:270px">
								</c:when>
								<c:otherwise>
									<img class="normal_img" src="img/reviewImg/${flist.fundReviewImg }" alt="????????????" style="height:270px">
								</c:otherwise>
							</c:choose>
						</div>
						<!-- Product Description -->
						<div class="product_description">
							<p class="brand_name">${flist.fundMakerName }</p>
							<p class="review_content">${flist.fundReviewContent }</p><br><br>
							<p class="product-short-desc">${flist. fundTitle}</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<div style="text-align: center;">
		<button type="button" class="btn btn-primary" style="background-color: #00c4c4;" onclick="location.href='feed.do?memberId=${memberId}'">?????? ?????????</button>
	</div>
</div>
</section>
<!-- ?????? Area End -->
<hr>
<c:if test="${memberId ne '' }">
<!-- ????????? ???????????? Area -->
<div class="container">
<section class="sec_pad">
	<div>
		<div class="row" style="margin-bottom: 20px;">
			<div class="col-12">
				<div>
					<h3>${memberId }?????? <span style="color: green">?????????</span> ????????????
						<a data-toggle="tooltip" data-placement="top" title="????????? ????????? ???????????? ????????? ???????????????.">
						<span class="fa-regular fa-comment-dots"></span>
						</a>
					</h3>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12">
				<c:if test="${empty likelist }">
					<div style="height: 150px; text-align: center;">
						<p style="font-size:2em; margin:50px;">????????? ????????? ?????? ????????? ????????????.</p>
					</div>		
				</c:if>
				<c:if test="${not empty likelist }">
					<c:forEach var="llist" items="${likelist }">
					<fmt:parseNumber var="targetprice" value="${llist.fundTargetPrice }"/>
					<fmt:parseNumber var="price" value="${llist.fundPrice }"/>
					<fmt:parseNumber var="integer" value="${price / targetprice *100 }" integerOnly="true"/>
					<c:set var="targetrate4" value="${integer}"/>
						<!-- Single Product -->
						<div class="single-product-area" id="inline_block_2"  style="width: 200px;">
							<div class="product_image" style="height: 120px;">
								<!-- Product Image -->
								<img class="normal_img" src="img/fundingMainImg/${llist.fundMainImg }" alt="???????????????" style="height: 120px;"> 
								<img class="hover_img" src="img/fundingMainImg/${llist.fundMainImg }" alt="???????????????" style="height: 120px;">
	
								<!-- Wishlist -->
								<div class="product_wishlist">
									<a href="javascript:LikeAjax(${llist.fundIdx },'FUND','${memberId }')"><i class="icofont-heart"></i></a>
								</div>
							</div>
	
							<!-- Product Description -->
							<div style="height: 95px; padding: 10px;" onclick="javascript:location.href='productDetailView.do?memberId=${memberId}&fundIdx=${llist.fundIdx}';">
								<h6 id="sample"  style="width: inherit;">${llist.fundTitle }</h6>
								<span class="product-price"><fmt:formatNumber value="${targetrate4 }"/>%</span> &nbsp;&nbsp;/&nbsp;&nbsp; 
								<span class="product-price">${llist.fundCategory }</span>
							</div>
						</div>
					</c:forEach>
				</c:if>		
			</div>
		</div>
	</div>
</section>
</div>
<!-- ????????? ????????? Area End -->
<hr>
</c:if>
<!-- ????????? Area -->
<div class="container">
<section class="sec_pad" style="height: 530px;">
	<div style="width: 50%; vertical-align: top; padding-right: 30px;">
		<div class="row" style="margin-bottom: 20px;">
			<div class="col-12">
				<div>
					<h3>?????????</h3>
				</div>
			</div>
		</div>
	</div>
	<div style="width: 565px; display: inline-block; vertical-align: top; height:440px; padding-right: 30px;">
		<div id="trend">
			<span id="bold"><a data-toggle="tooltip" data-placement="top" title="???????????? ???????????? ?????? ???????????? 3???????????? ????????? ???????????????.">#????????????!! </a></span><span>????????????</span>
		</div>
		<div class="row">
			<div class="col-12">
				<c:if test="${empty expirelist }">
					<div style="height: 150px; text-align: center;">
						<p style="font-size:2em; margin:50px;">???????????? 3???????????? ????????? ????????????.</p>
					</div>		
				</c:if>
				<c:if test="${not empty expirelist }">
					<!-- Single Product -->
					<c:forEach var="elist" items="${expirelist }">
					<jsp:useBean id="now" class="java.util.Date" />
					<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate" />
					<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="nowdate"/>
					<fmt:parseDate value="${elist.fundEndDate }" var="endDate" pattern="yyyy-MM-dd"/>
					<fmt:parseNumber value="${endDate.time / (1000*60*60*24)}" integerOnly="true" var="enddate"/>
					<c:set var="Dday" value="${enddate - nowdate +1 }"/>
					
						<div class="single-product-area" id="single_4">
							<div class="product_image" style="height: 60%;">
								<!-- Product Image -->
								<img class="normal_img" src="img/fundingMainImg/${elist.fundMainImg }" alt="???????????????" style="height: 120px;"> 
								<img class="hover_img" src="img/fundingMainImg/${elist.fundMainImg }" alt="???????????????" style="height: 120px;">
		
								<!-- Wishlist -->
								<div class="product_wishlist">
									<a href="javascript:LikeAjax(${elist.fundIdx },'FUND','${memberId }')"><i class="icofont-heart"></i></a>
								</div>
							</div>
		
							<!-- Product Description -->
							<div style="height: 40%; padding: 10px;" onclick="javascript:location.href='productDetailView.do?memberId=${memberId}&fundIdx=${elist.fundIdx}'">
								<h6 id="sample">${elist.fundTitle }</h6>
								<span class="product-price" id="bling">D - ${Dday }</span> &nbsp;&nbsp;/&nbsp;&nbsp;
								 <span class="product-price" style="font-size: 0.8em; margin: 0;">${elist.fundCategory }</span>
							</div>
						</div>
					</c:forEach>
				</c:if>		
			</div>
		</div>
	</div>
	<div style="width: 520px; float: right; height:440px; ">
		<div id="trend">
			<span>?????? ?????? ???????????? </span><span id="bold"><a data-toggle="tooltip" data-placement="top" title="'?????????'??? ?????? ?????? ??????????????? ???????????????.">#????????? </a></span><span>????????????</span>
		</div>
		<div class="row" id="trend">
			<div class="col-12">
				<c:if test="${empty fundlikelist }">
					<div style="height: 150px; text-align: center;">
						<p style="font-size:2em; margin:50px;">???????????? ?????? ????????? ????????????.</p>
					</div>		
				</c:if>
				<c:if test="${not empty fundlikelist }">
					<c:forEach var="fllist" items="${fundlikelist }" begin="0" end="3">
					<fmt:parseNumber var="targetprice" value="${fllist.fundTargetPrice }"/>
					<fmt:parseNumber var="price" value="${fllist.fundPrice }"/>
					<fmt:parseNumber var="integer" value="${price / targetprice *100 }" integerOnly="true"/>
					<c:set var="targetrate1" value="${integer}"/>
						<!-- Single Product -->
						<div class="single-product-area" id="single_4">
							<div class="product_image" style="height: 60%;">
								<!-- Product Image -->
								<img class="normal_img" src="img/fundingMainImg/${fllist.fundMainImg }" alt="???????????????" style="height: 120px;"> 
								<img class="hover_img" src="img/fundingMainImg/${fllist.fundMainImg }" alt="???????????????" style="height: 120px;">
		
								<!-- Wishlist -->
								<div class="product_wishlist">
									<a href="javascript:LikeAjax(${fllist.fundIdx },'FUND','${memberId }')"><i class="icofont-heart"></i></a>
								</div>
							</div>
		
							<!-- Product Description -->
							<div style="height: 40%; padding: 10px;" onclick="javascript:location.href='productDetailView.do?memberId=${memberId}&fundIdx=${fllist.fundIdx}';">
								<h6 id="sample">${fllist.fundTitle }</h6>
								<span class="product-price"><fmt:formatNumber value="${targetrate1 }"/>%</span>&nbsp;&nbsp;/&nbsp;&nbsp;
								<span class="product-price" style="font-size: 0.8em; margin: 0;">${fllist.fundCategory }</span>
							</div>
						</div>
					</c:forEach>
				</c:if>
			</div>
		</div>
	</div>
</section>
</div>
<!-- ????????? Area End -->
<hr>
<!-- ?????? ?????? Area -->
<section class="sec_pad">
<div class="container">
	<div class="row" style="margin-bottom: 20px;">
		<div class="col-12">
			<div>
				<h3>???????????????! ?????? ????????? ????????????
					<a data-toggle="tooltip" data-placement="top" title="???????????? ???????????? ????????? ???????????????.">
					<span class="fa-regular fa-comment-dots"></span>
					</a>
				</h3>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
			<c:if test="${empty openlist }">
				<div style="height: 150px; text-align: center;">
					<p style="font-size:2em; margin:50px;">?????? ????????? ??????????????? ????????????.</p>
				</div>		
			</c:if>
			<c:if test="${not empty openlist }">
				<c:forEach var="olist" items="${openlist }">
					<fmt:parseNumber var="targetprice" value="${olist.fundTargetPrice }"/>
					<fmt:parseNumber var="price" value="${olist.fundPrice }"/>
					<fmt:parseNumber var="integer" value="${price / targetprice *100 }" integerOnly="true"/>
					<c:set var="targetrate2" value="${integer}"/>
					<!-- Single Product -->
					<div class="single-product-area" id="inline_block_2">
						<div class="product_image" style="height:120px;">
							<!-- Product Image -->
							<img class="normal_img" src="img/fundingMainImg/${olist.fundMainImg }" alt="???????????????" style="height: 120px;"> 
							<img class="hover_img" src="img/fundingMainImg/${olist.fundMainImg }" alt="???????????????" style="height: 120px;">
		
							<!-- Wishlist -->
							<div class="product_wishlist">
								<a href="javascript:LikeAjax(${olist.fundIdx },'FUND','${memberId }')"><i class="icofont-heart"></i></a>
							</div>
						</div>
		
						<!-- Product Description -->
						<div style="height: 80px; padding: 10px;" onclick="javascript:location.href='productDetailView.do?memberId=${memberId}&fundIdx=${olist.fundIdx}';">
							<h6 id="sample">${olist.fundTitle }</h6>
							<span class="product-price"><fmt:formatNumber value="${targetrate2 }"/>%</span> &nbsp;&nbsp;/&nbsp;&nbsp;
							 <span class="product-price" style="font-size: 0.8em; margin: 0;">${olist. fundCategory}</span>
						</div>
					</div>
				</c:forEach>
			</c:if>
		</div>
	</div>
</div>
</section>
<!-- ???????????? Area End -->
<hr>
<!-- ?????? ?????? Area -->
<section class="sec_pad">
<div class="container">
	<div class="row">
		<div class="col-12">
			<div>
				<h3>??????????????? ????????????
					<a data-toggle="tooltip" data-placement="top" title="?????????????????? ?????? ?????? ??????????????? ???????????????.">
					<span class="fa-regular fa-comment-dots"></span>
					</a>
				</h3>
				<h6>???????????? ??????~~</h6>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
		<c:if test="${empty nextdaylist }">
			<div style="height: 150px; text-align: center;">
				<p style="font-size:2em; margin:50px;">?????? ????????? ??????????????? ????????????.</p>
			</div>		
		</c:if>
		<c:if test="${not empty nextdaylist }">
		<c:forEach var="nlist" items="${nextdaylist }">
			<!-- Single Product -->
			<div class="single-product-area" id="inline_block_2">
				<div class="product_image" style="height: 120px;">
					<!-- Product Image -->
					<img class="normal_img" src="img/fundingMainImg/${nlist.fundMainImg }" alt="???????????????" style="height: 120px;"> 
					<img class="hover_img" src="img/fundingMainImg/${nlist.fundMainImg }" alt="???????????????" style="height: 120px;">

					<!-- Wishlist -->
					<div class="product_wishlist">
						<a href="javascript:LikeAjax(${nlist.fundIdx },'FUND','${memberId }')"><i class="icofont-heart"></i></a>
					</div>
				</div>

				<!-- Product Description -->
				<div style="height: 80px; padding: 10px;" onclick="javascript:location.href='productDetailView.do?memberId=${memberId}&fundIdx=${nlist.fundIdx}';">
					<h6 id="sample">${nlist.fundTitle }</h6>
					<span class="product-price">????????????</span> &nbsp;&nbsp;/&nbsp;&nbsp; 
					<span class="product-price" style="font-size: 0.8em; margin: 0;">${nlist.fundCategory }</span>
				</div>
			</div>
			</c:forEach>
			</c:if>
		</div>
	</div>
</div>
</section>
<!-- ???????????? Area End -->
<hr>
<!-- ??????????????? Area -->
<section class="sec_pad_1">
<div class="container">
	<div class="row" style="margin-bottom: 15px;">
		<div class="col-12">
			<div>
			<c:if test="${memberId eq ''}">
				<h3>???????????? ???????????? ?????? ????????? ??????????</h3>
			</c:if>
			<c:if test="${memberId ne ''}">
				<h3>${memberId }?????? ???????????? ?????? ????????? ??????????</h3>
			</c:if>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-12">
				<div class="main_follow_2">
					<div class="blur_content">
						<section class="profile_sec">
							<c:forEach var="list" items="${list }">
									<div class="profile">
										<span class="profile_icon"></span>
										<div class="profile_card">
											<div class="profile_name"><p>${list.memberName }</p></div>
											<div class="profile_follow">
												<span>?????? ?? ?????? ${list.memberFundCnt }</span>
											</div>
										</div>
									</div>	
							</c:forEach>		
						</section>
						<section class="profile_sec">
							<c:forEach var="list" items="${list }">
									<div class="profile">
										<span class="profile_icon"></span>
										<div class="profile_card">
											<div class="profile_name"><p>${list.memberName }</p></div>
											<div class="profile_follow">
												<span>?????? ?? ?????? ${list.memberFundCnt }</span>
											</div>
										</div>
									</div>	
							</c:forEach>		
						</section>
					</div>
					<!-- ???????????? ???????????? ?????? ???????????? ???????????? ?????? ?????? -->
					<c:if test="${memberId ne '' && followfundlist ne null && not empty followfundlist }">
						<div class="follow_content" style="background-color: white;">
							<c:forEach var="flist" items="${followfundlist }" begin="0" end="2">
							<fmt:parseNumber var="targetprice" value="${flist.fundTargetPrice }"/>
							<fmt:parseNumber var="price" value="${flist.fundPrice }"/>
							<fmt:parseNumber var="integer" value="${price / targetprice *100 }" integerOnly="true"/>
							<c:set var="targetrate5" value="${integer}"/>
								<div style="display: inline-block;width: 320px; margin-right: 30px">
									<a href="profile.do?profileId=${flist.memberId }">
										<div>
											<span><strong>${flist.fundMakerName }</strong> ??????<br>?????? ????????? ?????????????????????. </span>
											<span style="font-size: 15px; margin-left: 10px;"><i class="fa-solid fa-right-to-bracket"></i></span>
										</div>
									</a>
										<br>
									<a href="productDetailView.do?memberId=${memberId}&fundIdx=${flist.fundIdx}">
										<div style="width: 310px;height: 70px;">
											<div id="ss" >
												<img class="normal_img" src="img/fundingMainImg/${flist.fundMainImg }" alt="???????????????" style="height: inherit;">									
											</div>
											<div id="aa" >
												<p id="sample" style="margin: 0; width: auto;">${flist.fundTitle }</p>
												<span class="product-price"><fmt:formatNumber value="${targetrate5 }"/>%</span> &nbsp;&nbsp;/&nbsp;&nbsp; 
												<span class="product-price" style="font-size: 0.8em; margin: 0;">${flist.fundCategory }</span>
											</div>
										</div>
									</a>
								</div>
							</c:forEach>		
						</div>
						<div id="follow_content_1">					
							<div class="follow_1">
								<button id="follow_2" onclick="gopage('${user.memberId}', 'follow.do')">????????? ??????</button>
							</div>
						</div>
					</c:if>
					<!-- ?????? ?????? ???????????? ?????? ?????? -->
					<c:if test="${memberId eq '' || followfundlist eq null || empty followfundlist}"> 
						<div class="follow_content">		
							<div id="follow_content_1">					
								<div class="follow_1">
									<p>???????????? ?????? ????????? ??????????????? ??????????????????.<p>
									<c:if test="${memberId ne '' }">
										<button id="follow_2" onclick="gopage('${user.memberId}', 'follow.do')">????????? ??????</button>
									</c:if>
									<c:if test="${memberId eq '' }">
										<button id="follow_2" onclick="location.href='loginForm.do'">????????? ??????</button>
									</c:if>
								</div>
							</div>
						</div>
					</c:if>
				</div>
			</div>		
		</div>
	</div>
</section>
<!-- ??????????????? Area End -->


</body>
<!-- <script src="js/main/main.js"></script> -->
<%@include file="/common/Footer.jsp"%>
</html>
