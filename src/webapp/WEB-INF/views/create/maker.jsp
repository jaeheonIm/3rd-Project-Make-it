<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<%@include file ="/common/Header_jy.jsp" %>
<body>
	<div class="wrapper d-flex align-items-stretch">
		<%@include file ="/common/Nav.jsp" %>
			<div id="content" class="p-4 p-md-5">
				<%@include file ="/common/TopButton.jsp" %>
				<!-- content start -->
				
            <div>
                <h2 class="fundingFromContainer_title">메이커 정보</h2>
            </div>

            <form action="updateMaker.do" method="post" enctype="multipart/form-data" id="myForm" onkeypress="if(event.keyCode=='13'){event.preventDefault();}">
            <input type="hidden" name="fundIdx" value="${fund.fundIdx}">
                <div>
                    <label class="wz label FormikFieldDropdown_label__3g5jL Label_label__3oH0h" style="margin-top: 20px;">
                        <div class="ToolTipMobile_toolTipContainer__2tYPd">
                            <div class="ToolTipMobile_label__1dBSo ToolTipMobile_required__3WiIn" >메이커명
                            </div>
                        </div>
                         <div style="font-size:15px; margin-bottom: 15px; color: gray;">법인 사업자는 법인등기부상 법인명 / 개인 사업자는 주민등록상 성명 또는 상호 / 개인은 주민등록상 성명을 입력해 주세요.
                        </div>
                        <div class="mi input right">
                            <input type="text" id="fundMakerName" name="fundMakerName" placeholder="메이커명을 입력하세요." 
                            		value="${getSaveData.fundMakerName}" maxlength="40" style="white-space: pre;"><br>
                            <div class="fundMakerName regex"></div>
                        </div>
                    </label>
                </div>

				<div class="FundingBaseInfoImageField_container__2Q_xy" style="margin-top: 20px;">
					<label class="wz label Label_label__3oH0h">
						<div class="ToolTipMobile_toolTipContainer__2tYPd">
							<div class="ToolTipMobile_label__1dBSo ToolTipMobile_required__3WiIn">메이커 이미지</div>
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
                          		 <c:if test="${not empty getSaveData.fundMakerImg }">
									<img src="img/makerImg/${getSaveData.fundMakerImg}" style="width:300px;">
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
                                        document.querySelector("div#image_container").appendChild(img);
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
                
               
                 <div>
                    <label class="wz label FormikFieldDropdown_label__3g5jL Label_label__3oH0h" style="margin-top: 20px;">
                        <div class="ToolTipMobile_toolTipContainer__2tYPd">
                            <div class="ToolTipMobile_label__1dBSo ToolTipMobile_required__3WiIn">문의 이메일
                            </div>
                        </div>
                        <div class="mi input right">
                            <input type="text" id="fundMakerEmail" name="fundMakerEmail" placeholder="이메일 입력" 
                            		value="${getSaveData.fundMakerEmail}" style="white-space: pre;" ><br>
                            <div class="fundMakerEmail regex"></div>
                        </div>
                    </label>
                </div>
                
                 <div>
                    <label class="wz label FormikFieldDropdown_label__3g5jL Label_label__3oH0h" style="margin-top: 20px;">
                        <div class="ToolTipMobile_toolTipContainer__2tYPd">
                            <div class="ToolTipMobile_label__1dBSo ToolTipMobile_required__3WiIn">문의 전화번호
                            </div>
                        </div>
                        <div class="mi input right">
                            <input type="text" name="fundMakerCallNumber" id="fundMakerCallNumber" maxlength="40"  
                            		value="${getSaveData.fundMakerCallNumber}" oninput="autoHyphen(this)" maxlength="13" placeholder="숫자만 입력하세요" 
                            		autofocus style="white-space: pre;">
                        </div>
                    </label>
                </div>

               <div class="projectMarginTop">
                   <div>
                       <div class="normalInput">
                           <p>함께하는 멤버 (선택 사항)</p>
                           <p class="normalInput_p">와디즈 회원으로 가입된 팀원이 있다면 함께 소개해 주세요. 서포터님들의 신뢰를 높일 수 있어요.<br>('프로젝트 최종 등록시' 혹은 '나의 펀딩 > 멤버관리에서 추가시' 멤버에게 초대 메일이 전송돼요.)</p>
						</div>
						<div class="mi input right">
	                       <input type="text" id="inputMemberEmail" placeholder="멤버의 이메일 입력"  style="white-space: pre; width: 584px;">
							<button type="button" class="wz button gray" id="memberPlusBtn">추가</button>
							<div class="inputMemberEmail regex"></div>
						
								<input type="hidden" id="fundTagSave" name="fundTagSave" value="" >
								<input type="hidden" id="fundTeamMember" name="fundTeamMember" value="">
						</div>
						<div class="FundingBaseInfoTagList_listWrapper__wfX5e">
							<ul id="tag-list" class="ulTagInsert"></ul>
						</div>
						
                   </div>
                  
               </div>
               
               <div class="projectMarginTop">
					<div>
                       	<div class="normalInput">
                                <p>홈페이지 (선택 사항)</p>
                        </div>
                        <div class="mi input right" >
                         	<input type="text" name="fundMakerHomepage" placeholder="홈페이지 URL 입력" value="${getSaveData.fundMakerHomepage}" maxlength="40" >
                        </div>
					</div>
                </div>
				<div class="FundingBaseInfo_btnWrapper__3J9jG" style="margin-top: 40px;">
				<input type="submit" id="submitBtn" class="wz button primary" value="저장하기" onclick="submitData()">
			</div>

            </form>
				<!-- content end-->
			</div>
	</div>
	
	
	<div class="modal-wrapper">
        <div class="modal2">
            <p class="modal2_p">멤버 추가는  회원으로 <strong>가입된 이메일 계정</strong>만 가능해요.<br>
            	이메일 주소를 다시 확인해주세요.</p>
            <div class="close-wrapper">
                <button id="close" onclick="closeModal();" style="color:#00b2b2">닫기</button>
            </div>
        </div>
    </div>
