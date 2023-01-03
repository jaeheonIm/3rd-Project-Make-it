<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
	<meta name="description" content="" />
	<meta name="author" content="" />
	<link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
	<link href="css/styles.css" rel="stylesheet" />
	<script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<meta charset="UTF-8">
	<link rel="stylesheet" href="css/main/main.css" type="text/css"> 
	<title>Admin</title>
</head>
<style>
#cc_main{
    z-index: 10000000 !important;
    box-shadow: rgb(255 255 255 / 12%) 0px 0px 2px 0px inset, rgb(0 0 0 / 5%) 0px 0px 2px 1px, rgb(0 0 0 / 30%) 0px 12px 60px;
    position: fixed;
    right:2px;
    bottom: 10px !important;
	width: 450px;
    height: 650px;
    min-height: 520px !important;
    max-height: 680px !important;
    overflow: hidden !important;
    background-color: transparent !important;
    border-radius: 30px !important;
    animation: 0.25s ease-out 0s 1 normal none running jZyQVL !important;
    }
    #cc_main_none{
    	display: none;
    }
.roomlistcontainer{
	margin: 0 auto;
	padding: 25px
}
.roomlistcontainer h1{
	text-align: left;
	padding: 5px 5px 5px 15px;
	color: #FFBB00;
	border-left: 3px solid #FFBB00;
	margin-bottom: 20px;
}
.roomContainer{
    width: 800px;
}
.roomList{
	border: none;
	width: inherit;
}
.roomList th{
	border: 1px solid #FFBB00;
	background-color: #fff;
	color: #FFBB00;
}
.roomList td{
	border: 1px solid gray;
	background-color: #fff;
	text-align: center;
	color: black;
}
.roomList .num{
	width: 75px;
	text-align: center;
}
.roomList .room{
	width: 350px;
}
.roomList .go{
	width: 71px;
	text-align: center;
}
#roomlistbtn{
	background-color: gray;
	font-size: 14px;
	color: #000;
	border: 1px solid #000;
	border-radius: 5px;
	padding: 3px;
	margin: 3px;
	width: 100px;
}
.roomlistinputTable th{
	padding: 5px;
}
.roomlistinputTable input{
	width: 330px;
	height: 25px;
}
#blink{
  -webkit-animation: blink 0.5s ease-in-out infinite alternate;
  -moz-animation: blink 0.5s ease-in-out infinite alternate;
  animation: blink 0.5s ease-in-out infinite alternate;
  color: red;
}
@-webkit-keyframes blink{
  0% {opacity: 0;}
  100% {opacity: 1;}
}

@-moz-keyframes blink{
  0% {opacity: 0;}
  100% {opacity: 1;}
}

@keyframes blink{
  0% {opacity: 0;}
  100% {opacity: 1;}
}

</style>
<script type="text/javascript">
	var ws;
	window.onload = function(){
           getRoom();            
        setInterval(function(){
          getRoom();},2000);
	}

	function getRoom(){
		$.ajax("getRoom.do",{
			type:"post",
			dataType:"json",
			success: function (result) {
			createChatingRoom(result);
			},
			error : function(err){
			alert("ajax실패");
			console.log('error');
			}
		});
	}

	function goRoom(number, name){
		console.log("adminid:${adminId}");
		chatopen(number,name);
	}
	
	function createChatingRoom(res){
		if(res != null){
			var tag = "";
			res.forEach(function(d, idx){
				var participants = d.participants.split(',');
				var rn = d.roomName.trim();
				var roomNumber = d.roomNumber;
				tag += "<tr>"
				tag += "<td class='num'>"+roomNumber+"</td>"
				if(d.memberId == null || d.memberId == ''){
					tag += "<td class='room'>"+ rn + "()" +"</td>";
				}else{
					tag += "<td class='room'>"+ rn + "(회원ID : "+d.memberId+")" +"</td>";
				}
				tag += "<td class='room'>"+ d.regdate +"</td>";
				tag += "<td class='go'><button type='button' id='roomlistbtn' onclick='goRoom(\""+roomNumber+"\", \""+rn+"\")'>상담연결</button></td>" ;
				if(d.conn == 1 && participants[1]== ''){
					tag += "<td class='go'><i id='blink' class='fa-solid fa-plug-circle-exclamation fa-2x' ></i></td>" ;
				}
				tag += "</tr>";	
			});
			$("#roomList").empty().append(tag);
		}
	}

	function commonAjax(url, parameter, type, calbak){
		$.ajax({
			url: url,
			data: parameter,
			type: type,
			
			success: function (res) {
				calbak(res);
			},
			error : function(err){
				alert("ajax실패");
				console.log('error');
				calbak(err);
			}
		});
	}
	
function chatopen(number,name){
	var chat="<iframe class='chatopen' id='chatopeniframe' src=\"chat_go_adm.do?roomName="+name+"&"+"roomNumber="+number+"&authority=admin\"></iframe>";
	$(".con").html(chat);
	$(".con").attr("id","cc_main");
}

function chatclose(){
	var targetObj = document.getElementById("chatopeniframe");
	targetObj.parentNode.removeChild(targetObj);
	$(".con").attr("id","cc_main_none");
	}
function chatclosetrash(roomNumber){
	var targetObj = document.getElementById("chatopeniframe");
	targetObj.parentNode.removeChild(targetObj);
	$(".con").attr("id","cc_main_none");
	location.href="adminChatDelete.do?roomNumber="+roomNumber;
	}

</script>
<body class="sb-nav-fixed">
<%@ include file="/common/AdminHeader.jsp" %>
	<div id="layoutSidenav_content">
		<main>
	       <div class="container-fluid px-4">
	       	   <h1 class="mt-4">상담 현황</h1>
	           <ol class="breadcrumb mb-4">
	               <li class="breadcrumb-item active">실시간 채팅을 통한 고객과의 상담업무가 가능합니다.</li>
	           </ol>
	           <div class="card mb-4" style="min-width: 920px; max-width: 900px;">
	               <div class="card-header">
	                   <i class="fas fa-table me-1"></i>상담요청목록
	               </div>
	               <div class="card-body">  							
						<div id="roomContainer" class="roomContainer">
							<table id="roomList" class="roomList"></table>
						</div>
	               </div>
	           </div>
			</div>
			<div style="height: 700px;">
				<div class="con" id="cc_main_none"></div>
			</div>
		</main>
	</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="js_jh/scripts.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
</body>
</html>