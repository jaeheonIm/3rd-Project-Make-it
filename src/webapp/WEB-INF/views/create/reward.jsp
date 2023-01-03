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
			<div>
				<h2 class="fundingFromContainer_title">옵션 설계</h2>
				<p>서포터님들에게 제공할 상품 옵션을 입력해 주세요.</p>
			</div>

		<div class="FundingConditionGuideSection_content__BPu9e" style="margin-top:20px;">
                <h4 class="FundingConditionGuideSection_title__3WoCK">옵션 설계 조건</h4>
                <ul class="FundingConditionGuideSection_list__2hGJ2">
                    <li class="FundingConditionGuideSection_item__2HEgM">
                        <h5 class="FundingConditionGuideSection_name__2bCqQ">정렬 순서</h5>
                        <p class="FundingConditionGuideSection_description__1NZyz">혜택이 좋은 순서대로 등록해 주세요.</p>
                    </li>
                 
                    <li class="FundingConditionGuideSection_item__2HEgM">
                        <h5 class="FundingConditionGuideSection_name__2bCqQ">옵션 설정</h5>
                        <p class="FundingConditionGuideSection_description__1NZyz">고객이 직접 입력해야 할 내용이 있다면 추가해 주세요.</p>
                    </li>
                </ul>
            </div>


            <section class="FundingConditionControlSection_container__dS_HI spacing-5">
                <div class="FundingConditionControlSection_inner__2irbO">
                    <div color="info" class="MessageBox_messageBox__3acWS MessageBox_info__16itf spacing-4"><span><svg viewBox="0 0 40 40" focusable="false" role="presentation" class="withIcon_icon__3lrgp MessageBox_icon__31KWI MessageBox_withoutTitle__2S2r8" aria-hidden="true">
                                <path fill="none" d="M0 0h40v40H0z"></path>
                                <path d="M20 1a19 19 0 1 0 19 19A19.06 19.06 0 0 0 20 1zm1 28.6h-2v-13h2zm-1-15.84A1.8 1.8 0 1 1 21.8 12a1.8 1.8 0 0 1-1.8 1.76z"></path>
                            </svg></span>
                        <div class="MessageBox_content__3db50">
                            <div class="MessageBox_description__1bCQv">
                                <p>옵션을 추가하기 전에 프로젝트 종료일을 설정해 주세요.</p>
                                <p>프로젝트 종료일은 펀딩 준비 &gt; <button class="link" type="button">기본 정보</button>에서 설정할 수 있어요.</p>
                            </div>
                        </div>
                    </div>
                    <div class="FundingConditionControlSection_addBox__3Kq20">
                        <div><svg viewBox="0 0 32 32" focusable="false" role="presentation" class="openBtn" aria-hidden="true">
                                <path d="M16 1.6C8.047 1.6 1.6 8.047 1.6 16S8.047 30.4 16 30.4 30.4 23.953 30.4 16 23.953 1.6 16 1.6zm8 15.2h-7.2V24h-1.6v-7.2H8v-1.6h7.2V8h1.6v7.2H24z"></path>
                            </svg>
                            <p>옵션을 추가해 주세요</p>
                        </div>
                    </div>
                </div>
                   
                   
                   
                   
                   
                   
                   <!--리워드 추가시 보임-->
                <div style="width: 418px;" class="rewardPlus" id="rewardDiv">
                    <section class="FundingConditionRewardSection_container__a4jlz" style="display:none;">
                        <div class="FundingConditionRewardItem_container__1aQKY spacing-4">
                            <div class="FundingConditionRewardItem_header__3LoHV">
                                <div class="FundingConditionRewardItem_amount__13WhI" id="fund_option_price">20,000</div>
                            </div>
                            <hr class="Divider_divider__iEd6P Divider_horizontal__2aRDB Divider_lightBG__1SKWl Divider_spacing5__1JRsJ Divider_caption2__1zTI_">
                            <h4 class="FundingConditionRewardItem_name__Q9cMr" id="fund_option_title">B세트</h4>
                            <p class="FundingConditionRewardItem_description__3Yhpu" id="fund_option_content">무선이어폰</p>
                            <div class="FundingConditionRewardItem_shipping__1XIAG">
                                <div class="FundingConditionRewardItem_shippingCharge__J2R07">
                                    <span>배송비</span>
                                    <span id="fund_option_delivery">2,500원</span>
                                </div>
                                <div class="FundingConditionRewardItem_shippingPeriod__1BURI"></div>
                            </div>
                            <div class="FundingConditionRewardItem_buttonGroup__19GER" >
                                <div ><button class="Button_button__1e2A2 Button_xs__x1b7M Button_startIcon__19sdm" type="button" id = "deleteOption" onclick='button1_click(this);'><span><svg viewBox="0 0 40 40" focusable="false" role="presentation" class="withIcon_icon__3lrgp Button_icon__1qsE3" aria-hidden="true">
                                                <path d="M36.67 5.31H3.33v2h2.82v31.88h27.7V7.31h2.82zm-4.82 31.88H8.15V7.31h23.7zM15 .81h10v2H15z" ></path>
                                                <path d="M14.75 15.18h2v15h-2zm8.5 0h2v15h-2z" ></path>
                                            </svg><span class="Button_children__q9VCZ" >삭제</span></span></button></div>
                            </div>
                               <input type="hidden" name="fundIdx" id="fundIdx" value="${fund.fundIdx}" >
                        </div>
                    </section>
                </div>
                
                <form action="*" method="post">
                    <input type="hidden" name="returnReward" id="returnValue" style="width:100%;" value="" >
                </form>
                
              <div class="FundingBaseInfo_btnWrapper__3J9jG" style="margin-top: 40px;">
				<button type="button" class="wz button primary" id="saveAllBt">저장하기</button>
			</div>
            </section>
            <table width="300" height="100" border="1" cellspacing="0" cellpadding="1" bordercolorlight="#E0E0E0" bordercolordark="#FFFFFF">
            </table>



            <!--<button class="openBtn">모달창 open</button>-->
            <div class="modal hidden">

                <!--여기부터 -->

                <div class="ReactModalPortal">
                    <div class="ReactModal__Overlay ReactModal__Overlay--after-open ConfirmModal_overlay__-jHao waffle__modal__overlay" style="background-color: rgba(0, 0, 0, 0.3);">
                        <div class="ReactModal__Content ReactModal__Content--after-open ConfirmModal_confirmModal__3LOlx ConfirmModal_sizeXl__15YuF FundingConditionRewardModalContainer_container__1Avmk" tabindex="-1" role="dialog" aria-modal="true">
                            <div class="ConfirmModal_header__3_Qxt">
                                <div class="ConfirmModal_closeIconRoot__1iJoQ">
                                    <button class="closeBtn">
                                        <svg viewBox="0 0 40 40" focusable="false" role="presentation" class="withIcon_icon__3lrgp ConfirmModal_closeIcon__3E6vy" aria-hidden="true">
                                            <path d="M33.4 8L32 6.6l-12 12-12-12L6.6 8l12 12-12 12L8 33.4l12-12 12 12 1.4-1.4-12-12 12-12z"></path>
                                        </svg></button>
                                </div>
                                <div title="리워드 추가" class="ConfirmModal_title__sFrkL ConfirmModal_showCloseButton__1P8aT">옵션 추가</div>
                            </div>


                            <div class="ConfirmModal_content__1rEr7 ConfirmModal_hasTitle__3Fk6J">
                                <div class="spacing-8" style="width: 50%;">
                                    <div class="TextField_textField__23rCe TextField_md__2zsQn TextField_right__1qt_G"><label>금액</label><span style="color: red;"> *</span>
                                        <div class="TextField_field__1E9vt"><input name="fund_option_price" id="option_price" placeholder="0" type="text" class="Input_input__2kAAL Input_md__3-eZ6" aria-invalid="false"><span class="TextField_fixedText__2vIuK TextField_endText__3jIeG">원</span></div>
                                    </div>
                                </div>
                                <div class="ToolTipMobile_label__1dBSo ToolTipMobile_required__3WiIn"><label>옵션명</label><span style="color: red;"> *</span>
                                    <div class="TextField_field__1E9vt">
                                    	<input placeholder="예시) [얼리버드] 베이지 이불∙베개 1세트" maxlength="60" type="text" class="Input_input__2kAAL Input_md__3-eZ6" aria-invalid="false" name="fund_option_title" id="option_title_input"></div>
                                    <em class="HelperMessage_helperMessage__1qZPy" id="optionNameInput">60</em><em class="HelperMessage_helperMessage__1qZPy" id="optionNameInput">자 남음</em>
                                    
                                </div>
                                <div class="TextField_textField__23rCe TextField_md__2zsQn spacing-8" style="margin-top:20px;">
                                    <label>옵션 설명</label><span style="color: red;"> *</span>
                                    <div class="TextField_field__1E9vt"><textarea name="fund_option_content" id="option_content_input" placeholder="옵션의 구성과 혜택을 간결하게 설명해 주세요." maxlength="150" rows="3" class="Textarea_textarea__2swOj undefined" style="height: 106px;"></textarea><textarea aria-hidden="true" tabindex="-1" class="Textarea_textarea__2swOj undefined" style="visibility: hidden; position: absolute; overflow: hidden; height: 0px; top: 0px; left: 0px; transform: translateZ(0px); pointer-events: none; width: 754px;"></textarea></div><em class="HelperMessage_helperMessage__1qZPy" id="optionContentInput">150</em><em class="HelperMessage_helperMessage__1qZPy">자 남음</em>
                                </div>


                                <div class="ToolTipMobile_toolTipContainer__2tYPd" style="margin-bottom: 20px;">
                                    <div class="ToolTipMobile_label__1dBSo ToolTipMobile_required__3WiIn">옵션 설정
                                    </div>
                                </div>

                                <div class="mi dropdown outline block" style="width: 270px;">
                                    <select name="selectOption" id="selectOption">
                                        <option value disabled>선택해주세요</option>
                                        <option value="옵션없음">옵션 없음</option>
                                        <option value="직접입력옵션">직접 입력 옵션(각인, 메시지 등)</option>
                                    </select>

                                </div>

                                <div class="TextField_field__1E9vt" id="optionWrite">
                                    <input placeholder="입력해 주세요" type="text" class="Input_input__2kAAL Input_md__3-eZ6" aria-invalid="false" value="">
                                    <em class="HelperMessage_helperMessage__1qZPy">예시) 한글 10자, 영문 15자 이내의 각인 메시지를 입력해 주세요.</em>
                                </div>

                                <div class="FundingConditionRewardOptionSettingContainer_container__1lKeh spacing-8" id="element1">
                                    <label class="wz label Label_label__3oH0h" style="margin-top:20px;">옵션 입력</label>

                                    <div id="optionPlus">
                                        <div class="FundingConditionRewardOptionSettingFieldDesktop_container__2KOHQ spacing-6">
                                            <div class="TextField_textField__23rCe TextField_md__2zsQn FundingConditionRewardOptionSettingFieldDesktop_textField__8TXpt">
                                                <label>옵션명</label>
                                                <div class="TextField_field__1E9vt" id="divInputoptionName"><input name="reward.optionSettings[0].optionName" placeholder="예시) 색상" maxlength="16" type="text" class="Input_input__2kAAL Input_md__3-eZ6" aria-invalid="false" value=""></div>
                                            </div>
                                            <div class="TextField_textField__23rCe TextField_md__2zsQn FundingConditionRewardOptionSettingFieldDesktop_textField__8TXpt"><label>
                                                    <div><button type="button" class="Tooltip_button__26Zz0" title="옵션 값" aria-describedby="Tooltip_1"><span class="Tooltip_label__1s0-R">옵션 값</span><span class="Tooltip_helpIconWrap__3JEtO">
                                                                <path fill="none" d="M0 0h40v40H0z"></path>
                                                                <path d="M20 39a19 19 0 1 1 19-19 19.06 19.06 0 0 1-19 19zm0-36a17 17 0 1 0 17 17A17 17 0 0 0 20 3z"></path>
                                                                <path d="M24.34 10A5.75 5.75 0 0 0 20 8.33a5.7 5.7 0 0 0-6 6h2a3.7 3.7 0 0 1 4-4 3.7 3.7 0 0 1 4 4A4.29 4.29 0 0 1 22 18l-.7.6a6.51 6.51 0 0 0-2.3 5.7h2c0-1.9 0-2.6 1.7-4.3l.6-.5a6.28 6.28 0 0 0 2.7-5.2 5.73 5.73 0 0 0-1.66-4.3zM20 26.87a1.8 1.8 0 1 0 0 3.6 1.8 1.8 0 1 0 0-3.6z"></path>

                                                                <path fill="none" d="M0 0h40v40H0z"></path>
                                                                <path d="M20 1a19 19 0 1 0 19 19A19.06 19.06 0 0 0 20 1zm0 29.5a1.8 1.8 0 1 1 1.8-1.79 1.8 1.8 0 0 1-1.8 1.75zm6-16.13a6.28 6.28 0 0 1-2.7 5.2l-.6.5c-1.7 1.7-1.7 2.4-1.7 4.3h-2a6.51 6.51 0 0 1 2.3-5.7L22 18a4.29 4.29 0 0 0 2-3.7 3.7 3.7 0 0 0-4-4 3.7 3.7 0 0 0-4 4h-2a5.7 5.7 0 0 1 6-6 5.7 5.7 0 0 1 6 6z"></path>
                                                            </span></button></div>
                                                </label>

                                            </div>
                                            <!-- x 버튼-->
                                            <div id="xBt">
                                                <button class="Button_button__1e2A2 Button_tertiaryGrey__3gRf4 Button_contained__TTXSM Button_md__1FRMG Button_iconOnly__34khK iconButton" type="button"><span><span class="Button_children__q9VCZ"><svg viewBox="0 0 40 40" focusable="false" role="presentation" class="withIcon_icon__3lrgp" aria-hidden="true" style="width: 20px; height: 20px;">
                                                                <path d="M33.4 8L32 6.6l-12 12-12-12L6.6 8l12 12-12 12L8 33.4l12-12 12 12 1.4-1.4-12-12 12-12z"></path>
                                                            </svg></span></span></button>
                                            </div>

                                            <!-- + 버튼-->
                                            <div id="divPlusBt">
                                                <button class="Button_button__1e2A2 Button_tertiaryGrey__3gRf4 Button_contained__TTXSM Button_md__1FRMG Button_iconOnly__34khK iconButton" type="button" id="plusbt" value='createDiv'><span><span class="Button_children__q9VCZ"><svg viewBox="0 0 32 32" focusable="false" role="presentation" class="withIcon_icon__3lrgp" aria-hidden="true" style="width: 20px; height: 20px;">
                                                                <path d="M30.4 15.2H16.8V1.6h-1.6v13.6H1.6v1.6h13.6v13.6h1.6V16.8h13.6v-1.6z"></path>
                                                            </svg></span></span></button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!--배송비-->
                                <div class="spacing-8" style="width: 50%; margin-top: 20px;">
                                    <div class="TextField_textField__23rCe TextField_md__2zsQn TextField_right__1qt_G">
                                        <label>배송비</label><span style="color: red;"> *</span>
                                        <div class="TextField_field__1E9vt">
                                            <input placeholder="0" type="text" class="Input_input__2kAAL Input_md__3-eZ6" aria-invalid="false" name="fund_option_delivery" id="option_delivery"><span class="TextField_fixedText__2vIuK TextField_endText__3jIeG">원</span>
                                        </div>
                                        <em class="HelperMessage_helperMessage__1qZPy">무료배송인 경우 0원을 입력해 주세요.</em>
                                    </div>
                                </div>



                                <button class="Button_button__1e2A2 Button_primary__PxOJr Button_contained__TTXSM Button_lg__3vRQD Button_endIcon__3ZOY3 Button_block__2mEqp Button_disabled__3x0Tg update-button" type="button" id="savebt"><span><span class="Button_children__q9VCZ">저장</span><svg viewBox="0 0 32 32" focusable="false" role="presentation" class="withIcon_icon__3lrgp Button_icon__1qsE3" aria-hidden="true">
                                            <path d="M15.2 4.8v19.36l-8.48-8.48L5.6 16.8 16 27.2l10.4-10.4-1.12-1.12-8.48 8.48V4.8h-1.6z"></path>
                                        </svg></span></button>
                            </div>
			
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


