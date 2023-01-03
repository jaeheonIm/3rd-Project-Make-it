package com.makeit.fund.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.makeit.fund.FundService;
import com.makeit.fund.FundVO;

// @Service : @Component 상속확장 어노테이션
//		비즈니스 로직 처리 서비스 영역에 사용
@Service("fundService")
public class FundServiceImpl implements FundService {
	@Autowired //타입이 일치하는 객체(인스턴스) 주입(DI)
	private FundDAO fundDAO;
	
	public FundServiceImpl() {
		System.out.println(" =====> FundServiceImpl() 객체 생성 <===== ");
	}
	@Override
	public FundVO startMakeIt(FundVO vo) {
		return fundDAO.startMakeIt(vo);
	}
	
	//=======================================================ALL
	@Override
	public int getBoardListAllCnt() {
		return fundDAO.getBoardListAllCnt();
	}
	
	@Override
	public List<FundVO> getBoardListAll(int begin, int end) {
		List<FundVO> list = fundDAO.getBoardListAll(begin, end);
		return list;
	}
	//---------------------------------------------------------------------------------------------------------------
	@Override
	public int fundingPageAllEndDateCnt() {
		return fundDAO.fundingPageAllEndDateCnt();
	}
	@Override
	public List<FundVO> fundingPageAllEndDate(int begin, int end, FundVO vo) {
		List<FundVO> list = fundDAO.fundingPageAllEndDate(begin, end, vo);
		return list;
	}
	//---------------------------------------------------------------------------------------------------------------
	@Override
	public int fundingPageAllFundPriceCnt() {
		return fundDAO.fundingPageAllFundPriceCnt();
	}
	@Override
	public List<FundVO> fundingPageAllFundPrice(int begin, int end, FundVO vo) {
		List<FundVO> list = fundDAO.fundingPageAllFundPrice(begin, end, vo);
		return list;
	}
	//---------------------------------------------------------------------------------------------------------------
	@Override
	public int fundingPageAllRecentCnt() {
		return fundDAO.fundingPageAllRecentCnt();
	}
	@Override
	public List<FundVO> fundingPageAllRecent(int begin, int end, FundVO vo) {
		List<FundVO> list = fundDAO.fundingPageAllRecent(begin, end, vo);
		return list;
	}
	
//=======================================================TECH
	
	@Override
	public int getBoardListTechCnt() {
		return fundDAO.getBoardListTechCnt();
	}
	@Override
	public List<FundVO> getBoardListTech(int begin, int end) {
		List<FundVO> list = fundDAO.getBoardListTech(begin, end);
		return list;
	}
	
	//---------------------------------------------------------------------------------------------------------------
	
	@Override
	public int fundingPageTechEndDateCnt(String fundCategory) {
		return fundDAO.fundingPageTechEndDateCnt(fundCategory);
	}
	@Override
	public List<FundVO> fundingPageTechEndDate(int begin, int end, String fundCategory) {
		List<FundVO> list = fundDAO.fundingPageTechEndDate(begin, end, fundCategory);
		return list;
	}

	//---------------------------------------------------------------------------------------------------------------
	@Override
	public int fundingPageTechFundPriceCnt(String fundCategory) {
		return fundDAO.fundingPageTechFundPriceCnt(fundCategory);
	}
	@Override
	public List<FundVO> fundingPageTechFundPrice(int begin, int end, String fundCategory) {
		List<FundVO> list = fundDAO.fundingPageTechFundPrice(begin, end, fundCategory);
		return list;
	}
	//---------------------------------------------------------------------------------------------------------------
	@Override
	public int fundingPageTechRecentCnt(String fundCategory) {
		return fundDAO.fundingPageTechRecentCnt(fundCategory);
	}
	@Override
	public List<FundVO> fundingPageTechRecent(int begin, int end, String fundCategory) {
		List<FundVO> list = fundDAO.fundingPageTechRecent(begin, end, fundCategory);
		return list;
	}
	
//=======================================================FASHION
	@Override
	public int getBoardListFashionCnt() {
		return fundDAO.getBoardListFashionCnt();
	}
	@Override
	public List<FundVO> getBoardListFashion(int begin, int end) {
		List<FundVO> list = fundDAO.getBoardListFashion(begin, end);
		return list;
	}
	//---------------------------------------------------------------------------------------------------------------
	@Override
	public List<FundVO> fundingPageFashionEndDate(FundVO vo) {
		return fundDAO.fundingPageFashionEndDate(vo);
	}
	//---------------------------------------------------------------------------------------------------------------
	@Override
	public List<FundVO> fundingPageFashionFundPrice(FundVO vo) {
		return fundDAO.fundingPageFashionFundPrice(vo);
	}
	//---------------------------------------------------------------------------------------------------------------
	@Override
	public List<FundVO> fundingPageFashionRecent(FundVO vo) {
		return fundDAO.fundingPageFashionRecent(vo);
	}
//=======================================================BEAUTY
	@Override
	public int getBoardListBeautyCnt() {
		return fundDAO.getBoardListBeautyCnt();
	}
	@Override
	public List<FundVO> getBoardListBeauty(int begin, int end) {
		List<FundVO> list = fundDAO.getBoardListBeauty(begin, end);
		return list;
	}
	
