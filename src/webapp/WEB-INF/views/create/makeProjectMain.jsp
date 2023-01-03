<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%@include file="/common/Header_jy.jsp"%>
<body>
	<div class="wrapper d-flex align-items-stretch">
		<%@include file="/common/Nav.jsp"%>
		<div id="content" class="p-4 p-md-5">
			<%@include file="/common/TopButton.jsp"%>
			<!-- content start -->
			<div style="margin-bottom: 30px;">
				<h2 class="fundingFromContainer_title">펀딩 준비</h2>
				<p>프로젝트를 공개하는 데 필요한 내용을 작성해 주세요.</p>
			</div>

		<form action="getSaveVo.do" id="myForm" method="post">
		 	<input type="hidden" name="fundIdx" id="fundIdx" value="${fund.fundIdx}">
		
			<div class="FundingLayout_contents__12sTn" style="width: 800px;">
				<div class="FundingStatus_container__3bqGB">
					<div class="FundingStatus_label__393mk">프로젝트 상태</div>
					<div class="FundingStatus_statusView__D10Ag"></div>
					<div class="FundingStatus_statusView__D10Ag">
						<div id="projectStatus"> 펀딩 준비 중</div>
					</div>
					<div class="FundingStatus_guide__37jtT">아래의 필수 항목들이 모두 작성 완료 상태로 바뀌면 [미리보기]와 [제출하기]를 누를 수 있어요.</div>
				</div>
				<div class="FundingContainer_listContainer__1jw_z">
					<div>
						<div class="PageMenuList_card__1VyAW PageMenuList_wadizColor__3nQuN">
							<div class="PageMenuList_container__1xz-L">
								<div class="PageMenuList_name__2nKKm">요금제 선택</div>
								
									<c:if test="${empty notNullCheck.fundMembership }">
										<div class="PageMenuList_status__3M6fF PageMenuList_wadizColor__3nQuN" id="notNullMembership">작성중</div>
									</c:if>
									<c:if test="${not empty notNullCheck.fundMembership }">
										<div class="PageMenuList_status__3M6fF PageMenuList_wadizColor__3nQuN" id="notNullMembership">작성 완료</div>
									</c:if>						
								<a class="PageMenuList_buttonWrapper__3PXAt"
									href="create_pricing.do"><button
										type="button" class="wz button">작성하기</button></a>
							</div>
						</div>
						<div class="PageMenuList_card__1VyAW PageMenuList_wadizColor__3nQuN">
							<div class="PageMenuList_container__1xz-L">
								<div class="PageMenuList_name__2nKKm">기본 정보</div>
									<c:if test="${empty notNullCheck.fundTitle }">
										<div class="PageMenuList_status__3M6fF PageMenuList_wadizColor__3nQuN" id="notNullInfor">작성중</div>
									</c:if>
									<c:if test="${not empty notNullCheck.fundTitle }">
										<div class="PageMenuList_status__3M6fF PageMenuList_wadizColor__3nQuN" id="notNullInfor">작성 완료</div>
									</c:if>		
								<a class="PageMenuList_buttonWrapper__3PXAt"
									href="create_infor.do"><button
										type="button" class="wz button">작성하기</button></a>
							</div>
						</div>
						<div class="PageMenuList_card__1VyAW PageMenuList_wadizColor__3nQuN">
							<div class="PageMenuList_container__1xz-L">
								<div class="PageMenuList_name__2nKKm">스토리 작성</div>
									<c:if test="${empty notNullCheck.fundDetailImg }">
										<div class="PageMenuList_status__3M6fF PageMenuList_wadizColor__3nQuN" id="notNullStory" >작성중</div>
									</c:if>
									<c:if test="${not empty notNullCheck.fundDetailImg }">
										<div class="PageMenuList_status__3M6fF PageMenuList_wadizColor__3nQuN"id="notNullStory">작성 완료</div>
									</c:if>			
								<a class="PageMenuList_buttonWrapper__3PXAt"
									href="create_story.do"><button
										type="button" class="wz button">작성하기</button></a>
							</div>
						</div>
						<div class="PageMenuList_card__1VyAW PageMenuList_wadizColor__3nQuN">
							<div class="PageMenuList_container__1xz-L">
								<div class="PageMenuList_name__2nKKm">옵션 설계</div>
									<c:if test="${empty notNullCheckOption[0].fundOptionTitle }">
										<div class="PageMenuList_status__3M6fF PageMenuList_wadizColor__3nQuN" id="notNullReward">작성중</div>
									</c:if>
									<c:if test="${not empty notNullCheckOption[0].fundOptionTitle }">
										<div class="PageMenuList_status__3M6fF PageMenuList_wadizColor__3nQuN" id="notNullReward">작성 완료</div>
									</c:if>		
								<a class="PageMenuList_buttonWrapper__3PXAt"
									href="create_reward.do"><button
										type="button" class="wz button">작성하기</button></a>
							</div>
						</div>

						<div class="PageMenuList_card__1VyAW PageMenuList_wadizColor__3nQuN">
							<div class="PageMenuList_container__1xz-L">
								<div class="PageMenuList_name__2nKKm">메이커 정보</div>
									<c:if test="${empty notNullCheck.fundMakerName }">
										<div class="PageMenuList_status__3M6fF PageMenuList_wadizColor__3nQuN" id="notNullMaker" >작성중</div>
									</c:if>
									<c:if test="${not empty notNullCheck.fundMakerName }">
										<div class="PageMenuList_status__3M6fF PageMenuList_wadizColor__3nQuN" id="notNullMaker" >작성 완료</div>
									</c:if>		
								<a class="PageMenuList_buttonWrapper__3PXAt"
									href="create_maker.do"><button
										type="button" class="wz button">작성하기</button></a>
							</div>
						</div>

					</div>
				</div>
				<div style="margin-top: 40px;">
					<div>
						<input type="button" class="mi button primary2" style="border-color:#00c4c4;" id="previewBtn" value="미리보기" onclick="popUpGetData()">
						<input type="submit" class="mi button primary" id="submitBtn" value="제출하기" onclick="sumbitData()">
					</div>
					
				</div>
				
				
					
				</div>
			</div>
		</form>
			<!-- content end-->
		</div>
	</div>