<script>
const open = () => {
    document.querySelector(".modal").classList.remove("hidden");
}

const close = () => {
    document.querySelector(".modal").classList.add("hidden");
}

document.querySelector(".openBtn").addEventListener("click", open);
document.querySelector(".closeBtn").addEventListener("click", close);
document.querySelector("#savebt").addEventListener("click", close);

const formatPrice = (target) => {
  // 숫자만 남긴 후 포맷
 target.value = Number(target.value.replace(/[^0-9]/g, '')).toLocaleString();
}
</script>
<script>
$(function() {
    var element1 = document.getElementById('element1');
    var element5 = document.getElementById('optionPlus');
    $('#plusbt').click(function() {
        element1.innerHTML += element5.innerHTML;
    });
});
</script>
<script>
//리워드(옵션)입력창 배열로 저장 후 넘기기 
var resArr = new Array();
var cnt = 0;
$(function() {
    $('#savebt').click(function() {
       var resObj = new Object();
       console.log("리워드 모달창에서 저장버튼 클릭");
       resObj.fundOptionPrice = $("input[name='fund_option_price']").val();
       resObj.fundOptionTitle = $("input[name='fund_option_title']").val();
       resObj.fundOptionContent = $("textarea[name='fund_option_content']").val();
       resObj.fundOptionDelivery = $("input[name='fund_option_delivery']").val();
       resObj.fundIdx= $("#fundIdx").val();
       resObj.addDivId = "addDiv" + cnt;

       // JSON 문자열 출력
       /* const jsonResObj = JSON.stringify(resObj); */
       
       $("#fund_option_price").html(resObj.fundOptionPrice + "원");   
       $("#fund_option_title").html(resObj.fundOptionTitle);   
       $("#fund_option_content").html(resObj.fundOptionContent);   
       $("#fund_option_delivery").html(resObj.fundOptionDelivery + "원"); 
       
 
       var cloneElements = $('.FundingConditionRewardSection_container__a4jlz').clone();
       cloneElements.attr("class", "addDiv" + cnt);	
       cloneElements.attr("id", "addDiv" + cnt);	
       cloneElements.attr("style","display :");
       
       $(".rewardPlus").append(cloneElements);
       
       //모달창에서 저장 누를 시 배열에 하나씩 push
       resArr.push(resObj);
       
       //console.log("resArr : " + resArr);

       const jsonResArr = JSON.stringify(resArr);
 
       $("#returnValue").val(jsonResArr);

       cnt++;
    });
});
</script>
<script>
$(document).ready(function() {
	$('#saveAllBt').click(
		function() {
			var CopyAddDivId = [];
			
	    	console.log("저장전 resArr : "+JSON.stringify(resArr));
	    	
			for(var i = 0; i < resArr.length; i++){
				//console.log(i);
				CopyAddDivId[i] = resArr[i].addDivId
				delete resArr[i].addDivId;
			}
			
			alert("저장되었습니다.");
			//console.log("resArr : " + JSON.stringify(resArr));
			
			$.ajax("url.do", {
				type: 'POST',
			    data: {resArr: JSON.stringify(resArr), flag: 'Y'},
			    success: function(res){
			    	
			    	for(var i = 0; i < resArr.length; i++){
						//console.log(i);
						resArr[i].addDivId = CopyAddDivId[i];
					}
			    	console.log("저장후 resArr : "+JSON.stringify(resArr));
			    }
				    
		});
	});
});
</script>
<script>
$('#selectOption').change(function() {
    var state = jQuery('#selectOption option:selected').val();
    if (state == '직접입력옵션') {
        $('#optionWrite').show();
        $('#element1').hide();
    } else if (state == '옵션없음') {
        $('#optionWrite').hide();
        $('#element1').hide();
    }
});
</script>
<script>
$(document).ready(function (event){
	$('#option_title_input').keyup(function(){
		//남은 글자 수 구함
 		var inputLength = $(this).val().length;
      	var remain = 60 - inputLength;
      	//문서 객체에 입력
      	$('#optionNameInput').html(remain);
	});
	
	$('#option_content_input').keyup(function(){
		//남은 글자 수 구함
 		var inputLength = $(this).val().length;
      	var remain = 150 - inputLength;
      	//문서 객체에 입력
      	$('#optionContentInput').html(remain);
	});
	
});
</script>
<script>
var deleteOption = document.getElementById(deleteOption);