	//---------------------------------------------------------------------------------------------------------------
	@Override
	public List<FundVO> fundingPageBeautyEndDate(FundVO vo) {
		return fundDAO.fundingPageBeautyEndDate(vo);
	}
	//---------------------------------------------------------------------------------------------------------------
	@Override
	public List<FundVO> fundingPageBeautyFundPrice(FundVO vo) {
		return fundDAO.fundingPageBeautyFundPrice(vo);
	}
	//---------------------------------------------------------------------------------------------------------------
	@Override
	public List<FundVO> fundingPageBeautyRecent(FundVO vo) {
		return fundDAO.fundingPageBeautyRecent(vo);
	}
	
//=======================================================FOOD
	@Override
	public int getBoardListFoodCnt() {
		return fundDAO.getBoardListFoodCnt();
	}
	@Override
	public List<FundVO> getBoardListFood(int begin, int end) {
		List<FundVO> list = fundDAO.getBoardListFood(begin, end);
		return list;
	}

	//---------------------------------------------------------------------------------------------------------------
	@Override
	public List<FundVO> fundingPageFoodEndDate(FundVO vo) {
		return fundDAO.fundingPageFoodEndDate(vo);
	}
	//---------------------------------------------------------------------------------------------------------------
	@Override
	public List<FundVO> fundingPageFoodFundPrice(FundVO vo) {
		return fundDAO.fundingPageFoodFundPrice(vo);
	}
	//---------------------------------------------------------------------------------------------------------------
	@Override
	public List<FundVO> fundingPageFoodRecent(FundVO vo) {
		return fundDAO.fundingPageFoodRecent(vo);
	}
	
//=======================================================TRAVEL
	@Override
	public int getBoardListTravelCnt() {
		return fundDAO.getBoardListTravelCnt();
	}
	@Override
	public List<FundVO> getBoardListTravel(int begin, int end) {
		List<FundVO> list = fundDAO.getBoardListTravel(begin, end);
		return list;
	}
	
	//---------------------------------------------------------------------------------------------------------------
	@Override
	public List<FundVO> fundingPageTravelEndDate(FundVO vo) {
		return fundDAO.fundingPageTravelEndDate(vo);
	}
	//---------------------------------------------------------------------------------------------------------------
	@Override
	public List<FundVO> fundingPageTravelFundPrice(FundVO vo) {
		return fundDAO.fundingPageTravelFundPrice(vo);
	}
	//---------------------------------------------------------------------------------------------------------------
	@Override
	public List<FundVO> fundingPageTravelRecent(FundVO vo) {
		return fundDAO.fundingPageTravelRecent(vo);
	}
	
//=======================================================BABY
	@Override
	public int getBoardListBabyCnt() {
		return fundDAO.getBoardListBabyCnt();
	}
	@Override
	public List<FundVO> getBoardListBaby(int begin, int end) {
		List<FundVO> list = fundDAO.getBoardListBaby(begin, end);
		return list;
	}
	
	//---------------------------------------------------------------------------------------------------------------
	@Override
	public List<FundVO> fundingPageBabyEndDate(FundVO vo) {
		return fundDAO.fundingPageBabyEndDate(vo);
	}
	//---------------------------------------------------------------------------------------------------------------
	@Override
	public List<FundVO> fundingPageBabyFundPrice(FundVO vo) {
		return fundDAO.fundingPageBabyFundPrice(vo);
	}
	//---------------------------------------------------------------------------------------------------------------
	@Override
	public List<FundVO> fundingPageBabyRecent(FundVO vo) {
		return fundDAO.fundingPageBabyRecent(vo);
	}
	
//=======================================================ANIMAL
	@Override
	public int getBoardListAnimalCnt() {
		return fundDAO.getBoardListAnimalCnt();
	}
	@Override
	public List<FundVO> getBoardListAnimal(int begin, int end) {
		List<FundVO> list = fundDAO.getBoardListAnimal(begin, end);
		return list;
	}
	//---------------------------------------------------------------------------------------------------------------
	@Override
	public List<FundVO> fundingPageAnimalEndDate(FundVO vo) {
		return fundDAO.fundingPageAnimalEndDate(vo);
	}
	//---------------------------------------------------------------------------------------------------------------
	@Override
	public List<FundVO> fundingPageAnimalFundPrice(FundVO vo) {
		return fundDAO.fundingPageAnimalFundPrice(vo);
	}
	//---------------------------------------------------------------------------------------------------------------
	@Override
	public List<FundVO> fundingPageAnimalRecent(FundVO vo) {
		return fundDAO.fundingPageAnimalRecent(vo);
	}
	
//==================================================================
	@Override
	public List<FundVO> searchBoardList(FundVO vo) {
		return fundDAO.searchBoardList(vo);
	}
	
	@Override
	public FundVO productDetailView(FundVO vo) {
		return fundDAO.productDetailView(vo);
	}

	@Override
	public void insertReview(FundVO vo) {
		fundDAO.insertReview(vo);
	}

	@Override
	public void deleteReview(FundVO vo) {
		fundDAO.deleteReview(vo);
	}

