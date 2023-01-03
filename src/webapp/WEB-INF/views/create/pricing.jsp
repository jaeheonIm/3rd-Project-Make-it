<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!-- <link rel="shortcut icon" href="#"> -->
<%@include file="/common/Header_jy.jsp"%>
<body>
	<div class="wrapper d-flex align-items-stretch">
		<%@include file="/common/Nav.jsp"%>
		<div id="content" class="p-4 p-md-5">
			<%@include file="/common/TopButton.jsp"%>
			<!-- content start -->
			<form action="*" method="post">
				<div>
					<label class="mi label dropdown_label">
						<div class="tooltopmobile_tooltip">
							<div class="tooltipmobile_label">
								<h2 class="fundingFromContainer_title">요금제 선택</h2>
							</div>
							<p style="margin-bottom:10px;">원하는 요금제를 선택해 주세요.</p>

							<div>
								<ul>
									<li class="FundingPricingList">
										<article class="FundingPricing" data-type="light">

											<div class="FundingPricing_header">
												<h1>Light <small>(라이트)</small>
													<div style="float: right;">
														<button class="Button_button__1e2A2 Button_primary__PxOJr Button_lg__3vRQD Button_block__2mEqp"
															id="b1" type="button">
															<span><span class="Button_children__q9VCZ">이걸로 할게요</span></span>
														</button>
													</div>
												</h1>
												<div class="FundingPricing_fee">
													<span>수수료 </span><strong>5% </strong><small>(VAT 별도)</small>
												</div>
											</div>


											<div class="FundingPricing_body">

												<div class="FundingPricing_body_container">
													<p>가볍게 프로젝트를 시작하고 싶은 메이커님</p>
													<ul class="pricing-content">
														<li>프로젝트 공개</li>
														<li>메이크잇 스쿨 수강</li>
														<li>콘텐츠 제작 도우미</li>
														<li>데이터 플러스</li>
														<li>딜리버리</li>
														<li>인증 마크</li>
													</ul>
												</div>

											</div>

										</article>
									</li>
									<li class="FundingPricingList">
										<article class="FundingPricing basic" data-type="basic">
											<div class="FundingPricing_header">

												<h1>Basic <small>(베이직)</small>
													<div style="float: right;">
														<button class="Button_button__1e2A2 Button_primary__PxOJr Button_lg__3vRQD Button_block__2mEqp"
															id="b2" type="button">
															<span><span class="Button_children__q9VCZ">이걸로 할게요</span></span>
														</button>
													</div>
												</h1>
												<div class="FundingPricing_fee">
													<span>수수료 </span><strong>8% </strong><small>(VAT 별도)</small>
												</div>

											</div>

											<div class="FundingPricing_body">
												<div class="FundingPricing_body_container">
													<p>프로젝트를 공개하기 전부터 서포터를 모으고 싶은 메이커님</p>
													<ul class="pricing-content">
														<p class="FundingBold">Light 요금제의 모든 서비스에 추가로</p>
														<li>📣 오픈예정 서비스</li>
														<li>👩‍💻 1:1 프로젝트 매니저 온라인 상담</li>
													</ul>
												</div>
											</div>

										</article>
									</li>
									<li class="FundingPricingList">
										<article class="FundingPricing pro" data-type="pro">
											<div class="FundingPricing_header">
												<h1>Pro <small>(프로)</small>
													<div style="float: right;">
														<button class="Button_button__1e2A2 Button_primary__PxOJr Button_lg__3vRQD Button_block__2mEqp"
															id="b3" type="button">
															<span><span class="Button_children__q9VCZ">이걸로 할게요</span></span>
														</button>
													</div>
												</h1>
												<div class="FundingPricing_fee">
													<span>수수료 </span><strong>13% </strong><small>(VAT 별도)</small>
												</div>
											</div>



											<div class="FundingPricing_body">
												<div class="FundingPricing_body_container">
													<p>온∙오프라인에서 동시에 서포터를 모으고 싶은 메이커님</p>
													<ul class="pricing-content">
														<p class="FundingBold">Light 요금제의 모든 서비스에 추가로</p>
														<li>📣 오픈예정 서비스</li>
														<li>✨ 공간 메이크잇 쇼룸</li>
														<li>👩‍💻 1:1 프로젝트 매니저 온라인 상담</li>
													</ul>
												</div>
											</div>

										</article>
									</li>
								</ul>
							</div>
						</div>
					</label>
				</div>
			</form>
			<div class="FundingBaseInfo_btnWrapper__3J9jG"
				style="margin-top: 40px;">
				<button type="button" class="wz button primary" id="save_bt">저장하기</button>
			</div>
			<!-- content end -->
		</div>
	</div>
