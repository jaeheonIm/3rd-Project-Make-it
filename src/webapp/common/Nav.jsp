<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			<li ><a href="#" data-toggle="collapse"
				aria-expanded="false" class="dropdown-toggle collapsed">펀딩 관리</a>
				<ul class="list-unstyled2" id="homeSubmenu"
					style="background-color: #efecec7a">
				<li><a href="getMyFundList.do?memberId=${user.memberId}">나의 펀딩</a></li>
		</ul>
	</div>

</nav>

<script src="js_jy/jquery.min.js"></script>
<script src="js_jy/popper.js"></script>
<script src="js_jy/bootstrap.min.js"></script>
<script src="js_jy/main.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- <script src="https://code.jquery.com/jquery-3.5.1.js"></script> -->