function button1_click( i ) {
	var parentId = i.parentNode.parentNode.parentNode.parentNode.id;
	//console.log("["+parentId+"]");
	deleteList(parentId);
	$("."+parentId).remove();
}

function deleteList(parentId) {
	console.log("리스트에서 삭제");
	// addDivId
	const idx = resArr.findIndex( function(item) { 
		console.log("item.addDivId : " + item.addDivId);
		console.log("parentId : " + parentId);
		return item.addDivId == parentId} 
	)

	//값을 못찾으면 -1 return
	if (idx > -1) 
	{
		resArr.splice(idx, 1);
	}
		
	//리스트 출력
	console.log(resArr);
	
	const jsonResArr = JSON.stringify(resArr);
	$("#returnValue").val(jsonResArr);
	
	//옵션 모두 삭제했을때 버튼 비활성화
	var value = $('#returnValue').val();
	if(value != "[]") {
		btnEnabled();
	} else {
		btnDisabled();
	}
}
</script>
 <script>
 var optionPrice = 0;
 var optionTitle = 0;
 var optionContent = 0;
 var optionDelivery = 0;
 var hiddenInput = 0;

btnDisabled();

$('#option_title_input').on("propertychange change keyup paste input", function() {
	console.log("실행");
	var currentVal = $(this).val();
	if(currentVal != null) {
		optionTitle = 1;
	} else {
		optionTitle = 0;
	}
	judgeBtn();
});

