<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/common/Header_jy.jsp"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="css/div.css">
<link rel="stylesheet" href="css/style_jy.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css" integrity="sha512-pVCM5+SN2+qwj36KonHToF2p1oIvoU3bsqxphdOIWMYmgr4ZqD3t5DjKvvetKhXGc/ZG5REYTT6ltKfExEei/Q==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" integrity="sha256-NAxhqDvtY0l4xn+YVa6WjAcmd94NNfttjNsDmNatFVc=" crossorigin="anonymous" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>
<body>
	<div class="wrapper d-flex align-items-stretch">
		<%@include file="/common/Nav.jsp"%>
		<div id="content" class="p-4 p-md-5">
		
			<!-- S : 리워드 헤더 -->
			<div class="reward-header2">
				<div class="bg"></div>
				<p class="title-info" style="text-align: center; font-size:14px; color:gray;">
					<em>${fundStatus.fundCategory }</em>
				</p>
				<h2 class="fundTitle" style="text-align: center; font-size:22px;">
					<a href="productDetailView.do?fundIdx=${fundStatus.fundIdx}&memberId=${user.memberId}&fundMakerId=${user.memberId}">${fundStatus.fundTitle }</a>
				</h2>
				
			</div>
			<!-- E : 리워드 헤더 -->
			<!-- content start -->
			<div class="container-xl px-4 mt-4">

				<div class="fundingStatus">
				<hr class="mt-0 mb-4">
					<h4>펀딩 현황</h4>
					
					<div class="container" style="margin-top: 30px;">

						<div class="row row-cols-1 row-cols-md-2 row-cols-xl-4">
							<div class="col">
								<div
									class="card radius-10 border-start border-0 border-3 border-info">
									<div class="card-body">
										<div class="d-flex align-items-center">
											<div>
												<fmt:formatNumber var="targetPercent" type="number" maxFractionDigits="0" value="${fundStatus.fundPrice / fundStatus.fundTargetPrice * 100}" />
												<p class="mb-0 text-secondary">펀딩 달성률</p>
												<h4 class="my-1 text-info">${targetPercent}%</h4>
											</div>
											<div
												class="widgets-icons-2 rounded-circle bg-gradient-scooter text-white ms-auto">
												<i class="fa-sharp fa-solid fa-percent"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col">
								<div class="card radius-10 border-start border-0 border-3 border-danger">
									<div class="card-body">
										<div class="d-flex align-items-center">
											<div>
												<p class="mb-0 text-secondary">종료 날짜</p>
												<h4 class="my-1 text-danger">${fundStatus.fundEndDate }</h4>

											</div>
											<div class="widgets-icons-2 rounded-circle bg-gradient-bloody text-white ms-auto">
												<i class="fa-sharp fa-solid fa-won-sign"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col">
								<div class="card radius-10 border-start border-0 border-3 border-success">
									<div class="card-body">
										<div class="d-flex align-items-center">
											<div>
												<p class="mb-0 text-secondary">남은 기간</p>
												<h4 class="my-1 text-success" id="dDay">25일</h4>

											</div>
											<div class="widgets-icons-2 rounded-circle bg-gradient-ohhappiness text-white ms-auto">
												<i class="fa-sharp fa-solid fa-clock"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="col">
								<div class="card radius-10 border-start border-0 border-3 border-warning">
									<div class="card-body">
										<div class="d-flex align-items-center">
											<div>
												<p class="mb-0 text-secondary">찜 개수</p>
												<h4 class="my-1 text-warning" id="likeCnt">몇개</h4>

											</div>
											<div class="widgets-icons-2 rounded-circle bg-gradient-blooker text-white ms-auto">
												<i class="fa-sharp fa-solid fa-heart"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>


					<!-- 결제현황 -->
					<div class="payStatus" style="margin-top: 80px;">
						<hr class="mt-0 mb-4">
						<h4>결제 현황</h4>

						<div class="row" style="margin-top: 20px;">
							<div class="col-lg-4 mb-4">
								<!-- Billing card 1-->
								<div class="card h-100 border-start-lg border-start-primary">
									<div class="card-body">
										<div class="small text-muted">현재까지 펀딩 금액</div>
										<div class="h3" id="fundPrice">얼마</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 mb-4">
								<!-- Billing card 2-->
								<div class="card h-100 border-start-lg border-start-secondary">
									<div class="card-body">
										<div class="small text-muted">목표 펀딩 금액</div>
										<div class="h3" id="targetPrice">${fundStatus.fundTargetPrice }</div>
									</div>
								</div>
							</div>
							<div class="col-lg-4 mb-4">
								<!-- Billing card 3-->
								<div class="card h-100 border-start-lg border-start-success">
									<div class="card-body">
										<div class="small text-muted">결제 후원자 수</div>
										<div class="h3 d-flex align-items-center" id="orderCnt">몇명</div>
									</div>
								</div>
							</div>
						</div>


						<!-- S : 후원자 목록-->

						<div class="card mb-4" style="margin-top: 30px;">
							<div class="card-header">후원자 목록</div>
							<div class="card-body p-0">
								<!-- Billing history table-->
								<div class="table-responsive table-billing-history">
									<table class="table mb-0" id="pagination">
										<thead>
											<tr>
												<th class="border-gray-200" scope="col">아이디</th>
												<th class="border-gray-200" scope="col">결제 상품</th>
												<th class="border-gray-200" scope="col">결제 금액</th>
												<th class="border-gray-200" scope="col">결제 날짜</th>

											</tr>
										</thead>
										<tbody>
											<c:if test="${not empty orderList }">
												<c:forEach var="orderList" items="${orderList }">
													<tr class="pagingTr">
														<td>${orderList.memberId}</td>
														<td>${orderList.ordersOptionTitle}</td>
														<td><fmt:formatNumber
																value="${orderList.ordersPrice}" pattern="#,###" />원</td>
														<td>${orderList.ordersDate}</td>
													</tr>
												</c:forEach>
											</c:if>
											<c:if test="${empty orderList }">
												<tr>
													<td>결제 내역이 없습니다.</td>
												</tr>
											</c:if>
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<div class="divPagination">
							<ul class="pagination"></ul>
						</div>

						<!-- E : 후원자 목록 -->

						<!-- S : 멤버 목록 -->
						<div class="payStatus" style="margin-top: 80px;">
							<hr class="mt-0 mb-4">
							<h4>멤버 관리</h4>

							<div class="card mb-4" style="margin-top: 30px;">
								<div class="card-header">
									멤버 목록
									<button class="btn btn-primary" style="float: right; color: white;" onclick="memberPlusBt()">+멤버 추가</button>

									<div class="FundingOpen_fundingOpenContainer__1" id="container"
										style="top: 17%;">
										<div class="FundingOpen_btnLink__11tnC">
											<div class="FundingOpen_menuWrap FundingOpen_normal">
												<div class="FundingOpen_menuTitle__1">메이크잇에 가입된 이메일을 입력하세요. <input type="text" id="inputMemberEmail" style="border: 1px solid gray; margin-top: 10px; width: 250px;">
													<button class="plusBt" id="plusBt" type="button">추가</button>
													<button class="plusBt2" id="saveBt" type="button">완료</button>
													<div class="inputMemberEmail regex"></div>
													<input type="hidden" id="fundTagSave" name="fundTagSave" value=""> <input type="hidden" id="fundTeamMember" name="fundTeamMember" value="">
												</div>
												<div class="FundingBaseInfoTagList_listWrapper__wfX5e">
													<ul id="tag-list" class="ulTagInsert"></ul>
												</div>
											</div>
										</div>
									</div>
								</div>


								<div class="row">
									<div class="col-lg-12">
										<div class="">
											<div class="table-responsive">
												<table class="table mb-0" id="memberTable">
													<thead>
														<tr>
															<th class="border-gray-200" scope="col">이름</th>
															<th class="border-gray-200" scope="col">이메일</th>
															<th class="border-gray-200" scope="col">상태</th>
															<th class="border-gray-200" scope="col"
																style="width: 170px;">변경</th>
														</tr>
													</thead>
													<tbody>
														<c:if test="${not empty myFundMemberList }">
															<c:forEach var="member" items="${myFundMemberList }"
																varStatus="status">
																<tr>
																	<td><div class="avatar-sm d-inline-block me-2">
																			<div class="avatar-title bg-soft-primary rounded-circle text-primary">
																				<i class="mdi mdi-account-circle m-0"></i>
																			</div>
																		</div> <a href="#" class="text-body">${member.memberName}</a></td>
																	<td id="member${status.index}">${member.fundTeamMember}</td>
																	<c:if test="${'멤버 등록' eq member.authstatus}">
																		<td><span class="badge badge-soft-success mb-0"
																			id="memberStatus" style="font-size: 90%;">${member.authstatus}</span></td>
																	</c:if>
																	<c:if test="${'수락 대기중' eq member.authstatus}">
																		<td><span class="badge badge-soft-danger mb-0"
																			id="memberStatus" style="font-size: 90%;">${member.authstatus}</span></td>
																	</c:if>
																	<td>
																		<ul class="list-inline mb-0">
																			<li class="list-inline-item">
																				<button id="member${status.index}"
																					data-bs-toggle="tooltip" data-bs-placement="top"
																					title="멤버 삭제" class="px-2 text-danger"
																					onclick="deleteMember(this.id)">
																					<i class="bx bx-trash-alt font-size-18"></i>
																				</button>
																			</li>
																		</ul>
																	</td>
																</tr>
															</c:forEach>
														</c:if>
														<c:if test="${empty myFundMemberList }">
															<tr>
																<td>추가된 멤버가 없습니다.</td>
															</tr>
														</c:if>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<!-- E : 멤버 목록 -->
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal-wrapper">
		<div class="modal2">
			<p class="modal2_p">
				멤버 추가는 <strong>가입된 계정</strong>이나 <br>
				<strong>중복되지 않은 계정</strong>만가능해요.<br> 이메일 주소를 다시 확인해주세요.
			</p>
			<div class="close-wrapper">
				<button id="close" onclick="closeModal();" style="color: #00b2b2">닫기</button>
			</div>
		</div>
	</div>
