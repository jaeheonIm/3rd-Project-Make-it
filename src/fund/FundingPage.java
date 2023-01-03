package com.makeit.fund;

//페이지 처리시 사용할 데이터 저장클래스
public class FundingPage {
	private int cPage=0;
	private int nowPage = 1;
	private int nowBlock = 1; //페이지 아래쪽에 페이지 숫자나열된 곳을 block이라고 정함
	
	private int numPerPage = 9; //한페이지에 게시글목록의 갯수지정하는 변수
	private int numPerBlock = 9; //한페이지에 block에 보여지는 숫자의 갯수를 지정하는 변수
	
	private int totalRecord = 0; //총 게시물 갯수
	private int totalPage = 0; //전체 페이지 갯수(block과 연관)
	private int totalBlock = 0; //전체 block 갯수
	
	private int begin = 0; //현재 페이지 상의 시작 번호(DB에 있는 글번호와는 무관.페이지당 글갯수와 연관)
	private int end = 0; //현재 페이지 상의 마지막 번호(DB에 있는 글번호와는 무관.페이지당 글갯수와 연관)
	
	private int beginPage = 0; //현재 block의 시작 페이지번호
	private int endPage = 0; //현재 block의 마지막 페이지번호
	
	
	//전체 페이지 갯수 구하기
	public void setTotalPage() {
		totalPage = totalRecord / numPerPage;
		if(totalRecord % numPerPage >0) totalPage++;
	}
	
	public int getcPage() {
		return cPage;
	}

	public void setcPage(int cPage) {
		this.cPage = cPage;
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

	@Override
	public String toString() {
		return "Paging [cPage=" + cPage + ", nowPage=" + nowPage + ", nowBlock=" + nowBlock + ", numPerPage="
				+ numPerPage + ", numPerBlock=" + numPerBlock + ", totalRecord=" + totalRecord + ", totalPage="
				+ totalPage + ", totalBlock=" + totalBlock + ", begin=" + begin + ", end=" + end + ", beginPage="
				+ beginPage + ", endPage=" + endPage + "]";
	}




}

