package com.makeit.main;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

//공지사항 VO
public class CSVO {
	private String csTitle;
	private String csContent = "";
	private String csImg = "";
	private String csCategory,csSmallImg;
	private int csIdx,csHit,csHeart;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING,pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date csDate;
	

	public int getCsHeart() {
		return csHeart;
	}
	public void setCsHeart(int csHeart) {
		this.csHeart = csHeart;
	}
	public String getCsSmallImg() {
		return csSmallImg;
	}
	public void setCsSmallImg(String csSmallImg) {
		this.csSmallImg = csSmallImg;
	}
	public String getCsCategory() {
		return csCategory;
	}
	public void setCsCategory(String csCategory) {
		this.csCategory = csCategory;
	}
	public String getCsTitle() {
		return csTitle;
	}
	public void setCsTitle(String csTitle) {
		this.csTitle = csTitle;
	}
	public String getCsContent() {
		return csContent;
	}
	public void setCsContent(String csContent) {
		this.csContent = csContent;
	}
	public String getCsImg() {
		return csImg;
	}
	public void setCsImg(String csImg) {
		this.csImg = csImg;
	}
	public int getCsIdx() {
		return csIdx;
	}
	public void setCsIdx(int csIdx) {
		this.csIdx = csIdx;
	}
	public int getCsHit() {
		return csHit;
	}
	public void setCsHit(int csHit) {
		this.csHit = csHit;
	}
	
	public Date getCsDate() {
		return csDate;
	}
	public void setCsDate(Date csDate) {
		this.csDate = csDate;
	}
	@Override
	public String toString() {
		return "CSVO [csTitle=" + csTitle + ", csContent=" + csContent + ", csImg=" + csImg + ", csCategory="
				+ csCategory + ", csSmallImg=" + csSmallImg + ", csIdx=" + csIdx + ", csHit=" + csHit + ", csHeart="
				+ csHeart + ", csDate=" + csDate + "]";
	}


	
}
