package com.makeit.fund.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.makeit.fund.FundVO;

@Repository
public class FundDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	
	public FundDAO() {
		System.out.println(" =====> FundDAO(MyBatis) 객체 생성 <===== ");
	}
	
//	===================== 메인페이지 불러오기 	=====================
	
	public FundVO startMakeIt(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 startMakeIt(vo) 실행 <===== ");
		return mybatis.selectOne("fundDAO.startMakeIt", vo);
	}

//	============================================================== ALL
	
	// 글 전체 목록 조회
	public int getBoardListAllCnt() {
		System.out.println(" =====> MyBatis 사용 getBoardListAllCnt(vo) 실행 <===== ");
		return mybatis.selectOne("fundDAO.getBoardListAllCnt");
	}
	
	//펀딩 페이지 전체 불러오기
	public List<FundVO> getBoardListAll(int begin, int end) {
		System.out.println(" =====> MyBatis 사용 getBoardListAll(vo) 실행 <===== ");
		Map<String, Object> map = new HashMap<String,  Object>();
		map.put("begin", begin);
		map.put("end", end);
		List<FundVO> list = mybatis.selectList("fundDAO.getBoardListAll",map);
		return list;
	}
	
	//-------------------------------------------------------------------------------------------------------------------------
	public int fundingPageAllEndDateCnt() {
		System.out.println(" =====> MyBatis 사용 fundingPageAllEndDateCnt(vo) 실행 <===== ");
		return mybatis.selectOne("fundDAO.fundingPageAllEndDateCnt");
	}

	public List<FundVO> fundingPageAllEndDate(int begin, int end, FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundingPageAllEndDate(vo) 실행 <===== ");
		Map<String, Object> map = new HashMap<String,  Object>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("vo", vo);
		List<FundVO> list = mybatis.selectList("fundDAO.fundingPageAllEndDate",map);
		return list;
	}
	//-------------------------------------------------------------------------------------------------------------------------
	public int fundingPageAllFundPriceCnt() {
		System.out.println(" =====> MyBatis 사용 fundingPageAllFundPriceCnt(vo) 실행 <===== ");
		return mybatis.selectOne("fundDAO.fundingPageAllFundPriceCnt");
	}

	public List<FundVO> fundingPageAllFundPrice(int begin, int end, FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundingPageAllFundPrice(vo) 실행 <===== ");
		Map<String, Object> map = new HashMap<String,  Object>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("vo", vo);
		List<FundVO> list = mybatis.selectList("fundDAO.fundingPageAllFundPrice",map);
		return list;
	}
	//-------------------------------------------------------------------------------------------------------------------------
	public int fundingPageAllRecentCnt() {
		System.out.println(" =====> MyBatis 사용 fundingPageAllRecentCnt(vo) 실행 <===== ");
		return mybatis.selectOne("fundDAO.fundingPageAllRecentCnt");
	}

	public List<FundVO> fundingPageAllRecent(int begin, int end, FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundingPageAllRecent(vo) 실행 <===== ");
		Map<String, Object> map = new HashMap<String,  Object>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("vo", vo);
		List<FundVO> list = mybatis.selectList("fundDAO.fundingPageAllRecent",map);
		return list;
	}
	
