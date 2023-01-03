package com.makeit.fund;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class FundVO {
	private String memberId;
	private String fundIdx;
	private String fundTitle;
	private String fundMembership;
	private String fundMainImg;
	private String fundDetailImg;
	private String fundCategory;
	private String fundPrice; // 현재 펀딩된 금액
	private String fundTargetPrice; // 펀딩 목표 금액
	private String fundStartDate; //펀딩 시작일
	private String fundEndDate; // 펀딩 마감일
	private String fundDday; //펀딩 디데이
	private String fundTag;
	private String fundSupporter;
//	==========================================
	private String fundReviewIdx;
	private String fundReviewImg;
	private String fundReviewScore;
	private String fundReviewContent;
	private String fundReviewRegdate;
	private String fundReveiwWriteDate; //펀드 리뷰 작성일자 (년월일 시분)
	private float fundReviewAvg; // 리뷰 평점
//	==========================================
	private String fundOptionIdx;
	private String fundOptionPrice;
	private String fundOptionContent;
	private String fundOptionTitle;
	private String fundOptionDelivery;
//	==========================================
	private String fundAskContent;
	private String fundAskDate;
//	==========================================
	private String fundLikeIdx;
	private String likeCnt;
	private String computePrice;
	private String fundMakerId;
	private String fundMakerName;
	private String fundMakerImg;
	private String fundMakerEmail;
	private String fundMakerHomepage;
	private String fundMakerCallNumber;
//	==========================================
	private String followingId;
	private String followerId;
//	==========================================
	private String ordersIdx;
	private String ordersCardCompany;
	private String ordersCardNumber;
	private String ordersCardPassword;
	private String ordersAddress;
	private String ordersReceiver;
	private String ordersComment;
	private String ordersPrice;
	private String ordersDate;
	private String ordersAddressDetail;
	private String totalPrice;
	private String ordersPhone;
	private String ordersOptionTitle;
//	==========================================
	private String fundQnaIdx;
	private String fundQnaTitle;
	private String fundQnaContent;
	private String fundQnaDate;
	private String fundQnaCategory;
	private String fundQnaReContent; // QnA 답글
	private String fundQnaReDate;
//	==========================================
	private String couponIdx;
	private String couponPrice;
	private String couponTitle;
	private String couponContent;
	private String couponStartDate;
	private String couponEndDate;
	private String couponCheck;
//	==========================================
	private int fundQnaIdxReCNT;
	private int fundTotalPrice; // 계산된 금액
	private int fundTotalPricePercent; // 계산된 금액
	private int communityCnt;
	private int supporterCnt;
	private int priceSum;
	private int statusChange;
	
	private String lastSaveDate; // 최근 저장 날짜
	private String fundTeamMember; //펀딩 함께하는 멤버 이메일 
	private String authkey; // 인증키
	private String authstatus; // 권한확인
	private String memberName;
	
	// 검색을 위한 데이터 저장용
	@JsonIgnore
	private String searchCondition = "TITLE";
	@JsonIgnore
	private String searchKeyword = "";
	
	// 파일 업로드용
	@JsonIgnore
	private MultipartFile uploadFile;
	
	//여러 파일 불러오기용
	private MultipartFile getImg;
	
	public FundVO() {
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getFundIdx() {
		return fundIdx;
	}

	public void setFundIdx(String fundIdx) {
		this.fundIdx = fundIdx;
	}

	public String getFundTitle() {
		return fundTitle;
	}

	public void setFundTitle(String fundTitle) {
		this.fundTitle = fundTitle;
	}

	public String getFundMembership() {
		return fundMembership;
	}

	public void setFundMembership(String fundMembership) {
		this.fundMembership = fundMembership;
	}

	public String getFundMainImg() {
		return fundMainImg;
	}

	public void setFundMainImg(String fundMainImg) {
		this.fundMainImg = fundMainImg;
	}

	public String getFundDetailImg() {
		return fundDetailImg;
	}

	public void setFundDetailImg(String fundDetailImg) {
		this.fundDetailImg = fundDetailImg;
	}

	public String getFundCategory() {
		return fundCategory;
	}

	public void setFundCategory(String fundCategory) {
		this.fundCategory = fundCategory;
	}

	public String getFundTargetPrice() {
		return fundTargetPrice;
	}

	public void setFundTargetPrice(String fundTargetPrice) {
		this.fundTargetPrice = fundTargetPrice;
	}

	public String getFundStartDate() {
		return fundStartDate;
	}

	public void setFundStartDate(String fundStartDate) {
		this.fundStartDate = fundStartDate;
	}

	public String getFundEndDate() {
		return fundEndDate;
	}

	public void setFundEndDate(String fundEndDate) {
		this.fundEndDate = fundEndDate;
	}
	
	public String getFundDday() {
		return fundDday;
	}

	public void setFundDday(String fundDday) {
		this.fundDday = fundDday;
	}

	public String getFundTag() {
		return fundTag;
	}

	public void setFundTag(String fundTag) {
		this.fundTag = fundTag;
	}

	public String getFundSupporter() {
		return fundSupporter;
	}

	public void setFundSupporter(String fundSupporter) {
		this.fundSupporter = fundSupporter;
	}

	public String getFundPrice() {
		return fundPrice;
	}

	public void setFundPrice(String fundPrice) {
		this.fundPrice = fundPrice;
	}
	
	public String getFundReviewIdx() {
		return fundReviewIdx;
	}

	public void setFundReviewIdx(String fundReviewIdx) {
		this.fundReviewIdx = fundReviewIdx;
	}

	public String getFundReviewImg() {
		return fundReviewImg;
	}

	public void setFundReviewImg(String fundReviewImg) {
		this.fundReviewImg = fundReviewImg;
	}

	public String getFundReviewScore() {
		return fundReviewScore;
	}

	public void setFundReviewScore(String fundReviewScore) {
		this.fundReviewScore = fundReviewScore;
	}

	public String getFundReviewContent() {
		return fundReviewContent;
	}

	public void setFundReviewContent(String fundReviewContent) {
		this.fundReviewContent = fundReviewContent;
	}

	public String getFundReviewRegdate() {
		return fundReviewRegdate;
	}

	public void setFundReviewRegdate(String fundReviewRegdate) {
		this.fundReviewRegdate = fundReviewRegdate;
	}
	
	public String getFundReveiwWriteDate() {
		return fundReveiwWriteDate;
	}

	public void setFundReveiwWriteDate(String fundReveiwWriteDate) {
		this.fundReveiwWriteDate = fundReveiwWriteDate;
	}
	
	public float getFundReviewAvg() {
		return fundReviewAvg;
	}

	public void setFundReviewAvg(float fundReviewAvg) {
		this.fundReviewAvg = fundReviewAvg;
	}

	public String getFundOptionPrice() {
		return fundOptionPrice;
	}

	public void setFundOptionPrice(String fundOptionPrice) {
		this.fundOptionPrice = fundOptionPrice;
	}

	public String getFundOptionContent() {
		return fundOptionContent;
	}

	public void setFundOptionContent(String fundOptionContent) {
		this.fundOptionContent = fundOptionContent;
	}

	public String getFundOptionTitle() {
		return fundOptionTitle;
	}

	public void setFundOptionTitle(String fundOptionTitle) {
		this.fundOptionTitle = fundOptionTitle;
	}

	public String getFundOptionDelivery() {
		return fundOptionDelivery;
	}

	public void setFundOptionDelivery(String fundOptionDelivery) {
		this.fundOptionDelivery = fundOptionDelivery;
	}

	public String getFundAskContent() {
		return fundAskContent;
	}

	public void setFundAskContent(String fundAskContent) {
		this.fundAskContent = fundAskContent;
	}

	public String getFundAskDate() {
		return fundAskDate;
	}

	public void setFundAskDate(String fundAskDate) {
		this.fundAskDate = fundAskDate;
	}

	public String getFundLikeIdx() {
		return fundLikeIdx;
	}

	public void setFundLikeIdx(String fundLikeIdx) {
		this.fundLikeIdx = fundLikeIdx;
	}

	public String getLikeCnt() {
		return likeCnt;
	}

	public void setLikeCnt(String likeCnt) {
		this.likeCnt = likeCnt;
	}
	
	public String getComputePrice() {
		return computePrice;
	}

	public String getFundMakerName() {
		return fundMakerName;
	}
	
	public String getFundMakerId() {
		return fundMakerId;
	}

	public void setFundMakerId(String fundMakerId) {
		this.fundMakerId = fundMakerId;
	}

	public void setFundMakerName(String fundMakerName) {
		this.fundMakerName = fundMakerName;
	}

	public String getFundMakerImg() {
		return fundMakerImg;
	}

	public void setFundMakerImg(String fundMakerImg) {
		this.fundMakerImg = fundMakerImg;
	}
	
	public String getFundMakerEmail() {
		return fundMakerEmail;
	}

	public void setFundMakerEmail(String fundMakerEmail) {
		this.fundMakerEmail = fundMakerEmail;
	}

	public String getFundMakerHomepage() {
		return fundMakerHomepage;
	}

	public void setFundMakerHomepage(String fundMakerHomepage) {
		this.fundMakerHomepage = fundMakerHomepage;
	}

	public String getFundMakerCallNumber() {
		return fundMakerCallNumber;
	}

	public void setFundMakerCallNumber(String fundMakerCallNumber) {
		this.fundMakerCallNumber = fundMakerCallNumber;
	}
	
	public String getFollowingId() {
		return followingId;
	}

	public void setFollowingId(String followingId) {
		this.followingId = followingId;
	}

	public String getFollowerId() {
		return followerId;
	}

	public void setFollowerId(String followerId) {
		this.followerId = followerId;
	}
	
	public String getFundOptionIdx() {
		return fundOptionIdx;
	}

	public void setFundOptionIdx(String fundOptionIdx) {
		this.fundOptionIdx = fundOptionIdx;
	}
	
	// 검색 ===========================================

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}

	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	
	// 파일 업로드 관련 ===========================================
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public int getCommunityCnt() {
		return communityCnt;
	}

	public void setCommunityCnt(int communityCnt) {
		this.communityCnt = communityCnt;
	}

	public int getSupporterCnt() {
		return supporterCnt;
	}

	public void setSupporterCnt(int supporterCnt) {
		this.supporterCnt = supporterCnt;
	}

	public MultipartFile getGetImg() {
		return getImg;
	}

	public void setGetImg(MultipartFile getImg) {
		this.getImg = getImg;
	}

	public MultipartFile getImg() {
		return getImg;
	}

	public int getPriceSum() {
		return priceSum;
	}

	public void setPriceSum(int priceSum) {
		this.priceSum = priceSum;
	}
	
	// Orders 관련 ======================================================

	public String getOrdersIdx() {
		return ordersIdx;
	}

	public void setOrdersIdx(String ordersIdx) {
		this.ordersIdx = ordersIdx;
	}

	public String getOrdersCardCompany() {
		return ordersCardCompany;
	}

	public void setOrdersCardCompany(String ordersCardCompany) {
		this.ordersCardCompany = ordersCardCompany;
	}

	public String getOrdersCardNumber() {
		return ordersCardNumber;
	}

	public void setOrdersCardNumber(String ordersCardNumber) {
		this.ordersCardNumber = ordersCardNumber;
	}

	public String getOrdersCardPassword() {
		return ordersCardPassword;
	}

	public void setOrdersCardPassword(String ordersCardPassword) {
		this.ordersCardPassword = ordersCardPassword;
	}

	public String getOrdersAddress() {
		return ordersAddress;
	}

	public void setOrdersAddress(String ordersAddress) {
		this.ordersAddress = ordersAddress;
	}

	public String getOrdersReceiver() {
		return ordersReceiver;
	}

	public void setOrdersReceiver(String ordersReceiver) {
		this.ordersReceiver = ordersReceiver;
	}

	public String getOrdersComment() {
		return ordersComment;
	}

	public void setOrdersComment(String ordersComment) {
		this.ordersComment = ordersComment;
	}

	public String getOrdersPrice() {
		return ordersPrice;
	}

	public void setOrdersPrice(String ordersPrice) {
		this.ordersPrice = ordersPrice;
	}

	public String getOrdersDate() {
		return ordersDate;
	}

	public void setOrdersDate(String ordersDate) {
		this.ordersDate = ordersDate;
	}

	public String getOrdersAddressDetail() {
		return ordersAddressDetail;
	}

	public void setOrdersAddressDetail(String ordersAddressDetail) {
		this.ordersAddressDetail = ordersAddressDetail;
	}
	
	public String getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	public String getOrdersPhone() {
		return ordersPhone;
	}

	public void setOrdersPhone(String ordersPhone) {
		this.ordersPhone = ordersPhone;
	}
	
	public String getOrdersOptionTitle() {
		return ordersOptionTitle;
	}

	public void setOrdersOptionTitle(String ordersOptionTitle) {
		this.ordersOptionTitle = ordersOptionTitle;
	}

	// QnA 관련 ======================================================

	public String getFundQnaIdx() {
		return fundQnaIdx;
	}

	public void setFundQnaIdx(String fundQnaIdx) {
		this.fundQnaIdx = fundQnaIdx;
	}

	public String getFundQnaTitle() {
		return fundQnaTitle;
	}

	public void setFundQnaTitle(String fundQnaTitle) {
		this.fundQnaTitle = fundQnaTitle;
	}

	public String getFundQnaContent() {
		return fundQnaContent;
	}

	public void setFundQnaContent(String fundQnaContent) {
		this.fundQnaContent = fundQnaContent;
	}

	public String getFundQnaDate() {
		return fundQnaDate;
	}

	public void setFundQnaDate(String fundQnaDate) {
		this.fundQnaDate = fundQnaDate;
	}
	
	public String getFundQnaCategory() {
		return fundQnaCategory;
	}

	public void setFundQnaCategory(String fundQnaCategory) {
		this.fundQnaCategory = fundQnaCategory;
	}
	
	public String getFundQnaReContent() {
		return fundQnaReContent;
	}

	public void setFundQnaReContent(String fundQnaReContent) {
		this.fundQnaReContent = fundQnaReContent;
	}     
	
	public int getFundQnaIdxReCNT() {
		return fundQnaIdxReCNT;
	}

	public void setFundQnaIdxReCNT(int fundQnaIdxReCNT) {
		this.fundQnaIdxReCNT = fundQnaIdxReCNT;
	}

	
	public String getFundQnaReDate() {
		return fundQnaReDate;
	}

	public void setFundQnaReDate(String fundQnaReDate) {
		this.fundQnaReDate = fundQnaReDate;
	}
	
	public int getStatusChange() {
		return statusChange;
	}

	public void setStatusChange(int statusChange) {
		this.statusChange = statusChange;
	}

	// Progress Bar 관련 ==============================================
	
	public int getFundTotalPrice() {
		return fundTotalPrice;
	}

	public void setFundTotalPrice(int fundTotalPrice) {
		this.fundTotalPrice = fundTotalPrice;
	}
	
	public int getFundTotalPricePercent() {
		return fundTotalPricePercent;
	}

	public void setFundTotalPricePercent(int fundTotalPricePercent) {
		this.fundTotalPricePercent = fundTotalPricePercent;
	}

	// Coupon 관련 ==============================================
	
	public String getCouponIdx() {
		return couponIdx;
	}

	public void setCouponIdx(String couponIdx) {
		this.couponIdx = couponIdx;
	}

	public String getCouponPrice() {
		return couponPrice;
	}

	public void setCouponPrice(String couponPrice) {
		this.couponPrice = couponPrice;
	}

	public String getCouponTitle() {
		return couponTitle;
	}

	public void setCouponTitle(String couponTitle) {
		this.couponTitle = couponTitle;
	}

	public String getCouponContent() {
		return couponContent;
	}

	public void setCouponContent(String couponContent) {
		this.couponContent = couponContent;
	}

	public String getCouponStartDate() {
		return couponStartDate;
	}

	public void setCouponStartDate(String couponStartDate) {
		this.couponStartDate = couponStartDate;
	}

	public String getCouponEndDate() {
		return couponEndDate;
	}

	public void setCouponEndDate(String couponEndDate) {
		this.couponEndDate = couponEndDate;
	}

	public String getCouponCheck() {
		return couponCheck;
	}

	public void setCouponCheck(String couponCheck) {
		this.couponCheck = couponCheck;
	}
	//==============================================================
	
	public String getLastSaveDate() {
		return lastSaveDate;
	}

	public void setLastSaveDate(String lastSaveDate) {
		this.lastSaveDate = lastSaveDate;
	}

	public String getFundTeamMember() {
		return fundTeamMember;
	}

	public void setFundTeamMember(String fundTeamMember) {
		this.fundTeamMember = fundTeamMember;
	}

	public String getAuthkey() {
		return authkey;
	}

	public void setAuthkey(String authkey) {
		this.authkey = authkey;
	}

	public String getAuthstatus() {
		return authstatus;
	}

	public void setAuthstatus(String authstatus) {
		this.authstatus = authstatus;
	}

	public void setComputePrice(String computePrice) {
		this.computePrice = computePrice;
	}
	
	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("FundVO [memberId=");
		builder.append(memberId);
		builder.append(", fundIdx=");
		builder.append(fundIdx);
		builder.append(", fundTitle=");
		builder.append(fundTitle);
		builder.append(", fundMembership=");
		builder.append(fundMembership);
		builder.append(", fundMainImg=");
		builder.append(fundMainImg);
		builder.append(", fundDetailImg=");
		builder.append(fundDetailImg);
		builder.append(", fundCategory=");
		builder.append(fundCategory);
		builder.append(", fundPrice=");
		builder.append(fundPrice);
		builder.append(", fundTargetPrice=");
		builder.append(fundTargetPrice);
		builder.append(", fundStartDate=");
		builder.append(fundStartDate);
		builder.append(", fundEndDate=");
		builder.append(fundEndDate);
		builder.append(", fundDday=");
		builder.append(fundDday);
		builder.append(", fundTag=");
		builder.append(fundTag);
		builder.append(", fundSupporter=");
		builder.append(fundSupporter);
		builder.append(", fundReviewIdx=");
		builder.append(fundReviewIdx);
		builder.append(", fundReviewImg=");
		builder.append(fundReviewImg);
		builder.append(", fundReviewScore=");
		builder.append(fundReviewScore);
		builder.append(", fundReviewContent=");
		builder.append(fundReviewContent);
		builder.append(", fundReviewRegdate=");
		builder.append(fundReviewRegdate);
		builder.append(", fundReveiwWriteDate=");
		builder.append(fundReveiwWriteDate);
		builder.append(", fundReviewAvg=");
		builder.append(fundReviewAvg);
		builder.append(", fundOptionIdx=");
		builder.append(fundOptionIdx);
		builder.append(", fundOptionPrice=");
		builder.append(fundOptionPrice);
		builder.append(", fundOptionContent=");
		builder.append(fundOptionContent);
		builder.append(", fundOptionTitle=");
		builder.append(fundOptionTitle);
		builder.append(", fundOptionDelivery=");
		builder.append(fundOptionDelivery);
		builder.append(", fundAskContent=");
		builder.append(fundAskContent);
		builder.append(", fundAskDate=");
		builder.append(fundAskDate);
		builder.append(", fundLikeIdx=");
		builder.append(fundLikeIdx);
		builder.append(", likeCnt=");
		builder.append(likeCnt);
		builder.append(", computePrice=");
		builder.append(computePrice);
		builder.append(", fundMakerId=");
		builder.append(fundMakerId);
		builder.append(", fundMakerName=");
		builder.append(fundMakerName);
		builder.append(", fundMakerImg=");
		builder.append(fundMakerImg);
		builder.append(", fundMakerEmail=");
		builder.append(fundMakerEmail);
		builder.append(", fundMakerHomepage=");
		builder.append(fundMakerHomepage);
		builder.append(", fundMakerCallNumber=");
		builder.append(fundMakerCallNumber);
		builder.append(", followingId=");
		builder.append(followingId);
		builder.append(", followerId=");
		builder.append(followerId);
		builder.append(", ordersIdx=");
		builder.append(ordersIdx);
		builder.append(", ordersCardCompany=");
		builder.append(ordersCardCompany);
		builder.append(", ordersCardNumber=");
		builder.append(ordersCardNumber);
		builder.append(", ordersCardPassword=");
		builder.append(ordersCardPassword);
		builder.append(", ordersAddress=");
		builder.append(ordersAddress);
		builder.append(", ordersReceiver=");
		builder.append(ordersReceiver);
		builder.append(", ordersComment=");
		builder.append(ordersComment);
		builder.append(", ordersPrice=");
		builder.append(ordersPrice);
		builder.append(", ordersDate=");
		builder.append(ordersDate);
		builder.append(", ordersAddressDetail=");
		builder.append(ordersAddressDetail);
		builder.append(", totalPrice=");
		builder.append(totalPrice);
		builder.append(", ordersPhone=");
		builder.append(ordersPhone);
		builder.append(", ordersOptionTitle=");
		builder.append(ordersOptionTitle);
		builder.append(", fundQnaIdx=");
		builder.append(fundQnaIdx);
		builder.append(", fundQnaTitle=");
		builder.append(fundQnaTitle);
		builder.append(", fundQnaContent=");
		builder.append(fundQnaContent);
		builder.append(", fundQnaDate=");
		builder.append(fundQnaDate);
		builder.append(", fundQnaCategory=");
		builder.append(fundQnaCategory);
		builder.append(", fundQnaReContent=");
		builder.append(fundQnaReContent);
		builder.append(", fundQnaReDate=");
		builder.append(fundQnaReDate);
		builder.append(", couponIdx=");
		builder.append(couponIdx);
		builder.append(", couponPrice=");
		builder.append(couponPrice);
		builder.append(", couponTitle=");
		builder.append(couponTitle);
		builder.append(", couponContent=");
		builder.append(couponContent);
		builder.append(", couponStartDate=");
		builder.append(couponStartDate);
		builder.append(", couponEndDate=");
		builder.append(couponEndDate);
		builder.append(", couponCheck=");
		builder.append(couponCheck);
		builder.append(", fundQnaIdxReCNT=");
		builder.append(fundQnaIdxReCNT);
		builder.append(", fundTotalPrice=");
		builder.append(fundTotalPrice);
		builder.append(", fundTotalPricePercent=");
		builder.append(fundTotalPricePercent);
		builder.append(", communityCnt=");
		builder.append(communityCnt);
		builder.append(", supporterCnt=");
		builder.append(supporterCnt);
		builder.append(", priceSum=");
		builder.append(priceSum);
		builder.append(", statusChange=");
		builder.append(statusChange);
		builder.append(", lastSaveDate=");
		builder.append(lastSaveDate);
		builder.append(", fundTeamMember=");
		builder.append(fundTeamMember);
		builder.append(", authkey=");
		builder.append(authkey);
		builder.append(", authstatus=");
		builder.append(authstatus);
		builder.append(", searchCondition=");
		builder.append(searchCondition);
		builder.append(", searchKeyword=");
		builder.append(searchKeyword);
		builder.append(", uploadFile=");
		builder.append(uploadFile);
		builder.append(", getImg=");
		builder.append(getImg);
		builder.append("]");
		return builder.toString();
	}

}
