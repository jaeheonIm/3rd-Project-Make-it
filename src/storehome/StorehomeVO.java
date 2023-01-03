package com.makeit.storehome;

import org.springframework.web.multipart.MultipartFile;

public class StorehomeVO {
	private String storeIdx, storeTitle, storePrice, storeImg, storeDate, storeCategory,
	storeSatisfy, memberId, storeDel2, storeOption, storeOptiondetail;
	
	private String ordersIdx, fundIdx, ordersCardCompany, ordersCardNumber, ordersCardPaswword,
				ordersAddress, ordersReceiver, ordersComment, ordersPrice, ordersDate, ordersAddressdtail;

	private String storeReviewImg, 	storeReviewScore, storeReviewContent, storeReviewRegdate, ordersOptionTitle;
	
	private String qnaIdx, qnaTitle, qnaContent, qnaImg, qnaDate, qnaHit, qnaDelete,
	qnaCategory,qnaChange, qnaReContent, qnaReDate, followingId, followerId, cPage, storeImgDetail, couponIdx, ouponCheck
	,couponPrice, couponTitle, couponContent, couponStartDate, couponEndDate;
	
	private String cnt, sum;
	
	private int nowPage = 1; // 현재페이지 
	private int nowBlock = 1; // 현재블록(페이지 담는 단위)
	
	private int numPerPage = 9; // 하나의 페이지에 표시할 게시글 수
	private int numPerBlock = 9; // 블록당 표시하는 페이지 갯수
	
	
	
	public String getQnaChange() {
		return qnaChange;
	}
	public void setQnaChange(String qnaChange) {
		this.qnaChange = qnaChange;
	}

	private int totalRecord = 0; // 총 게시글의 갯수 (원본 게시글 수)
	private int totalPage = 0; // 총 페이지 수
	private int totalBlock = 0; // 전체 블록 갯수
	
	private int begin = 0; // 현재 페이지상의 시작 번호 - 글번호와 상관 없음
	private int end = 0; // 현재 페이지상의 끝 번호 - 글번호와 상관 없음
	
	private int beginPage = 0; // 현재 블록의 시작 페이지 번호
	private int endPage = 0; // 현재 블록의 끝 페이지 번호
	
	// 전체 페이지 갯수 구하기
		public void setTotalPage() {
			totalPage = totalRecord / numPerPage;
			if (totalRecord % numPerPage > 0) totalPage++;
		}
	
