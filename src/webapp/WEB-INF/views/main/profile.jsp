<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<title>profile</title>

<!-- Favicon  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="icon" href="img/core-img/favicon.ico">

<!-- Style CSS -->
<link rel="stylesheet" href="style.css">
<link rel="stylesheet" href="css/main/main.css" type="text/css">
<style>
.profile_3{
    vertical-align: middle;
    width: 120px;
    height: 120px;
    background-position: 50%;
    min-width: 32px;
    display: inline-block;
    border-radius: 50%;
    background-repeat: no-repeat;
    background-size: cover;
    transition: background-image .5s;
    margin-right: 50px;
   
}
#follow{
	color:#00c4c4;; 
	font-weight:bold; 
	background-color: white; 
	border: none; 
	outline-style: none;
	text-align: center;
}
#title{
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 3;
    -webkit-box-orient: vertical;
    width: 227px;
    height: 70px;
}
</style>
<script>
/*팔로우 버튼 */
function profilefollow(profileid) {
	if("${memberId}"==null||"${memberId}"==''){
		location.href="loginForm.do";
	}else{
		$.ajax("mainfollow.do",{
			type:"post",
			data:{"followmemberId":profileid},
			dataType:"json",
			success:function(data){
			if(data>0){
				alert("팔로우가 취소되었습니다.");
				$("#follow").attr('id','follownone');
				$("#followicon").remove();
				$("#follownone").text('+ 팔로우');
			}else{
				alert("팔로우가 추가되었습니다.");
				$("#follownone").attr('id','follow');
				$("#follow").html("<i class='fa-solid fa-check' id='followicon'></i> 팔로잉");
			}
		},			
		error:function(){
			alert("ajax실패");
		}
		});
	}
}

/*더보기 페이징 처리 */
function more(profileid,memberId,category) {
	var endnum = $("input[name='endNum']").val();
	var addnum = $("input[name='addNum']").val();
	var totnum = parseInt(endnum) + parseInt(addnum);
	var today = new Date();
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var nowDate = year + '-' + month  + '-' + day;
	$.ajax("profileMoreAjax.do",{
		type:"post",
		data:{"profileid":profileid,"category":category},
		dataType:"json",
		success:function(data){
		let profilehtml="<ul>";
		for(var i=0; i<totnum; i++){
			if(data[i]==undefined){
				break;
			}
			var flist = data[i]
			var price = parseInt(data[i].fundPrice);
			var targetprice = parseInt(data[i].fundTargetPrice);
			var targetrate = Math.floor(price / targetprice *100);
				profilehtml += "<li class='reward' style='display: inline-table; margin: 0px 15px 40px 0;'>";
				profilehtml += "<a href=\"productDetailView.do?memberId="+memberId+"&fundIdx="+data[i].fundIdx+"\">";
				profilehtml += "<div class='project-card'>";
				profilehtml += "<div class='card-img-section'>";
				profilehtml += "<em class='project-img' style=\"background-image:url(img/fundingMainImg/"+data[i].fundMainImg+")\"></em>";
				profilehtml += "<div class='progressbar-wrap'>";
				profilehtml += "<dl><dt><span style=\"width:"+(230 * targetrate / 100)+"px;\"></span></dt>";
				profilehtml += "<dd><span class='percent'>"+targetrate+"%</span>";
				profilehtml += "<span class='amount'>"+price.toLocaleString('ko-KR')+"원 달성</span>";
				if(nowDate <= data[i].fundEndDate ){
					profilehtml += "<span class='days'>진행중</span></dd></dl></div></div>";
				}else{
					if(price >= targetprice){
						profilehtml += "<span class='days'>성공</span></dd></dl></div></div>";						
					}else{
						profilehtml += "<span class='days'>실패</span></dd></dl></div></div>";						
					}
				}
				profilehtml += "<div class='card-info-section'>";
				profilehtml += "<h4 id='title'>"+flist.fundTitle+"</h4>";
				profilehtml += "<h5>"+flist.fundMakerName+"</h5>";
				profilehtml += "<div class='card-category'>";
				profilehtml += "<span class='category1'>"+flist.fundCategory+"</span>";
				profilehtml += "</div></div></div></a></li>";
		}
		profilehtml+="</ul>";
			if(data.length > totnum){
				buttonhtml="<button type='button' class='btn btn-primary' onclick=\"more('"+data[0].memberId+"','"+memberId+"','"+category+"')\">더보기</button>";
				buttonhtml+="<input type='hidden' name='addNum' value='"+addnum+"'>";
				buttonhtml+="<input type='hidden' name='endNum' value='"+totnum+"'>";
				$("#btnAjaxinsert").html(buttonhtml);
			}else{
				$("#btnAjaxinsert button").remove();
			}
		$("#moreajaxinsert").html(profilehtml);
	},			
	error:function(){
		alert("ajax실패");
	}
	});
}
 
