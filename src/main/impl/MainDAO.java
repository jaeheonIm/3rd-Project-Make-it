package com.makeit.main.impl;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.TreeMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.makeit.fund.FundVO;
import com.makeit.main.CSVO;
import com.makeit.main.ChatRoomVO;
import com.makeit.member.MemberVO;
import com.makeit.storehome.StorehomeVO;

@Repository
public class MainDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public MainDAO() {
	}
//===============================Main===============================================//
	//배너 가져오기
	public List<FundVO> getMainBanner() {
		List<FundVO> banner = mybatis.selectList("MainDAO.getMainBanner");
		return banner;
	}
	
	//취향맞춤 목록 가져오기
	public List<FundVO> getMainPick() {
		System.out.println("===(DAO)getMainPick실행");
		int  foodcnt= mybatis.selectOne("MainDAO.getMainPick","푸드");
		int  fashioncnt= mybatis.selectOne("MainDAO.getMainPick","패션·잡화");
		int  techcnt= mybatis.selectOne("MainDAO.getMainPick","테크·가전");
		int beautycnt= mybatis.selectOne("MainDAO.getMainPick","뷰티");
		int  livingcnt= mybatis.selectOne("MainDAO.getMainPick","리빙·베이비");
		int  tripNsportscnt= mybatis.selectOne("MainDAO.getMainPick","여행·스포츠");
		int  animalcnt= mybatis.selectOne("MainDAO.getMainPick","반려동물");
		Map<String, Integer> map = new HashMap<>();
		map.put("푸드",foodcnt);
		map.put("패션·잡화",fashioncnt);
		map.put("테크·가전",techcnt);
		map.put("뷰티",beautycnt);
		map.put("리빙·베이비",livingcnt );
		map.put("여행·스포츠",tripNsportscnt);
		map.put("반려동물",animalcnt );
		List<Entry<String, Integer>> maparray = new ArrayList<Entry<String, Integer>>(map.entrySet());
		Collections.sort(maparray, new Comparator<Entry<String, Integer>>() {
			public int compare(Entry<String, Integer> obj1, Entry<String, Integer> obj2) {
				return obj2.getValue().compareTo(obj1.getValue());
			}
		});
		System.out.println("maparray:"+maparray);
		List<FundVO> list = new ArrayList<FundVO>();
		for(int i=0; i<6; i++) {
			String key = maparray.get(i).getKey();
			System.out.println("key:"+key);
			FundVO vo =  mybatis.selectOne("MainDAO.getCategoryContentOne",key);
			if(vo!=null) {
				list.add(vo);
			}
		}
		System.out.println("list:"+list);
		return list;
	}
	
	//실시간 랭킹 가져오기
	public List<FundVO> getMainRank() {

		List<FundVO> ranklist = mybatis.selectList("MainDAO.getMainRank");

		return ranklist;
	}
	//ajax용 실시간랭킹 가져오기
	public List<Object> mainrankAjax(String category) {

		List<Object> ranklist = new ArrayList<Object>();
		if(category.equals("FUND")) {
			ranklist = mybatis.selectList("MainDAO.getMainRank");
		} else if(category.equals("STORE")) {
			ranklist = mybatis.selectList("MainDAO.mainrankAjax",category);
		}
		return ranklist ;
	}
	
	//스토어추천제품출력기능
	public List<StorehomeVO> getStorePopularity() {
		System.out.println("===(DAO)getStorePopularity실행");
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", 1);
		map.put("end", 6);
		List<StorehomeVO> popularlist = new ArrayList<StorehomeVO>();
		List<Integer> list = mybatis.selectList("MainDAO.getStorePopularity",map);
		for(int i:list) {
			StorehomeVO vo = mybatis.selectOne("MainDAO.getStoreContent",i);
			String score = mybatis.selectOne("MainDAO.getScore",i);
			if(score == null) {
				vo.setStoreReviewScore("0.0");
			}else {
				vo.setStoreReviewScore(score);
			}
			popularlist.add(vo);
		}
		return popularlist;
	}
	
	//Fund ' feed 가져오기
	public List<FundVO> getFundReview() {
		System.out.println("===(DAO)getFundReview실행");
		List<FundVO> fundFeed = mybatis.selectList("MainDAO.getFundReview");
		return fundFeed;
	}	
	//ajax용 피드가져오기
	public List<Object> mainFeedAjax(String category) {
		System.out.println("===(DAO)mainFeedAjax실행");
		List<Object> feedlist = new ArrayList<Object>();
		if(category.equals("FUND")) {
			feedlist = mybatis.selectList("MainDAO.getFundReview");
		} else if(category.equals("STORE")) {
			feedlist = mybatis.selectList("MainDAO.mainFeedAjax",category);
		}
		return feedlist ;
	}
	
	//좋아할~가져오기
	public List<FundVO> getMemberLike(String memberId) {
		System.out.println("===(DAO)getMemberLike실행");
		List<FundVO> likelist = new ArrayList<FundVO>();
		String  category = mybatis.selectOne("MainDAO.getMemberLikeCategory", memberId);
		if(category.contains(",")) {
		  String[] likecategory = category.split(",");
		  for(int i=0; i<likecategory.length; i++) {
			  System.out.println("cate:"+likecategory[i]);
			  FundVO vo = mybatis.selectOne("MainDAO.getMemberLike", likecategory[i]);
			  if(vo!=null) {
				  likelist.add(vo);  
			  }
		  }
		}else {
			likelist = mybatis.selectList("MainDAO.getMemberLike2",category);
		}
		return likelist;
	}
	
	//#마감임박 가져오기
	public List<FundVO> getfundExpire() {
		List<FundVO> expirelist = mybatis.selectList("MainDAO.getfundExpire");
		return expirelist;
	}
	
	//#좋아한 가져오기
	public List<FundVO> getFundLike() {
		List<FundVO> fundlikelist = mybatis.selectList("MainDAO.getFundLike");
		return fundlikelist;
	}

	//오늘오픈한 프로젝트 가져오기
	public List<FundVO> getTodayOpen() {
		System.out.println("===(DAO)getTodayOpen실행");
        LocalDate now = LocalDate.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
        String today = now.format(formatter);
		List<FundVO> openlist = mybatis.selectList("MainDAO.getTodayOpen",today);
		return openlist;
	}
	
	//오픈예정인 프로젝트 가져오기
	public List<FundVO> getNextdayOpen() {
		System.out.println("===(DAO)getNextdayOpen실행");
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		String today = now.format(formatter);
		List<FundVO> nextdaylist = mybatis.selectList("MainDAO.getNextdayOpen",today);
		return nextdaylist;
	}

	//ajax용 찜하기 여부
	public int mainFundLikeAjax(String fundIdx, String memberId) {
		System.out.println("===(DAO)mainFundLikeAjax실행");
		Map<String, String> map = new HashMap<String, String>();
		map.put("fundIdx", fundIdx);
		map.put("memberId", memberId);
		int likeresult = mybatis.selectOne("MainDAO.mainFundLikeAjax",map);
		if(likeresult==0) {
			mybatis.insert("MainDAO.mainInsertFundLike",map);
		}
		return likeresult;
	}

	
	//회원의 팔로우 리스트 가져오기
  	public Map<String, Object> getMainFollowMember(String memberId) {
		System.out.println("===(DAO)getMainFollow실행");
		List<MemberVO> list = new ArrayList<MemberVO>();
		List<FundVO> followlist = new ArrayList<FundVO>();
		Map<String, Object> map = new HashMap<String, Object>();
		if(memberId.equals("")) {
			list = mybatis.selectList("MainDAO.getMainFollow");
			map.put("list",list);
			map.put("followlist",followlist);
		}else {
			//팔로잉아이디 찾기
			List<String> followinglist = mybatis.selectList("MainDAO.mainFollowingFind",memberId);
			list = mybatis.selectList("MainDAO.getMainFollow");
			//팔로잉아이디로 펀딩한것 한개 찾기
			for(int i=0; i<followinglist.size(); i++) {
				FundVO vo = mybatis.selectOne("MainDAO.mainFollowFundList",followinglist.get(i));
				if(vo==null) {
					followinglist.remove(i);
				}else {
					followlist.add(vo);
				}
			}
			//map으로 보내기
			map.put("list",list);
			map.put("followlist",followlist);
		}
		
		return map;
}
	
	
//===============================Notice===============================================//
	
	//공지사항 전체 목록 출력기능
	public List<CSVO> getNoticeList(int begin, int end){
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);
		System.out.println("===(DAO)getNoticeList실행");
		List<CSVO> list = mybatis.selectList("MainDAO.getNoticeList",map);
		return list;
	}
	//공지사항 카테로리별 목록 출력기능
	public List<CSVO> getNoticeCategoryList(int begin, int end, String category) {
		System.out.println("===(DAO)getNoticeCategoryList실행");
		Map<String, Object> map = new HashMap<String,  Object>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("category", category);
		List<CSVO> list = mybatis.selectList("MainDAO.getNoticeCategoryList",map);
		return list;
	}
	//공지사항 전체 갯수출력기능
	public int getNoticeTotalCnt() {
		System.out.println("===(DAO)getNoticeTotalCnt실행");
		int totalCnt = mybatis.selectOne("MainDAO.getNoticeTotalCnt");
		return totalCnt;
	}
	//공지사항 카테고리별 갯수 출력기능
	public int getNoticeCategoryCnt(String category) {
		System.out.println("===(DAO)getNoticeCategoryCnt실행");
		int categoryCnt = mybatis.selectOne("MainDAO.getNoticeCategoryCnt",category);
		return categoryCnt;
	}
	//검색시 갯수
	public int getSearchwordTotalCnt(String searchword) {
		System.out.println("===(DAO)getSearchwordTotalCnt실행");
		int searchwordCnt = mybatis.selectOne("MainDAO.getSearchwordTotalCnt",searchword);
		return searchwordCnt;
	}
	//검색시 목록출력기능
	public List<CSVO> getSearchList(int begin, int end, String searchword) {
		System.out.println("===(DAO)getSearchList실행");
		Map<String, Object> map = new HashMap<String,  Object>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("searchword", searchword);
		List<CSVO> list =mybatis.selectList("MainDAO.getSearchList", map);
		return list;
	}
	//게시글 상세보기
	public Map<String, Object>  noticeDetail(int idx) {
		System.out.println("===(DAO)noticeDetail실행");
		CSVO vo = mybatis.selectOne("MainDAO.noticeDetail", idx);
			String[] imgArr = vo.getCsImg().split(",");
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("vo", vo);
			map.put("imgArr", imgArr);
		return map;
	}
	//ajax사용 좋아요 유무
	public Map<String, Object> heartYN(int csIdx, String memberId) {
		System.out.println("===(DAO)heartYN실행");
		CSVO vo = null;
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> mapfinal = new HashMap<String, Object>();
		map.put("csIdx", csIdx);
		map.put("memberId", memberId);
		int result = mybatis.selectOne("MainDAO.heartYN", map);
		if(result==0) {
			mybatis.update("MainDAO.heartUpdate", map.get("csIdx"));
			mybatis.update("MainDAO.heartMember",map);
			vo = mybatis.selectOne("MainDAO.boardOne", map.get("csIdx"));		
			mapfinal.put("vo", vo);
			mapfinal.put("result",result );
			return mapfinal;
		}else {
			mybatis.update("MainDAO.heartDelete", map.get("csIdx"));
			mybatis.delete("MainDAO.heartMemberDelete",map);
			vo = mybatis.selectOne("MainDAO.boardOne", map.get("csIdx"));		
			mapfinal.put("vo", vo);
			mapfinal.put("result",result );
			return mapfinal;
		}
	}
	//첫페이지 좋아요 유무
	public int heartYNCnt(int idx, String memberId) {
		System.out.println("===(DAO)heartYNCnt실행");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("csIdx", idx);
		map.put("memberId", memberId);
		int result = mybatis.selectOne("MainDAO.heartYN", map);
		return result;
	}