$('#option_price').on("propertychange change keyup paste input", function() {
	console.log("실행");
	var currentVal = $(this).val();
	if(currentVal != null) {
		optionPrice = 1;
	} else {
		optionPrice = 0;
	}
	judgeBtn();
});

$('#option_content_input').on("propertychange change keyup paste input", function() {
	console.log("실행");
	var currentVal = $(this).val();
	if(currentVal != null) {
		optionContent = 1;
	} else {
		optionContent = 0;
	}
	judgeBtn();
});

$('#option_delivery').on("propertychange change keyup paste input", function() {
	console.log("실행");
	var currentVal = $(this).val();
	if(currentVal != null) {
		optionDelivery = 1;
	} else {
		optionDelivery = 0;
	}
	judgeBtn();
});

$('#returnValue').on("propertychange change keyup paste input", function() {
	console.log("실행");
	var currentVal = $(this).val();
	if(currentVal != "[]") {
		console.log("1 여기~!");
		hiddenInput = 1;
	} else {
		console.log("2 여기~!");
		hiddenInput = 0;
	}
	judgeBtn();
});
// 버튼 활성화 여부를 결정하는 함수
function judgeBtn() {
	if (optionTitle === 1 && optionPrice === 1 && optionContent ===1 && optionDelivery ===1) {
		console.log("btnEnabled()실행");
		btnEnabled();
	} else {
		console.log("실행~!!");
		btnDisabled();
	}
}

