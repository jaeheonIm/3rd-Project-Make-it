<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
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
<title>feed</title>

<!-- Favicon  -->
<link rel="icon" href="img/core-img/favicon.ico">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- Style CSS -->
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="css/main/main.css">
<style>
.review_content{
    overflow: hidden;
    -webkit-line-clamp: 3;
    margin-top: 40px;
    margin-bottom: 1em;
}
.review_content_open{
	line-height: 20px;
    letter-spacing: 0;
    font-size: 14px;
    font-weight: 400;
    font-style: normal;
    overflow-wrap: break-word;
    color: #212529;
	max-height: 100%;
	max-width: 554px;
	display: flex;
	margin-top: 40px;
    margin-bottom: 1em;
}
#follownone{
    border: 1px solid #00c4c4;
    padding: 9px 16px;
    border-radius: 4px;
    color: white;
    width: 90px;
    background-color: #00c4c4;
    font-weight: bold;
    outline-style: none;
}
#follow{
   	border: none;
    padding: 9px 16px;
    border-radius: 4px;
    color: #00c4c4;
    width: 90px;
    font-weight: normal;
}
</style>
</head>
<script>
/*리뷰글 더보기 버튼 */
function more(num) {
	$("#content"+num).attr("class","review_content_open");
	$("#more"+num).remove();
}

/*팔로우 버튼 */
function follow(memberid,index) {
	if("${memberId}"==null||"${memberId}"==''){
		location.href="loginForm.do";
	}else{
		$.ajax("mainfollow.do",{
			type:"post",
			data:{"followmemberId":memberid},
			dataType:"json",
			success:function(data){
			let followhtml="";
			if(data>0){
				alert("팔로우가 취소되었습니다.");
				$("."+index).attr('id','follownone');
				$("#followicon"+index).remove();
				$("."+index).text('+ 팔로우');
			}else{
				alert("팔로우가 추가되었습니다.");
				$("."+index).attr('id','follow');
				$("."+index).html("<i class='fa-solid fa-check' id=\"followicon"+index+"\"></i> 팔로잉");
			}
		},			
		error:function(){
			alert("ajax실패");
		}
		});
	}
}