//===============================Q&A===============================================//
	//관리자모드 : 채팅방목록 출력
	public List<ChatRoomVO> getChatRoomList() {
		List<ChatRoomVO> list = mybatis.selectList("MainDAO.getChatRoomList");
		return list;	
	}
	//고객모드 : 채팅방생성
	public int chatNumberSearch(String memberId) {
		System.out.println("===(DAO)chatNumberSearch실행");
		mybatis.insert("MainDAO.chatNumberSearch",memberId);	
		int num = getChatRoomNum();
		return num;
	}
	//시퀀스번호(채팅방번호)가져오기
	public int getChatRoomNum() {
		int num = mybatis.selectOne("MainDAO.getChatRoomNum");
		return num;
	}
	//고객이 창을 닫으면(=채팅방을 나가면) 채팅방 소멸
	public void deleteChatRoom(String chatnum) {
		System.out.println("===(DAO)deleteChatRoom실행");
		mybatis.delete("MainDAO.deleteChatRoom",chatnum);
	}
	//채팅대화 저장
	public void insertConversation(String rN, String conversation,String authority,String conn) {
		System.out.println("===(DAO)insertConversation실행");
		Map<String, String> map = new HashMap<String, String>();
		map.put("rN", rN);
		map.put("conversation", conversation);
		map.put("authority", authority);
		map.put("conn", conn);
		mybatis.update("MainDAO.insertConversation", map);
	}
	
	//채팅대화 불러오기
	public List<String> getconversation(Object roomNumber) {
		String roomnumber = (String)roomNumber;
		System.out.println("===(DAO)실행roomnumber"+roomnumber);
		System.out.println("===(DAO)getconversation실행");
		String conversation = mybatis.selectOne("MainDAO.getconversation",roomnumber);
		List<String> list = new ArrayList<String>();
		if(conversation == null) {
			return list;	
		}else {
			String[] conlist = conversation.split(",");
			for(int i=0; i<conlist.length; i++) {
				list.add(conlist[i]);
			}
			return list;
		}
	}
	
	//채팅유지여부
	public int SearchChatRoom(String roomNumber) {
		int exist = mybatis.selectOne("MainDAO.SearchChatRoom", roomNumber);
		return exist;
	}
	//상담사용 채팅읽음 여부11
	public void insertCheckAdmin(String roomNumber, String conn,String authority) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("roomNumber", roomNumber);
		map.put("conn", conn);
		map.put("authority", authority);
		mybatis.update("MainDAO.insertCheckAdmin",map);	
	}
	//상담사용 채팅읽음 여부22
	public void deleteParticipant(String authority,String chatnum) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("roomNumber", chatnum);
		map.put("authority", authority);
		mybatis.update("MainDAO.deleteParticipant",map);	
		
	}



	