//	============================================================== Tech
	// 테크, 가전 목록 조회
	public int getBoardListTechCnt() {
		System.out.println(" =====> MyBatis 사용 getBoardListTechCnt(vo) 실행 <===== ");
		return mybatis.selectOne("fundDAO.getBoardListTechCnt");
	}

	public List<FundVO> getBoardListTech(int begin, int end) {
		System.out.println(" =====> MyBatis 사용 getBoardListTech(vo) 실행 <===== ");
		Map<String, Object> map = new HashMap<String,  Object>();
		map.put("begin", begin);
		map.put("end", end);
		List<FundVO> list = mybatis.selectList("fundDAO.getBoardListTech",map);
		return list;
	}

	//-------------------------------------------------------------------------------------------------------------------------
	public int fundingPageTechEndDateCnt(String fundCategory) {
		System.out.println(" =====> MyBatis 사용 fundingPageTechEndDateCnt(vo) 실행 <===== ");
		return mybatis.selectOne("fundDAO.fundingPageTechEndDateCnt", fundCategory);
	}

	public List<FundVO> fundingPageTechEndDate(int begin, int end, String fundCategory) {
		System.out.println(" =====> MyBatis 사용 fundingPageTechEndDate(vo) 실행 <===== ");
		Map<String, Object> map = new HashMap<String,  Object>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("fundCategory", fundCategory);
		List<FundVO> list = mybatis.selectList("fundDAO.fundingPageTechEndDate",map);
		return list;
	}
	//-------------------------------------------------------------------------------------------------------------------------
	public int fundingPageTechFundPriceCnt(String fundCategory) {
		System.out.println(" =====> MyBatis 사용 fundingPageTechFundPriceCnt(vo) 실행 <===== ");
		return mybatis.selectOne("fundDAO.fundingPageTechFundPriceCnt", fundCategory);
	}

	public List<FundVO> fundingPageTechFundPrice(int begin, int end, String fundCategory) {
		System.out.println(" =====> MyBatis 사용 fundingPageTechFundPrice(vo) 실행 <===== ");
		Map<String, Object> map = new HashMap<String,  Object>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("fundCategory", fundCategory);
		List<FundVO> list = mybatis.selectList("fundDAO.fundingPageTechFundPrice",map);
		return list;
	}
	//-------------------------------------------------------------------------------------------------------------------------
	public int fundingPageTechRecentCnt(String fundCategory) {
		System.out.println(" =====> MyBatis 사용 fundingPageTechRecentCnt(vo) 실행 <===== ");
		return mybatis.selectOne("fundDAO.fundingPageTechRecentCnt", fundCategory);
	}

	public List<FundVO> fundingPageTechRecent(int begin, int end, String fundCategory) {
		System.out.println(" =====> MyBatis 사용 fundingPageTechRecent(vo) 실행 <===== ");
		Map<String, Object> map = new HashMap<String,  Object>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("fundCategory", fundCategory);
		List<FundVO> list = mybatis.selectList("fundDAO.fundingPageTechRecent",map);
		return list;
	}
	
//	============================================================== Fahion
	// 패션, 잡화 목록 조회
	public int getBoardListFashionCnt() {
		System.out.println(" =====> MyBatis 사용 getBoardListFashionCnt(vo) 실행 <===== ");
		return mybatis.selectOne("fundDAO.getBoardListFashionCnt");
	}

	public List<FundVO> getBoardListFashion(int begin, int end) {
		System.out.println(" =====> MyBatis 사용 getBoardListFashion(vo) 실행 <===== ");
		Map<String, Object> map = new HashMap<String,  Object>();
		map.put("begin", begin);
		map.put("end", end);
		List<FundVO> list = mybatis.selectList("fundDAO.getBoardListFashion",map);
		return list;
	}
	//-------------------------------------------------------------------------------------------------------------------------
	public List<FundVO> fundingPageFashionEndDate(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundingPageFashionEndDate(vo) 실행 <===== ");
		return mybatis.selectList("fundDAO.fundingPageFashionEndDate", vo);
	}
	//-------------------------------------------------------------------------------------------------------------------------
	public List<FundVO> fundingPageFashionFundPrice(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundingPageFashionFundPrice(vo) 실행 <===== ");
		return mybatis.selectList("fundDAO.fundingPageFashionFundPrice", vo);
	}
	//-------------------------------------------------------------------------------------------------------------------------
	public List<FundVO> fundingPageFashionRecent(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundingPageFashionRecent(vo) 실행 <===== ");
		return mybatis.selectList("fundDAO.fundingPageFashionRecent", vo);
	}
	
//	============================================================== Beauty
	// 뷰티 목록 조회
	public int getBoardListBeautyCnt() {
		System.out.println(" =====> MyBatis 사용 getBoardListBeautyCnt(vo) 실행 <===== ");
		return mybatis.selectOne("fundDAO.getBoardListBeautyCnt");
	}

	public List<FundVO> getBoardListBeauty(int begin, int end) {
		System.out.println(" =====> MyBatis 사용 getBoardListBeauty(vo) 실행 <===== ");
		Map<String, Object> map = new HashMap<String,  Object>();
		map.put("begin", begin);
		map.put("end", end);
		List<FundVO> list = mybatis.selectList("fundDAO.getBoardListBeauty",map);
		return list;
	}
	
	//-------------------------------------------------------------------------------------------------------------------------
	public List<FundVO> fundingPageBeautyEndDate(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundingPageBeautyEndDate(vo) 실행 <===== ");
		return mybatis.selectList("fundDAO.fundingPageBeautyEndDate", vo);
	}
	//-------------------------------------------------------------------------------------------------------------------------
	public List<FundVO> fundingPageBeautyFundPrice(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundingPageBeautyFundPrice(vo) 실행 <===== ");
		return mybatis.selectList("fundDAO.fundingPageBeautyFundPrice", vo);
	}
	//-------------------------------------------------------------------------------------------------------------------------
	public List<FundVO> fundingPageBeautyRecent(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundingPageBeautyRecent(vo) 실행 <===== ");
		return mybatis.selectList("fundDAO.fundingPageBeautyRecent", vo);
	}
	
