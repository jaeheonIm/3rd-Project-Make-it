<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="/common/Header_jy.jsp"%>
<body>
	<p>${membership_name}
	<p>
	<div class="wrapper d-flex align-items-stretch">
		<%@include file="/common/Nav.jsp"%>
		<div id="content" class="p-4 p-md-5">
			<%@include file="/common/TopButton.jsp"%>
			<!-- content start -->
			<div>
				<h2 class="fundingFromContainer_title">스토리 작성</h2>
				<p>메이커님의 프로젝트를 소개해 주세요.</p>
			</div>

			<form name="dataForm" id="dataForm" onsubmit="return registerAction()">
			   <input type="hidden" name="fundIdx" id="fundIdx" value="${fund.fundIdx}" >
				<div>
						<div class="tooltopmobile_tooltip">
							<div class="tooltipmobile_label" style="margin-top: 20px;">
								<p>소개 영상·사진 등록</p>
							</div>
							<div style="font-size: 15px; margin-bottom: 15px; color: gray;">
								프로젝트에서 보여 주고 싶은 영상이나 사진을 순서대로 등록해 주세요.
							</div>
							<div>
								<input type="radio" name="story_uploadChoice" value="영상" 
									class="radio" onclick="div_show(this.value,'divshowVideo');" />
								소개 영상
							</div>

							<div class="field Form_field__35I9T StoryVideoField_field__CrP-m"
								id="divshowVideo" style="display: none;">
								<div class="StoryVideoField_videoInput__30CMJ">
									<div class="wz input error right StoryVideoField_input__2fUfc">
										<input id="storyVideo" name="storyInfo.videoUrl"
											placeholder="영상 URL 입력" type="text" value="">
									</div>
									<button type="button" class="wz button gray"
										onclick="div_show(this.value,'divshowUrl');" value="url">등록</button>
								</div>
								<!-- <em class="helper StoryVideoField_helper__YF6Jn error"
									id="storyVideoUrl">영상 URL을 확인하고 다시 등록해 주세요.</em> -->

								<!--url등록시 보임-->
								<div class="StoryVideoField_container__1HAZ8" id="divshowUrl"
									style="display: none; margin-top: 20px;">
									<iframe title="대표 영상" src="" frameborder="0" id="urlShow"></iframe>
									<button type="button"
										class="wz button less icon small StoryVideoField_closeBtn__3KGdu"
										id="closeBtn">
										<i aria-hidden="true" class="icon close"></i>
									</button>
								</div>
							</div>

							<div>
								<input type="radio" name="story_uploadChoice" value="사진" id = "story_uploadChoice_img"
									class="radio" onclick="div_show(this.value,'divshowPhoto');" />
								소개 사진
							</div>

							<!--사진선택시 보임-->
							<div class="field Form_field__35I9T required ImageFormField_field__X1jTW StoryImageField_field__2BLTd" id="divshowPhoto" style="display: none;">
								<div class="ImageFormField_buttonWrapper__su3pO">

									<div class="wz button gray" id="btn-upload" style="padding-top: 14px;">
										<i class="fa-solid fa-camera"></i> 등록하기 
									</div>
										<!--  <button id="btn-upload" type="button" style="border: 1px solid #ddd; outline: none;">파일 추가</button>-->
										
											<input id="input_file" multiple="multiple" type="file" style="display:none;">
											<span style="font-size:14px; color: gray;">※사진은 최대 10개까지 등록 가능해요.</span>
										  	<div class="data_file_txt" id="data_file_txt" style="margin:20px; font-size:13px; ">
												<!-- <span>첨부 사진</span> -->
												<br />
												<div id="articlefileChange"></div>
												
											</div>
											
										</div> 
										
                            		
								</div>
							</div>
							<div class="FundingBaseInfo_btnWrapper__3J9jG" style="margin-top: 40px;">
								<button type="submit" class="wz button primary" id="save_bt" >저장하기</button>
							</div>
								
						</div>
					
			</form>
		</div>
	</div>
<script>
//사진 있는지 확인
var toggleImg = 0; 
//파일 현재 필드 숫자 totalCount랑 비교값
var fileCount = 0;
// 해당 숫자를 수정하여 전체 업로드 갯수를 정한다.
var totalCount = 10;
// 파일 고유넘버
var fileNum = 0;
// 첨부파일 배열
var content_files = new Array();

//저장된 사진있으면 가져오기
$(function() {
   if ('${getSaveData.fundDetailImg}' != null) {
   	var arr1 = [];
   	arr1 = '${getSaveData.fundDetailImg}'.split(";");
   	console.log("arr1 : " + arr1);
   	
   	var tagText = "";
   	
   	if( arr1.length != 0) {

   		for(var i = 0; i < arr1.length-1; i++) {
   			
   			var tagValue = arr1[i];
   			content_files.push(tagValue);	
   			console.log("content_files1 : " + content_files);
   			$('#articlefileChange').append(
   		       		'<div id="file' + fileNum + '" onclick="fileDelete(\'file' + fileNum + '\')">'
   		       		+ '<font style="font-size:14px">' + tagValue + '&nbsp;</font>'
   		       		+ '<img src="img/icon_minus.png" style="width:17px; height:auto; vertical-align: middle; cursor: pointer;  />"/>' 
   		       		+ '<div/>'
   			);
   			var img = document.createElement("img");
   			img.setAttribute("src", "img/fundingStoryImg/" + tagValue);
   	        img.setAttribute("style", "width:200px; margin-bottom:20px;");
   	        
   	        $("#file" + fileNum).append(img);
   	        
   	        fileNum ++;
   		}
   	}
   }
   
 	//사진 유무에 따라 저장하기 버튼 활성화 or 비활성화
	const imgDiv = document.getElementById('articlefileChange');
	if(imgDiv.hasChildNodes()) {
		btnEnabled();
	} else {
		btnDisabled();
	}
}); 