//===============================Follow===============================================//
	//활발한 서포터 출력하기
	public Map<String, Object>  getFollowMemberList(String memberId) {
		System.out.println("===(DAO)getFollowMemberList실행");
		 
		Map<String, Object> map =  new LinkedHashMap<String, Object>();
		List<MemberVO> memberlist = mybatis.selectList("MainDAO.getFollowMemberList",memberId);
		for(int i=0; i<memberlist.size(); i++) {
			memberlist.get(i).setFollowCnt(mybatis.selectOne("MainDAO.getfollowcnt",memberlist.get(i).getMemberId()));
		}
		List<String> followinglist = mybatis.selectList("MainDAO.getfollowinglist",memberId);
		map.put("memberlist",memberlist);
		map.put("followinglist",followinglist);
		return map;
	}
	
	//ajax 팔로우 추가 및 삭제
	public int followAdd(String followmemberId, String memberId) {
		System.out.println("===(DAO)followAdd실행");
		Map<String, String> map = new HashMap<>();
		map.put("followmemberId", followmemberId);
		map.put("memberId", memberId);
		int result = mybatis.selectOne("MainDAO.followAdd",map);
		List<String> followinglist = new ArrayList<String>();
		if(result > 0) { //팔로우중이다.그럼 삭제
			mybatis.delete("MainDAO.deleteFollow", map);
				return result;
		}else {  //팔로우 아니다 그럼 추가
			mybatis.insert("MainDAO.insertFollow", map);			
				return result;
			}
	}

