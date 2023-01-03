package com.makeit.member;

public class AdminVO {
	private String memberId, monthDate, dailyDate, category , fundCategory, storeTitle, storePrice, storeCategory;
	private int monthPrice, monthAvg, dailyPrice, dailyAvg , categoryCnt , fundCategoryCnt, rank, adMonthPrice, adMonthAvg, adDailyPrice, adDailyAvg;
	
	private String couponIdx, fundIdx, storeIdx, couponPrice, couponTitle, couponContent, couponStartDate, couponEndDate, couponTotalCnt, myCouponCnt;

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMonthDate() {
		return monthDate;
	}

	public void setMonthDate(String monthDate) {
		this.monthDate = monthDate;
	}

	public String getDailyDate() {
		return dailyDate;
	}

	public void setDailyDate(String dailyDate) {
		this.dailyDate = dailyDate;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getFundCategory() {
		return fundCategory;
	}

	public void setFundCategory(String fundCategory) {
		this.fundCategory = fundCategory;
	}

	public String getStoreTitle() {
		return storeTitle;
	}

	public void setStoreTitle(String storeTitle) {
		this.storeTitle = storeTitle;
	}

	public String getStorePrice() {
		return storePrice;
	}

	public void setStorePrice(String storePrice) {
		this.storePrice = storePrice;
	}

	public String getStoreCategory() {
		return storeCategory;
	}

	public void setStoreCategory(String storeCategory) {
		this.storeCategory = storeCategory;
	}

	public int getMonthPrice() {
		return monthPrice;
	}

	public void setMonthPrice(int monthPrice) {
		this.monthPrice = monthPrice;
	}

	public int getMonthAvg() {
		return monthAvg;
	}

	public void setMonthAvg(int monthAvg) {
		this.monthAvg = monthAvg;
	}

	public int getDailyPrice() {
		return dailyPrice;
	}

	public void setDailyPrice(int dailyPrice) {
		this.dailyPrice = dailyPrice;
	}

	public int getDailyAvg() {
		return dailyAvg;
	}

	public void setDailyAvg(int dailyAvg) {
		this.dailyAvg = dailyAvg;
	}

	public int getCategoryCnt() {
		return categoryCnt;
	}

	public void setCategoryCnt(int categoryCnt) {
		this.categoryCnt = categoryCnt;
	}

	public int getFundCategoryCnt() {
		return fundCategoryCnt;
	}

	public void setFundCategoryCnt(int fundCategoryCnt) {
		this.fundCategoryCnt = fundCategoryCnt;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public int getAdMonthPrice() {
		return adMonthPrice;
	}

	public void setAdMonthPrice(int adMonthPrice) {
		this.adMonthPrice = adMonthPrice;
	}

	public int getAdMonthAvg() {
		return adMonthAvg;
	}

	public void setAdMonthAvg(int adMonthAvg) {
		this.adMonthAvg = adMonthAvg;
	}

	public int getAdDailyPrice() {
		return adDailyPrice;
	}

	public void setAdDailyPrice(int adDailyPrice) {
		this.adDailyPrice = adDailyPrice;
	}

	public int getAdDailyAvg() {
		return adDailyAvg;
	}

	public void setAdDailyAvg(int adDailyAvg) {
		this.adDailyAvg = adDailyAvg;
	}

	public String getCouponIdx() {
		return couponIdx;
	}

	public void setCouponIdx(String couponIdx) {
		this.couponIdx = couponIdx;
	}

	public String getFundIdx() {
		return fundIdx;
	}

	public void setFundIdx(String fundIdx) {
		this.fundIdx = fundIdx;
	}

	public String getStoreIdx() {
		return storeIdx;
	}

	public void setStoreIdx(String storeIdx) {
		this.storeIdx = storeIdx;
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

	public String getCouponTotalCnt() {
		return couponTotalCnt;
	}

	public void setCouponTotalCnt(String couponTotalCnt) {
		this.couponTotalCnt = couponTotalCnt;
	}

	public String getMyCouponCnt() {
		return myCouponCnt;
	}

	public void setMyCouponCnt(String myCouponCnt) {
		this.myCouponCnt = myCouponCnt;
	}

	@Override
	public String toString() {
		return "AdminVO [memberId=" + memberId + ", monthDate=" + monthDate + ", dailyDate=" + dailyDate + ", category="
				+ category + ", fundCategory=" + fundCategory + ", storeTitle=" + storeTitle + ", storePrice="
				+ storePrice + ", storeCategory=" + storeCategory + ", monthPrice=" + monthPrice + ", monthAvg="
				+ monthAvg + ", dailyPrice=" + dailyPrice + ", dailyAvg=" + dailyAvg + ", categoryCnt=" + categoryCnt
				+ ", fundCategoryCnt=" + fundCategoryCnt + ", rank=" + rank + ", adMonthPrice=" + adMonthPrice
				+ ", adMonthAvg=" + adMonthAvg + ", adDailyPrice=" + adDailyPrice + ", adDailyAvg=" + adDailyAvg
				+ ", couponIdx=" + couponIdx + ", fundIdx=" + fundIdx + ", storeIdx=" + storeIdx + ", couponPrice="
				+ couponPrice + ", couponTitle=" + couponTitle + ", couponContent=" + couponContent
				+ ", couponStartDate=" + couponStartDate + ", couponEndDate=" + couponEndDate + ", couponTotalCnt="
				+ couponTotalCnt + ", myCouponCnt=" + myCouponCnt + "]";
	}

	
}
