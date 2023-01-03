<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/common/Header_jy.jsp"%>
<!DOCTYPE html>
<html>
<body>
	<div class="wrapper d-flex align-items-stretch">
		<%@include file="/common/Nav.jsp"%>
		<div id="content" class="p-4 p-md-5">
			
			<!-- content start -->
			<div class="container-xl px-4 mt-4">
				<!-- Account page navigation-->
				<h3>나의 펀딩</h3>

				<section class="gallery-block cards-gallery">
					<div class="container">

						<div class="row" id="dispBody">
						<c:if test="${not empty myFundList }">
							<c:forEach var="fund" items="${myFundList }">
								<c:if test="${not empty fund.fundTitle }">
									<div class="col-md-6 col-lg-4">
										<div class="card border-0 transform-on-hover" style="width:340px;">
											<a class="lightbox" href="fundStatus.do?fundTitle=${fund.fundTitle}"> 
												<img src="img/fundingMainImg/${fund.fundMainImg }" alt="Card Image" class="card-img-top" style="width:340px; height:222px;">
											</a>
											<div class="card-body">
												<h6 id="listTitle">
													<a href="fundStatus.do?fundTitle=${fund.fundTitle}">${fund.fundTitle }</a>
												</h6>
												<p class="text-muted card-text">${fund.fundMakerName }</p>
											</div>
										</div>
									</div>
								</c:if>	
							</c:forEach>
						</c:if>	
						</div>
					</div>
				</section>

			</div>
		</div>
	</div>

   
</body>
<script>

</script>
</html>