</body>
<script>
	//좋아요 가져오기
	var fundIdx = '${fundStatus.fundIdx}';
	$(function() {
		$.ajax({
			type : "POST",
			url : "likeOrderCnt.do",
			dataType : 'json',
			data : {
				fundIdx : fundIdx
			},
			success : function(data) {
				$('#likeCnt').text(data.likeCnt + "개");
				$('#orderCnt').text(data.orderCnt + "명");
			},
			error : function() {
				alert("[오류발생] 담당자에게 문의하세요.");
			}
		});
	});
</script>
<script>
$(function() {
	//천단위 콤마
	const fundTargetPrice = '${fundStatus.fundTargetPrice }';
	const fundPrice = '${fundStatus.fundPrice}';

	let priceResult = fundTargetPrice.toString().replace(
			/\B(?=(\d{3})+(?!\d))/g, ",");
	let price = fundPrice.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	$('#targetPrice').text(priceResult + "원");
	$('#fundPrice').text(price + "원");

	//남은 날짜 계산
	const TIME_ZONE = 3240 * 10000;

	var today = new Date(+new Date() + TIME_ZONE).toISOString().split('T')[0];

	var endDate = '${fundStatus.fundEndDate }';
	var arr1 = today.split('-');
	var arr2 = endDate.split('-');
	var dat1 = new Date(arr1[0], arr1[1], arr1[2]);
	var dat2 = new Date(arr2[0], arr2[1], arr2[2]);

	var diff = dat2 - dat1;
	var currDay = 24 * 60 * 60 * 1000;// 시 * 분 * 초 * 밀리세컨
	var currMonth = currDay * 30;// 월 만듬
	var currYear = currMonth * 12; // 년 만듬

	$("#dDay").html(parseInt(diff / currDay) + "일");
});
</script>
<script>
var tag = {};
var counter = 0;
var sumTagText = "";