//항목이동 
function colum(profileid,memberId,category) {
	var today = new Date();
	var year = today.getFullYear();
	var month = ('0' + (today.getMonth() + 1)).slice(-2);
	var day = ('0' + today.getDate()).slice(-2);
	var nowDate = year + '-' + month  + '-' + day;
	$.ajax("profileColumAjax.do",{
		type:"post",
		data:{"profileid":profileid,"category":category},
		dataType:"json",
		success:function(data){
		var startnum = data.paging.startNum;
		var endnum = data.paging.endNum;
		var addnum = data.paging.addNum;
		var totnum = startnum + endnum;
		console.log("endnum:"+endnum);
		console.log("data.fundlist.length:"+data.fundlist.length);
		var list = data.fundlist;
		let profilehtml="";
		if(list.length==0){
			if(category=="FUND"){
				profilehtml +="<ul><div><p style='font-size: 1em;text-align: center;'>펀딩한 내역이 없습니다.</p></div></ul>";
			}
			else{
				profilehtml +="<ul><div><p style='font-size: 1em;text-align: center;'>찜한 내역이 없습니다.</p></div></ul>";
			}
		}else{
			profilehtml+="<ul>";
			for(var i=0; i<endnum; i++){
			if(list[i]==undefined){
				break;
			}
			var flist = list[i]
			var price = parseInt(flist.fundPrice);
			var targetprice = parseInt(list[i].fundTargetPrice);
			var targetrate = Math.floor(price / targetprice *100);
				profilehtml += "<li class='reward' style='display: inline-table;margin: 0px 15px 40px 0;' >";
				profilehtml += "<a href=\"productDetailView.do?memberId="+memberId+"&fundIdx="+flist.fundIdx+"\">";
				profilehtml += "<div class='project-card'>";
				profilehtml += "<div class='card-img-section'>";
				profilehtml += "<em class='project-img' style=\"background-image:url(img/fundingMainImg/"+flist.fundMainImg+")\"></em>";
				profilehtml += "<div class='progressbar-wrap'>";
				profilehtml += "<dl><dt><span style=\"width:"+(230 * targetrate / 100)+"px;\"></span></dt></dt>";
				profilehtml += "<dd><span class='percent'>"+targetrate+"%</span>";
				profilehtml += "<span class='amount'>"+price.toLocaleString('ko-KR')+"원 달성</span>";
				if(nowDate <= flist.fundEndDate ){
					profilehtml += "<span class='days'>진행중</span></dd></dl></div></div>";
				}else{
					if(price >= targetprice){
						profilehtml += "<span class='days'>성공</span></dd></dl></div></div>";						
					}else{
						profilehtml += "<span class='days'>실패</span></dd></dl></div></div>";						
					}
				}
				profilehtml += "<div class='card-info-section'>";
				profilehtml += "<h4 id='title'>"+flist.fundTitle+"</h4>";
				profilehtml += "<h5>"+flist.fundMakerName+"</h5>";
				profilehtml += "<div class='card-category'>";
				profilehtml += "<span class='category1'>"+flist.fundCategory+"</span>";
				profilehtml += "</div></div></div></a></li>";
			}
			profilehtml+="</ul>";
			if(data.fundlist.length > endnum){
				profilehtml+="<div style='text-align: center;'>";
				profilehtml+="<button type='button' class='btn btn-primary' onclick=\"more('"+flist.memberId+"','"+memberId+"','"+category+"')\">더보기</button>";
				profilehtml+="<input type='hidden' name='addNum' value='"+addnum+"'>";
				profilehtml+="<input type='hidden' name='endNum' value='"+endnum+"'>";
				profilehtml+="</div>";
				
			}else{
				$("#btnAjaxinsert button").remove();
			}
	}
		$("#moreajaxinsert").html(profilehtml);
		if(category == 'FUND'){
			$("#fund").attr("class","active");
			$("#like").attr("class","");
		} else if(category == 'LIKE'){
			$("#like").attr("class","active");
			$("#fund").attr("class","");
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
<c:if test="${memberId eq ''}">
	<%@include file ="/common/Header_N.jsp" %>
</c:if>
<!-- Header -->
<hr>
<div>
	<section class="profile_1">
		<div class="profile_2">
				<c:choose>
					<c:when test="${profilevo.memberPicture eq '' ||profilevo.memberPicture eq null }">
						<div class="profile_3" style="background-image: url(img/main/profile-icon-5.png)">	
						</div>					
					</c:when>
					<c:otherwise>
						<div class="profile_3" style="background-image: url(img/user-img/${profilevo.memberPicture})">
						</div>
					</c:otherwise>
				</c:choose>
			<div class="profile_4">
				<div>${profilevo.memberNickname }</div>
				<dl>
					<div><dt>펀딩</dt><dd>${fundcnt }<span class="BlindText_textHidden__GsPV1">회</span></dd></div>
					<div><dt>구매</dt><dd>${profilevo.totalCnt }<span class="BlindText_textHidden__GsPV1">회</span></dd></div>
					<div><dt>팔로워</dt><dd>${follower }<span class="BlindText_textHidden__GsPV1">명</span><a href="/web/social/follower/5008283216"><span class="BlindText_textHidden__GsPV1"></span></a></dd></div>
					<div><dt>팔로잉</dt><dd>${following }<span class="BlindText_textHidden__GsPV1">명</span><a href="/web/social/following/5008283216"><span class="BlindText_textHidden__GsPV1"></span></a></dd></div>
				</dl>
			</div>
			<div class="profile_5">
			<c:if test="${memberId ne profilevo.memberId }">
				<c:choose>
					<c:when test="${fn:contains(followinglist, profilevo.memberId)}">
						<button id="follow" onclick="profilefollow('${profilevo.memberId}')"><i class="fa-solid fa-check" id="followicon"></i> 팔로잉</button>
					</c:when>
					<c:otherwise>
						<button id="follownone" onclick="profilefollow('${profilevo.memberId}')">+ 팔로우</button>
					</c:otherwise>
				</c:choose>
			</c:if>
			</div>
		</div>
	</section>
	<section class="profile_6">
		<div class="tablist">
			<ul>
				<li id="fund" class="active">
					<a href="javascript:colum('${profilevo.memberId }','${memberId }','FUND')" role="tab" aria-selected="true" aria-controls="tabFunding" tabindex="0">펀딩한</a>
				</li>
				<li id="like" class="">
					<a href="javascript:colum('${profilevo.memberId }','${memberId }','LIKE')" role="tab" tabindex="-1">찜한</a>
				</li>
			</ul>
		</div>
	</section>
	<hr style="margin:0;">
	<div class="profile_8">
	 	<section class="profile_7" style="padding: 80px 30px 100px 0px;"  id="moreajaxinsert"> 
			<ul>
				<!-- S : 리워드 리스트 -->
				<c:if test="${empty fundlist }">
				<div>
					<p style="font-size: 1em;text-align: center;">펀딩한 내역이 없습니다.</p>
				</div>
				</c:if>
				<c:if test="${not empty fundlist }">
				<c:forEach var="flist" items="${fundlist }" begin="0" end="8">
				<fmt:parseNumber var="targetprice" value="${flist.fundTargetPrice }"/>
				<fmt:parseNumber var="price" value="${flist.fundPrice }"/>
				<fmt:parseNumber var="integer" value="${price / targetprice *100 }" integerOnly="true"/>
				<c:set var="targetrate" value="${integer}"/>
					<li class="reward" style="display: inline-table; margin: 0px 15px 40px 0;">			
						<a href="productDetailView.do?memberId=${memberId}&fundIdx=${flist.fundIdx}">
							<div class="project-card">
								<div class="card-img-section">
		                         	<em class="project-img" style="background-image:url(img/fundingMainImg/${flist.fundMainImg})"></em>
									<div class="progressbar-wrap">
										<dl>
											<dt><span style="width:${230 * targetrate / 100}px;"></span></dt>
											<dd>
												<span class="percent">${targetrate }%</span>
												<span class="amount"><fmt:formatNumber value="${price }"/>원 달성</span>
												<jsp:useBean id="now" class="java.util.Date" />
												<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="nowDate" />
												<fmt:parseDate value="${flist.fundEndDate }" var="enddate" pattern="yyyy-MM-dd"/>
												<fmt:formatDate value="${enddate}" pattern="yyyy-MM-dd" var="endDate" />
												<c:choose>
													<c:when test="${nowDate <= endDate }">
														<span class="days">진행중</span>
													</c:when>
													<c:otherwise>
														<c:if test="${targetprice <= price }">
															<span class="days">성공</span>
														</c:if>
														<c:if test="${targetprice > price }">
															<span class="days">실패</span>
														</c:if>								
													</c:otherwise>
												</c:choose>
											</dd>
										</dl>
									</div>
								</div>
								<div class="card-info-section">
									<h4 id="title">${flist.fundTitle }</h4>
									<h5>${flist.fundMakerName }</h5>
									<div class="card-category">
										<span class="category1">${flist.fundCategory }</span>
									</div>
								</div>
							</div>
						</a>
					</li>
				</c:forEach>
				</c:if>
			</ul>
			<c:if test="${fn:length(fundlist) > 9}">
			<div id="btnAjaxinsert" style="text-align: center;">
	 			<button type="button" class="btn btn-primary" onclick="more('${fundlist[0].memberId}','${memberId }','FUND')">더보기</button>
			  	<input type='hidden' name='addNum' value="${paging.addNum }">
			  	<input type='hidden' name='endNum' value="${paging.endNum }"> 	
			</div>
			</c:if>
	 	</section> 
	</div>
</div>

</body>
<%@include file="/common/Footer.jsp"%>
</html>