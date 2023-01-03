package com.makeit.main;

import java.util.List;
import java.util.Map;

import com.makeit.fund.FundVO;
import com.makeit.member.MemberVO;
import com.makeit.storehome.StorehomeVO;

public interface MainService {

	List<CSVO> getNoticeList(int begin, int end);
	List<CSVO> getNoticeCategoryList(int begin, int end,String category);
	int getNoticeTotalCnt();
	int getNoticeCategoryCnt(String category);
	int getSearchwordTotalCnt(String searchword);
	List<CSVO> getSearchList(int begin, int end, String searchword);
	Map<String, Object> noticeDetail(int idx);
	Map<String, Object> heartYN(int csIdx, String memberId);
	int heartYNCnt(int idx, String memberId);
	List<ChatRoomVO> getChatRoomList();
	int chatNumberSearch(String memberId);
	void deleteChatRoom(String chatnum);
	List<FundVO> getMainPick();
	List<StorehomeVO> getStorePopularity();
	List<FundVO> getFundReview();
	List<Object> mainFeedAjax(String category);
	List<FundVO> getMemberLike(String memberId);
	List<FundVO> getTodayOpen();
	List<FundVO> getNextdayOpen();
	List<FundVO> getMainRank();
	List<Object> mainrankAjax(String category);
	List<FundVO> getFundLike();
	int mainFundLikeAjax(String fundIdx, String memberId);
	Map<String, Object> getMainFollow(String memberId);
	List<FundVO> getfundExpire();
	Map<String, Object> getFollowMemberList(String memberId);
	int followAdd(String followmemberId, String memberId);
	Map<String, Object> getProfileInfo(String profileId, String memberId);
	List<FundVO> getFundList(String profileid,String category);
	List<FundVO> profileColumAjax(String profileid, String category);
	Map<String, Object> getFeedList(String memberId,String category);
	List<FundVO> getMainBanner();
	void insertConversation(String rN, String conversation,String authority,String conn);
	List<String> getconversation(Object roomNumber);
	int SearchChatRoom(String rN);
	void insertCheckAdmin(String roomNumber, String conn,String authority);
	void deleteParticipant(String authority,String chatnum);
	

	
	
}
