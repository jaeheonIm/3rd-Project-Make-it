package com.makeit.main;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ChatRoomVO {
	private int roomNumber;
	private String roomName;
	private String msg;
	private String memberId;
	private String conversation;
	@JsonFormat(shape = JsonFormat.Shape.STRING,pattern = "yyyy-MM-dd    HH:mm:ss", timezone = "Asia/Seoul")
	@DateTimeFormat(pattern = "yyyy-MM-dd    HH:mm:ss")
	private Date regdate;
	private int conn;
	private String participants;
	
//-------------qna메일보내기-----------------------
	private MultipartFile fileupload;
	private String memid="";
	private String name;
	private String email;
	private String Fromemail="hyennnnnna0321@gmail.com";
	private String title;
	private String message;
	
	
	
	public String getFromemail() {
		return Fromemail;
	}
	public void setFromemail(String fromemail) {
		Fromemail = fromemail;
	}
	public MultipartFile getFileupload() {
		return fileupload;
	}
	public void setFileupload(MultipartFile fileupload) {
		this.fileupload = fileupload;
	}

	public String getMemid() {
		return memid;
	}
	public void setMemid(String memid) {
		this.memid = memid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
//--------------------------------------------------
	
	public int getRoomNumber() {
		return roomNumber;
	}
	public void setRoomNumber(int roomNumber) {
		this.roomNumber = roomNumber;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getConversation() {
		return conversation;
	}
	public void setConversation(String conversation) {
		this.conversation = conversation;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public int getConn() {
		return conn;
	}
	public void setConn(int conn) {
		this.conn = conn;
	}
	public String getParticipants() {
		return participants;
	}
	public void setParticipants(String participants) {
		this.participants = participants;
	}
	
	

	
	
}
