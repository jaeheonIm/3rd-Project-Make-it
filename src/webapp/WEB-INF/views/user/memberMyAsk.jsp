<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="UTF-8">

<!-- Title  -->
<title>나의 문의내역</title>
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>

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
					<h5>My Fund Ask</h5>
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="main.do?memberId=${user.memberId }">Home</a></li>
						<li class="breadcrumb-item active">My Fund Ask</li>
					</ol>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<div class="container">
		<h2 style="font-weight: bold;">나의 문의내역</h2>
		<hr style="color: silver;">
	</div>
        <div class="container">
            <div class="row justify-content-between">
                <div class="col-12">
                    <div class="cart-table">
                        <div class="table-responsive">
                            <table class="table table-bordered mb-30">
                                <thead>
                                    <tr>
                                        <th scope="col">Title</th>
                                        <th scope="col">Date</th>
                                        <th scope="col">Answer</th>
                                        <th scope="col">Category</th>
                                    </tr>
                                </thead>
                                <tbody>
                                	<c:if test="${ empty MyAsk }">
                                		<tr>
                                			<th colspan="4">문의 내역이 없습니다</th>
                                		</tr>
                                	</c:if>
                                	<c:if test="${ not empty MyAsk }">
                                	<c:forEach var="ask" items="${MyAsk }">
	                                    <tr>
	                                        <td>
	                                            <a href="myQnaView.do?fundQnaIdx=${ask.fundQnaIdx }">${ask.fundQnaTitle }</a>
	                                        </td>
	                                        <fmt:parseDate value="${ask.fundQnaDate }" var="registered" pattern="yyyy-MM-dd HH:mm:ss" />
	                                        <td><fmt:formatDate value="${registered}" pattern="yyyy-MM-dd" /></td>
	                                        <td>
		                                        <c:if test="${ask.statusChange == 0 }">
		                                        	미응답
		                                        </c:if>
		                                        <c:if test="${ask.statusChange == 1 }">
		                                        	답변완료
		                                        </c:if>
	                                        </td>
	                                        <td>${ask.fundQnaCategory }</td>
	                                    </tr>
	                                </c:forEach>
                                    </c:if>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
				<!-- Pagination Area -->
								<div class="container" >
									<div class="shop_pagination_area mt-30">
										<nav aria-label="Page navigation">
											<ul class="pagination pagination-sm justify-content-center"  style="display: flex;" id="ajaxpageinsert" >
												<c:if test="${page.beginPage==1 }">
													<li class="page-item">
														<a class="page-link"><i class="fa fa-angle-left" aria-hidden="false"></i></a>
													</li>
												</c:if>
												<c:if test="${page.beginPage!=1 }">
													<li class="page-item">
														<a class="page-link" href="memberMyAsk.do?cPage=${page.beginPage-1}&memberId=${user.memberId}"><i class="fa fa-angle-left" aria-hidden="true"></i></a>
													</li>
												</c:if>
												
												<c:forEach var="pageNo" begin="${page.beginPage }" end="${page.endPage }">
													<c:if test="${pageNo == page.nowPage }">
														<li class="page-item active">
															<a class="page-link">${pageNo }</a>
														</li>

													</c:if>
													<c:if test="${pageNo != page.nowPage }">
														<li class="page-item">
															<a class="page-link" href="memberMyAsk.do?cPage=${pageNo }&memberId=${user.memberId}">${pageNo }</a>
	 													</li>
													</c:if>
												</c:forEach>
												
												<c:if test="${page.endPage < page.totalPage }">
												<li class="page-item"> 
													<a class="page-link" href="memberMyAsk.do?cPage=${page.endPage +1 }&memberId=${user.memberId}"><i class="fa fa-angle-right" aria-hidden="true"></i></a>
												</li>
												</c:if>
												<c:if test="${page.endPage >= page.totalPage  }">
													<li class="page-item">
														<a class="page-link"><i class="fa fa-angle-right" aria-hidden="false"></i></a>
													</li>
												</c:if>
											</ul>
										</nav>
									</div>
								</div>
								<!-- Pagination Area End-->

            </div>
        </div>
	<br><br>
	
	<%@ include file="/common/Footer.jsp"%>