<script>
var choiceMembership = '';
var fundIdx = ${fund.fundIdx};
var buttonHtml = '이걸로 할게요';
var choiceHtml = '✔️이걸로 골랐어요';
var choiceBg= 'linear-gradient(118deg,#bbf5c5,#65bfce)';
$(function() {
	btnDisabled();
	//저장된 데이터 있을 시 불러오기
	if ('${getSaveData.fundMembership}' != null) {
		if('${getSaveData.fundMembership}' == '라이트') {
			$('#b1').html(choiceHtml).css('background-image', choiceBg);
			btnEnabled();
		}
		if('${getSaveData.fundMembership}' == '베이직') {
			$('#b2').html(choiceHtml).css('background-image', choiceBg);
			btnEnabled();
		}
		if('${getSaveData.fundMembership}' == '프로') {
			$('#b3').html(choiceHtml).css('background-image',choiceBg);
			btnEnabled();
		}
		
	}
});
$('#b1').click(function() {
	btnEnabled();
	choiceMembership = '라이트';
	if ($(this).html() == buttonHtml) {
		$(this).html(choiceHtml).css('background-image', choiceBg);
		$('#b2, #b3').html(buttonHtml).css('background', '');
	} else {
		$(this).html(buttonHtml).css('background','');
	}
	
});

$('#b2').click(function() {
	btnEnabled();
	choiceMembership = '베이직';
	if ($(this).html() == buttonHtml) {
		$(this).html(choiceHtml).css('background-image', choiceBg);
		$('#b1, #b3').html(buttonHtml).css('background', '');
	} else {
		$(this).html(buttonHtml).css('background','');
	}
	
});

$('#b3').click(function() {
	btnEnabled();
	choiceMembership = '프로';					
	if ($(this).html() == buttonHtml) {
		$(this).html(choiceHtml).css('background-image',choiceBg);
		$('#b1, #b2').html(buttonHtml).css('background', '');
	} else {
		$(this).html(buttonHtml).css('background','');
	}
	
});
function btnDisabled() {
	console.log("비활성화");
	  $('#save_bt').css('background-color', '#90949c');
	  // 버튼이 비활성화되었을 때 마우스오버 효과를 없애기 위한 코드
	  setShadowNone();
	  $('#save_bt').attr('disabled', true);
	  // console.log('btnDisabled');
	}

function btnEnabled() {
	console.log("활성화");
  $('#save_bt').css('background-color', '#00c4c4');
  // 아래 코드도 버튼 활성화가 가능하다.
  // $('#submit-btn').attr('disabled', false);
  $('#save_bt').removeAttr('disabled');
  $('#save_bt').on('mouseover', setShadow);
  $('#save_bt').on('mouseleave', setShadowNone);
}

function setShadow() {
  $('#save_bt').css('box-shadow', '0 2px 4px 0 rgba(0, 0, 0, 0.50)');
}

function setShadowNone() {
  $('#save_bt').css('box-shadow', 'none');
}
</script>
<script>
$('#save_bt').click(
	function() {
		if ($('#b1').html() == choiceHtml || $('#b2').html() == choiceHtml || $('#b3').html() == choiceHtml) {
			$.ajax("saveData.do", {
				type : "post",
				data : JSON.stringify({fundMembership : choiceMembership , fundIdx : fundIdx }), // 서버쪽으로 JSON 문자열 전달
				contentType : "application/json", // 서버로 전송하는 컨텐츠 유형(JSON 형식)
				dataType : "text", // 서버로부터 응답받는 데이터 형식
				success : function(data) {
					alert("저장했어요.");
					console.log(data);
				},
				error : function(jqXHR, textStatus,
						errorThrown) {
					alert("ERROR : " + textStatus
							+ " : " + errorThrown);
				}
			});
		}
		
	});

</script>

</body>
</html>
