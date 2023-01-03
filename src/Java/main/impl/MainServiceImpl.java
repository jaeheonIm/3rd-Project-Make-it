package com.makeit.main.impl;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.makeit.fund.FundVO;
import com.makeit.main.CSVO;
import com.makeit.main.ChatRoomVO;
import com.makeit.main.MainService;
import com.makeit.storehome.StorehomeVO;

// UserService 구현
@Service("mainService")
public class MainServiceImpl implements MainService {
	@Autowired
	private MainDAO mainDAO;
	
	public MainServiceImpl() {
	}
	
//========================================Main=================================================//	
	//배너 가져오기
	@Override
	public List<FundVO> getMainBanner() {
		List<FundVO> picklist = mainDAO.getMainBanner();
		return picklist;
	}
	
	//취향맞춤 목록 가져오기
	@Override
	public List<FundVO> getMainPick() {
		List<FundVO> picklist = mainDAO.getMainPick();
		return picklist;
	}
	
	//실시간 랭킹 가져오기
	@Override
	public List<FundVO> getMainRank() {
		List<FundVO> ranklist = mainDAO.getMainRank();
		return ranklist;
	}
	//ajax용 실시간랭킹가져오기
	@Override
	public List<Object> mainrankAjax(String category) {
		List<Object> ranklist = mainDAO.mainrankAjax(category);
		return ranklist;
	}
	
	//스토어추천제품출력기능
	@Override
	public List<StorehomeVO> getStorePopularity() {
		List<StorehomeVO> popularlist = mainDAO.getStorePopularity();
		return popularlist;
	}
	
	//Fund' feed 가져오기
	@Override
	public List<FundVO> getFundReview() {
		List<FundVO> fundFeed = mainDAO.getFundReview();
		return fundFeed;
	}
	//ajax용 피드가져오기
	@Override
	public List<Object> mainFeedAjax(String category) {
		List<Object> feedlist = mainDAO.mainFeedAjax(category);
		return feedlist;
	}
	
	//좋아할~가져오기
	@Override
	public List<FundVO> getMemberLike(String memberId) {
		List<FundVO> likelist = mainDAO.getMemberLike(memberId);
		return likelist;
	}
	
	//#마감임박 가져오기
	@Override
	public List<FundVO> getfundExpire() {
		List<FundVO> expirelist = mainDAO.getfundExpire();
		return expirelist;
	}
	
	//#좋아한 가져오기
	@Override
	public List<FundVO> getFundLike() {
		List<FundVO> fundlikelist = mainDAO.getFundLike();
		return fundlikelist;
	}

	//오늘오픈한 프로젝트 가져오기
	@Override
	public List<FundVO> getTodayOpen() {
		 List<FundVO> openlist = mainDAO.getTodayOpen();
		return openlist;
	}

	//오픈예정인 프로젝트 가져오기
	@Override
	public List<FundVO> getNextdayOpen() {
		List<FundVO> nextdaylist = mainDAO.getNextdayOpen();
		return nextdaylist;
	}

	//ajax용 찜하기 여부
	@Override
	public int mainFundLikeAjax(String fundIdx, String memberId) {
		int likeresult = mainDAO.mainFundLikeAjax(fundIdx,memberId);
		return likeresult;
	}

	//팔로우 목록 가져오기
	@Override
	public Map<String, Object> getMainFollow(String memberId) {
		Map<String, Object> map = mainDAO.getMainFollowMember(memberId);
		return map;
	}
	
//========================================Notice=================================================//	
	//공지사항 전체
	@Override
	public List<CSVO> getNoticeList(int begin, int end) {
		List<CSVO> list = mainDAO.getNoticeList(begin, end);
		System.out.println("impl로 돌아옴");
		return list;
	}

	//공지사항 카테고리별
	@Override
	public List<CSVO> getNoticeCategoryList(int begin, int end,String category) {
		List<CSVO> list = mainDAO.getNoticeCategoryList(begin,end,category);
		return list;
	}
	//공지사항 전체갯수
	@Override
	public int getNoticeTotalCnt() {
		int totalCnt = mainDAO.getNoticeTotalCnt();
		return totalCnt;
	}
	//공지사항 공지갯수
	@Override
	public int getNoticeCategoryCnt(String category) {
		int CategoryCnt = mainDAO.getNoticeCategoryCnt(category);
		return CategoryCnt;
	}
	//검색 시 갯수
	@Override
	public int getSearchwordTotalCnt(String searchword) {
		int CategoryCnt = mainDAO.getSearchwordTotalCnt(searchword);
		return CategoryCnt;
	}
	
