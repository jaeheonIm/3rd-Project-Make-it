package com.makeit.member;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	private String memberId, memberPwd, memberName, memberAddress, memberPhone, 
				   memberEmail, memberBirth, memberInterest, memberNickname, memberPicture;

	private MultipartFile uploadPicture;

	//마이페이지 카운트를 위해 생성
	private int memberFundCnt;
	private int memberStoreCnt;
	private int memberAskCnt;
	
	//카드 등록
	private String cardCategory, cardNumber, cardExpiration, cardSecurity;
	
	//문의
	private String qnaIdx, qnaTitle, qnaContent, qnaImg, qnaDate, qnaHit, qnaDelete;

	private int followCnt; //팔로우 수
	private int totalCnt; //펀딩 및 스토어 구매 수
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPwd() {
		return memberPwd;
	}
	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberAddress() {
		return memberAddress;
	}
	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberBirth() {
		return memberBirth;
	}
	public void setMemberBirth(String memberBirth) {
		this.memberBirth = memberBirth;
	}
	public String getMemberInterest() {
		return memberInterest;
	}
	public void setMemberInterest(String memberInterest) {
		this.memberInterest = memberInterest;
	}
	public String getMemberNickname() {
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}
	public String getMemberPicture() {
		return memberPicture;
	}
	public void setMemberPicture(String memberPicture) {
		this.memberPicture = memberPicture;
	}
	public MultipartFile getUploadPicture() {
		return uploadPicture;
	}
	public void setUploadPicture(MultipartFile uploadPicture) {
		this.uploadPicture = uploadPicture;
	}
	public int getMemberFundCnt() {
		return memberFundCnt;
	}
	public void setMemberFundCnt(int memberFundCnt) {
		this.memberFundCnt = memberFundCnt;
	}
	public int getMemberStoreCnt() {
		return memberStoreCnt;
	}
	public void setMemberStoreCnt(int memberStoreCnt) {
		this.memberStoreCnt = memberStoreCnt;
	}
	public int getMemberAskCnt() {
		return memberAskCnt;
	}
	public void setMemberAskCnt(int memberAskCnt) {
		this.memberAskCnt = memberAskCnt;
	}
	public String getCardCategory() {
		return cardCategory;
	}
	public void setCardCategory(String cardCategory) {
		this.cardCategory = cardCategory;
	}
	public String getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	public String getCardExpiration() {
		return cardExpiration;
	}
	public void setCardExpiration(String cardExpiration) {
		this.cardExpiration = cardExpiration;
	}
	public String getCardSecurity() {
		return cardSecurity;
	}
	public void setCardSecurity(String cardSecurity) {
		this.cardSecurity = cardSecurity;
	}
	public String getQnaIdx() {
		return qnaIdx;
	}
	public void setQnaIdx(String qnaIdx) {
		this.qnaIdx = qnaIdx;
	}
	public String getQnaTitle() {
		return qnaTitle;
	}
	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}
	public String getQnaContent() {
		return qnaContent;
	}
	public void setQnaContent(String qnaContent) {
		this.qnaContent = qnaContent;
	}
	public String getQnaImg() {
		return qnaImg;
	}
	public void setQnaImg(String qnaImg) {
		this.qnaImg = qnaImg;
	}
	public String getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(String qnaDate) {
		this.qnaDate = qnaDate;
	}
	public String getQnaHit() {
		return qnaHit;
	}
	public void setQnaHit(String qnaHit) {
		this.qnaHit = qnaHit;
	}
	public String getQnaDelete() {
		return qnaDelete;
	}
	public void setQnaDelete(String qnaDelete) {
		this.qnaDelete = qnaDelete;
	}
	public int getFollowCnt() {
		return followCnt;
	}
	public void setFollowCnt(int followCnt) {
		this.followCnt = followCnt;
	}
	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	@Override
	public String toString() {
		return "MemberVO [memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName=" + memberName
				+ ", memberAddress=" + memberAddress + ", memberPhone=" + memberPhone + ", memberEmail=" + memberEmail
				+ ", memberBirth=" + memberBirth + ", memberInterest=" + memberInterest + ", memberNickname="
				+ memberNickname + ", memberPicture=" + memberPicture + ", uploadPicture=" + uploadPicture
				+ ", memberFundCnt=" + memberFundCnt + ", memberStoreCnt=" + memberStoreCnt + ", memberAskCnt="
				+ memberAskCnt + ", cardCategory=" + cardCategory + ", cardNumber=" + cardNumber + ", cardExpiration="
				+ cardExpiration + ", cardSecurity=" + cardSecurity + ", qnaIdx=" + qnaIdx + ", qnaTitle=" + qnaTitle
				+ ", qnaContent=" + qnaContent + ", qnaImg=" + qnaImg + ", qnaDate=" + qnaDate + ", qnaHit=" + qnaHit
				+ ", qnaDelete=" + qnaDelete + ", followCnt=" + followCnt + ", totalCnt=" + totalCnt + "]";
	}
	

	
}