/*페이지 처리 및 항목이동*/
var page = 1;
var loading = false;
var category = "${category}";
var addnum = 5;
var endnum = 5;
var StoreEndNum = 5;
var FundEndNum = 5;
$(function(){
	$(window).scroll(function(){
		let $window = $(this);
		let scrollTop = $window.scrollTop();
		let windowHeight = $window.height();
		let documentHeight = $(document).height();

		if(scrollTop + windowHeight +100> documentHeight){
			if (!loading){
				loading = true;
				Feedlist(category);				
			}			
		}
	})
})
function Feedlist(cate) {
	console.log("category2131313132:"+cate);
	$.ajax("ajaxFundFeed.do",{
		type:"post",
		data : {"page":page,"category":cate},
		dataType:"json",
		success:function(data){
			var feedScrollHtml="";
			var flist = data.list;
			var mlist = data.memberlist;
			var followinglist = data.followinglist;
			if(data.category == 'FUND'){
				StoreEndNum=5;
				if($("#store").prop("disabled")==true){
					  $("#store").attr("disabled", false);
					  $("#fund").attr("disabled", true);
				}
				console.log("fundEndNum:"+FundEndNum);
				for(var i=0; i<FundEndNum; i++){
					if(flist.length> FundEndNum || flist[i]!=undefined){
						var reviewdate = flist[i].fundReviewRegdate;
						var startdate = flist[i].fundStartDate.substr(0,10);
						var enddate = flist[i].fundEndDate.substr(0,10);
						var price = parseInt(flist[i].fundPrice);
						var targetprice = parseInt(flist[i].fundTargetPrice);
						var targetrate = Math.floor(price / targetprice *100);
						feedScrollHtml +="<section class='profile_sec'><a href=\"profile.do?profileId="+mlist[i].memberId+"\">";
						feedScrollHtml +="<div class='profile'>";
						if(mlist[i].memberPicture == null ||mlist[i].memberPicture == ''){
							feedScrollHtml +="<span class='profile_icon' style=\"background-image: url(img/main/profile-icon-5.png)\"></span>";					
						}else{
							feedScrollHtml +="<span class='profile_icon' style=\"background-image: url(img/user-img/"+mlist[i].memberPicture+")\"></span>";			
						}
						feedScrollHtml +="<div class='profile_card'>";
						feedScrollHtml +="<div class='profile_name'><p>"+mlist[i].memberNickname+"</p></div>";
						feedScrollHtml +="<div class='profile_follow'><div>팔로워 <span>"+mlist[i].followCnt+"</span></div>";
						feedScrollHtml +="</div></div></div></a>";
						feedScrollHtml +="<div class='follow_btn' id='ajaxinsert'>";
						if("${memberId}"!= mlist[i].memberId){
							if(followinglist.includes(mlist[i].memberId)){
								feedScrollHtml +="<button id='follow' class=\""+i+"\" onclick=\"follow('"+mlist[i].memberId+"',"+i+")\"><i class='fa-solid fa-check' id=\"followicon"+i+"\"></i> 팔로잉</button>";	
							}else{
								feedScrollHtml +="<button id='follownone' class=\""+i+"\" onclick=\"follow('"+mlist[i].memberId+"',"+i+")\">+ 팔로우</button>";
							}
						}
						feedScrollHtml +="</div></section>";
						feedScrollHtml +="<section class='review'>";
						if(flist[i].fundReviewImg != null && flist[i].fundReviewImg != ''){
							feedScrollHtml +="<p class='review_photo'><img alt='리뷰이미지'  src=\"img/reviewImg/"+flist[i].fundReviewImg+"\"  style='width: 800px;height: 400px;'></p>";					
						}
						feedScrollHtml +="<p class='review_content' id=\"content"+i+"\">"+flist[i].fundReviewContent+"</p>";
						if(flist[i].fundReviewContent.length>121){
							feedScrollHtml +="<p class='review_more' id=\"more"+i+"\" onclick=\"more("+i+")\">더보기</p>";
						}
						feedScrollHtml +="<span class='review_date'>"+reviewdate +"</span></section>";
						feedScrollHtml +="<a href=\"productDetailView.do?memberId=${memberId}"+"&fundIdx="+flist[i].fundIdx+"\" class='product'>";
						feedScrollHtml +="<div class='product_photo'>";
						feedScrollHtml +="<div style=\"background-image: url(img/fundingMainImg/"+flist[i].fundMainImg+"); background-size: cover;\"></div>";
						feedScrollHtml +="</div>";
						feedScrollHtml +="<div class='product_content' style='width: 400px;'>";
						feedScrollHtml +="<p class='content1' style='color: black;'>"+flist[i].fundTitle+"</p>";
						feedScrollHtml +="<div class='content2'><div style='width: 380px;'>";
						feedScrollHtml +="<span>"+startdate+" &nbsp;~&nbsp; "+enddate+"</span>";
						feedScrollHtml +="<span style='float: right;'>"+targetrate+"% 달성</span>";
						feedScrollHtml +="</div></div></div></a><div><hr></div>";
					}else{
						console.log("여기요111");
						StoreEndNum=5;
						break;
					}
				}
				$("#feedajaxinsert").html(feedScrollHtml);
				FundEndNum +=addnum;
				page++;
				category = cate;
				loading = false;
				}else if(data.category == "STORE"){	
					FundEndNum = 5;
					console.log("StoreEndNum:"+StoreEndNum);
					if($("#fund").prop("disabled")==true){
						  $("#fund").attr("disabled", false);
						  $("#store").attr("disabled", true);
						}
					for(var i=0; i<StoreEndNum; i++){
						if(flist.length> StoreEndNum || flist[i]!=undefined){
							var reviewdate = flist[i].storeReviewRegdate;
							var storeDate = flist[i].storeDate;
							var Date = storeDate.substr(0,10);
							var price = parseInt(flist[i].storePrice);
							feedScrollHtml +="<section class='profile_sec'><a href=\"profile.do?profileId="+mlist[i].memberId+"\">";
							feedScrollHtml +="<div class='profile'>";
							if(mlist[i].memberPicture == null ||mlist[i].memberPicture == ''){
								feedScrollHtml +="<span class='profile_icon' style=\"background-image: url(img/main/profile-icon-5.png)\"></span>";					
							}else{
								feedScrollHtml +="<span class='profile_icon' style=\"background-image: url(img/user-img/"+mlist[i].memberPicture+")\"></span>";			
							}
							feedScrollHtml +="<div class='profile_card'>";
							feedScrollHtml +="<div class='profile_name'><p>"+mlist[i].memberNickname+"</p></div>";
							feedScrollHtml +="<div class='profile_follow'><div>팔로워 <span>"+mlist[i].followCnt+"</span></div>";
							feedScrollHtml +="</div></div></div></a>";
							feedScrollHtml +="<div class='follow_btn' id='ajaxinsert'>";
							if("${memberId}"!= mlist[i].memberId){
								if(followinglist.includes(mlist[i].memberId)){
									feedScrollHtml +="<button id='follow' class=\""+i+"\" onclick=\"follow('"+mlist[i].memberId+"',"+i+")\"><i class='fa-solid fa-check' id=\"followicon"+i+"\"></i> 팔로잉</button>";	
								}else{
									feedScrollHtml +="<button id='follownone' class=\""+i+"\" onclick=\"follow('"+mlist[i].memberId+"',"+i+")\">+ 팔로우</button>";
								}
							}
							feedScrollHtml +="</div></section>";
							feedScrollHtml +="<section class='review'>";
							if(flist[i].storeReviewImg != null && flist[i].storeReviewImg != ''){
								feedScrollHtml +="<p class='review_photo'><img alt='리뷰이미지' src='img/store-img/"+flist[i].storeReviewImg+"' style='width: 800px;height: 400px;'></p>";					
							}
							feedScrollHtml +="<p class='review_content' id=\"content"+i+"\">"+flist[i].storeReviewContent+"</p>";
							if(flist[i].storeReviewContent.length>121){
								feedScrollHtml +="<p class='review_more' id=\"more"+i+"\" onclick=\"more("+i+")\">더보기</p>";
							}
							feedScrollHtml +="<span class='review_date'>"+reviewdate +"</span></section>";
							feedScrollHtml +="<a href=\"detail.do?memberId=${memberId}"+"&storeIdx="+flist[i].storeIdx+"\" class='product'>";
							feedScrollHtml +="<div class='product_photo'>";
							feedScrollHtml +="<div style=\"background-image: url(imgs/"+flist[i].storeImg+"); background-size: cover;\"></div>";
							feedScrollHtml +="</div>";
							feedScrollHtml +="<div class='product_content' style='width: 400px;'>";
							feedScrollHtml +="<p class='content1' style='color: black;'>"+flist[i].storeTitle+"</p>";
							feedScrollHtml +="<div class='content2'><div style='width: 380px;'>";
							feedScrollHtml +="<span>"+Date+"</span>";
							feedScrollHtml +="<span style='float: right;'><img src='img/main/star_point_icon.png' style='width: 20px;  display: inline-block;vertical-align: sub;'> &nbsp;"+flist[i].storeReviewScore+"</span>";
							feedScrollHtml +="</div></div></div></a><div><hr></div>";
						}else{
							console.log("여기요22");
							FundEndNum = 5;
							break;
						}
					}
					$("#feedajaxinsert").html(feedScrollHtml);
					page++;
					StoreEndNum += addnum;
					category = cate;
					loading = false;
			}	else if(data.category == ''){
					console.log("endnum:"+endnum);
					for(var i=0; i<endnum; i++){
						if(flist.length> endnum || flist[i]!=undefined){							
							var reviewdate = flist[i].fundReviewRegdate;
							var startdate = flist[i].fundStartDate.substr(0,10);
							var enddate = flist[i].fundEndDate.substr(0,10);
							var price = parseInt(flist[i].fundPrice);
							var targetprice = parseInt(flist[i].fundTargetPrice);
							var targetrate = Math.floor(price / targetprice *100);
							feedScrollHtml +="<section class='profile_sec'><a href=\"profile.do?profileId="+mlist[i].memberId+"\">";
							feedScrollHtml +="<div class='profile'>";
							if(mlist[i].memberPicture == null ||mlist[i].memberPicture == ''){
								feedScrollHtml +="<span class='profile_icon' style=\"background-image: url(img/main/profile-icon-5.png)\"></span>";					
							}else{
								feedScrollHtml +="<span class='profile_icon' style=\"background-image: url(img/user-img/"+mlist[i].memberPicture+")\"></span>";			
							}
							feedScrollHtml +="<div class='profile_card'>";
							feedScrollHtml +="<div class='profile_name'><p>"+mlist[i].memberNickname+"</p></div>";
							feedScrollHtml +="<div class='profile_follow'><div>팔로워 <span>"+mlist[i].followCnt+"</span></div>";
							feedScrollHtml +="</div></div></div></a>";
							feedScrollHtml +="<div class='follow_btn' id='ajaxinsert'>";
							if("${memberId}"!= mlist[i].memberId){
								if(followinglist.includes(mlist[i].memberId)){
									feedScrollHtml +="<button id='follow' class=\""+i+"\" onclick=\"follow('"+mlist[i].memberId+"',"+i+")\"><i class='fa-solid fa-check' id=\"followicon"+i+"\"></i> 팔로잉</button>";	
								}else{
									feedScrollHtml +="<button id='follownone' class=\""+i+"\" onclick=\"follow('"+mlist[i].memberId+"',"+i+")\">+ 팔로우</button>";
								}
							}
							feedScrollHtml +="</div></section>";
							feedScrollHtml +="<section class='review'>";
							if(flist[i].fundReviewImg != null && flist[i].fundReviewImg != ''){
								feedScrollHtml +="<p class='review_photo'><img alt='리뷰이미지' src=\"img/reviewImg/"+flist[i].fundReviewImg+"\" style='width: 800px;height: 400px;'></p>";					
							}
							feedScrollHtml +="<p class='review_content' id=\"content"+i+"\">"+flist[i].fundReviewContent+"</p>";
							if(flist[i].fundReviewContent.length>121){
								feedScrollHtml +="<p class='review_more' id=\"more"+i+"\" onclick=\"more("+i+")\">더보기</p>";
							}
							feedScrollHtml +="<span class='review_date'>"+reviewdate +"</span></section>";
							feedScrollHtml +="<a href=\"productDetailView.do?memberId=${memberId}"+"&fundIdx="+flist[i].fundIdx+"\" class='product'>";
							feedScrollHtml +="<div class='product_photo'>";
							feedScrollHtml +="<div style=\"background-image: url(img/fundingMainImg/"+flist[i].fundMainImg+"); background-size: cover;\"></div>";
							feedScrollHtml +="</div>";
							feedScrollHtml +="<div class='product_content' style='width: 400px;'>";
							feedScrollHtml +="<p class='content1' style='color: black;'>"+flist[i].fundTitle+"</p>";
							feedScrollHtml +="<div class='content2'><div style='width: 380px;'>";
							feedScrollHtml +="<span>"+startdate+" &nbsp;~&nbsp; "+enddate+"</span>";
							feedScrollHtml +="<span style='float: right;'>"+targetrate+"% 달성</span>";
							feedScrollHtml +="</div></div></div></a><div><hr></div>";
						}else{
							console.log("여기요33");
							break;
						}
					}
					$("#feedajaxinsert").html(feedScrollHtml);
					endnum +=addnum;
					page++;
					category = cate;
					loading = false;
				}
	},			
	error:function(){
		alert("ajax실패");
	}
	});
}
</script>
<body>
<!-- Header -->
<c:if test="${memberId ne ''}">
<%@include file ="/common/Header.jsp" %>
</c:if>
<c:if test="${memberId eq '' }">
<%@include file ="/common/Header_N.jsp" %>
</c:if>
<!-- Header -->
<div class="mainWrapper">
	<div>
		<div>
		<hr style="margin: 0;">
			<div class="category" style="justify-content: space-between;">
				<div class="category_button" >
					<button id="fund" class="btn btn-light" onclick="Feedlist('FUND')" disabled><span>펀딩</span></button>
				</div>
				<div class="category_button" >
					<button id="store" class="btn btn-light" onclick="Feedlist('STORE')" ><span>스토어</span></button>
				</div>
			</div>
		</div>
		<div class="content" id="feedajaxinsert">
			<c:forEach begin="0" end="4" varStatus="status">
			<c:set var="i" value="${status.index}" />
					<section class="profile_sec">
						<a href="profile.do?profileId=${mlist[i].memberId }&memberId=${memberId}">
							<div class="profile">
								<c:choose>
								<c:when test="${mlist[i].memberPicture eq '' || mlist[i].memberPicture eq null }">
									<span class="profile_icon" style="background-image: url(img/main/profile-icon-5.png)"></span>						
								</c:when>
								<c:otherwise>
									<span class="profile_icon" style="background-image: url(img/user-img/${mlist[i].memberPicture})"></span>
								</c:otherwise>
							</c:choose>
								<div class="profile_card">
									<div class="profile_name"><p>${mlist[i].memberNickname }</p></div>
									<!-- 팔로워인경우 -->
									<div class="profile_follow">
										<div>팔로워 <span>${mlist[i].followCnt }</span></div>
									</div>
								</div>
							</div>
						</a>
						<div class="follow_btn" id="ajaxinsert">
								<c:if test="${memberId ne mlist[i].memberId }">
									<c:choose>
										<c:when test="${fn:contains(followinglist, mlist[i].memberId)}">
											<button id="follow" class="${i }" onclick="follow('${mlist[i].memberId}',${i })"><i class="fa-solid fa-check" id="followicon${i }"></i> 팔로잉</button>
										</c:when>
										<c:otherwise>
											<button id="follownone" class="${i }" onclick="follow('${mlist[i].memberId}',${i })">+ 팔로우</button>
										</c:otherwise>
									</c:choose>
								</c:if>
							</div>
					</section>

					<section class="review">
					<!-- 사진이 있을 경우 -->
					<c:if test="${flist[i].fundReviewImg ne '' && not empty flist[i].fundReviewImg}">				
						<p class="review_photo"><img alt="리뷰이미지" src="img/reviewImg/${flist[i].fundReviewImg }" style='width: 800px;height: 400px;'></p>						
					</c:if>
					<p class="review_content" id="content${i }">${flist[i].fundReviewContent }</p>
					<c:if test="${fn:length(flist[i].fundReviewContent ) > 121}">					
						<p class="review_more" id="more${i }" onclick="more(${i})">더보기</p>	
					</c:if>
					<fmt:parseDate value="${flist[i].fundReviewRegdate }" var="regdate" pattern="yyyy-MM-dd"/>
					<fmt:formatDate value="${regdate}" pattern="yyyy-MM-dd" var="reviewDate" />			
					<span class="review_date">${reviewDate }</span>
					</section>
					<a href="productDetailView.do?memberId=${memberId}&fundIdx=${flist[i].fundIdx}" class="product">
						<div class="product_photo">
							<div style="background-image: url(img/fundingMainImg/${flist[i].fundMainImg}); background-size: cover;"></div>
						</div>
						<div class="product_content" style="width: 400px;">
							<p class="content1" style="color: black;">${flist[i].fundTitle }</p>
							<div class="content2">
								<div style="width: 380px;">
									<fmt:parseNumber var="targetprice" value="${flist[i].fundTargetPrice }"/>
									<fmt:parseNumber var="price" value="${flist[i].fundPrice }"/>
									<fmt:parseNumber var="integer" value="${price / targetprice *100 }" integerOnly="true"/>
									<c:set var="targetrate" value="${integer}"/>
									<fmt:parseDate value="${flist[i].fundStartDate }" var="startdate" pattern="yyyy-MM-dd"/>
									<fmt:parseDate value="${flist[i].fundEndDate }" var="enddate" pattern="yyyy-MM-dd"/>
									<fmt:formatDate value="${startdate}" pattern="yyyy-MM-dd" var="startDate" />
									<fmt:formatDate value="${enddate}" pattern="yyyy-MM-dd" var="endDate" />
									<span>${startDate} &nbsp;~&nbsp; ${endDate}</span>
									<span style="float: right;">${targetrate}% 달성</span>
								</div>
							</div>
						</div>
					</a>
					<div><hr></div>
			</c:forEach>
		</div>
	</div>
</div>

</body>
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
</html>