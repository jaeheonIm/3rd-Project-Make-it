<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!doctype html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <!-- Title  -->
    <title>MY 정보설정</title>
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

    <!-- Favicon  -->
    <link rel="icon" href="img/core-img/favicon.ico">

    <!-- Style CSS -->
    <link rel="stylesheet" href="style.css">

</head>

<body>
<c:if test="${user.memberId ne ''}">
	<%@include file ="/common/Header.jsp" %>
</c:if>
<c:if test="${user.memberId eq ''}">
	<%@include file ="/common/Header_N.jsp" %>
</c:if>

    <!-- Breadcumb Area -->
    <div class="breadcumb_area">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <h5>Information setting</h5>
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="main.do?memberId=${user.memberId }">Home</a></li>
                        <li class="breadcrumb-item active">Information setting</li>
                    </ol>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcumb Area -->

    <div class="bigshop_reg_log_area section_padding_100_50">
        <div class="container">
            <div class="row" style="float: none; margin:100 auto;">
                <div class="col-12 col-md-6" style="float: none; margin:0 auto;">
	                <div class="list-group list-group-flush">
	                  <h3>MY 정보설정</h3><br>
					  <a href="memberBasicUpdate.do" class="list-group-item list-group-item-action">기본 정보 설정</a>
					  <a href="memberPasswordUpdate.do" class="list-group-item list-group-item-action">비밀번호 변경</a>
					  <a href="memberProfileUpdate.do" class="list-group-item list-group-item-action">프로필 정보 변경</a>
					  <a href="memberDelete.do" class="list-group-item list-group-item-action">회원탈퇴</a>
					</div>
                </div>
            </div>
        </div>
    </div>
<%@ include file="/common/Footer.jsp" %>