<script>
function submitData() {
	alert("저장되었습니다.");
	document.getElementById('myForm').submit();
}
</script>
<script>

</script>
<script>
//번호
const autoHyphen = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
}
$(function() {
	//이메일
	$("#fundMakerEmail").on("propertychange change keyup paste",function(){
	     var regex =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	     var result = regex.exec($("#fundMakerEmail").val());
	    
	    if(result != null){
	       $(".fundMakerEmail.regex").html("");  
	    }else{
	        $(".fundMakerEmail.regex").html("올바른 이메일 형식이 아니에요.");
	    }
	});
	$("#inputMemberEmail").on("propertychange change keyup paste",function(){
	     var regex =  /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	     var result = regex.exec($("#inputMemberEmail").val());
	    
	    if(result != null){
	       $(".inputMemberEmail.regex").html("");  
	    }else{
	        $(".inputMemberEmail.regex").html("올바른 이메일 형식이 아니에요.");
	    }
	});
});
</script>
 <script>
var toggleName = 0;
var toggleEmail = 0;
var toggleCall = 0;
var toggleImg = 0;
var sumTagText = "";
	

$(function() {
 	btnDisabled();
 	console.log(" $('#closeBtn').length  : " + $('#closeBtn').length );
 	if( $('#fundMakerName').val() != "" ) {
 		toggleName = 1;
 	}
 	if( $('#fundMakerEmail').val() != "" ) {
 		toggleEmail = 1;
 	}
 	if( $('#fundMakerCallNumber').val() != "" ) {
 		toggleCall = 1;
 	}
 	if($('#closeBtn').length > 0 ) {
 		toggleImg = 1;
 	}
 	 judgeBtn();
 	
    $('#fundMakerName').on('input', setToggleName);
    $('#fundMakerEmail').on('input', setToggleEmail);
    $('#fundMakerCallNumber').on('input', setToggleCall);
    
});


	

</script>
<script>
//로드시 이메일 불러오기
$(function() {
	var arr1 = [];
	arr1 = '${getSaveData.fundTeamMember}'.split(",");
	console.log("fundTeamMember :" + '${getSaveData.fundTeamMember}');
	var tagText = "";
	
	if( arr1.length != 0) {
		console.log("1");
		for(var i = 0; i < arr1.length-1; i++) {
			
			var tagValue = arr1[i];
				
			$("#tag-list").append("<li class='tag-item'>"
					+ "<span class='spanTagInsert' style='margin-top: 10px;'>"
					+ tagValue
					+ "<span class='del-btn' idx= '"+counter+"' id='"+tagValue+"'>x</span></span></li>");
				addTag(tagValue);
			
			sumTagText = sumTagText+tagValue+',';
			console.log("sumTagText : "+sumTagText);

			$('#fundTeamMember').val(sumTagText);

		}
	}
});

</script>
<script>
<!--태그입력시 -->
var tag = {};
var counter = 0;

// 태그를 추가한다.
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
//토글 변수를 사용해서 입력값의 유무 상태를 기록한다.(입력값 없을 시 0)
// 이를 통해 입력값을 지울 경우 입력값이 없는 상태로 업데이트 가능하다.
// judgeBtn 함수를 호출하여 버튼 활성화 여부를 결정한다.
function setToggleName() {
  var input = $('#fundMakerName').val();
  if(input.length > 0) {
	  toggleName = 1;
  } else {
	  toggleName = 0;
  }
  judgeBtn();
}