function memberPlusBt() {
	if (document.getElementById('container').className == 'FundingOpen_fundingOpenContainer__1') {
		document.getElementById('container').className += ' FundingOpen_active__1';
	} else if (document.getElementById('container').className == 'FundingOpen_fundingOpenContainer__1 FundingOpen_active__1') {
		document.getElementById('container').classList
				.remove('FundingOpen_active__1');
	}
}

// 태그를 추가한다.
function addTag(value) {
	tag[counter] = value; // 태그를 Object 안에 추가
	counter++; // counter 증가 삭제를 위한 del-btn 의 고유 id 가 된다.

}

// 최종적으로 서버에 넘길때 tag 안에 있는 값을 array type 으로 만들어서 넘긴다.
function marginTag() {
	return Object.values(tag).filter(function(word) {
		return word !== "";
	});
}

//멤버 이메일 추가
function emailCheckAfter() {
	if ('${MemberEmailOk.memberEmail}' != null) {
		console
				.log("MemberEmailOk이메일만 : "
						+ '${MemberEmailOk.memberEmail}');
		var self = $("#inputMemberEmail");
		var tagValue = self.val();

		// 값이 없으면 동작 안함.
		if (tagValue !== "") {

			// 같은 태그가 있는지 검사한다. 있다면 해당값이 array로 return 된다.
			var result = Object.values(tag).filter(function(word) {
				return word === tagValue;
			})

			// 태그 중복 검사
			if (result.length == 0) {
				$("#tag-list")
						.append(
								"<li class='tag-item'>"
										+ "<span class='spanTagInsert' style='margin-top: 10px;'>"
										+ tagValue
										+ "<span class='del-btn' idx= '"+counter+"' id='"+tagValue+"'>x</span></span></li>");
				addTag(tagValue);

				self.val("");

				$('input[name=fundTagSave]').attr('value', tagValue);

				sumTagText = sumTagText + tagValue + ",";
				console.log("추가버튼 클릭 시 sumTagText : " + sumTagText);

				$('#fundTeamMember').val(sumTagText);

			} else {
				alert("이미 추가한 이메일입니다.");
			}
		}
	}
}