//===============================Profile===============================================//
	//프로필 정보 가져오기
	public Map<String, Object> getProfileInfo(String profileId, String memberId) {
		System.out.println("===(DAO)getProfileInfo실행");
		Map<String, Object> map = new HashMap<String, Object>();
		MemberVO profilevo = mybatis.selectOne("MainDAO.getProfileInfo", profileId); //프로필정보
		profilevo.setTotalCnt(mybatis.selectOne("MainDAO.getCnt", profileId)); //프로필정보

		int following = mybatis.selectOne("MainDAO.getProfileFollwing", profileId); //팔로잉
		int follower = mybatis.selectOne("MainDAO.getProfileFollwer", profileId); //팔로워
		List<FundVO> fundlist = mybatis.selectList("MainDAO.getProfileFund", profileId); //펀딩한 리스트
		int fundcnt = mybatis.selectOne("MainDAO.getFundCnt", profileId); //팔로워
		List<String> followinglist = mybatis.selectList("MainDAO.getfollowinglist",memberId);		
		map.put("profilevo", profilevo);
		map.put("fundlist", fundlist);
		map.put("following", following);
		map.put("follower", follower);
		map.put("fundcnt", fundcnt);
		map.put("followinglist", followinglist);
		return map;
	}
	
	//ajax 더보기 페이징 처리
	public List<FundVO> getFundList(String profileid,String category) {
		System.out.println("===(DAO)getFundList실행");
		if(category.equals("LIKE")) {
			List<FundVO> fundlist = mybatis.selectList("MainDAO.profileColumAjax", profileid); //찜 리스트
			return fundlist;
		}else {
			List<FundVO> fundlist = mybatis.selectList("MainDAO.getProfileFund", profileid); //펀딩한 리스트
			return fundlist;
		}
	}
	//ajax 항목이동 
	public List<FundVO> profileColumAjax(String profileid, String category) {
		System.out.println("===(DAO)profileColumAjax실행");
		if(category.equals("LIKE")) {
			List<FundVO> fundlist = mybatis.selectList("MainDAO.profileColumAjax", profileid); //찜 리스트
			return fundlist;
		}else {
			List<FundVO> fundlist = mybatis.selectList("MainDAO.getProfileFund", profileid); //펀딩한 리스트
			return fundlist;
		}
	}