	//검색시 출력
	@Override
	public List<CSVO> getSearchList(int begin, int end, String searchword) {
		List<CSVO> list =mainDAO.getSearchList(begin,end,searchword);
		return list;
	}
	
	//게시글 상세보기
	@Override
	public Map<String, Object> noticeDetail(int idx) {
		Map<String, Object> map = mainDAO.noticeDetail(idx);
		System.out.println(map);
		return map;
	}

	//ajax사용 좋아요 유무
	@Override
	public Map<String, Object> heartYN(int csIdx, String memberId) {
		return mainDAO.heartYN(csIdx,memberId);
	}
	
	//첫페이지 좋아요 유무
	@Override
	public int heartYNCnt(int idx, String memberId) {
		int result = mainDAO.heartYNCnt(idx,memberId);
		return result;
	}
	
	
//========================================Q&A=================================================//
	
	//관리자모드 :  채팅방리스트 출력
	@Override
	public List<ChatRoomVO> getChatRoomList() {
		List<ChatRoomVO> list = mainDAO.getChatRoomList();
		return list;
	}
	
	//고객모드 : 채팅방생성
	@Override
	public int chatNumberSearch(String memberId) {
		int num = mainDAO.chatNumberSearch(memberId);
		return num;
	}
	//고객이 창을 닫으면(=채팅방을 나가면) 채팅방 소멸
	@Override
	public void deleteChatRoom(String chatnum) {
			mainDAO.deleteChatRoom(chatnum);
	}
	
	//채팅대화 저장
	@Override
	public void insertConversation(String rN, String conversation,String authority,String conn) {
		mainDAO.insertConversation(rN,conversation,authority,conn);
		
	}

	//채팅대화 꺼내오기
	@Override
	public List<String> getconversation(Object roomNumber) {
		List<String> conversation = mainDAO.getconversation(roomNumber);
		return conversation;
	}

	//채팅유지여부 확인
	@Override
	public int SearchChatRoom(String rN) {
		int exist= mainDAO.SearchChatRoom(rN);
		return exist;
	}
	
	//상담사용 채팅읽음표시11
	@Override
	public void insertCheckAdmin(String roomNumber, String conn,String authority) {
		mainDAO.insertCheckAdmin(roomNumber,conn,authority);
		
	}
	//상담사용 채팅읽음표시22
	@Override
	public void deleteParticipant(String authority,String chatnum) {
		mainDAO.deleteParticipant(authority,chatnum);
		
	}

	
//========================================Follow=================================================//
	//활발한 서포터 출력하기 
	@Override
	public Map<String, Object>  getFollowMemberList(String memberId) {
		Map<String, Object> memberlist = mainDAO.getFollowMemberList(memberId);
		return memberlist;
	}
	//ajax 팔로우 추가 및 삭제
	@Override
	public int followAdd(String followmemberId, String memberId) {
		int result = mainDAO.followAdd(followmemberId,memberId);
		return result;
	}


//========================================Profile=================================================//
	//프로필 정보 가져오기
	@Override
	public Map<String, Object> getProfileInfo(String profileId, String memberId) {
		Map<String, Object> map = mainDAO.getProfileInfo(profileId, memberId);
		return map;
	}
	
	//ajax 더보기 페이징 처리
	@Override
	public List<FundVO> getFundList(String profileid,String category) {
		List<FundVO> fundlist = mainDAO.getFundList(profileid,category);
		return fundlist;
	}
	
	//ajax 항목이동
	@Override
	public List<FundVO> profileColumAjax(String profileid, String category) {
		List<FundVO> fundlist = mainDAO.profileColumAjax(profileid,category);
		return fundlist;
	}
	

//========================================Feed=================================================//
	//피드목록 가져오기
	@Override
	public Map<String, Object> getFeedList(String memberId,String category) {
		Map<String, Object> map = mainDAO.getFeedList(memberId,category);
		return map;
	}




}
