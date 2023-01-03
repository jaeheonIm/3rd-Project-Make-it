<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="css/style_jy.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="./js/html2canvas.min.js"></script>
<meta charset="UTF-8">
<title>미리보기</title>
<style>
.pjDown {
	float: right;
    border: 1px solid gray;
    outline: none;
    font-size: 12px;
    margin: -7px;
    background: #ffffff;
    color: black;
    padding: 6px;
    border-radius: 6px;
}
</style>
</head>
<body>
	<div id="page-container">
		<div id="mi-header">
			<div class="web-header">
				<section class="PreviewHeader">
					<strong>미리 보기 모드 </strong><span> 저장한 내용을 미리 볼 수 있어요.</span>
					<button class="pjDown" onclick="makeShareImage();">프로젝트 다운로드</button>
				</section>
			</div>
		</div>

		<!-- 시작 -->
		<div id="container" class="wd-layout-sub-content reward is-preview actionbar-hide">
			<!-- S : 캠페인 액션바 -->
			<div class="campaign-action-container">
				<!-- S : 퍼딩하기 액션바 -->
				<div class="funding-action-bar">

					<div id="funding-message-popup" class="wz message-popup"
						style="display: none;">
						<input type="checkbox" id="message-popup-mobile">

						<!-- 프로젝트 유형이 프리오더 프로젝트가 아닌경우: 기존과 동일하게 처리 -->

					</div>

					<button type="button" class="campaign-wish">
						<i class="icon-favorite-o"></i><i class="icon-favorite"></i><span
							class="text-hidden">찜하기</span>
					</button>

				</div>
				<!-- E : 퍼딩하기 액션바 -->
			</div>
			<!-- E : 캠페인 액션바 -->

			<!-- S : 리워드 헤더 -->
			<div class="reward-header">
				<div class="bg"></div>
				<p class="title-info">
					<em>${previewData.fundCategory}</em>
				</p>
				<h2 class="title">
					<a href="/web/campaign/detail/174982">${previewData.fundTitle}</a>
				</h2>
			</div>
			<!-- E : 리워드 헤더 -->

			<!-- S: 리워드 오픈된 프로젝트 새소식 scroll 포커스 위치 -->
			<div id="openRewardNavigationLocation"></div>
			<!-- E: 리워드 오픈된 프로젝트 새소식 scroll 포커스 위치 -->

			<!-- S : 리워드 네비게이션 -->
			<div class="reward-nav">
				<input type="hidden" id="campaignId" value="174982"> <input
					type="hidden" id="campaignTitle" value="프로젝트 제목">
				<ul class="tab-list">
					<li class="active"><a class="tab-link" href="#"
						onclick="campaignDetail('story');">스토리</a></li>
					<li><a class="tab-link" href="#"
						onclick="campaignDetail('fundingInfo');">반환・정책</a></li>
					<li><a class="tab-link disabled"
						href="/web/campaign/detailPost/174982">새소식 </a></li>
					<li><a class="tab-link disabled"
						href="/web/campaign/detail/qa/174982">커뮤니티 </a></li>
					<li><a class="tab-link disabled"
						href="/web/campaign/detailBacker/174982">서포터 </a></li>
				</ul>
			</div>
			<!-- E : 리워드 네비게이션 -->
			<div class="reward-body-wrap">
				<!-- S : 서브 컨텐트 영역 -->
				<div class="wd-ui-sub-contents">
					<!-- S : 페이지 레이아웃 컨테이너 -->
					<div class="wd-ui-info-wrap">
						<!-- S : 우측 캠페인 관련 정보 -->
						<div class="wd-ui-sub-opener-info" style="padding-top: 0;">
							<!-- S : 프로젝트 정보 ******************************************************************* 웹 -->
							<h3 class="text-hidden">프로젝트 정보</h3>
							<div class="project-state-info">
								<div class="state-box">
									<p class="remaining-day">100일 남음</p>
									<p class="rate-bar">
										<em style="width: 33560%"></em>
									</p>
									<p class="achievement-rate" style="margin-bottom: 16px;">
										<strong>0</strong>% 달성
									</p>
									<p class="total-amount" style="margin-bottom: 16px;">
										<strong>0</strong>원 펀딩
									</p>
									<p class="total-supporter" style="margin-bottom: 16px;">
										<strong>0</strong>명의 서포터
									</p>
								</div>


								<div class="btn-wrap share">
									<div class="btn-wrap-flex">
										<button class="campaign-wish btn-wish">
											<i class="fa-regular fa-heart"></i> 0
										</button>
										<button class="campaign-message btn-message">
											<i class="fa-regular fa-comment"></i> 문의
										</button>
										<button id="btnShare" class="campaign-share btn-share"
											onclick="wadiz.share.kakaoSdkInit();">공유하기</button>
									</div>



									<div id="shareSection" class="share-section">
										<ul class="share-list" style="margin-top: 10px">
											<li><button
													class="wz button dense icon-facebook circular"
													onclick="wadiz.share.facebook();" title="페이스북 공유"
													style="width: 36px; padding: 0"></button></li>
											<li><button class="wz button dense icon-kakao circular"
													onclick="wadiz.share.kakao();" title="카카오톡 공유"
													style="width: 36px; padding: 0"></button></li>
											<li><button
													class="wz button dense icon-twitter circular"
													onclick="wadiz.share.twitter();" title="트위터 공유"
													style="width: 36px; padding: 0"></button></li>
											<li><button class="wz button dense icon-link circular"
													onclick="wadiz.share.urlCopy();" title="URL 공유"
													style="width: 36px; padding: 0"></button></li>
											<li><button class="wz button dense icon-code circular"
													onclick="window.open('/web/embed/reward/174982','_blank');"
													title="임베드 공유" style="width: 36px; padding: 0"></button></li>
										</ul>
									</div>
								</div>
								<div class="banner-section-RB2">
									<a
										href="https://www.wadiz.kr/web/wevent/firstfunding?_refer_section_st=RB2_0"
										class="banner-coupon"> </a>
								</div>
							</div>
							<!--E : 프로젝트 정보  -->

							<!-- S : 프로젝트 신고하기 -->

							<!-- E : 프로젝트 신고하기 -->

							<!--S : 네이버페이 혜택  -->
							<div class="naver-pay-benefits">
								<div id="naver-pay-benefits" data-is-donation-category="false"
									data-is-preorder-type="false">
									<div class="NaverPayBenefits_container__oXp3I">
										<div>
											<button type="button"
												class="Tooltip_button__-MP6V NaverPayBenefits_tooltip__89DV7"
												title="결제 시 네이버페이 포인트 1% 적립" aria-describedby="Tooltip_21">
												<span class="Tooltip_label__2V7JK">결제 시 네이버페이 포인트 1%
													적립</span>
											</button>
										</div>
									</div>
								</div>
							</div>
							<!--E : 네이버페이 혜택  -->

							<!--S : 팔로우활동 정보  -->
							<div class="social-info">
								<a href="/web/campaign/detailBacker/174982">
									<figure>
										<div class="profiles">
											<span style="background-image: url()"></span>
										</div>
										<figcaption>
											<p>
												<strong></strong>
											</p>
										</figcaption>
									</figure> <span class="icon-chevron-right"> </span>
								</a>
							</div>
							<!--E : 팔로우활동 정보  -->

							<!-- S : 메이커 정보  -->
							<div class="project-maker-info">
								<h3 class="project-right-title">메이커 정보</h3>
								<div id="funding-maker-info" data-is-preview="true">
									<div class="FundingMakerInfoContainer_container__hy1D5">
										<div class="FundingMakerInfoContainer_header__1pDXk">
											<a class="MakerInfoHeader_link__HmY8C MakerInfoHeader_disabled__11rlW"
												href="">
												<button class="Avatar_avatar__CiRY0 Avatar_xs__1Mz7G MakerInfoHeader_avatar__ltZMd">
													<span style="background-image: url(&quot;img/makerImg/${previewData.fundMakerImg}&quot;);"></span>
												</button>
												<div class="MakerInfoHeader_texts__1vfam">
													<span class="MakerInfoHeader_makerName__KDu0a">${previewData.fundMakerName}</span>
												</div>
											</a>
										</div>


										<div class="MakerInfoStatusSection_container__3YDLU">
											<div
												class="Rating_container__gF5kM MakerInfoStatusSection_status__1uClB">
												<span class="Rating_wrapper__30aE9">
													<img class="Rating_icon__1gh4s"
													src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiAgICA8ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPgogICAgICAgIDxwYXRoIGQ9Ik0wIDBoMTZ2MTZIMHoiLz4KICAgICAgICA8cGF0aCBkPSJNMiAyaDExLjY2N3YxMS42NjdIMnoiLz4KICAgICAgICA8cGF0aCBkPSJNNy44MzMgMTEuODQxIDUuMDU1IDEzLjU2YS43MjEuNzIxIDAgMCAxLS45OTgtLjI0NC43NDUuNzQ1IDAgMCAxLS4wODYtLjU1NGwuNzU1LTMuMjA1LTIuNDcyLTIuMTQzYS43NDEuNzQxIDAgMCAxLS4wOC0xLjAzNi43MjUuNzI1IDAgMCAxIC40OTQtLjI1NGwzLjI0NS0uMjY0IDEuMjUtMy4wNDJhLjcyMy43MjMgMCAwIDEgMS4zNCAwbDEuMjUgMy4wNDJMMTMgNi4xMjNhLjczOC43MzggMCAwIDEgLjQxNCAxLjI5TDEwLjk0IDkuNTU2bC43NTYgMy4yMDVhLjczNi43MzYgMCAwIDEtLjUzOC44ODYuNzIuNzIgMCAwIDEtLjU0Ny0uMDg5bC0yLjc3OC0xLjcxN3oiIGZpbGw9IiMwMEM0QzQiIGZpbGwtcnVsZT0ibm9uemVybyIvPgogICAgPC9nPgo8L3N2Zz4K"
													alt=""><span class="Rating_rating__2L2kG">만족도
														5.0</span><span class="Rating_count__2AQZ-">(0개)</span></span>
											</div>
											<div
												class="FundingAmount_container__3Kfk8 MakerInfoStatusSection_status__1uClB">
												<span class="FundingAmount_wrapper__25T00">
													<img class="FundingAmount_icon__2x1z8"
													src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiAgICA8ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPgogICAgICAgIDxwYXRoIGQ9Ik0wIDBoMTZ2MTZIMHoiLz4KICAgICAgICA8ZyBmaWxsLXJ1bGU9Im5vbnplcm8iPgogICAgICAgICAgICA8cGF0aCBkPSJNOCAxYTcgNyAwIDAgMSAuMjQgMTMuOTk2TDggMTVBNyA3IDAgMCAxIDggMXoiIGZpbGw9IiMwMEM0QzQiLz4KICAgICAgICAgICAgPHBhdGggZD0iTTExLjAyIDUuMjcyYS41NjkuNTY5IDAgMCAxIC4zODUuNjM0bC0uMDIuMDgyLS40MTMgMS4yNjhoLjk2NmMuMzE0IDAgLjU2OC4yNjEuNTY4LjU4NCAwIC4yOTItLjIxLjUzNS0uNDg0LjU3N2wtLjA4NS4wMDZoLTEuMzQ0bC0uNjMgMS45NGMtLjE2LjQ5My0uODI3LjUyMi0xLjA0Ni4wODdsLS4wMzYtLjA4N0w4IDcuNjUybC0uODgxIDIuNzExYy0uMTYuNDkzLS44MjYuNTIyLTEuMDQ2LjA4N2wtLjAzNi0uMDg3LS42MzEtMS45NEg0LjA2M2EuNTc2LjU3NiAwIDAgMS0uNTctLjU4M2MwLS4yOTMuMjExLS41MzYuNDg1LS41NzdsLjA4NC0uMDA3aC45NjVsLS40MTItMS4yNjhhLjU2OS41NjkgMCAwIDEgMS4wNS0uNDNsLjAzMi4wNzkuODggMi43MDkuODgyLTIuNzFjLjE2LS40OTIuODI3LS41MjEgMS4wNDYtLjA4NmwuMDM2LjA4Ny44OCAyLjcxLjg4Mi0yLjcxYS41NjkuNTY5IDAgMCAxIC43MTctLjM2NXoiIGZpbGw9IiNGRkYiLz4KICAgICAgICA8L2c+CiAgICA8L2c+Cjwvc3ZnPgo="
													alt="">누적 펀딩액 0원+</span>
											</div>
											<div
												class="SupporterCount_container__p3Uui MakerInfoStatusSection_status__1uClB">
												<span class="SupporterCount_wrapper__3Qdya">
													<img class="SupporterCount_icon__KjJI5"
													src="data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTYiIGhlaWdodD0iMTYiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CiAgICA8ZyBmaWxsPSJub25lIiBmaWxsLXJ1bGU9ImV2ZW5vZGQiPgogICAgICAgIDxnIGZpbGw9IiMwMEM0QzQiIGZpbGwtcnVsZT0ibm9uemVybyI+CiAgICAgICAgICAgIDxwYXRoIGQ9Ik04IDhjLTEuNjUzLS4wMS0zLTEuMy0zLTMuMDQyQzUgMy4zNDMgNi4zNDcgMiA4IDJzMyAxLjM0MyAzIDIuOTU4QzExIDYuNjk5IDkuNjUzIDguMDEgOCA4ek0xMy4zMTIgMTRIMi42ODhDMi4yMTQgMTQgMiAxMy42OTggMiAxMy4yNzQgMiAxMi4wMjMgMy45MTcgOC43NSA4IDguNzVzNiAzLjI3MyA2IDQuNTI0YzAgLjQyNC0uMjE0LjcyNi0uNjg4LjcyNnoiLz4KICAgICAgICA8L2c+CiAgICAgICAgPHBhdGggZD0iTTAgMGgxNnYxNkgweiIvPgogICAgPC9nPgo8L3N2Zz4K"
													alt="">서포터 0명</span>
											</div>

										</div>

										<div class="MakerInfoButtonSection_container__1kr0h">
											<button class="Button_button__NY-pS Button_secondary__1LwxB Button_md__23rz_ MakerInfoButtonSection_button__35bCE"
												type="button">
												<span><span class="Button_children__zgA2f"><span
														class="MakerInfoButtonSection_buttonContent__I2Heu">
															<svg viewBox="0 0 40 40" focusable="false"
																role="presentation" class="withIcon_icon__2cPeY"
																aria-hidden="true">
																<path fill="none" d="M0 0h40v40H0z"></path>
																<path d="M10.62 38.33V29H2.87V1.67h34.26v27.79H18.92zM5 27h7.7v6.11l5.3-5.73h17V3.75H5z"></path>
																<path d="M12.84 13.28a1.87 1.87 0 100 3.74 1.87 1.87 0 100-3.74zm7.16 0a1.87 1.87 0 100 3.74 1.87 1.87 0 100-3.74zm7.16 0a1.87 1.87 0 100 3.74 1.87 1.87 0 100-3.74z"></path></svg>문의하기
													</span></span></span>
											</button>
											<button class="Button_button__NY-pS Button_primary__32BXt Button_contained__d7J6h Button_md__23rz_ Button_startIcon__2jCAd FollowingButton_followingButton__1JTPx MakerInfoButtonSection_button__35bCE MakerInfoButtonSection_followingButton__2kWXP"
												type="button">
												<span><svg viewBox="0 0 32 32" focusable="false"
														role="presentation"
														class="withIcon_icon__2cPeY Button_icon__AUViJ FollowingButton_icon__3svX6"
														aria-hidden="true" style="width: 12px; height: 12px;">
														<path d="M30.4 15.2H16.8V1.6h-1.6v13.6H1.6v1.6h13.6v13.6h1.6V16.8h13.6v-1.6z"></path></svg><span class="Button_children__zgA2f">팔로우</span></span>
											</button>
										</div>
									</div>
								</div>
							</div>
							<!-- E : 메이커 정보  -->

							<!-- S : 보상품 목록, 참여할 때 드리는 선물  -->
							<div id="campaign-rewards" style="position: relative; top: -50px"></div>
							<div class="moveRewards">

								<div class="wd-ui-gift">
									<h3 class="project-right-title">옵션 선택</h3>

								<button class="rightinfo-reward-list2" style="border-bottom-color: #00c4c4; border-right-color: #00c4c4; display:none;">
										<div class="top-info">
											<dl class="reward-info">
												<dt id="fund_option_price">10,000원 펀딩</dt>
												<dd>
													<p class="reward-name" id="fund_option_title">세트1</p>
													<p id="fund_option_content">스킨1+로션1</p>
												</dd>
											</dl>

											<ul class="data-info">
												<li class="shipping" id="fund_option_delivery" style="width: 100%; margin-bottom: 18px;">배송비 : 3,000원
												</li>
											</ul>
											<p class="reward-soldcount">
												총 <strong>0</strong>개 펀딩완료
											</p>
										</div>
									</button>

								</div>
							</div>
							<!-- E : 보상품 목록, 참여할 때 드리는 선물 -->
						</div>
						
						<!-- S : 캠페인 정보 -->
						<div class="wd-ui-sub-campaign-info-container">
							<div class="wd-ui-sub-campaign-info">
								<!-- S : 탭 주요 콘텐츠 -->
								<div class="wd-ui-tab-contents">

									<section class="wd-ui-tab-contents">
										<h3 class="text-hidden">프로젝트 스토리</h3>
										<div class="view-slide-wrap" style="padding: 0">
											<ul class="view-slide-big image-slide slick-initialized slick-slider">

												<div aria-live="polite" class="slick-list draggable" style="height: 401px;">
													<div class="slick-track" style="opacity: 1; width: 632px; transform: translate3d(0px, 0px, 0px);"
														role="listbox">
														<li class="slick-slide slick-current slick-active" data-slick-index="0" aria-hidden="false" style="width: 632px; padding-top: 30px;" tabindex="-1" role="option" aria-describedby="slick-slide00">
															<!-- 메인이미지 -->
															<%-- <h3>${previewData}</h3> --%>
															<div class="img-responsive" style="background: url(img/fundingMainImg/${previewData.fundMainImg}); background-size: cover; background-position: center 0; width: 100%; height: 0; padding-bottom: 63.49%;"></div>
															<%-- <div class="img-responsive"> <img style="width:633px;" src="img/fundingMainImg/${previewData}.fundMainImg"> </div> --%>
														</li>
													</div>
												</div>
												
												
											</ul>
										</div>
									
										<br>

										<div>
											<div style="padding: 16px; background: rgba(0, 196, 196, 0.1); border-radius: 8px; width: 633px; margin-top: 21px;">
												<p style="color: #00b2b2; font-size: 13px; line-height: 20px; margin-bottom: 6px;">
													<strong>목표 금액</strong> <span id ="fundTargetPrice">${previewData.fundTargetPrice}원</span><br> 
													<strong>펀딩기간</strong> <span>${previewData.fundStartDate}~${previewData.fundEndDate}</span>
													<br>
												</p>
												<p style="color: #60656a; font-size: 12px; line-height: 18px;">
													100% 이상 모이면 펀딩이 성공되며, 펀딩 마감일까지 목표 금액이 100% 모이지 않으면 결제가 진행되지 않습니다.
												</p>
											</div>
										</div>

										<!-- S: 프로젝트 내용 -->
										<div class="NewsStoryUpList_newsStoryUpListContainer__befQF"></div>

										<div id="introdetails" style="height: auto;" class="story">
											<strong class="title">프로젝트 스토리</strong>

										</div>
										
										<!-- S : 상세 이미지 스토리 이미지-->
										<div class="inner-contents fr-view" id="here" style="width:633px;">
											<p>
												<br>
											</p>
											<!-- <p><img class="fr-fic fr-dib lazyloaded" style="width:633px;" src="img/fundingStoryImg/1_Story_story1.jpg"> </p>-->
											
											
											
											</div>
											</section>
											</div>
											</div>
											</div>
											</div>
											</div>
											
										</div>
										<!-- E : 상세 이미지 스토리 이미지-->
									
										
										
										
								</div>
							<!-- E: 프로젝트 내용 -->