function btnDisabled() {
	$('#savebt').css('background-color', '#90949c');
	$('#saveAllBt').css('background-color', '#90949c');
	// 버튼이 비활성화되었을 때 마우스오버 효과를 없애기 위한 코드
	setShadowNone();
	$('#savebt').attr('disabled', true);
	$('#saveAllBt').attr('disabled', true);
	// console.log('btnDisabled');
}

function btnEnabled() {
	$('#savebt').css('background-color', '#00c4c4');
	$('#saveAllBt').css('background-color', '#00c4c4');
	// 아래 코드도 버튼 활성화가 가능하다.
	// $('#submit-btn').attr('disabled', false);
	$('#savebt').removeAttr('disabled');
	$('#saveAllBt').removeAttr('disabled');
	$('#savebt').on('mouseover', setShadow);
	$('#saveAllBt').on('mouseover', setShadow);
	$('#savebt').on('mouseleave', setShadowNone);
	$('#saveAllBt').on('mouseleave', setShadowNone);
}

function setShadow() {
	console.log('setShadow');
	$('#savebt').css('box-shadow', '0 2px 4px 0 rgba(0, 0, 0, 0.50)');
	$('#saveAllBt').css('box-shadow', '0 2px 4px 0 rgba(0, 0, 0, 0.50)');
}

