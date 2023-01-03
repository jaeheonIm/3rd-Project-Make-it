package com.makeit.fund;

import java.util.List;

import com.makeit.storehome.StorehomeVO;

public interface FundService {
	//펀딩 전체 페이지 정렬------------------------------------------------------------------------------
	int getBoardListAllCnt(); // 페이징 처리를 위한 All Page CNT
	List <FundVO> getBoardListAll(int begin, int end); // 페이징 처리를 위한 All Page List
	
	int fundingPageAllEndDateCnt();
	List<FundVO> fundingPageAllEndDate(int begin, int end, FundVO vo);
	
	int fundingPageAllFundPriceCnt();
	List<FundVO> fundingPageAllFundPrice(int begin, int end, FundVO vo);
	
	int fundingPageAllRecentCnt();
	List<FundVO> fundingPageAllRecent(int begin, int end, FundVO vo);
	
	//테크 페이지 정렬------------------------------------------------------------------------------
	int getBoardListTechCnt(); // 페이징 처리를 위한 테크, 가전 조회 CNT
	List <FundVO> getBoardListTech(int begin, int end); // 페이징 처리를 위한 테크, 가전 조회 List

	int fundingPageTechEndDateCnt(String fundCategory);
	List<FundVO> fundingPageTechEndDate(int begin, int end, String fundCategory);
	
	int fundingPageTechFundPriceCnt(String fundCategory);
	List<FundVO> fundingPageTechFundPrice(int begin, int end, String fundCategory);
	
	int fundingPageTechRecentCnt(String fundCategory);
	List<FundVO> fundingPageTechRecent(int begin, int end, String fundCategory);
	
	//패션 잡화 페이지 정렬------------------------------------------------------------------------------
	int getBoardListFashionCnt(); // 페이징 처리를 위한 패션 잡화 조회 CNT
	List <FundVO> getBoardListFashion(int begin, int end); // 페이징 처리를 위한 패션 잡화 조회 List
	
	List<FundVO> fundingPageFashionEndDate(FundVO vo);
	List<FundVO> fundingPageFashionFundPrice(FundVO vo);
	List<FundVO> fundingPageFashionRecent(FundVO vo);
	
	//뷰티 페이지 정렬------------------------------------------------------------------------------
	int getBoardListBeautyCnt(); // 페이징 처리를 위한 뷰티 조회 CNT
	List <FundVO> getBoardListBeauty(int begin, int end); // 페이징 처리를 위한 뷰티 조회 List
	
	List<FundVO> fundingPageBeautyEndDate(FundVO vo);
	List<FundVO> fundingPageBeautyFundPrice(FundVO vo);
	List<FundVO> fundingPageBeautyRecent(FundVO vo);
	
	//푸드 페이지 정렬------------------------------------------------------------------------------
	int getBoardListFoodCnt();// 페이징 처리를 위한 푸드 조회 CNT
	List<FundVO> getBoardListFood(int begin, int end);// 페이징 처리를 위한 푸드 조회 List
	
	List<FundVO> fundingPageFoodEndDate(FundVO vo);
	List<FundVO> fundingPageFoodFundPrice(FundVO vo);
	List<FundVO> fundingPageFoodRecent(FundVO vo);
	
	//여행, 레저 페이지 정렬------------------------------------------------------------------------------
	int getBoardListTravelCnt(); // 페이징 처리를 위한 여행, 레저 조회 CNT
	List<FundVO> getBoardListTravel(int begin, int end);// 페이징 처리를 위한 여행, 레저 조회 List
	
	List<FundVO> fundingPageTravelEndDate(FundVO vo);
	List<FundVO> fundingPageTravelFundPrice(FundVO vo);
	List<FundVO> fundingPageTravelRecent(FundVO vo);
	
	//베이비, 키즈 페이지 정렬------------------------------------------------------------------------------
	int getBoardListBabyCnt();// 페이징 처리를 위한 베이비 조회 CNT
	List<FundVO> getBoardListBaby(int begin, int end);// 페이징 처리를 위한 베이비 조회 List
	
	List<FundVO> fundingPageBabyEndDate(FundVO vo);
	List<FundVO> fundingPageBabyFundPrice(FundVO vo);
	List<FundVO> fundingPageBabyRecent(FundVO vo);
	
