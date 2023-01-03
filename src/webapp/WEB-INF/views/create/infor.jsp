<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="ko">
<head>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="css/style_jy.css">
<link rel="stylesheet" href="css/style_jy_funding.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" rel="stylesheet">

<!--글꼴-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<style>
.ui-datepicker-trigger{cursor: pointer;}
.hasDatepicker{cursor: pointer;}
.ui-state-highlight, .ui-widget-content .ui-state-highlight  {
    border: 1px solid #aeaeac;
    background: #7e7e7e38;
    color: #000000;
   
}
.ui-widget-header {
	background: #cdcdcd;
	border-radius: 5px;
}
.ui-datepicker select.ui-datepicker-month, .ui-datepicker select.ui-datepicker-year {
    width: 45%;
    border-radius: 5px;
}
.ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default, .ui-button, html .ui-button.ui-state-disabled:hover, html .ui-button.ui-state-disabled:active {
    border-radius: 5px;
}
.ui-state-active, .ui-widget-content .ui-state-active {
    border: 1px solid #adaeaf;
    background: rgb(35 174 146 / 25%);
    font-weight: normal;
    color: #ffffff;
}
</style>
</head>
<body>
	<div class="wrapper d-flex align-items-stretch">
		<nav id="sidebar" class="">
	<div class="sideTop">
		<div class="sideTitle">
			<a>${user.memberName}님의<br> 멋진 프로젝트
			</a><br>
		</div>
		<span>프로젝트 번호 ${fund.fundIdx}</span>
	</div>
	<div class="p-4 pt-5">
		<ul class="list-unstyled components mb-5">
			<li class="active">
			<a href="#" data-toggle="collapse" aria-expanded="false" class="dropdown-toggle collapsed">펀딩 설계</a>
				<ul class="list-unstyled2" id="homeSubmenu"
					style="background-color: #efecec7a">
					<li><a href="create_Main.do?fundIdx=${fund.fundIdx}">펀딩 준비</a></li>
					<li><a href="create_pricing.do">요금제 선택</a></li>
					<li><a href="create_infor.do">기본 정보</a></li>
					<li><a href="create_story.do">스토리 작성</a></li>
					<li><a href="create_reward.do">옵션 설계</a></li>
					<li><a href="create_maker.do">메이커 정보</a></li>
				</ul></li>
			<li ><a href="#homeSubmenu" data-toggle="collapse"
				aria-expanded="false" class="dropdown-toggle collapsed">펀딩 관리</a>
				<ul class="list-unstyled2" id="homeSubmenu"
					style="background-color: #efecec7a">
				<li><a href="getMyFundList.do?memberId=${user.memberId}">나의 펀딩</a></li>
		</ul>
	</div>

</nav>
		<div id="content" class="p-4 p-md-5">
			<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid">

		<button type="button" id="sidebarCollapse" class="btn btn-primary">
			<i class="fa fa-bars"></i> <span class="sr-only">토글</span>
		</button>

		<div>
			<button class="mi button circular dense primary-outline" type="button" style="width:64px; height:38px;" onclick="javascript:location.href='main.do'">
				<i class="fa-solid fa-house"></i></button>
		</div> 

	</div>
