<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/Header_N.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#aaa {
		background-color: #f7ffff;
	    margin-top: 50px;
	    margin-bottom: 50px;
	    padding: 30 20 20 30;
}
	}
	
</style>
</head>
<body>
<hr>
<div class="container"  id="aaa">
	<h2>주문완료</h2>
	<p>고객님의 주문이 정상적으로 완료되었습니다.</p>
	<p>주문번호 : ${orderinfo.ordersIdx }</p>
	<p>결제금액 : ${orderinfo.ordersPrice }</p>
	<p>결제일시 : ${orderinfo.ordersDate }</p>
</div>
</body>
<%@include file="/common/Footer.jsp"%>
</html>