</div>

						
							
							<!-- 맨끝 -->
</body>
<script>
//상세이미지 넣기
var content_files = new Array();
$(function() {
    if ('${previewData.fundDetailImg}' != null) {
    	var arr = [];
    	arr = '${previewData.fundDetailImg}'.split(";");
    	
    	var tagText = "";
    	
    	if( arr.length != 0) {
    		for(var i = 0; i < arr.length-1; i++) {
    			var tagValue = arr[i];
    			$('#here').append('<p><img class=\"fr-fic fr-dib lazyloaded\" style=\"width:633px;\"src=\"img/fundingStoryImg/' + tagValue + '\"></p>');
    		}
    	}
    }
});

</script>
<script>
//옵션 넣기
$(function() {

	<c:forEach var="getSaveOptionData" items="${previewOptionData}">
	
		var resObj = new Object();
		var cnt = 0;
		
		var fundOptionPrice1 = '${getSaveOptionData.fundOptionPrice}';
		var fundOptionDelivery1 = '${getSaveOptionData.fundOptionDelivery}';
		
		//천단위 콤마
		opPriceResult = fundOptionPrice1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		opDeliveryResult = fundOptionDelivery1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		
	  	resObj.fundOptionPrice = opPriceResult;
	 	resObj.fundOptionTitle = '${getSaveOptionData.fundOptionTitle}';
		resObj.fundOptionContent = '${getSaveOptionData.fundOptionContent}';
		resObj.fundOptionDelivery = opDeliveryResult;
		
		
		$("#fund_option_price").html(resObj.fundOptionPrice + "원");   
		$("#fund_option_title").html(resObj.fundOptionTitle);   
		$("#fund_option_content").html(resObj.fundOptionContent);   
		$("#fund_option_delivery").html("배송비 : " + resObj.fundOptionDelivery + "원"); 
		
		var cloneElements = $('.rightinfo-reward-list2').clone();
		cloneElements.attr("class", "rightinfo-reward-list");	
		cloneElements.attr("style","border-bottom-color: #00c4c4; border-right-color: #00c4c4; display :;");
		
		
		$(".wd-ui-gift").append(cloneElements);
	</c:forEach>
});
</script>
<script>
$(function() {
	//천단위 콤마
	const fundTargetPrice = '${previewData.fundTargetPrice}';
	let priceResult = fundTargetPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	$('#fundTargetPrice').text(priceResult+"원");
	
	//남은 날짜 계산
	const TIME_ZONE = 3240 * 10000;

	var today = new Date(+new Date() + TIME_ZONE).toISOString().split('T')[0];
	
	var endDate = '${previewData.fundEndDate}';
	var arr1 = today.split('-');
	var arr2 = endDate.split('-');
	var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
	var dat2 = new Date(arr2[0], arr2[1], arr2[2]);
	
	var diff = dat2 - dat1;
	var currDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
	var currMonth = currDay * 30;// 월 만듬
	var currYear = currMonth * 12; // 년 만듬
	
	//console.log("* 일수 차이 : " + parseInt(diff/currDay) + " 일<br/>");
	$(".remaining-day").html(parseInt(diff/currDay) + "일 남음");
});
</script>
<script>
//프로젝트 다운로드 버튼 클릭시 화면캡쳐 캡처
function makeShareImage(){
	 html2canvas(document.getElementById("page-container")).then(function(canvas) {
         var el = document.createElement("a")
         el.href = canvas.toDataURL("image/jpeg")
         el.download = '메이크잇_프로젝트_미리보기.jpg' //다운로드 할 파일명 설정
         el.click()
	 })
}
</script>

</html>