//===============================Feed===============================================//
	//피드 목록 가져오기
	public Map<String, Object> getFeedList(String memberId,String category) {
		System.out.println("===(DAO)getFeedList실행");

		Map<String, Object> map = new HashMap<String, Object>();
		List<MemberVO> memberlist= new ArrayList<MemberVO>();
		
		if(category.equals("FUND")||category.equals("")) {
			List<FundVO> list = mybatis.selectList("MainDAO.getFundFeedList");
			for(int i=0; i<list.size(); i++) {
				MemberVO vo = mybatis.selectOne("MainDAO.getMember",list.get(i).getMemberId());
				vo.setFollowCnt(mybatis.selectOne("MainDAO.getfollowcnt",vo.getMemberId()));
				memberlist.add(vo);
			}
			map.put("list", list);
		}else if(category.equals("STORE")){
			List<StorehomeVO> list = mybatis.selectList("MainDAO.getStoreFeedList");			
			for(int i=0; i<list.size(); i++) {
				MemberVO vo = mybatis.selectOne("MainDAO.getMember",list.get(i).getMemberId());
				vo.setFollowCnt(mybatis.selectOne("MainDAO.getfollowcnt",vo.getMemberId()));
				memberlist.add(vo);
			}
			map.put("list", list);
		}
		List<String> followinglist = mybatis.selectList("MainDAO.getfollowinglist",memberId);
		map.put("memberlist", memberlist);
		map.put("followinglist",followinglist);
		return map;
	}

}