	@Override
	public FundVO returnAndCancel(FundVO vo) {
		return fundDAO.returnAndCancel(vo);
	}
	
	@Override
	public List<FundVO> getSupporter(FundVO vo) {
		return fundDAO.getSupporter(vo);
	}

	@Override
	public FundVO communityCnt(FundVO vo) {
		return fundDAO.communityCnt(vo);
	}

	@Override
	public FundVO supporterCnt(FundVO vo) {
		return fundDAO.supporterCnt(vo);
	}


	@Override
	public List<FundVO> fundOptionView(FundVO vo) {
		return fundDAO.fundOptionView(vo);
	}

	@Override
	public FundVO rewardFunding(FundVO vo) {
		return fundDAO.rewardFunding(vo);
	}

	@Override
	public FundVO fundingQnaView(FundVO vo) {
		return fundDAO.fundingQnaView(vo);
	}

	@Override
	public FundVO myQnaView(FundVO vo) {
		return fundDAO.myQnaView(vo);
	}
	
	@Override
	public FundVO fundingQnaInsertForm(FundVO vo) {
		return fundDAO.fundingQnaInsertForm(vo);
	}

	@Override
	public void fundingQnaInsert(FundVO vo) {
		fundDAO.fundingQnaInsert(vo);
		
	}

	@Override
	public void deleteQnA(FundVO vo) {
		fundDAO.deleteQnA(vo);
	}

	@Override
	public FundVO fundingQnaUpdateForm(FundVO vo) {
		return fundDAO.fundingQnaUpdateForm(vo);
	}

	@Override
	public void fundingQnaUpdate(FundVO vo) {
		fundDAO.fundingQnaUpdate(vo);
	}

	@Override
	public void insertQnaRe(FundVO vo) {
		fundDAO.insertQnaRe(vo);
	}

	@Override
	public FundVO fundingQnaRe(FundVO vo) {
		return fundDAO.fundingQnaRe(vo);
	}

	@Override
	public void statusChange(FundVO vo) {
		fundDAO.statusChange(vo);
	}

	@Override
	public int getCommentListCnt(String fundIdx) {
		return fundDAO.getCommentListCnt(fundIdx);
	}

	@Override
	public List<FundVO> getCommentList(int begin, int end, String fundIdx) {
		List<FundVO> list = fundDAO.getCommentList(begin, end, fundIdx);
		return list;
	}

	@Override
	public int fundingQnaCnt(String fundIdx) {
		return fundDAO.fundingQnaCnt(fundIdx);
	}

	@Override
	public List<FundVO> fundingQnaList(int begin, int end, String fundIdx) {
		List<FundVO> list = fundDAO.fundingQnaList(begin, end, fundIdx);
		return list;
	}

	@Override
	public int myQnaListCnt(String fundIdx, String memberId) {
		return fundDAO.myQnaListCnt(fundIdx, memberId);
	}

	@Override
	public List<FundVO> fundMyQnaList(int begin, int end, String memberId, String fundIdx) {
		List<FundVO> list = fundDAO.fundMyQnaList(begin, end, memberId, fundIdx);
		return list;
	}

	@Override
	public List<FundVO> couponList(FundVO vo) {
		return fundDAO.couponList(vo);
	}
	
	@Override
	public void rewardInsert(FundVO vo) {
		fundDAO.rewardInsert(vo);
	}
	
	@Override
	public void couponCheck(FundVO vo) {
		fundDAO.couponCheck(vo);
	}
	
	@Override
	public void fundPriceUpdate(FundVO vo) {
		fundDAO.fundPriceUpdate(vo);
	}

	@Override
	public void insertSupporter(FundVO vo) {
		fundDAO.insertSupporter(vo);
	}
	
	@Override
	public void supporterPriceUpdate(FundVO vo) {
		fundDAO.supporterPriceUpdate(vo);
	}
	
	@Override
	public int fundLikeCnt(FundVO vo) {
		return fundDAO.fundLikeCnt(vo);
	}
	@Override
	public int fundLikeUpdate(FundVO vo) {
		return fundDAO.fundLikeUpdate(vo);
	}
	@Override
	public int fundLikeDelete(FundVO vo) {
		return fundDAO.fundLikeDelete(vo);
	}
	
	@Override
	public int fundDetailViewLikeCnt(FundVO vo) {
		return fundDAO.fundDetailViewLikeCnt(vo);
	}
	
	@Override
	public int fundDetailViewLikeInsert(FundVO vo) {
		return fundDAO.fundDetailViewLikeInsert(vo);
	}
	
	@Override
	public int fundDetailViewLikeDelete(FundVO vo) {
		return fundDAO.fundDetailViewLikeDelete(vo);
	}

	@Override
	public int fundDetailFollowCnt(FundVO vo) {
		return fundDAO.fundDetailFollowCnt(vo);
	}
	@Override
	public int insertDetailFollow(FundVO vo) {
		return fundDAO.insertDetailFollow(vo);
	}
	@Override
	public int deleteDetailFollow(FundVO vo) {
		return fundDAO.deleteDetailFollow(vo);
	}



}
