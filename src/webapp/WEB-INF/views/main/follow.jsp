<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
<title>follow</title>

<!-- Favicon  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Style CSS -->
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="css/main/main.css">
<style>
.follow_title{
	margin-left: 10px;
    line-height: 30px;
    letter-spacing: -.6px;
    font-size: 20px;
    font-weight: bolder;
    font-style: normal;
}
#follow{
	border:none;
	padding: 9px 16px;
	border-radius: 4px;
    color: #00c4c4;
    width: 90px;
    font-weight: normal;
}
#follownone{
	border:1px solid #00c4c4;
	padding: 9px 16px;
	border-radius: 4px;
    color: white;
    width: 90px;
    background-color: #00c4c4;
   	font-weight:bold; 
	outline-style: none;
}
</style>
</head>
<script>
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
</script>
<body>
<!-- Header -->
<c:if test="${memberId ne ''}">
<%@include file ="/common/Header.jsp" %>
</c:if>
<c:if test="${memberId eq ''}">
<%@include file ="/common/Header_N.jsp" %>
</c:if>
<!-- Header -->
<hr style="margin: 0;">
<div class="mainWrapper">
	<div class="content">
		<h2 class="follow_title">활발하게 활동중인 서포터</h2>
		<div>
			<div>
				<c:forEach var="mlist" items="${memberlist }">
				<c:set var="i" value="${i+1 }"/>
					<div id="${i }">
						<section class="profile_sec">
							<a href="profile.do?profileId=${mlist.memberId }">
								<div class="profile">
									<c:choose>
										<c:when test="${mlist.memberPicture eq '' ||mlist.memberPicture eq null }">
											<span class="profile_icon" style="background-image: url(img/main/profile-icon-5.png)"></span>						
										</c:when>
										<c:otherwise>
											<span class="profile_icon" style="background-image: url(img/user-img/${mlist.memberPicture})"></span>
										</c:otherwise>
									</c:choose>
									<div class="profile_card">
										<div class="profile_name"><p>${mlist.memberNickname }</p></div>
										<div class="profile_follow">
											<span>펀딩 · 스토어 ${mlist.totalCnt }</span>
											<span>&nbsp;&nbsp;&nbsp;팔로워 ${mlist.followCnt}</span>
										</div>
									</div>
								</div>
							</a>
							<div class="follow_btn" id="ajaxinsert">
								<c:choose>
									<c:when test="${fn:contains(followinglist, mlist.memberId)}">
										<button id="follow" class="${i }" onclick="follow('${mlist.memberId}',${i })"><i class="fa-solid fa-check" id="followicon${i }"></i> 팔로잉</button>
									</c:when>
									<c:otherwise>
										<button id="follownone" class="${i }" onclick="follow('${mlist.memberId}',${i })">+ 팔로우</button>
									</c:otherwise>
								</c:choose>
							</div>
						</section>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>
</body>
<%@include file="/common/Footer.jsp"%>
</html>