//input file 파일 첨부시 fileCheck 함수 실행
$("#input_file").on("change", fileCheck);

function fileCheck(e) {
	//파일추가시 저장하기 버튼 활성화
	btnEnabled();
	
    var files = e.target.files;
    // 파일 배열 담기
    var filesArr = Array.prototype.slice.call(files);

    // 파일 개수 확인 및 제한
    if (fileCount + filesArr.length > totalCount) {
      alert('사진은 최대 '+totalCount+'개까지 업로드 할 수 있어요.');
      return;
    } else {
    	 fileCount = fileCount + filesArr.length;
    }
    
    // 각각의 파일 배열담기 및 기타
    filesArr.forEach(function (f) {
      var reader = new FileReader();
      reader.onload = function (e) {
        content_files.push(f);
        $('#articlefileChange').append(
       		'<div id="file' + fileNum + '" onclick="fileDelete(\'file' + fileNum + '\')">'
       		+ '<font style="font-size:14px">' + f.name + '&nbsp;</font>'
       		+ '<img src="img/icon_minus.png" style="width:17px; height:auto; vertical-align: middle; cursor: pointer;  />"/>' 
       		+ '<div/>'
		);
        
        var img = document.createElement("img");
        img.setAttribute("src", e.target.result);
        img.setAttribute("style", "width:200px");
        
        $("#file" + fileNum).append(img);
        
        fileNum ++;
      };
      reader.readAsDataURL(f);
    });
    console.log("content_files : " + content_files);
    //초기화 한다.
    $("#input_file").val("");
    
}

$('#btn-upload').click(function (e) {
    e.preventDefault();
    $('#input_file').click();
});

// 파일 부분 삭제 함수
function fileDelete(fileNum){
    var no = fileNum.replace(/[^0-9]/g, "");
    content_files[no].is_delete = true; //파일 리스트의 해당 인덱스에 is_delete=true 라는 키와 값을 추가한다
   
	$('#' + fileNum).remove(); //파일 삭제함
	fileCount --;
   console.log("파일삭제1 : "+ content_files);
   
   ///사진 유무에 따라 저장하기 버튼 활성화 or 비활성화
   const imgDiv = document.getElementById('articlefileChange');
	console.log(imgDiv.hasChildNodes());
	if(imgDiv.hasChildNodes()) {
		btnEnabled();
	} else {
		btnDisabled();
	}
}

/*
 * 폼 submit 로직
 */
function registerAction(){
	var form = $("form")[0];        
 	var formData = new FormData(form);
		for (var x = 0; x < content_files.length; x++) {
			
			if(!content_files[x].is_delete){ // 삭제 안한것만 담아 준다. (is_delete가 추가되지 않은것만)
				 formData.append("article_file", content_files[x]);
			}
		}
   /*
   * 파일업로드 multiple ajax처리
   */    
	$.ajax({
			type: "POST",
			enctype: "multipart/form-data",
			url: "file-upload.do",
			data : formData,
			processData: false,
			async: false,
			cache: false,
			contentType: false,
   	      success: function (result) {
   	    	if(result == "Y"){
   	    		alert("저장하였습니다.");
			} else
				alert("사진을 넣어주세요.");
   	      },
   	      error: function (xhr, status, error) {
   	    	alert("[에러발생] 관리자에게 문의하세요.");
   	     return false;
   	      }
	});
	return false;
}
</script>
<script>
var imageCnt = 0;
function div_show(value, id) {
    if (value == "영상") {
        document.getElementById(id).style.display = "";
        document.getElementById('divshowPhoto').style.display = "none";
    } else if (value == "사진") {
        document.getElementById(id).style.display = "";
        document.getElementById('divshowVideo').style.display = "none";
    } else if (value == "url") {
        document.getElementById(id).style.display = "";
        var url = document.getElementById('storyVideo').value;

        if (url.indexOf("youtu.be") != -1) { //youtu.be를 포함할때
            var lastUrlPos = url.lastIndexOf('/');
            var lastUrl = "https://www.youtube.com/embed" + url.substring(lastUrlPos);
            $("#urlShow").attr("src", lastUrl);
        } //   https://youtu.be                    /USZcvpEWAcY
        //    https://www.youtube.com/embed       /USZcvpEWAcY

        if (url.indexOf("youtube.com") != -1) { //youtube.com를 포함할때
            var lastUrlPos = url.lastIndexOf('=');
            var lastUrl = "https://www.youtube.com/embed/" + url.substring(lastUrlPos + 1);
            $("#urlShow").attr("src", lastUrl);
        } //   https://www.youtube.com/watch?v=      Y5MixfYTVLk
        //    https://www.youtube.com/embed/        Y5MixfYTVLk
    }
}
   
$(document).on("click", "#closeBtn", function(e) {
	   $("#divshowUrl").css('display', 'none');
       $("#storyVideo").val("");
});
</script>
<script>
function judgeBtn() {
    if (toggleImg === 1) {
    	console.log("버튼 활성화");
      btnEnabled();
    } else {
    	console.log("버튼 비활성화");
      btnDisabled();
    }
  }
  
function btnDisabled() {
    $('#save_bt').css('background-color', '#90949c');
    // 버튼이 비활성화되었을 때 마우스오버 효과를 없애기 위한 코드
    setShadowNone();
    $('#save_bt').attr('disabled', true);
    // console.log('btnDisabled');
  }
function btnEnabled() {
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
</body>
</html>
