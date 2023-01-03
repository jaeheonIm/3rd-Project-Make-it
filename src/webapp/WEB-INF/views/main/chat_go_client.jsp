<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
<head>

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
.chat_middle { max-height: 400px;}
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
				authority : 'user'
			}
		socket.send(JSON.stringify(option))
		$("#message").val("");
	});
	connect();
});
</script>
<script type="text/javascript">
var socket =null;
function connect(){					/* 서버을 사용할 컴퓨터의 ip주소와 port주소를 입력 */
	var wsocket =new WebSocket("ws://localhost:8081/biz/chat_test.do?roomNumber=${roomNumber}&authority=user");
	socket = wsocket;
	
	wsocket.onopen = function(data){
		console.log("Info: connection opened.");

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
					str += "<i class='fa-solid fa-circle-user fa-2x'></i></div>";
					str += " <div class='wrap'>";
					str += " <div class='textbox'>"+jsonMsg.msg+"</div></div> </div>";
					$("#chat_insert").append(str);
				}else{
					var str = "<div class='chat middle2'>";
					str += "<div class='icon'>";
					str += "<img width='30' height='30' alt='관리자프로필' src='img/main/makit_mark.png'></div>";
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
		str="<p id='chat_ment'>상담사에 의해 채팅방이 강제 종료 되었습니다.<br>더이상 채팅이 불가합니다.</p>";
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
			<div>
				<header style="background-color:#9bd8d8;">
					<div class="chat_top1">
						<div class="chat_adminprofile">
							<img width="30" height="30" alt="관리자프로필" src="img/main/makit_mark.png">
						</div>
						<span>make it 고객센터(상담원 연결)</span>
					</div>
					<div>	
						<div class="chat_top2">
							<button type="button" id="chatbtn2" onclick="parent.chatclose();"><i class="fa-solid fa-x"></i></button>
						</div>
					</div>
				</header>	
					<p id="chat_ment"><i class="fa-solid fa-headset fa-lg"></i> make it에 대한 궁금증을 해소해드립니다. <br>대화도중 욕설과 비방시에는<br>상담원과의 연결이 종료될 수 있습니다.</p>
			</div>
			<div class="chat_middle" id="chat_middle">
				<div class="chat_middle1">
					 <div class="chat_middle1-1" id="chat_insert">
					 <input type="hidden" id="sessionId" value="">
					 <input type="hidden" id="roomNumber" value="${roomNumber }">
					 	<div class="chat middle2">
				            <div class="icon">
				            	<img width="30" height="30" alt="관리자프로필" src="img/main/makit_mark.png">
				            </div>
					        <div class="wrap">
					            <div class="textbox">안녕하세요. 반갑습니다.<br> 잠시만 기다리시면 상담사와 연결됩니다.</div>
					        </div>
				        </div>
					 	<div class="chat middle2">
				            <div class="icon">
				            	<img width="30" height="30" alt="관리자프로필" src="img/main/makit_mark.png">
				            </div>
					        <div class="wrap">
					            <div class="textbox">기다리는 동안 문의사항을 남겨주시면 더욱 빠르게 상담이 가능합니다.</div>
					        </div>
				        </div>
				    </div>
				</div>
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