//	============================================================== Food
	// 푸드 목록 조회
	public int getBoardListFoodCnt() {
		System.out.println(" =====> MyBatis 사용 getBoardListFoodCnt(vo) 실행 <===== ");
		return mybatis.selectOne("fundDAO.getBoardListFoodCnt");
	}

	public List<FundVO> getBoardListFood(int begin, int end) {
		System.out.println(" =====> MyBatis 사용 getBoardListFood(vo) 실행 <===== ");
		Map<String, Object> map = new HashMap<String,  Object>();
		map.put("begin", begin);
		map.put("end", end);
		List<FundVO> list = mybatis.selectList("fundDAO.getBoardListFood",map);
		return list;
	}

	//-------------------------------------------------------------------------------------------------------------------------
	public List<FundVO> fundingPageFoodEndDate(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundingPageFoodEndDate(vo) 실행 <===== ");
		return mybatis.selectList("fundDAO.fundingPageFoodEndDate", vo);
	}
	//-------------------------------------------------------------------------------------------------------------------------
	public List<FundVO> fundingPageFoodFundPrice(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundingPageFoodFundPrice(vo) 실행 <===== ");
		return mybatis.selectList("fundDAO.fundingPageFoodFundPrice", vo);
	}
	//-------------------------------------------------------------------------------------------------------------------------
	public List<FundVO> fundingPageFoodRecent(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundingPageFoodRecent(vo) 실행 <===== ");
		return mybatis.selectList("fundDAO.fundingPageFoodRecent", vo);
	}
	
//	============================================================== Travel
	// 여행, 레저 목록 조회
	public int getBoardListTravelCnt() {
		System.out.println(" =====> MyBatis 사용 getBoardListTravelCnt(vo) 실행 <===== ");
		return mybatis.selectOne("fundDAO.getBoardListTravelCnt");
	}

	public List<FundVO> getBoardListTravel(int begin, int end) {
		System.out.println(" =====> MyBatis 사용 getBoardListTravel(vo) 실행 <===== ");
		Map<String, Object> map = new HashMap<String,  Object>();
		map.put("begin", begin);
		map.put("end", end);
		List<FundVO> list = mybatis.selectList("fundDAO.getBoardListTravel",map);
		return list;
	}
	

	//-------------------------------------------------------------------------------------------------------------------------
	public List<FundVO> fundingPageTravelEndDate(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundingPageTravelEndDate(vo) 실행 <===== ");
		return mybatis.selectList("fundDAO.fundingPageTravelEndDate", vo);
	}
	//-------------------------------------------------------------------------------------------------------------------------
	public List<FundVO> fundingPageTravelFundPrice(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundingPageTravelFundPrice(vo) 실행 <===== ");
		return mybatis.selectList("fundDAO.fundingPageTravelFundPrice", vo);
	}
	//-------------------------------------------------------------------------------------------------------------------------
	public List<FundVO> fundingPageTravelRecent(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundingPageTravelRecent(vo) 실행 <===== ");
		return mybatis.selectList("fundDAO.fundingPageTravelRecent", vo);
	}
	