</nav>
			<!-- content start -->
			<div>
				<h2 class="fundingFromContainer_title">기본 정보</h2>
				<p>프로젝트를 대표하는 중요한 정보들을 입력해 주세요.</p>
			</div>

			<form action="updateInfor.do" method="post" enctype="multipart/form-data" id="myForm" onkeypress="if(event.keyCode=='13'){event.preventDefault();}">
				   <input type="hidden" name="fundIdx" id="fundIdx" value="${fund.fundIdx}" >
				<div>
					<label
						class="wz label FormikFieldDropdown_label__3g5jL Label_label__3oH0h"
						style="margin-top: 20px;">
						<div class="ToolTipMobile_toolTipContainer__2tYPd">
							<div
								class="ToolTipMobile_label__1dBSo ToolTipMobile_required__3WiIn">프로젝트
								제목</div>
						</div>
						<div class="mi input right">
							<input type="text" id="title" name="fundTitle"
								placeholder="제목을 입력해주세요." maxlength="40"
								style="white-space: pre;" value="${getSaveData.fundTitle}">
						</div>
					</label>
				</div>

				<div class="FundingBaseInfoImageField_container__2Q_xy" style="margin-top: 20px;">
					<label class="wz label Label_label__3oH0h">
						<div class="ToolTipMobile_toolTipContainer__2tYPd">
							<div class="ToolTipMobile_label__1dBSo ToolTipMobile_required__3WiIn">대표 이미지</div>
						</div>
					</label>
				</div>


				<div class="field Form_field__35I9T required ImageFormField_field__X1jTW StoryImageField_field__2BLTd">
                    <div class="ImageFormField_buttonWrapper__su3pO">
                       
                        <label class="wz label ImageFileButton_label__3thB2 Label_label__3oH0h">
       
                          <div class="filebox">
                            <input type="file" id="image" name="uploadFile" accept="image/*" onchange="setThumbnail(event);"  /> 
                            <div class="wz button gray" id="imageUploadBt" style="padding-top:14px;">
                            <i class="fa-solid fa-camera"></i> 등록하기 
                            </div>

                            <div id="image_container" >
	                            <c:if test="${not empty getSaveData.fundMainImg }">
									<img src="img/fundingMainImg/${getSaveData.fundMainImg}">
									<button type="button" id="closeBtn" class="wz button less icon small2 StoryVideoField_closeBtn__3KGdu" >
									<i aria-hidden="true" class="icon close"></i></button>
									<script>$("#imageUploadBt").css('display','none');</script>
								</c:if>
                            </div>

                            <script>
                                function setThumbnail(event) {
                                    var reader = new FileReader();
                                    reader.onload = function(event) {
                                        var img = document.createElement("img");
                                        img.setAttribute("src", event.target.result);
                                        document.querySelector("div#image_container").append(img);
                                        $("#image_container").append("<button type=\"button\" id=\"closeBtn\" class=\"wz button less icon small2 StoryVideoField_closeBtn__3KGdu\" ><i aria-hidden=\"true\" class=\"icon close\"></i></button>");
                                        $("#imageUploadBt").css('display','none');
                                    };
                                    reader.readAsDataURL(event.target.files[0]);
                                    
                                    toggleImg = 1;
                                    judgeBtn();
                                }
                            </script>
                           
                            </div>
                        </label>
                    </div>
                </div>


				<div class="projectMarginTop">
					<label
						class="wz label FormikFieldDropdown_label__3g5jL Label_label__3oH0h">
						<div class="ToolTipMobile_toolTipContainer__2tYPd">
							<div
								class="ToolTipMobile_label__1dBSo ToolTipMobile_required__3WiIn">카테고리
							</div>
						</div>
					</label>
					
					<div class="mi dropdown outline block">
						<select name="fundCategory" id="fundCategory">
							<option value disabled>카테고리를 선택해주세요</option>
							<option value="테크·가전">테크·가전</option>
							<option value="패션·잡화">패션·잡화</option>
							<option value="뷰티">뷰티</option>
							<option value="푸드">푸드</option>
							<option value="홈·리빙">홈·리빙</option>
							<option value="여행·레저">여행·레저</option>
							<option value="스포츠·모빌리티">스포츠·모빌리티</option>
							<option value="캐릭터·굿즈">캐릭터·굿즈</option>
							<option value="베이비·키즈">베이비·키즈</option>
							<option value="반려동물">반려동물</option>
							<option value="게임·취미">게임·취미</option>
							<option value="컬쳐·아티스트">컬쳐·아티스트</option>
							<option value="클래스·컨설팅">클래스·컨설팅</option>
							<option value="출판">출판</option>
							<option value="기부·캠페인">기부·캠페인</option>
							<option value="후원">후원</option>
							<option value="모임">모임</option>
						</select>
					</div>
				</div>

				<div class="projectMarginTop">
					<label
						class="wz label FormikFieldDropdown_label__3g5jL Label_label__3oH0h">
						<div class="ToolTipMobile_toolTipContainer__2tYPd">
							<div class="ToolTipMobile_label__1dBSo ToolTipMobile_required__3WiIn">목표 금액</div>
						</div>
						<div style="font-size: 15px; margin-bottom: 15px; color: gray;">
							최대 1억 원 까지 설정 가능해요.</div>
						<div class="mi input right">
							<input type="text" id="fundTargetPrice" name="fundTargetPrice"
								placeholder="목표 금액을 입력해주세요." maxlength="11" value=""
								style="white-space: pre;"> 원
						</div>
					</label>
				</div>



 				<div class="projectMarginTop">
                    <label class="wz label FormikFieldDropdown_label__3g5jL Label_label__3oH0h">
                        <div class="ToolTipMobile_toolTipContainer__2tYPd">
                            <div class="ToolTipMobile_label__1dBSo ToolTipMobile_required__3WiIn">프로젝트 시작일
                            </div>
                        </div>
                        <div style="font-size:15px; margin-bottom: 15px; color: gray;">프로젝트 심사부터 리워드 제작 기간 등 전체 일정을 고려해 설정해 주세요.
                        </div>
                        <div class="funding_input">
                            <div class="funding_input_input">
                                <div class="mi input right funding_input">
                                    <input type="text" placeholder="클릭하여 시작일을 설정해 주세요." readonly id="datepicker" name="fundStartDate" style="width: 273px; margin-right: 10px;">
                                </div>
                            </div>
                        </div>
                    </label>
                </div>


				<div class="projectMarginTop">
					<label
						class="wz label FormikFieldDropdown_label__3g5jL Label_label__3oH0h">
						<div class="ToolTipMobile_toolTipContainer__2tYPd">
							<div
								class="ToolTipMobile_label__1dBSo ToolTipMobile_required__3WiIn">프로젝트
								종료일</div>
						</div>
						<div style="font-size: 15px; margin-bottom: 15px; color: gray;">프로젝트
							심사부터 리워드 제작 기간 등 전체 일정을 고려해 설정해 주세요.</div>
						<div class="funding_input">
							<div class="funding_input_input">
								<div class="mi input right funding_input">
									<input type="text" placeholder="클릭하여 종료일을 설정해 주세요." readonly id="datepicker2" name="fundEndDate" style="width: 273px; margin-right: 10px;">
								</div>
							
							</div>
						</div>
					</label>
				</div>

				<div class="projectMarginTop">
					<label class="mi label dropdown_label">
						<div class="tooltopmobile_tooltip">
							<div class="tooltipmobile_label">
								<p>성인 인증(선택 사항)</p>
							</div>
							<div style="font-size: 15px; margin-bottom: 15px; color: gray;">19세
								이상만 사용할 수 있는 리워드인 경우 체크해 주세요. 체크 시 성인인 서포터만 해당 프로젝트에 펀딩할 수 있어요.<br>
								예시) 전통주, 성인 대상 공연 티켓 등</div>
							<input type="checkbox" /> 19세 이상 펀딩 가능한 리워드입니다.
						</div>
					</label>
				</div>


				<div class="projectMarginTop">
					<!-- <label class="wz label FormikFieldDropdown_label__3g5jL Label_label__3oH0h"> -->
						<div class="ToolTipMobile_toolTipContainer__2tYPd">
							<div
								class="ToolTipMobile_label__1dBSo ToolTipMobile_required__3WiIn">검색용
								태그(#)</div>
						</div>
						<div style="font-size: 15px; margin-bottom: 15px; color: gray;">엔터를
							누르면 최대 10개까지 태그를 등록할 수 있어요.</div>
						<div class="mi input right">
							<input type="text" id="tag" name="tag" placeholder="태그를 입력해주세요."
								maxlength="40" style="white-space: pre;">
								
								<input type="hidden" id="fundTagSave" name="fundTagSave" value="" >
								<input type="hidden" id="fundTag" name="fundTag" value="">
						</div>
						<div class="FundingBaseInfoTagList_listWrapper__wfX5e">
							<div class="FundingBaseInfoTagList_countLabel__4-flO"
								id="tagCount">0/10개의 태그</div>
							<ul id="tag-list" class="ulTagInsert">
							</ul>


						</div>
					<!-- </label> -->
				</div>
				<div class="FundingBaseInfo_btnWrapper__3J9jG" style="margin-top: 40px;">
				<input type="submit" id="submitBtn" class="wz button primary" value="저장하기" onclick="submitData()">
			</div>
			</form>
			

			<!-- content end-->
		</div>
	</div>
<script>
$(function() {
	$("#fundCategory").val('${getSaveData.fundCategory}');
	
	//금액 불러올때 - 천단위 콤마
	const fundTargetPrice = '${getSaveData.fundTargetPrice}';
	let priceResult = fundTargetPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	$("#fundTargetPrice").val(priceResult);
});
</script>
<script>
//목표금액
$("#fundTargetPrice").on("propertychange change keyup paste input",function(e){
	const input = document.querySelector('#fundTargetPrice');	
	 let value = e.target.value;
	 value = Number(value.replaceAll(',', ''));
	 if(isNaN(value)) {
	   input.value = 0;
	 } else if (value > 100000000) {
	  alert("최대 1억원까지 설정 가능해요.");
	  input.value = "100,000,000";
	 } else {
	   const formatValue = value.toLocaleString('ko-KR');
	   input.value = formatValue;
	 }
});
</script>
<script>
$(function() {
    //모든 datepicker에 대한 공통 옵션 설정
    $.datepicker.setDefaults({
       dateFormat: 'yy-mm-dd' //Input Display Format 변경
        ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
        ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
        ,changeYear: true //콤보박스에서 년 선택 가능
        ,changeMonth: true //콤보박스에서 월 선택 가능                
        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
        ,buttonImage: "img/calendar.png" //버튼 이미지 경로
        ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
        ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트                
        ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                      
    });

    //input을 datepicker로 선언
    $("#datepicker").datepicker();                    
    $("#datepicker2").datepicker();
    
   
    $('#datepicker').datepicker();
    $('#datepicker').datepicker("option", "minDate", 0);
    $('#datepicker').datepicker("option", "maxDate", $("#datepicker2").val());
    $('#datepicker').datepicker("option", "onClose", function ( selectedDate ) {
        $("#datepicker2").datepicker( "option", "minDate", selectedDate );
    });

    $('#datepicker2').datepicker();
    $('#datepicker2').datepicker("option", "minDate", $("#datepicker").val());
    $('#datepicker2').datepicker("option", "onClose", function ( selectedDate ) {
        $("#datepicker").datepicker( "option", "maxDate", selectedDate );
    });
    
    //저장된 날짜있다면 불러오기
    if ('${getSaveData.fundStartDate}' != null) {
    	$('#datepicker').datepicker('setDate', '${getSaveData.fundStartDate}');
    	$('#datepicker2').datepicker('setDate', '${getSaveData.fundEndDate}');
    }
});
</script>
	
<script>
<!--태그입력시 -->
var tag = {};
var counter = 0;
var toggleTitle = 0;
var toggleTargetPrice = 0;
var toggleStart = 0;
var toggleEnd = 0;
var toggleImg = 0;
var sumTagText = "";

//태그추가
function addTag(value) {
	tag[counter] = value; // 태그를 Object 안에 추가
	counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.
}

// 최종적으로 서버에 넘길때 tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
function marginTag() {
	return Object.values(tag).filter(
			function(word) {
				return word !== "";
			});
}

$("#tag").on("keyup",function(e) {
	var self = $(this);
	console.log("keypress");

		// input 에 focus 되있을 때 엔터시 구동
		if (e.key === "Enter") {
	
			var tagValue = self.val(); // 값 가져오기
			
			// 값이 없으면 동작 안합니다.
			if (tagValue !== "") {
	
				// 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
				var result = Object.values(tag).filter(
					function(word) {
						return word === tagValue;
				})
	
				// 태그 중복 검사
				if (result.length == 0) {
	
					//div텍스트 값 가져오기 : 0/10개의 태그
					const element = document.getElementById('tagCount');
	
					if (counter >= 10) {
						element.textContent = "10/10개의 태그";
						alert("태그는 10개까지 입력 가능합니다.");
						return false;
					}
					$("#tag-list").append("<li class='tag-item'>"
						+ "<span class='spanTagInsert'>"
						+ tagValue
						+ "<span class='del-btn' idx= '"+counter+"' id='"+tagValue+"'>x</span></span></li>");
					addTag(tagValue);
					
					
					self.val("");
					console.log("counter: " + counter);
					element.textContent = counter + "/10개의 태그";
					
					
					sumTagText = sumTagText+tagValue+',';
					console.log("sumTagText : "+sumTagText);
					
					$('input[name=fundTagSave]').attr('value', tagValue);
				
					$('#fundTag').val(sumTagText);
		
					if(sumTagText != null) {
						toggleTag = 1;
			    	} else {
			    		toggleTag = 0;
			    	}
			    	judgeBtn();
					
				} else {
					alert("태그값이 중복됩니다.");
				}
			}
			e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지
		
	}
});

//저장된 태그 추가
$(function() {
	var arr1 = [];
	arr1 = '${getSaveData.fundTag}'.split(",");
	console.log('${getSaveData.fundTag}');
	var tagText = "";
	
	if( arr1.length != 0) {
		const element = document.getElementById('tagCount');
		element.textContent = arr1.length-1 + "/10개의 태그";
		
		console.log("1");
		for(var i = 0; i < arr1.length-1; i++) {
			
			var tagValue = arr1[i];
				
			$("#tag-list").append("<li class='tag-item'>"
					+ "<span class='spanTagInsert'>"
					+ tagValue
					+ "<span class='del-btn' idx='" + counter + "' id='"+tagValue+"'>x</span></span></li>");
			addTag(tagValue);
			
			sumTagText = sumTagText+tagValue+',';
			console.log("sumTagText : "+sumTagText);
			
			$('#fundTag').val(sumTagText);

		}
	}
});

var toggleTag = 0;
// 삭제 버튼
$(document).on("click", ".del-btn", function(e) {
	var index = $(this).attr("idx");
	//var tagValue1 = $(this).attr("id");
	var tagValue = $(this).prop("id");

	tag[index] = "";
	$(this).parent().parent().remove();
	counter--;
	const element = document.getElementById('tagCount');
	element.textContent = counter + "/10개의 태그";
	
	sumTagText = sumTagText.replace( tagValue+",", "");

	console.log("sumTagText : "+sumTagText);
	
	$('#fundTag').val(sumTagText);
	
	if($('#fundTag').val() == "") {
		toggleTag = 0;
		judgeBtn();
	}
});

</script>
 <script>
$(document).on("click", "#closeBtn", function(e) {
    alert("삭제합니다.");
    $("#imageUploadBt").css('display','');
    $("#image_container").empty();
    
    toggleImg = 0;
	btnDisabled();
});
</script>

 <script>
 toggleTitle = 0;
 toggleTargetPrice = 0;
 toggleStart = 0;
 toggleEnd = 0;
 
 	btnDisabled();
 
 	$(function() {
 		console.log("2");
 	 	
 	 	console.log($('#title').val());
 	 	console.log("목표금액 : "+ $('#fundTargetPrice').val());
 	 	console.log($('#datepicker').val());
 	 	console.log($('#datepicker2').val());
 	 	console.log($('#fundTag').val());
 	 	
 		if( $('#title').val() != "" ) {
 	 		toggleTitle = 1;
 	 	}
 	 	if( $('#fundTargetPrice').val() != "" ) {
 	 		toggleTargetPrice = 1;
 	 	}
 	 	if( $('#datepicker').val() != "" ) {
 	 		toggleStart = 1;
 	 	}
 	 	if( $('#datepicker2').val() != "" ) {
 	 		toggleEnd = 1;
 	 	}
 	 	if( $('#fundTag').val() != "" ) {
 	 		toggleTag = 1;
 	 	}
 	 	if($('#closeBtn').length > 0 ) {
 	 		toggleImg = 1;
 	 	}
 	 	judgeBtn();
 	});
 	
    $('#title').on('input', setToggleTitle);
   $('#fundTargetPrice').on('input', setToggleTargetPrice);
    $('#datepicker').on("propertychange change keyup paste input", function() {
    	var currentVal = $(this).val();
    	if(currentVal != null) {
    		toggleStart = 1;
    	} else {
    		toggleStart = 0;
    	}
    	judgeBtn();
    });
   
    $('#datepicker2').on("propertychange change keyup paste input", function() {
    	var currentVal = $(this).val();
    	if(currentVal != null) {
    		toggleEnd = 1;
    	} else {
    		toggleEnd = 0;
    	}
    	judgeBtn();
    });
    
    $('#fundTag').on("propertychange changed keyup paste input", function() {
    	var currentVal = $(this).val();
    	console.log(currentVal);
    	if(currentVal != null) {
    		toggleTag = 1;
    	} else {
    		toggleTag = 0;
    	}
    	judgeBtn();
    });
  
    // 토글 변수를 사용해서 입력값의 유무 상태를 기록한다.(입력값 없을 시 0)
    // 이를 통해 입력값을 지울 경우 입력값이 없는 상태로 업데이트 가능하다.
    // judgeBtn 함수를 호출하여 버튼 활성화 여부를 결정한다.
    function setToggleTitle() {
      var input = $('#title').val();
      if(input.length > 0) { //input.length : 한글자 쓸때마다 1 2 3 .. 지울때마다  2 1 0..
    	  toggleTitle = 1;
      } else {
    	  toggleTitle = 0;
      }
      judgeBtn();
    }
    
    function setToggleTargetPrice() {
        var input = $('#fundTargetPrice').val();
        console.log("금액 input : " + input);
        if(input.length > 0) {
        	toggleTargetPrice = 1;
        } else {
        	toggleTargetPrice = 0;
        }
        judgeBtn();
      }
    
  
    // 버튼 활성화 여부를 결정하는 함수
    function judgeBtn() {
      if (toggleTitle === 1 && toggleTargetPrice === 1 && toggleStart === 1 && toggleEnd ===1 && toggleTag ===1 && toggleImg ===1) {
    	  console.log("btnEnabled()실행");
        btnEnabled();
      } else {
    	 console.log("실행~!!");
        btnDisabled();
      }
    }

    function btnDisabled() {
      $('#submitBtn').css('background-color', '#90949c');
      // 버튼이 비활성화되었을 때 마우스오버 효과를 없애기 위한 코드
      setShadowNone();
      $('#submitBtn').attr('disabled', true);
      // console.log('btnDisabled');
    }

    function btnEnabled() {
      $('#submitBtn').css('background-color', '#00c4c4');
      // 아래 코드도 버튼 활성화가 가능하다.
      // $('#submit-btn').attr('disabled', false);
      $('#submitBtn').removeAttr('disabled');
      $('#submitBtn').on('mouseover', setShadow);
      $('#submitBtn').on('mouseleave', setShadowNone);
    }

    function setShadow() {
      console.log('setShadow');
      $('#submitBtn').css('box-shadow', '0 2px 4px 0 rgba(0, 0, 0, 0.50)');
    }

    function setShadowNone() {
      $('#submitBtn').css('box-shadow', 'none');
    }
    
    function submitData() {
        document.getElementById('myForm').submit();
        alert("저장되었습니다.")
     }
</script>

</body>
</html>