//추가버튼 누를 때
$(document).on("click", "#plusBt", function() {
	var fundTeamMember = $('#inputMemberEmail').val();
	console.log("fundTeamMember 인풋 값: " + fundTeamMember);

	$.ajax({
		type : "POST",
		url : "checkMemberEmail.do",
		data : {
			fundTeamMember : fundTeamMember,
			fundIdx : fundIdx
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
//삭제 버튼 누를 때
$(document).on("click", ".del-btn", function(e) {
	var index = $(this).attr("idx");
	console.log("삭제버튼 index : " + index);

	var tagValue = $(this).prop("id");
	console.log("삭제버튼 tagValue : " + tagValue);

	tag[index] = "";
	$(this).parent().parent().remove();
	counter--;

	sumTagText = sumTagText.replace(tagValue + ",", "");
	console.log("삭제버튼 클릭 시 sumTagText : " + sumTagText);

	$('#fundTeamMember').val(sumTagText);
});

//DB에서 멤버 삭제
function deleteMember(id) {
	var fundTeamMember = $('#memberTable').find('#' + id).text();

	console.log(fundTeamMember);
	var fundIdx = '${fundStatus.fundIdx}';
	$.ajax({
		type : "POST",
		url : "memberDelete.do",
		data : {
			fundTeamMember : fundTeamMember,
			fundIdx : fundIdx
		},
		success : function(data) {
			alert("삭제완료");
			
		},
		error : function() {
			alert("[오류발생] 담당자에게 문의하세요.");
		}
	});
	location.href = "fundStatus.do";
}
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
<script>
//멤버 DB에 추가하기 및 메일보내기
$(document).on("click", "#saveBt", function() {
	alert("메일을 보내는 중입니다. 잠시만 기다려주세요.");
	var fundTeamMember = $('#fundTeamMember').val();
	console.log(" 완료버튼 - fundTeamMember 인풋 값2 : " + fundTeamMember);
	console.log("fundIdx : " + fundIdx);
	var promise = $.ajax({
		type : "POST",
		url : "memberPlus.do",
		data : {
			fundTeamMember : fundTeamMember,
			fundIdx : fundIdx
		},
		success : function(data) {
			alert("💌 멤버 초대 메일을 전송했어요.\n초대 수락시 멤버로 등록돼요.");
		},
		error : function() {
			alert("[오류발생] 담당자에게 문의하세요.");
		}
	});
	
	promise.done(successFunction);//프로미스 패턴 => 해당 ajax를 태운다음에 동작하는 function(동기방식)
	promise.fail(failFunction);
    
    function successFunction(data){
    	location.href = "fundStatus.do";
    }
    
    function failFunction(data){
      	alert("[실패] 오류발생");
    }
});
</script>
<script>
//결제 현황 페이징 처리
function pagination() {
	var req_num_row = 5; //화면에 표시할 목록 개수
	var $tr = $('.pagingTr');  // paging 대상 class 명
	var total_num_row = $tr.length;
	var num_pages = 0;
	if (total_num_row % req_num_row == 0) {
		num_pages = total_num_row / req_num_row;
	}
	if (total_num_row % req_num_row >= 1) {
		num_pages = total_num_row / req_num_row;
		num_pages++;
		num_pages = Math.floor(num_pages++);
	}

	$('.pagination').append("<li id=\"orderPaging\" style=\"color: #c3c3c3;\"><a class=\"prev\"><</a></li>");

	for (var i = 1; i <= num_pages; i++) {
		$('.pagination').append("<li id=\"orderPaging\"><a>" + i + "</a></li>");
		$('.pagination li:nth-child(2)').addClass("activePg");
		$('.pagination a').addClass("pagination-link");
	}

	$('.pagination').append("<li id=\"orderPaging\" style=\"color: #c3c3c3;\"><a class=\"next\">></a></li>");

	$tr.each(function(i) {
		$(this).hide();
		if (i + 1 <= req_num_row) {
			$tr.eq(i).show();
		}
	});

	$('.pagination a').click('.pagination-link', function(e) {
		e.preventDefault();
		$tr.hide();
		var page = $(this).text();
		var temp = page - 1;
		var start = temp * req_num_row;
		var current_link = temp;

		$('.pagination li').removeClass("activePg");
		$(this).parent().addClass("activePg");

		for (var i = 0; i < req_num_row; i++) {
			$tr.eq(start + i).show();
		}

		if (temp >= 1) {
			$('.pagination li:first-child').removeClass("disabled");
		} else {
			$('.pagination li:first-child').addClass("disabled");
		}

	});

	$('.prev').click(function(e) {
		e.preventDefault();
		$('.pagination li:first-child').removeClass("activePg");
	});

	$('.next').click(function(e) {
		e.preventDefault();
		$('.pagination li:last-child').removeClass("activePg");
	});

}

$('document').ready(function() {
	pagination();

	$('.pagination li:first-child').addClass("disabled");

});
</script>

</html>