<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<meta charset="UTF-8">
	<link rel="stylesheet" href="css/main/main.css" type="text/css">
<title>1:1상담</title>
<style>    
.chat_main{
     right:0px;
     background-color:#ffffff;
}
.middle2 .wrap {
    box-shadow: rgb(255 255 255 / 12%) 0px 0px 2px 0px inset, rgb(0 0 0 /25%) 0px 0px 2px 1px, rgb(0 0 0 / 25%) 0px 2px 6px;
}
.middle3 .wrap {
    box-shadow: rgb(255 255 255 / 12%) 0px 0px 2px 0px inset, rgb(0 0 0 / 25%) 0px 0px 2px 1px, rgb(0 0 0 / 25%) 0px 2px 6px;
}
.chat_middle { max-height: 440px;}
</style>
<script>
$(document).ready(function(){
	$("#chatbtn").on('click',function(event){
		event.preventDefault();
		if(socket.readyState!=1) return;
		var option ={
				type: "message",
				roomNumber: $("#roomNumber").val(),
				sessionId : $("#sessionId").val(),
				msg : $("#message").val(),
				authority : 'admin'
			}
		socket.send(JSON.stringify(option))
		$("#message").val("");
	});
	connect();
});

</script>
<script type="text/javascript">
var socket =null;
function connect(){
	var wsocket =new WebSocket("ws://localhost:8081/biz/chat_test.do?roomNumber=${roomNumber}&authority=admin");
	socket = wsocket;
	
	wsocket.onopen = function(data){
		console.log("Info: connection opened.");
		$('#chat_middle').scrollTop($('#chat_middle').prop('scrollHeight'));
	};

	wsocket.onmessage = function(data){
		console.log("Receivemessager:"+data.data+'\n');
		var chat_msg = data.data;
		if(chat_msg != null && chat_msg.trim() != ''){
			var jsonMsg = JSON.parse(chat_msg);
			if(jsonMsg.type == "getId"){
				var sessionId = jsonMsg.sessionId  != null ? jsonMsg.sessionId  : "";
				if(sessionId != ''){
					$("#sessionId").val(sessionId);
				}
			}else if(jsonMsg.type == "message"){
				if(jsonMsg.sessionId == $("#sessionId").val()){
					console.log("jsonMsg.id:"+jsonMsg.sessionId);
					console.log("$('#sessionId').val():"+$("#sessionId").val());
					var str = "<div class='chat middle3'>";
					str += "<div class='icon'>";
					str += "<img width='30' height='30' alt='관리자프로필' src='img/main/makit_mark.png'></div>";
					str += " <div class='wrap'>";
					str += " <div class='textbox'>"+jsonMsg.msg+"</div></div> </div>";
					$("#chat_insert").append(str);
				}else{
					var str = "<div class='chat middle2'>";
					str += "<div class='icon'>";
					str += "<i class='fa-solid fa-circle-user fa-2x'></i></div>";
					str += " <div class='wrap'>";
					str += " <div class='textbox'>"+jsonMsg.msg+"</div></div> </div>";
					$("#chat_insert").append(str);
				}
				$('#chat_middle').scrollTop($('#chat_middle').prop('scrollHeight'));
			}else{
				console.warn("unknown type!");
			}
		}
	};

	wsocket.onclose = function(event){
		str="<p id='chat_ment'>고객이 채팅상담을 종료하였습니다.<br>더이상 채팅이 불가합니다.</p>";
		$("#chat_insert").append(str);
		$('#chat_middle').scrollTop($('#chat_middle').prop('scrollHeight'));
		console.log('Info:connection closed');
		console.log(event);

	};
	wsocket.onerror = function(err){
		console.log('ERROR:'+err);
	};
}

</script>

</head>
<body>
	<div class="chat_main">
		<div>
			<div id="chat_adm_ment">
				<header style="background-color: #3e5d5d;">
					<div class="chat_top1">
						<div class="chat_adminprofile">
							<img width="30" height="30" alt="관리자프로필" src="img/main/makit_mark.png">
						</div>
						<span>make it 고객센터</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      					<button style="background: none; border: none;" onclick="parent.chatclosetrash(${roomNumber});">
							<i class="fa-solid fa-trash" style="background: none;border: none;"></i>
						</button> 
					</div>
					<div>
						<div class="chat_top2">
							<button type="button" onclick="parent.chatclose();" ><i class="fa-solid fa-x"></i></button>
						</div>
					</div>
				</header>
				<p id="chat_ment"><i class="fa-solid fa-trash"></i>버튼을 누르면 상담을 강제 종료 합니다.</p>
			</div>
			<div class="chat_middle" id="chat_middle">
				<c:choose>
					<c:when test="${fn:length(conversation) > 0 }">
						<div class="chat_middle1" style="margin-top: 10px;">
							<div class="chat_middle1-1"  id="chat_insert">
							<input type="hidden" id="sessionId" value="">
							<input type="hidden" id="roomNumber" value="${roomNumber }">
							<c:forEach var="autority" items="${conversation }">
							<c:set var="auto" value="${fn:split(autority,':')[0]}"/>
							<c:set var="conver" value="${fn:split(autority,':')[1]}"/>
								<c:if test="${auto eq 'user' }">
									<div class='chat middle2'>
										<div class='icon'><i class='fa-solid fa-circle-user fa-2x'></i></div>
										<div class='wrap'>
											<div class='textbox'>${conver }</div>
										</div> 
									</div>
								</c:if>
								<c:if test="${auto eq 'admin' }">
									<div class='chat middle3'>
										<div class='icon'>
											<img width='30' height='30' alt='관리자프로필' src='img/main/makit_mark.png'>
										</div>
										<div class='wrap'>
											<div class='textbox'>${conver}</div>
										</div> 
									</div>
								</c:if>
							</c:forEach>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="chat_middle1"  style="margin-top: 10px;">						
							 <div class="chat_middle1-1" id="chat_insert">
								 <input type="hidden" id="sessionId" value="">
								 <input type="hidden" id="roomNumber" value="${roomNumber }">
						    </div>
						</div>
				</c:otherwise>
				</c:choose>
			</div>
			<div class="chat_msg_send" >
				<textarea rows="1" class="chat_msg" id="message"></textarea>
				<span>
					<button type="button" id="chatbtn" style="outline=none;"><i class="fa-regular fa-paper-plane fa-2x"></i></button>
				</span>
			</div>
		</div>
	</div>
</body>
</html>