function setToggleEmail() {
    var input = $('#fundMakerEmail').val();
    if(input.length > 0) {
    	toggleEmail = 1;
    } else {
    	toggleEmail = 0;
    }
    judgeBtn();
  }
  
function setToggleCall() {
    var input = $('#fundMakerCallNumber').val();
    if(input.length > 0) {
    	toggleCall = 1;
    } else {
    	toggleCall = 0;
    }
    judgeBtn();
  }


// 버튼 활성화 여부를 결정하는 함수
function judgeBtn() {
  if (toggleName === 1 && toggleEmail ===1 && toggleCall ===1 && toggleImg ===1) {
    btnEnabled();
  } else {
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
  $('#submitBtn').css('box-shadow', '0 2px 4px 0 rgba(0, 0, 0, 0.50)');
}

function setShadowNone() {
  $('#submitBtn').css('box-shadow', 'none');
}

$(document).on("click", "#closeBtn", function(e) {
    alert("삭제합니다.");
    $("#imageUploadBt").css('display','');
    $("#image_container").empty();
    
	toggleImg = 0;
	btnDisabled();
});
function emailCheckAfter() {

	if ('${MemberEmailOk.memberEmail}' != null) {
	    console.log("MemberEmailOk이메일만 : " + '${MemberEmailOk.memberEmail}');
		var self = $("#inputMemberEmail");
			
		var tagValue = self.val(); // 값 가져오기
		
		// 값이 없으면 동작 안함.
		if (tagValue !== "") {
	
			// 같은 태그가 있는지 검사한다. 있다면 해당값이 array 로 return 된다.
			var result = Object.values(tag).filter(
				function(word) {
					return word === tagValue;
			})
		
			// 태그 중복 검사
			if (result.length == 0) {
				$("#tag-list").append("<li class='tag-item'>"
					+ "<span class='spanTagInsert' style='margin-top: 10px;'>"
					+ tagValue
					+ "<span class='del-btn' idx= '"+counter+"' id='"+tagValue+"'>x</span></span></li>");
				addTag(tagValue);
				
				self.val("");
			
				$('input[name=fundTagSave]').attr('value', tagValue);
				
				//var tagText = $(".spanTagInsert").text();
				//console.log("tagText : " + tagText);
				//var tagText2 = tagText.split("x");
				//console.log("tagText2 : " + tagText2);
			
				sumTagText = sumTagText+tagValue+",";
				console.log("추가버튼 클릭 시 sumTagText : "+sumTagText);
				//$('input[name=fundTeamMember]').attr('value', tagText2);
				//$('#fundTeamMember').val(tagText2);
				$('#fundTeamMember').val(sumTagText);
				
			} else {
				alert("이미 추가한 이메일입니다.");
			}
		}
			/* e.preventDefault(); // SpaceBar 시 빈공간이 생기지 않도록 방지 */
		
		}
	}
	
//추가버튼
$(document).on("click", "#memberPlusBtn", function() {
	var fundTeamMember = $('#inputMemberEmail').val();
	console.log("fundTeamMember 인풋 값: " + fundTeamMember);
	 $.ajax({
		type : "POST",
		url : "checkMemberEmail.do",
		data : {
			fundTeamMember : fundTeamMember
		},
		success : function(data) {
				if (data == "Y") { //성공
					emailCheckAfter();
				} else { // 실패
					errorModal();
				}
	     },
		error : function() {
			alert("데이터 전송 실패.");
		}
		
	});
});

// 삭제 버튼
$(document).on("click", ".del-btn", function(e) {
	var index = $(this).attr("idx");
	console.log("삭제버튼 index : " + index);
	
	var tagValue = $(this).prop("id");
	console.log("삭제버튼 tagValue : " + tagValue);

	tag[index] = "";
	$(this).parent().parent().remove();
	counter--;
	
	sumTagText = sumTagText.replace(tagValue+",", "");
	console.log("삭제버튼 클릭 시 sumTagText : "+sumTagText);
	
	//var fundTagValue = $('#fundTeamMember').val().replace(tagValue+",", "");
	$('#fundTeamMember').val(sumTagText);
	
});

</script>
<script>
const open = document.getElementById("open");
const close = document.getElementById("close");
const modal = document.querySelector(".modal-wrapper");

function errorModal() {
	modal.style.display = "flex";
}
function closeModal() {
	modal.style.display = "none";
}
</script>
</body>
</html>