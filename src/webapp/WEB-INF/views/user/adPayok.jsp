<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/common/Header_N.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 확인</title>
</head>
<body>
<c:if test="${user.memberId ne ''}">
	<%@include file ="/common/Header.jsp" %>
</c:if>
<c:if test="${user.memberId eq ''}">
	<%@include file ="/common/Header_N.jsp" %>
</c:if>
<hr>
<div class="container" style="background-color: silver;">
	<h2>결제완료</h2>
	<p>고객님의 주문이 정상적으로 결제되었습니다.</p>
	<p>주문번호 : ${adPayinfo.adOrdersIdx }</p>
	<p>결제금액 : ${adPayinfo.adOrdersPrice }</p>
	<p>결제일시 : ${adPayinfo.adOrdersDate }</p>
</div>
</body>
<%@include file="/common/Footer.jsp"%>
</html>