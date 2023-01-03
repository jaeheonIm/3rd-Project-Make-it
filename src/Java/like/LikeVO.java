package com.makeit.like;

public class LikeVO {
	private String storeLikeIdx, storeIdx, memberId, fundLikeIdx, fundIdx;

	public String getStoreLikeIdx() {
		return storeLikeIdx;
	}

	public void setStoreLikeIdx(String storeLikeIdx) {
		this.storeLikeIdx = storeLikeIdx;
	}

	public String getStoreIdx() {
		return storeIdx;
	}

	public void setStoreIdx(String storeIdx) {
		this.storeIdx = storeIdx;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getFundLikeIdx() {
		return fundLikeIdx;
	}

	public void setFundLikeIdx(String fundLikeIdx) {
		this.fundLikeIdx = fundLikeIdx;
	}

	public String getFundIdx() {
		return fundIdx;
	}

	public void setFundIdx(String fundIdx) {
		this.fundIdx = fundIdx;
	}

	@Override
	public String toString() {
		return "LikeVO [storeLikeIdx=" + storeLikeIdx + ", storeIdx=" + storeIdx + ", memberId=" + memberId
				+ ", fundLikeIdx=" + fundLikeIdx + ", fundIdx=" + fundIdx + "]";
	}
	

	

}
