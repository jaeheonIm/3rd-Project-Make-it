 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="css/div.css">	
 
 <!-- Preloader -->
    <div id="preloader">
        <div class="spinner-grow" role="status">
            <span class="sr-only">Loading...</span>
        </div>
    </div>

    <!-- Header Area -->
    <header class="header_area">
        <!-- Top Header Area -->
        <div class="top-header-area">
            <div class="container h-100">
                <div class="row h-100 align-items-center">
                    <div class="col-6">
                        <div class="welcome-note">
                            <span class="popover--text" data-toggle="popover" data-content="Welcome to Bigshop ecommerce template."><i class="icofont-info-square"></i></span>
                            <span class="text">Welcome to Make It</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Menu -->
        <div class="bigshop-main-menu">
            <div class="container">
                <div class="classy-nav-container breakpoint-off">
                    <nav class="classy-navbar" id="bigshopNav">

                        <!-- Nav Brand -->
                        <a href="javascript:gopage('${user.memberId }','main.do')" class="nav-brand"><img src="img/makeit_logo3.png" alt="logo"></a>
						
                        <!-- Toggler -->
                        <div class="classy-navbar-toggler">
                            <span class="navbarToggler"><span></span><span></span><span></span></span>
                        </div>

                        <!-- Menu -->
                        <div class="classy-menu">
                            <!-- Close -->
                            <div class="classycloseIcon">
                                <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                            </div>

                            <!-- Nav -->
                            <div class="classynav">
                                <ul>
                                    <li><a href="javascript:gopage('${user.memberId }','main.do')">Home</a>
                                    </li>
                                    <li><a href="fundingPageAll.do">Funding</a>
                                    </li>
                                    <li><a href="store.do">Store</a>
                                    </li>
                                    <li><a href="#">More</a>
                                        <ul class="dropdown">
                                            <li><a href="javascript:gopage('${user.memberId }','notice.do')">notice</a></li>
                                            <li><a href="javascript:gopage('${user.memberId }','Mainqna.do')">Q&A</a></li>
                                        </ul>
                                    </li>
                                    <li><a href="javascript:gopage('${user.memberId }','feed.do')">Feed</a></li>
                                </ul>
                            </div>
                        </div>

                        <!-- Hero Meta -->
                        <div class="hero_meta_area ml-auto d-flex align-items-center justify-content-end">
                            <!-- Search -->
                            <div class="search-area">
                                <div class="search-btn"><i class="icofont-search"></i></div>
                                <!-- Form -->
                                <form action ="searchBoardList.do" method="get">
                                   <div class="search-form">
                                       <input type="search" class="form-control" placeholder="Search" name="searchKeyword">
                                       <input type="submit" class="d-none" value="Send">
                                   </div>
                                </form>
                            </div>
                     <div>
                           <div>
							<button type="button" onclick="javascript:location.href='loginForm.do'" style="border: none; outline: none; background-color: window; margin-right: 10px;">login</button>
							<button type="button" onclick="javascript:location.href='loginForm.do'" style="border: none; outline: none; background-color: window;">join</button>
							<button type="button" onclick="projectBtn()" style="border: 1px solid #00c4c4; margin-left: 10px; padding: 9px 16px; line-height: 1.45; font-size: 1em; border-radius: 4px; color: #00a2a2; outline: none; background-color: window;">프로젝트 만들기</button>
	                        	
	                        	<div class="FundingOpen_fundingOpenContainer__1" id="container">
									<div class="FundingOpen_btnLink__11tnC">
										<div class="FundingOpen_menuWrap FundingOpen_normal">
											<div class="FundingOpen_menuTitle__1">
												새로운 프로젝트 만들기
												<button class="NewProjectBtn Button_tertiaryGrey Button_contained FundingOpen_category"
													type="button" onclick="makeProject()">프로젝트 만들기</button>
											</div>
										</div>
									</div>
	
									<hr class="Divider_divider__2KIPe Divider_horizontal__1_4Nb Divider_lightBG__FsD3J Divider_spacing5__3m1_S Divider_caption2__u1j3r">
	
									<div class="FundingOpen_btnLink__11tnC">
										<div class="FundingOpen_menuWrap FundingOpen_normal" stlye="height:200px;">
											<div class="FundingOpen_menuTitle__1">
												이전 프로젝트 수정하기
											</div>
												
											 <c:if test="${not empty user.memberId }">
												<c:forEach var="fundUpdate" items="${fundUpdate }">
													<c:if test="${not empty fundUpdate.lastSaveDate }">
														<div class="NotificationList_listContainer__1">
															<div class="NotificationListItem_info">
																<div class="NotificationListItem_typeLine">
																	<a href="#" class="NotificationListItem_title">프로젝트를 시작했습니다!</a>
																	<div class="NotificationListItem_time__1">${fundUpdate.lastSaveDate }</div>
															</div>
															</div>
														</div>
													</c:if>	
													
												</c:forEach>
												
											</c:if>
												
											<c:if test="${empty user.memberId }">
												<div class="NotificationList_listContainer__1">
													<div class="NotificationListItem_info">
														<div class="NotificationListItem_typeLine">
															<p class="NotificationListItem_title">로그인 후 이용 가능해요.</p>
													</div>
													</div>
												</div>
											</c:if>				
										</div>
									</div>
								</div>
							</div>
                     </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
        
        <script>
function projectBtn() {
	if (document.getElementById('container').className == 'FundingOpen_fundingOpenContainer__1') {
		 document.getElementById('container').className += ' FundingOpen_active__1';
	} else if (document.getElementById('container').className == 'FundingOpen_fundingOpenContainer__1 FundingOpen_active__1') {
		document.getElementById('container').classList.remove('FundingOpen_active__1');
	}
	
}

function makeProject() {
	let user = "${user}";
	if (user == "") {
		alert("로그인 후 이용가능해요.");
		location.href = "loginForm.do";
	} else {
		//alert("로그인 되어있음");
		location.href = "create_Main.do";
	}
}

function gopage(id,url){
	let memberId = id;
	let posturl = url;
	let frm = document.createElement('form');
    
    let obj;
    obj = document.createElement('input');
    obj.setAttribute('type', 'hidden');
    obj.setAttribute('name', 'memberId');
    obj.setAttribute('value', id);
    
    frm.appendChild(obj);
    frm.setAttribute('method', 'post');
    frm.setAttribute('action', url);
    document.body.appendChild(frm);
    frm.submit();
    
}
</script>  
    </header>
    <!-- Header Area End -->
