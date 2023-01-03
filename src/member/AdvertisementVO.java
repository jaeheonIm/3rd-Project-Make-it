package com.makeit.member;

public class AdvertisementVO {
	private String memberId, adStartDate, adEndDate, adPrice, adPosition, fundTitle, fundCategory, memberName, memberPhone, memberEmail;
	private int adIdx, fundIdx, adCheck, adCnt;
	
	private String adOrdersIdx, adOrdersCardCompany, adOrdersCardNumber,adOrdersCardPassword, adOrdersPrice,
				   adOrdersDate, adOrdersTitle, adOrdersPhone;

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getAdStartDate() {
		return adStartDate;
	}

	public void setAdStartDate(String adStartDate) {
		this.adStartDate = adStartDate;
	}

	public String getAdEndDate() {
		return adEndDate;
	}

	public void setAdEndDate(String adEndDate) {
		this.adEndDate = adEndDate;
	}

	public String getAdPrice() {
		return adPrice;
	}

	public void setAdPrice(String adPrice) {
		this.adPrice = adPrice;
	}

	public String getAdPosition() {
		return adPosition;
	}

	public void setAdPosition(String adPosition) {
		this.adPosition = adPosition;
	}

	public String getFundTitle() {
		return fundTitle;
	}

	public void setFundTitle(String fundTitle) {
		this.fundTitle = fundTitle;
	}

	public String getFundCategory() {
		return fundCategory;
	}

	public void setFundCategory(String fundCategory) {
		this.fundCategory = fundCategory;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
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

	public int getAdIdx() {
		return adIdx;
	}

	public void setAdIdx(int adIdx) {
		this.adIdx = adIdx;
	}

	public int getFundIdx() {
		return fundIdx;
	}

	public void setFundIdx(int fundIdx) {
		this.fundIdx = fundIdx;
	}

	public int getAdCheck() {
		return adCheck;
	}

	public void setAdCheck(int adCheck) {
		this.adCheck = adCheck;
	}

	public int getAdCnt() {
		return adCnt;
	}

	public void setAdCnt(int adCnt) {
		this.adCnt = adCnt;
	}

	public String getAdOrdersIdx() {
		return adOrdersIdx;
	}

	public void setAdOrdersIdx(String adOrdersIdx) {
		this.adOrdersIdx = adOrdersIdx;
	}

	public String getAdOrdersCardCompany() {
		return adOrdersCardCompany;
	}

	public void setAdOrdersCardCompany(String adOrdersCardCompany) {
		this.adOrdersCardCompany = adOrdersCardCompany;
	}

	public String getAdOrdersCardNumber() {
		return adOrdersCardNumber;
	}

	public void setAdOrdersCardNumber(String adOrdersCardNumber) {
		this.adOrdersCardNumber = adOrdersCardNumber;
	}

	public String getAdOrdersCardPassword() {
		return adOrdersCardPassword;
	}

	public void setAdOrdersCardPassword(String adOrdersCardPassword) {
		this.adOrdersCardPassword = adOrdersCardPassword;
	}

	public String getAdOrdersPrice() {
		return adOrdersPrice;
	}

	public void setAdOrdersPrice(String adOrdersPrice) {
		this.adOrdersPrice = adOrdersPrice;
	}

	public String getAdOrdersDate() {
		return adOrdersDate;
	}

	public void setAdOrdersDate(String adOrdersDate) {
		this.adOrdersDate = adOrdersDate;
	}

	public String getAdOrdersTitle() {
		return adOrdersTitle;
	}

	public void setAdOrdersTitle(String adOrdersTitle) {
		this.adOrdersTitle = adOrdersTitle;
	}

	public String getAdOrdersPhone() {
		return adOrdersPhone;
	}

	public void setAdOrdersPhone(String adOrdersPhone) {
		this.adOrdersPhone = adOrdersPhone;
	}

	@Override
	public String toString() {
		return "AdvertisementVO [memberId=" + memberId + ", adStartDate=" + adStartDate + ", adEndDate=" + adEndDate
				+ ", adPrice=" + adPrice + ", adPosition=" + adPosition + ", fundTitle=" + fundTitle + ", fundCategory="
				+ fundCategory + ", memberName=" + memberName + ", memberPhone=" + memberPhone + ", memberEmail="
				+ memberEmail + ", adIdx=" + adIdx + ", fundIdx=" + fundIdx + ", adCheck=" + adCheck + ", adCnt="
				+ adCnt + ", adOrdersIdx=" + adOrdersIdx + ", adOrdersCardCompany=" + adOrdersCardCompany
				+ ", adOrdersCardNumber=" + adOrdersCardNumber + ", adOrdersCardPassword=" + adOrdersCardPassword
				+ ", adOrdersPrice=" + adOrdersPrice + ", adOrdersDate=" + adOrdersDate + ", adOrdersTitle="
				+ adOrdersTitle + ", adOrdersPhone=" + adOrdersPhone + "]";
	}
	
}
