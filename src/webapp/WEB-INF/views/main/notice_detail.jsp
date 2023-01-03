<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<head>
<meta charset="UTF-8">
<meta name="description" content="">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

<!-- Title  -->
<title>detail</title>

<!-- Favicon  -->
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Style CSS -->
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="css/main/main.css">
<style type="text/css">
.btn-symp-red{
	float: left;
    padding: 0px 0px 0 20px;
    height: 30px;
    line-height: 30px;
    font-size: 13px;
    color: black;
    border: none;
    outline: none;
	background-image: url(img/main/icon_red_heart.png);
	background-repeat:no-repeat;
    background-size: 20px 18px;
    background-color: window;
    background-position: center;
}  

</style>
<script>
//하트클릭시
function heartUpdate(){
	var csIdx = ${vo.csIdx};
		$.ajax("heartUpdate.do",{
			type:"get",
			data : {"csIdx":csIdx},
			dataType:"json",
			success:function(data){
				console.log(data.memberId);
				var vo = data.vo;
				if(data.memberId != ""){
					if(data.result==1){
						heartHtml="<button type='button' class='btn-symp' onclick='heartUpdate()'style='outline: none;'><span id='sympCount'>"+vo.csHeart+"</span></button>";
					}else if(data.result==0){
						heartHtml="<button type='button' class='btn-symp-red' onclick='heartUpdate()'style='outline: none;'><span id='sympCount'>"+vo.csHeart+"</span></button>";
					}
					heartHtml+="<div class='btn-share'><button class='kakao' onclick=\"shareSNS('kakao')\"></button>"
					heartHtml+="<button class='facebook' onclick=\"shareSNS('facebook')\"></button>"
					heartHtml+="<button class='twitter' onclick=\"shareSNS('twitter')\"></button></div>";
					console.log(heartHtml);
					$("#heartinsert").html(heartHtml);
				}else{
					location.href="loginForm.do";//로그인페이지로 이동변경하기
				}
			},

			error:function(){
				alert("ajax실패");
			}	
		});	
	}

function shareSNS(snsname) {
    var thisUrl = document.URL;
    var snsTitle = "${vo.csTitle}";
    var snsContent = "${vo.csTitle}";
    if( snsname == 'facebook' ) {
        var url = "http://www.facebook.com/sharer.php?u="+encodeURIComponent(thisUrl);
        window.open(url, "", "width=800, height=800");
    }
    else if( snsname == 'twitter' ) {
        var url = "http://twitter.com/share?url="+encodeURIComponent(thisUrl)+"&text="+encodeURIComponent(snsTitle);
        window.open(url, "tweetPop", "width=800, height=800,scrollbars=yes");
    }
    else if( snsname == 'kakao' ) {
    	    // 사용할 앱의 JavaScript 키 설정
    	    Kakao.init('03d3efc0e4481ccaeb5e1f9df3fbb84d');
    	    
    	    // 카카오링크 버튼 생성
    	    Kakao.Link.createDefaultButton({
    	        container: '#btnkakao', // HTML에서 작성한 ID값
    	        objectType: 'feed',
    	        content: {
    	        title: snsTitle, // 보여질 제목
    	        description: snsContent, // 보여질 설명
    	        imageUrl: thisUrl, // 콘텐츠 URL
    	        link: {
    	            webUrl: thisUrl
    	        }
    	        }
    	    });
    } 
}
	
</script>
</head>

<body>
<!-- Header -->
<c:if test="${user.memberId ne ''}">
<%@include file ="/common/Header.jsp" %>
</c:if>
<c:if test="${user.memberId eq ''}">
<%@include file ="/common/Header_N.jsp" %>
</c:if>
<!-- Header -->
		 <!-- Breadcumb Area -->
    <div class="breadcumb_area">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12" style="text-align: center; ">
                    <h5 style="font-size: 1.5em;">Detail</h5>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcumb Area -->


	<!-- FAQ Area -->
	<section class="faq--area section_padding_100_70" style="text-align: center;">
		<div class="container" id="con1">
			<div class="board-main">
				<ul>
					<li>
						<div class="info">
							<h3 class="title">${vo.csTitle }</h3><br>
							<div style="text-align: center;">
								<div class="writer">
									<p class="make_it"></p>
								</div>
								<div class="writer">
									<span class="author">관리자 </span><br>
									<span class="created-at">${vo.csDate }</span>
								</div>
							</div>
						</div>
					</li>					
				</ul>
				<hr>
				<ul>
				<c:if test="${vo.csImg ne \"\"}">
					<c:forEach var="img" items="${imgArr }">
						<li>
							<img alt="사진" src="img/main/notice_detail/${img }">
						</li>
					</c:forEach>	
				</c:if>
				<c:if test="${vo.csContent ne '' }">
					<li>
						<p style="color: black; text-align: left; white-space:pre-line; margin-bottom: 150px;  padding: 0 50px;">${vo.csContent }</p>
					</li>
				</c:if>
				</ul>
				<ul>
					<li>
						<div class="wcommunity-share-area" id="heartinsert">

						<c:choose>
							<c:when test="${result==0}">
   								<button type="button" class="btn-symp" onclick="heartUpdate()"style="outline: none;"><span id="sympCount">${vo.csHeart}</span></button>
   							</c:when>
   							<c:otherwise>
   								<button type="button" class="btn-symp-red" onclick="heartUpdate()" style="outline: none;"><span id="sympCount">${vo.csHeart}</span></button>
							</c:otherwise>
						</c:choose>

   							<div class="btn-share">
	   							<button class="kakao" onclick="shareSNS('kakao')" id="btnkakao" style="outline:none;"></button>
	   							<button class="facebook" onclick="shareSNS('facebook')" style="outline:none;"></button>
	   							<button class="twitter" onclick="shareSNS('twitter')" style="outline:none;"></button>
   							</div>
						</div>
					</li>
				</ul>
				<br><br><hr>
			</div>
		</div>
		<div class="container" >
			<div class="board-main">
				<div>
					<ul>
					<c:if test="${category eq '' }">
						<li>
							<form action="notice.do">
								<input type="hidden" name="cPage" value="${cPage }">
								<button type="submit" class="btn btn-primary">목록으로</button>	
							</form>
						</li>					
					</c:if>
					<c:if test="${category eq 'EVENT' }">
						<li>
							<form action="notice_EVENT.do">
								<input type="hidden" name="cPage" value="${cPage }">
								<input type="hidden" name="category" value="${category }">
								<button type="submit" class="btn btn-primary">목록으로</button>	
							</form>
						</li>					
					</c:if>
					<c:if test="${category eq 'NOTICE' }">
						<li>
							<form action="notice_NOTICE.do">
								<input type="hidden" name="cPage" value="${cPage }">
								<input type="hidden" name="category" value="${category }">
								<button type="submit" class="btn btn-primary">목록으로</button>	
							</form>
						</li>					
					</c:if>
					
					</ul>
				</div>
			</div>
		</div>
	</section>
	<!-- FAQ Area End -->




	<!-- jQuery (Necessary for All JavaScript Plugins) -->
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

</body>
<%@include file="/common/Footer.jsp"%>
</html>