//	============================================================== Baby
	// 베이비, 키즈 목록 조회
	public int getBoardListBabyCnt() {
		System.out.println(" =====> MyBatis 사용 getBoardListBabyCnt(vo) 실행 <===== ");
		return mybatis.selectOne("fundDAO.getBoardListBabyCnt");
	}

	public List<FundVO> getBoardListBaby(int begin, int end) {
		System.out.println(" =====> MyBatis 사용 getBoardListBaby(vo) 실행 <===== ");
		Map<String, Object> map = new HashMap<String,  Object>();
		map.put("begin", begin);
		map.put("end", end);
		List<FundVO> list = mybatis.selectList("fundDAO.getBoardListBaby",map);
		return list;
	}
	
	//-------------------------------------------------------------------------------------------------------------------------
	public List<FundVO> fundingPageBabyEndDate(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundingPageBabyEndDate(vo) 실행 <===== ");
		return mybatis.selectList("fundDAO.fundingPageBabyEndDate", vo);
	}
	//-------------------------------------------------------------------------------------------------------------------------
	public List<FundVO> fundingPageBabyFundPrice(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundingPageBabyFundPrice(vo) 실행 <===== ");
		return mybatis.selectList("fundDAO.fundingPageBabyFundPrice", vo);
	}
	//-------------------------------------------------------------------------------------------------------------------------
	public List<FundVO> fundingPageBabyRecent(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundingPageBabyRecent(vo) 실행 <===== ");
		return mybatis.selectList("fundDAO.fundingPageBabyRecent", vo);
	}
	
//	==============================================================Animal
	// 반려동물 목록 조회
	public int getBoardListAnimalCnt() {
		System.out.println(" =====> MyBatis 사용 getBoardListAnimalCnt(vo) 실행 <===== ");
		return mybatis.selectOne("fundDAO.getBoardListAnimalCnt");
	}

	public List<FundVO> getBoardListAnimal(int begin, int end) {
		System.out.println(" =====> MyBatis 사용 getBoardListAnimal(vo) 실행 <===== ");
		Map<String, Object> map = new HashMap<String,  Object>();
		map.put("begin", begin);
		map.put("end", end);
		List<FundVO> list = mybatis.selectList("fundDAO.getBoardListAnimal",map);
		return list;
	}
	//-------------------------------------------------------------------------------------------------------------------------
	public List<FundVO> fundingPageAnimalEndDate(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundingPageAnimalEndDate(vo) 실행 <===== ");
		return mybatis.selectList("fundDAO.fundingPageAnimalEndDate", vo);
	}
	//-------------------------------------------------------------------------------------------------------------------------
	public List<FundVO> fundingPageAnimalFundPrice(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundingPageAnimalFundPrice(vo) 실행 <===== ");
		return mybatis.selectList("fundDAO.fundingPageAnimalFundPrice", vo);
	}
	//-------------------------------------------------------------------------------------------------------------------------
	public List<FundVO> fundingPageAnimalRecent(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundingPageAnimalRecent(vo) 실행 <===== ");
		return mybatis.selectList("fundDAO.fundingPageAnimalRecent", vo);
	}
	
//	==============================================================
	// 펀딩 Part 검색 결과 조회
	public List<FundVO> searchBoardList(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 searchBoardList(vo) 실행 <===== ");
		return mybatis.selectList("fundDAO.searchBoardList", vo);
	}
	
//	=========================== DetailView 관련 	===========================
	
	// 글 1개 조회
	public FundVO productDetailView(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 productDetailView(vo) 실행 <===== ");
		return mybatis.selectOne("fundDAO.productDetailView", vo);
	}
	
	//댓글 목록 조회
	public List<FundVO> getCommentList(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 getCommentList(vo) 실행 <===== ");
		return mybatis.selectList("fundDAO.getCommentList", vo);
	}
	
	//댓글 입력
	public void insertReview(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 insertReview(vo) 실행 <===== ");
		mybatis.insert("fundDAO.insertReview", vo);
	}
	
	//댓글 삭제
	public void deleteReview (FundVO vo) {
		System.out.println(" =====> MyBatis 사용 deleteReview(vo) 실행 <===== ");
		mybatis.delete("fundDAO.deleteReview", vo);
	}

	// 반환 정책
	public FundVO returnAndCancel (FundVO vo) {
		System.out.println(" =====> MyBatis 사용 returnAndCancel(vo) 실행 <===== ");
		return mybatis.selectOne("fundDAO.returnAndCancel", vo);
	}
	
	//서포터 조회
	public List<FundVO> getSupporter(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 getCommentList(vo) 실행 <===== ");
		return mybatis.selectList("fundDAO.getSupporter", vo);
	}
	
	//커뮤니티(후기) 갯수
	public FundVO communityCnt(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 communityCnt(vo) 실행 <===== ");
		return mybatis.selectOne("fundDAO.communityCnt", vo);
	}

	//서포터 인원수
	public FundVO supporterCnt(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 supporterCnt(vo) 실행 <===== ");
		return mybatis.selectOne("fundDAO.supporterCnt", vo);
	}

	// 펀드 옵션 가져오기
	public List<FundVO> fundOptionView(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundOptionView(vo) 실행 <===== ");
		return mybatis.selectList("fundDAO.fundOptionView", vo);
	}

	//리워드 펀딩하기
	public FundVO rewardFunding(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 rewardFunding(vo) 실행 <===== ");
		return mybatis.selectOne("fundDAO.rewardFunding", vo);
	}