	//동물 페이지 정렬------------------------------------------------------------------------------
	int getBoardListAnimalCnt(); // 페이징 처리를 위한 반려동물 조회 CNT
	List <FundVO> getBoardListAnimal(int begin, int end); // 페이징 처리를 위한 반려동물 조회 List
	
	List<FundVO> fundingPageAnimalEndDate(FundVO vo);
	List<FundVO> fundingPageAnimalFundPrice(FundVO vo);
	List<FundVO> fundingPageAnimalRecent(FundVO vo);
// ========================================================
	List<FundVO> searchBoardList(FundVO vo); //검색 조회
	List<FundVO> getSupporter(FundVO vo); // 댓글 조회	
	List<FundVO> fundOptionView(FundVO vo); //펀딩 옵션 불러오기
	List<FundVO> couponList(FundVO vo);
// ========================================================
	void insertReview(FundVO vo); // 댓글 입력
	void deleteReview(FundVO vo); // 댓글 삭제
	void fundingQnaInsert(FundVO vo); // 펀딩 문의글 입력
	void deleteQnA(FundVO vo); // 펀딩 문의글 삭제
	void fundingQnaUpdate(FundVO vo); // 펀딩 문의글 수정
	void insertQnaRe(FundVO vo); //문의글에 답글 달기
	void statusChange(FundVO vo); // 답글 달린글의 상태 변경 (0 -> 1)
	void rewardInsert(FundVO vo); // 쿠폰 있을때 결제
	void couponCheck(FundVO vo); // 쿠폰 상태 변경
	void fundPriceUpdate(FundVO vo); // FUND_PRICE 가격 업데이트
	void insertSupporter(FundVO vo); // 서포터 갱신
	void supporterPriceUpdate(FundVO vo); //서포터의 펀딩금액 업데이트
// ========================================================
	FundVO fundingQnaInsertForm (FundVO vo); //펀딩 문의글 남기기
	FundVO productDetailView(FundVO vo); //1개의 데이터 조회
	FundVO returnAndCancel (FundVO vo); // 반환 정책 그냥 불러오기
	FundVO communityCnt(FundVO vo); // 커뮤니티 글 갯수 count
	FundVO supporterCnt(FundVO vo); // 서포터 인원 count
	FundVO fundingQnaView(FundVO vo); // 펀딩 문의글 보기
	FundVO myQnaView(FundVO vo); // 나의 펀딩 문의글 보기
	FundVO fundingQnaRe(FundVO vo);// 문의 사항 답글
	FundVO fundingQnaUpdateForm(FundVO vo); // 펀딩 문의글 수정 입력 폼으로 이동
	FundVO startMakeIt(FundVO vo); // 메인 페이지 불러오기
	FundVO rewardFunding(FundVO vo);//리워드 펀딩하기
	
// ========================================================
	//Paging 처리용 
	int getCommentListCnt(String fundIdx); // 페이징 처리를 위한 댓글 목록 CNT
	List <FundVO> getCommentList(int begin, int end, String fundIdx); // 페이징 처리를 위한 Cmt List
	int fundingQnaCnt(String fundIdx); //페이징 처리를 위한 QnA CNT
	List<FundVO> fundingQnaList(int begin, int end, String fundIdx); //페이징 처리를 위한 QnA List
	int myQnaListCnt(String fundIdx, String memberId); //내 문의 내역 Cnt
	List<FundVO> fundMyQnaList(int begin, int end, String memberId, String fundIdx); //페이징 처리를 위한 my QnA List
// ========================================================
	//  목록 페이지 좋아요
	int fundLikeCnt(FundVO vo);
	int fundLikeUpdate(FundVO vo);
	int fundLikeDelete(FundVO vo);

	//상세 페이지 좋아요
	int fundDetailViewLikeCnt(FundVO vo);
	int fundDetailViewLikeInsert(FundVO vo);
	int fundDetailViewLikeDelete(FundVO vo);

	//팔로우
	int fundDetailFollowCnt(FundVO vo);
	int insertDetailFollow(FundVO vo);
	int deleteDetailFollow(FundVO vo);

}
