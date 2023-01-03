package com.makeit.storehome;

public class Paging {
	private int nowPage = 1; // 현재페이지 
	private int nowBlock = 1; // 현재블록(페이지 담는 단위)
	
	private int numPerPage = 9; // 하나의 페이지에 표시할 게시글 수
	private int numPerBlock = 9; // 블록당 표시하는 페이지 갯수
	
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
	public void setNumPerBlock(int nuPerBlock) {
		this.numPerBlock = nuPerBlock;
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
}