</body>
<script>
$(function() {
	 var allSave = 0;

	 	btnDisabled();
	 	saveCheck();
	 	
	 	function saveCheck() {
		   	var membershipVal = $('#notNullMembership').html();
		   	var inforVal = $('#notNullInfor').html();
		   	var storyVal = $('#notNullStory').html();
		   	var rewardVal = $('#notNullReward').html();
		   	var makerVal = $('#notNullMaker').html();
		   	console.log("membershipVal : " + membershipVal);
		   	console.log("inforVal : " + inforVal);
		   	console.log("storyVal : " + storyVal);
		   	console.log("rewardVal : " + rewardVal);
		   	console.log("makerVal : " + makerVal);
		   	if(membershipVal == '작성 완료' && inforVal == '작성 완료' && storyVal == '작성 완료' && rewardVal == '작성 완료' && makerVal == '작성 완료') {
		   		allSave = 1;
		   	} else {
		   		allSave = 0;
		   	}
		   	judgeBtn();
	 	}
	   
	    // 버튼 활성화 여부를 결정하는 함수
	    function judgeBtn() {
	      if (allSave === 1) {
	    	  console.log("btnEnabled()실행하자");
	    	  $('#projectStatus').html("펀딩 작성 완료!");
	    	  $('#projectStatus').css('color', '#f05757');
	        btnEnabled();
	      } else {
	    	  console.log("btnDisabled()실행하자");
	        btnDisabled();
	      }
	    }

	    function btnDisabled() {
	    	console.log("btnDisabled() 실행완료")
	      $('#submitBtn').css('background-color', '#adadad');
	      $('#submitBtn').css('border-color', '#adadad');
	      // 버튼이 비활성화되었을 때 마우스오버 효과를 없애기 위한 코드
	      setShadowNone();
	      $('#submitBtn').attr('disabled', true);
	      $('#previewBtn').attr('disabled', true);
	      $('#previewBtn').css('border-color', 'rgb(122 126 126 / 23%)');
	      $('#previewBtn').css('color', 'rgb(171 167 167 / 54%)');
	      
	   
	    }

	    function btnEnabled() {
	    	console.log("btnEnabled() 실행완료")
	      $('#submitBtn').css('background-color', '#00c4c4');
	      $('#submitBtn').removeAttr('disabled');
	      $('#submitBtn').on('mouseover', setShadow);
	      $('#submitBtn').on('mouseleave', setShadowNone);
	      
	      $('#previewBtn').css('border-color', 'rgb(122 126 126 / 70%)');
	      $('#previewBtn').css('color', 'rgb(0 0 0 / 65%)');
	      
	      $('#previewBtn').removeAttr('disabled');
	      $('#previewBtn').on('mouseover', setShadow2);
	      $('#previewBtn').on('mouseleave', setShadowNone2);
	    }

	    function setShadow() {
	      $('#submitBtn').css('box-shadow', '0 2px 4px 0 rgba(0, 0, 0, 0.50)');
	    }

	    function setShadowNone() {
	      $('#submitBtn').css('box-shadow', 'none');
	    
	    }
	    function setShadow2() {
			$('#previewBtn').css('box-shadow', '0 2px 4px 0 rgba(0, 0, 0, 0.50)');
	      }

	      function setShadowNone2() {
	        $('#previewBtn').css('box-shadow', 'none');
	      }
	});

 function sumbitData() {
	 var result = confirm("펀딩을 최종 등록하시나요?");
	 if(result){
	     alert("[등록중] 메인화면으로 이동할때까지 잠시만 기다려주세요");
	     document.getElementById('myForm').submit();
	     
	 }else{
	     alert("등록을 취소했어요.");
	 }
 }
//미리보기 기능
 function popUpGetData() {
 	var fundIdx = $('#fundIdx').val();
 	console.log("fundIdx : " + fundIdx);
 	 $.ajax({
 		type : "POST",
 		url : "preview.do",
 		data : {
 			fundIdx : fundIdx
 		},
 		success : function(data) {
 				if (data == "Y") { //성공
 					popUp();
 				} else { // 실패
 					alert("실패~!");
 				}
 	     },
 		error : function() {
 			alert("데이터 전송 실패.");
 		}
 		
 	});
 }
function popUp() {
	window.open("previewOpen.do", "preview", 'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');
}

</script>


</html>