//	===================== 문의하기 관련 	=====================
	
	//QnA 게시판 가기
	public List<FundVO> fundingQnA(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundingQnA(vo) 실행 <===== ");
		return mybatis.selectList("fundDAO.fundingQnA", vo);
	}

	//QnA 상세 페이지
	public FundVO fundingQnaView(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundingQnaView(vo) 실행 <===== ");
		return mybatis.selectOne("fundDAO.fundingQnaView", vo);
	}
	
	//나의 QnA 보기
	public FundVO myQnaView(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 myQnaView(vo) 실행 <===== ");
		return mybatis.selectOne("fundDAO.myQnaView", vo);
	}


	//QnA 입력 페이지로 이동
	public FundVO fundingQnaInsertForm(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundingQnaInsertForm(vo) 실행 <===== ");
		return mybatis.selectOne("fundDAO.fundingQnaInsertForm", vo);
	}

	// QnA 입력
	public void fundingQnaInsert(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundingQnaInsert(vo) 실행 <===== ");
		mybatis.insert("fundDAO.fundingQnaInsert", vo);
	}
	
	//QnA 수정 입력 폼으로 이동
	public FundVO fundingQnaUpdateForm(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundingQnaUpdateForm(vo) 실행 <===== ");
		return mybatis.selectOne("fundDAO.fundingQnaUpdateForm", vo);
	}

	//QnA 수정하기
	public void fundingQnaUpdate(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundingQnaUpdate(vo) 실행 <===== ");
		mybatis.update("fundDAO.fundingQnaUpdate", vo);
		
	}

	//QnA 삭제하기
	public void deleteQnA(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 deleteQnA(vo) 실행 <===== ");
		mybatis.delete("fundDAO.deleteQnA", vo);
	}

	//QnA 답글 달기 (관리자 : admin)
	public void insertQnaRe(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 insertQnaRe(vo) 실행 <===== ");
		mybatis.insert("fundDAO.insertQnaRe", vo);
	}
	
	//QnA 답글 가져오기
	public FundVO fundingQnaRe(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundingQnaRe(vo) 실행 <===== ");
		return mybatis.selectOne("fundDAO.fundingQnaRe", vo);
	}

	//답글 달린 글의 상태 변경(0 -> 1)
	public void statusChange(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 statusChange(vo) 실행 <===== ");
		mybatis.update("fundDAO.statusChange", vo);
	}

	//댓글 목록 카운트
	public int getCommentListCnt(String fundIdx) {
		System.out.println(" =====> MyBatis 사용 getCommentListCnt(vo) 실행 <===== ");
		return mybatis.selectOne("fundDAO.getCommentListCnt", fundIdx);
	}

	//댓글 목록 불러오기
	public List<FundVO> getCommentList(int begin, int end, String fundIdx) {
		System.out.println(" =====> MyBatis 사용 getCommentList(vo) 실행 <===== ");
		Map<String, Object> map = new HashMap<String,  Object>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("fundIdx", fundIdx);
		List<FundVO> list = mybatis.selectList("fundDAO.getCommentList",map);
		return list;
	}

	//QnA 게시판 카운트
	public int fundingQnaCnt(String fundIdx) {
		System.out.println(" =====> MyBatis 사용 fundingQnaCnt(vo) 실행 <===== ");
		return mybatis.selectOne("fundDAO.fundingQnaCnt", fundIdx);
	}

	//QnA 게시판 불러오기
	public List<FundVO> fundingQnaList(int begin, int end, String fundIdx) {
		System.out.println(" =====> MyBatis 사용 fundingQnaList(vo) 실행 <===== ");
		Map<String, Object> map = new HashMap<String,  Object>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("fundIdx", fundIdx);
		List<FundVO> list = mybatis.selectList("fundDAO.fundingQnaList",map);
		return list;
	}

	//나의 QnA 카운트
	public int myQnaListCnt(String fundIdx, String memberId) {
		System.out.println(" =====> MyBatis 사용 myQnaListCnt(vo) 실행 <===== ");
		Map<String, String> map = new HashMap<String, String>();
		map.put("fundIdx", fundIdx);
		map.put("memberId", memberId);
		
		return mybatis.selectOne("fundDAO.myQnaListCnt", map);
	}

	//나의 QnA 불러오기
	public List<FundVO> fundMyQnaList(int begin, int end, String memberId, String fundIdx) {
		System.out.println(" =====> MyBatis 사용 fundMyQnaList(vo) 실행 <===== ");
		Map<String, Object> map = new HashMap<String,  Object>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("memberId", memberId);
		map.put("fundIdx", fundIdx);
		List<FundVO> list = mybatis.selectList("fundDAO.fundMyQnaList",map);
		return list;
	}

	//쿠폰 목록 불러오기
	public List<FundVO> couponList(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 couponList(vo) 실행 <===== ");
		return mybatis.selectList("fundDAO.couponList", vo);
	}
	
	//리워드 옵션 선택
	public void rewardInsert(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 rewardInsert(vo) 실행 <===== ");
		mybatis.insert("fundDAO.rewardInsert", vo);
	}

	//쿠폰 사용내역 변경
	public void couponCheck(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 couponCheck(vo) 실행 <===== ");
		mybatis.update("fundDAO.couponCheck", vo);
	}

	//펀딩 금액 적산 수정
	public void fundPriceUpdate(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundPriceUpdate(vo) 실행 <===== ");
		mybatis.update("fundDAO.fundPriceUpdate", vo);
	}

	//펀딩 유저 서포터로 등록
	public void insertSupporter(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 insertSupporter(vo) 실행 <===== ");
		mybatis.insert("fundDAO.insertSupporter", vo);
	}

	//펀딩 유저 서포터 금액 적산
	public void supporterPriceUpdate(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 supporterPriceUpdate(vo) 실행 <===== ");
		mybatis.update("fundDAO.supporterPriceUpdate", vo);
	}

	//팔로잉 카운팅
	public int followCnt(FundVO vo) {
		return mybatis.selectOne("fundDAO.followCnt", vo);
	}

	//좋아요 카운팅
	public int fundLikeCnt(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundLikeCnt(vo) 실행 <===== ");
		return mybatis.selectOne("fundDAO.fundLikeCnt", vo);
	}

	//펀드 좋아요 수정
	public int fundLikeUpdate(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundLikeUpdate(vo) 실행 <===== ");
		return mybatis.insert("fundDAO.fundLikeUpdate", vo);
	}

	//펀도 좋아요 삭제
	public int fundLikeDelete(FundVO vo) {
		System.out.println(" =====> MyBatis 사용 fundLikeDelete(vo) 실행 <===== ");
		return mybatis.delete("fundDAO.fundLikeDelete", vo);
	}

	//펀딩 상세 내역 좋아요 카운팅
	public int fundDetailViewLikeCnt(FundVO vo) {
		return mybatis.selectOne("fundDAO.fundDetailViewLikeCnt", vo);
	}

	//펀딩 상세내역 좋아요 입력
	public int fundDetailViewLikeInsert(FundVO vo) {
		return mybatis.insert("fundDAO.fundDetailViewLikeInsert", vo);
	}

	//펀딩 상세내역 좋아요 삭제
	public int fundDetailViewLikeDelete(FundVO vo) {
		return mybatis.delete("fundDAO.fundDetailViewLikeDelete", vo);
	}

	//펀딩 팔로우 카운팅
	public int fundFollowCnt(FundVO vo) {
		return mybatis.selectOne("fundDAO.fundFollowCnt", vo);
	}

	//팔로잉 입력
	public int insertFollow(FundVO vo) {
		return mybatis.insert("fundDAO.insertFollow", vo);
	}

	//팔로잉 삭제
	public int deleteFollow(FundVO vo) {
		return mybatis.delete("fundDAO.deleteFollow", vo);
	}
	
	//펀딩 상세 내역 팔로우 카운팅
	public int fundDetailFollowCnt(FundVO vo) {
		return mybatis.selectOne("fundDAO.fundDetailFollowCnt", vo);
	}

	//펀딩 상세 내역 팔로우 추가
	public int insertDetailFollow(FundVO vo) {
		return mybatis.insert("fundDAO.insertDetailFollow", vo);
	}

	//펀딩 상세 내역 팔로우 삭제
	public int deleteDetailFollow(FundVO vo) {
		return mybatis.delete("fundDAO.deleteDetailFollow", vo);
	}
  	
  	

}
