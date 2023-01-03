<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시작 페이지</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>

<script>
// Ajax 요청처리로 데이터 가져와서 화면 표시
	function getJsonBoardListData() {
		alert("getJsonBoardListData() 실행 ~~")
		$.ajax("getJsonBoardList.do", {
			type : "get",
			dataType : "json",
			success : function(data){
				alert("성공~~");
				console.log(data);
				
				let dispHtml = "<ul>";
				$.each(data, function(index, obj){
					dispHtml += "<li>";
					dispHtml += this.seq + ", ";
					dispHtml += this.title + ", ";
					dispHtml += this["writer"] + ", ";
					dispHtml += obj.content + ", ";
					dispHtml += obj.regdate + ", ";
					dispHtml += obj["cnt"];
					dispHtml += "</li>";
				});
				dispHtml += "</ul>";
				
				$("#listDisp").html(dispHtml);
			},
			error : function(){
				alert("실패~~");
			}
		});
	}
</script>
</head>
<body>

<div id="container">
	<h1>게시판 프로그램 [index.jsp]</h1>
	<hr>
	<p>
		<a href="main.do">펀딩 페이지로 이동(GET)_main.do</a>
		<a href="fundingPageAll.do">펀딩 페이지로 이동(GET)_fundingPageAll.do</a>
		<a href="chat_admin.do?adminId=adm123">create 메인 페이지</a>
	</p>
	
	<hr><hr>
	
	<h2>Ajax 요청 처리</h2>
	<p><a href="javascript:getJsonBoardListData()"> JSON 데이터 가져오기(BoardList)</a></p>
	<p><a href="javascript:getJsonBoardData()">JSON 데이터 가져오기(Board)</a></p>
	<div id="listDisp">
		<ul>
			<li>데이터 가져와서 출력하기</li>
		</ul> 
	</div>
	
</div>
	
<script>
	function getJsonBoardData() {
		alert("getJsonBoardData() 실행 ~~");
		//let vo = { seq : 1 };
		let vo = {};
		vo.seq = 1;
		console.log(vo);
		console.log(JSON.stringify(vo));
		
		$.ajax("getJsonBoard.do", {
			type : "post", 
			data : JSON.stringify(vo), // 서버쪽으로 JSON 문자열 전달
			contentType : "application/json", // 서버로 전송하는 컨텐츠 유형(JSON 형식)
			dataType : "json", // 서버로부터 응답받는 데이터 형식
			success : function(data){
				alert("성공!!");
				console.log(data);
				
				let dispHtml = "<ul>";
				 	  dispHtml += "<li>";
					  dispHtml += data.seq + ", ";
				   	  dispHtml += data.title + ", ";
					  dispHtml += data.writer + ", ";
					  dispHtml += data.content + ", ";
					  dispHtml += data.regdate.substring(0, 10) + ", ";
					  dispHtml += data.cnt;
					  dispHtml += "</li>";
					  dispHtml += "</ul>";
				
				$("#listDisp").html(dispHtml);
			},
			error : function(){
				alert("실패!!");
			}
		});
	}
</script>		
$('input[type="text"]').keydown(function() {
    if (event.keyCode === 13) {
        event.preventDefault();
    }
});		
		
</body>
</html>