function setShadowNone() {
	$('#savebt').css('box-shadow', 'none');
	$('#saveAllBt').css('box-shadow', 'none');
}
</script>
<script>
//resArr
$(function() {
	<c:forEach var="getSaveOptionData" items="${getSaveOptionData}">
	
		var resObj = new Object();
		
		var fundOptionPrice1 = '${getSaveOptionData.fundOptionPrice}';
		var fundOptionDelivery1 = '${getSaveOptionData.fundOptionDelivery}';
		
		//천단위 콤마
		opPriceResult = fundOptionPrice1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		opDeliveryResult = fundOptionDelivery1.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		
	 	resObj.fundOptionPrice = opPriceResult;
	 	resObj.fundOptionTitle = '${getSaveOptionData.fundOptionTitle}';
		resObj.fundOptionContent = '${getSaveOptionData.fundOptionContent}';
		resObj.fundOptionDelivery = opDeliveryResult;
		resObj.fundIdx= '${getSaveOptionData.fundIdx}';
		resObj.addDivId = "addDiv" + cnt;
		
		$("#fund_option_price").html(resObj.fundOptionPrice + "원");   
		$("#fund_option_title").html(resObj.fundOptionTitle);   
		$("#fund_option_content").html(resObj.fundOptionContent);   
		$("#fund_option_delivery").html(resObj.fundOptionDelivery + "원"); 
		
		var cloneElements = $('.FundingConditionRewardSection_container__a4jlz').clone();
		cloneElements.attr("class", "addDiv" + cnt);	
		cloneElements.attr("id", "addDiv" + cnt);	
		cloneElements.attr("style","display :");
		
		$(".rewardPlus").append(cloneElements);
	
		resArr.push(resObj);
		
		var jsonResArr = JSON.stringify(resArr);
		
		$("#returnValue").val(jsonResArr);
		
		cnt++;
		
		var value = $('#returnValue').val();
		console.log("value: " + value);
		if(value != null) {
			btnEnabled();
		} else {
			btnDisabled();
		}
	</c:forEach>
});
</script>
<script>
//옵션 금액
$("#option_price").on("propertychange change keyup paste input",function(e){
	const input = document.querySelector('#option_price');	
	 let value = e.target.value;
	 value = Number(value.replaceAll(',', ''));
	 if(isNaN(value)) {
	   input.value = 0;
	 } else {
	   const formatValue = value.toLocaleString('ko-KR');
	   input.value = formatValue;
	 }
});
//옵션 배송비
$("#option_delivery").on("propertychange change keyup paste input",function(e){
	const input = document.querySelector('#option_delivery');	
	 let value = e.target.value;
	 value = Number(value.replaceAll(',', ''));
	 if(isNaN(value)) {
	   input.value = 0;
	 } else {
	   const formatValue = value.toLocaleString('ko-KR');
	   input.value = formatValue;
	 }
});
</script>

 <script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/locales/bootstrap-datepicker.kr.min.js"></script>
</body>
</html>