	public String getCouponIdx() {
			return couponIdx;
		}
		public void setCouponIdx(String couponIdx) {
			this.couponIdx = couponIdx;
		}
		public String getOuponCheck() {
			return ouponCheck;
		}
		public void setOuponCheck(String ouponCheck) {
			this.ouponCheck = ouponCheck;
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
	public String getStoreImgDetail() {
			return storeImgDetail;
		}
		public void setStoreImgDetail(String storeImgDetail) {
			this.storeImgDetail = storeImgDetail;
		}
	public String getcPage() {
			return cPage;
		}
		public void setcPage(String cPage) {
			this.cPage = cPage;
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
	public String getOrdersOptionTitle() {
			return ordersOptionTitle;
		}
		public void setOrdersOptionTitle(String ordersOptionTitle) {
			this.ordersOptionTitle = ordersOptionTitle;
		}
	public String getQnaReContent() {
			return qnaReContent;
		}
		public void setQnaReContent(String qnaReContent) {
			this.qnaReContent = qnaReContent;
		}
		public String getQnaReDate() {
			return qnaReDate;
		}
		public void setQnaReDate(String qnaReDate) {
			this.qnaReDate = qnaReDate;
		}
	public String getQnaCategory() {
			return qnaCategory;
		}



		public void setQnaCategory(String qnaCategory) {
			this.qnaCategory = qnaCategory;
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



	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}

	public int getNowBlock() {
		return nowBlock;
	}

	public void setNowBlock(int nowBlock) {
		this.nowBlock = nowBlock;
	}

	public int getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}

	public int getNumPerBlock() {
		return numPerBlock;
	}

	public void setNumPerBlock(int numPerBlock) {
		this.numPerBlock = numPerBlock;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalBlock() {
		return totalBlock;
	}

	public void setTotalBlock(int totalBlock) {
		this.totalBlock = totalBlock;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public String getCnt() {
		return cnt;
	}

	public void setCnt(String cnt) {
		this.cnt = cnt;
	}

	public String getSum() {
		return sum;
	}

	public void setSum(String sum) {
		this.sum = sum;
	}

	private MultipartFile uploadFile;
	
	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getStoreReviewImg() {
		return storeReviewImg;
	}

	public void setStoreReviewImg(String storeReviewImg) {
		this.storeReviewImg = storeReviewImg;
	}

	public String getStoreReviewScore() {
		return storeReviewScore;
	}

	public void setStoreReviewScore(String storeReviewScore) {
		this.storeReviewScore = storeReviewScore;
	}

	public String getStoreReviewContent() {
		return storeReviewContent;
	}

	public void setStoreReviewContent(String storeReviewContent) {
		this.storeReviewContent = storeReviewContent;
	}

	public String getStoreReviewRegdate() {
		return storeReviewRegdate;
	}

	public void setStoreReviewRegdate(String storeReviewRegdate) {
		this.storeReviewRegdate = storeReviewRegdate;
	}

	public String getOrdersAddressdtail() {
		return ordersAddressdtail;
	}

	public void setOrdersAddressdtail(String ordersAddressdtail) {
		this.ordersAddressdtail = ordersAddressdtail;
	}

	public void setOrdersPrice(String ordersPrice) {
		this.ordersPrice = ordersPrice;
	}

	public String getOrdersIdx() {
		return ordersIdx;
	}

	public void setOrdersIdx(String ordersIdx) {
		this.ordersIdx = ordersIdx;
	}

	public String getFundIdx() {
		return fundIdx;
	}

	public void setFundIdx(String fundIdx) {
		this.fundIdx = fundIdx;
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

	public String getOrdersCardPaswword() {
		return ordersCardPaswword;
	}

	public void setOrdersCardPaswword(String ordersCardPaswword) {
		this.ordersCardPaswword = ordersCardPaswword;
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

	public void setOrders_Price(String ordersPrice) {
		this.ordersPrice = ordersPrice;
	}

	public String getOrdersDate() {
		return ordersDate;
	}

	public void setOrdersDate(String ordersDate) {
		this.ordersDate = ordersDate;
	}

	private int storeDel, storeOptionprice;
	
	public String getStoreOption() {
		return storeOption;
	}

	public void setStoreOption(String storeOption) {
		this.storeOption = storeOption;
	}

	public String getStoreOptiondetail() {
		return storeOptiondetail;
	}

	public void setStoreOptiondetail(String storeOptiondetail) {
		this.storeOptiondetail = storeOptiondetail;
	}

	public int getStoreOptionprice() {
		return storeOptionprice;
	}

	public void setStoreOptionprice(int storeOptionprice) {
		this.storeOptionprice = storeOptionprice;
	}

	public String getStoreDel2() {
		return storeDel2;
	}

	public void setStoreDel2(String storeDel2) {
		this.storeDel2 = storeDel2;
	}

	public String getStoreIdx() {
		return storeIdx;
	}

	public void setStoreIdx(String storeIdx) {
		this.storeIdx = storeIdx;
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

	public String getStoreImg() {
		return storeImg;
	}

	public void setStoreImg(String storeImg) {
		this.storeImg = storeImg;
	}

	public String getStoreDate() {
		return storeDate;
	}

	public void setStoreDate(String storeDate) {
		this.storeDate = storeDate;
	}

	public String getStoreCategory() {
		return storeCategory;
	}

	public void setStoreCategory(String storeCategory) {
		this.storeCategory = storeCategory;
	}

	public String getStoreSatisfy() {
		return storeSatisfy;
	}

	public void setStoreSatisfy(String storeSatisfy) {
		this.storeSatisfy = storeSatisfy;
	}

	public int getStoreDel() {
		return storeDel;
	}

	public void setStoreDel(int storeDel) {
		this.storeDel = storeDel;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	@Override
	public String toString() {
		return "StorehomeVO [storeIdx=" + storeIdx + ", storeTitle=" + storeTitle + ", storePrice=" + storePrice
				+ ", storeImg=" + storeImg + ", storeDate=" + storeDate + ", storeCategory=" + storeCategory
				+ ", storeSatisfy=" + storeSatisfy + ", memberId=" + memberId + ", storeDel2=" + storeDel2
				+ ", storeOption=" + storeOption + ", storeOptiondetail=" + storeOptiondetail + ", ordersIdx="
				+ ordersIdx + ", fundIdx=" + fundIdx + ", ordersCardCompany=" + ordersCardCompany
				+ ", ordersCardNumber=" + ordersCardNumber + ", ordersCardPaswword=" + ordersCardPaswword
				+ ", ordersAddress=" + ordersAddress + ", ordersReceiver=" + ordersReceiver + ", ordersComment="
				+ ordersComment + ", ordersPrice=" + ordersPrice + ", ordersDate=" + ordersDate
				+ ", ordersAddressdtail=" + ordersAddressdtail + ", storeReviewImg=" + storeReviewImg
				+ ", storeReviewScore=" + storeReviewScore + ", storeReviewContent=" + storeReviewContent
				+ ", storeReviewRegdate=" + storeReviewRegdate + ", ordersOptionTitle=" + ordersOptionTitle
				+ ", qnaIdx=" + qnaIdx + ", qnaTitle=" + qnaTitle + ", qnaContent=" + qnaContent + ", qnaImg=" + qnaImg
				+ ", qnaDate=" + qnaDate + ", qnaHit=" + qnaHit + ", qnaDelete=" + qnaDelete + ", qnaCategory="
				+ qnaCategory + ", qnaChange=" + qnaChange + ", qnaReContent=" + qnaReContent + ", qnaReDate="
				+ qnaReDate + ", followingId=" + followingId + ", followerId=" + followerId + ", cPage=" + cPage
				+ ", storeImgDetail=" + storeImgDetail + ", couponIdx=" + couponIdx + ", ouponCheck=" + ouponCheck
				+ ", couponPrice=" + couponPrice + ", couponTitle=" + couponTitle + ", couponContent=" + couponContent
				+ ", couponStartDate=" + couponStartDate + ", couponEndDate=" + couponEndDate + ", cnt=" + cnt
				+ ", sum=" + sum + ", nowPage=" + nowPage + ", nowBlock=" + nowBlock + ", numPerPage=" + numPerPage
				+ ", numPerBlock=" + numPerBlock + ", totalRecord=" + totalRecord + ", totalPage=" + totalPage
				+ ", totalBlock=" + totalBlock + ", begin=" + begin + ", end=" + end + ", beginPage=" + beginPage
				+ ", endPage=" + endPage + ", uploadFile=" + uploadFile + ", storeDel=" + storeDel
				+ ", storeOptionprice=" + storeOptionprice + "]";
	}
	
}
