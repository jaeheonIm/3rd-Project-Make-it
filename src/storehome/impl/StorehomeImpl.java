package com.makeit.storehome.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.makeit.like.LikeVO;
import com.makeit.member.MemberVO;
import com.makeit.storehome.StorehomeService;
import com.makeit.storehome.StorehomeVO;

@Service
public class StorehomeImpl implements StorehomeService{
	
	@Autowired
	private StorehomeDAO storeDAO;
	
	@Override
	public List<StorehomeVO> getList() {
		return storeDAO.getList();
	}

	@Override
	public int likeUpdete(LikeVO vo) {
		return storeDAO.likeUpdete(vo);
	}

	@Override
	public void likeDelete(LikeVO vo) {
		storeDAO.likeDelete(vo);
	}

	@Override
	public int findLikeCnt(LikeVO vo) {
		return storeDAO.findLikeCnt(vo);
	}

	@Override
	public List<LikeVO> findLike(String memberId) {
		return storeDAO.findLike(memberId);
	}

	@Override
	public List<StorehomeVO> getFoodList() {
		return storeDAO.getFoodList();
	}
	
	@Override
	public List<StorehomeVO> getFashionList() {
		return storeDAO.fashion();
	}
	
	@Override
	public List<StorehomeVO> getTechList() {
		return storeDAO.getTechList();
	}
	
	@Override
	public List<StorehomeVO> getbeautyList() {
		// TODO Auto-generated method stub
		return storeDAO.getbeautyList();
	}
	
	@Override
	public List<StorehomeVO> gettripList() {
		// TODO Auto-generated method stub
		return storeDAO.gettripList();
	}
	
	@Override
	public List<StorehomeVO> getbabyList() {
		// TODO Auto-generated method stub
		return storeDAO.getbabyList();
	}
	
	@Override
	public List<StorehomeVO> getpetList() {
		// TODO Auto-generated method stub
		return storeDAO.getpetList();
	}
	

	@Override
	public StorehomeVO detail(StorehomeVO vo) {
		return storeDAO.detail(vo);
	}

	@Override
	public StorehomeVO order(StorehomeVO vo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO member(String memberId) {
		return storeDAO.member(memberId);
	}

	@Override
	public List<StorehomeVO> storeOption(String storeIdx) {
		return storeDAO.storeOption(storeIdx);
	}

	@Override
	public StorehomeVO storeOrder(String storeOtion) {
		return storeDAO.storeOrder(storeOtion);
	}

	@Override
	public StorehomeVO orderinfo(StorehomeVO vo) {
		return storeDAO.orderinfo(vo);
	}

	@Override
	public void orderInsert(StorehomeVO vo) {
		storeDAO.orderInsert(vo);
		
	}

	@Override
	public List<StorehomeVO> nowList() {
		return storeDAO.nowList();
	}

	@Override
	public List<StorehomeVO> myorder(StorehomeVO vo) {
		return storeDAO.myorder(vo);
	}

	@Override
	public List<StorehomeVO> getlistPopular() {
		return storeDAO.getlistPopular();
	}

	@Override
	public List<StorehomeVO> getlistRecent() {
		return storeDAO.getlistRecent();
	}

	@Override
	public List<StorehomeVO> getlistSatisfaction() {
		return storeDAO.getlistSatisfaction();
	}

	@Override
	public List<StorehomeVO> getfoodPopular() {
		return storeDAO.getfoodPopular();
	}

	@Override
	public List<StorehomeVO> getfoodRecent() {
		return storeDAO.getfoodRecent();
	}
	@Override
	public List<StorehomeVO> getfoodSatisfaction() {
		return storeDAO.getfoodSatisfaction();
	}

	@Override
	public List<StorehomeVO> gettechRecent() {
		return storeDAO.gettechRecent();
	}

	@Override
	public List<StorehomeVO> gettechSatisfaction() {
		return storeDAO.gettechSatisfaction();
	}

	@Override
	public List<StorehomeVO> gettechPopular() {
		return storeDAO.gettechPopular();
	}

	@Override
	public List<StorehomeVO> getbeautyRecent() {
		return storeDAO.getbeautyRecent();
	}

	@Override
	public List<StorehomeVO> getbeautySatisfaction() {
		return storeDAO.getbeautySatisfaction();
	}

	@Override
	public List<StorehomeVO> getbeautyPopular() {
		return storeDAO.getbeautyPopular();
	}

	@Override
	public List<StorehomeVO> gettripRecent() {
		return storeDAO.gettripRecent();
	}

	@Override
	public List<StorehomeVO> gettripPopular() {
		return storeDAO.gettripPopular();
	}

	@Override
	public List<StorehomeVO> gettripSatisfaction() {
		return storeDAO.gettripSatisfaction();
	}

	@Override
	public List<StorehomeVO> getbabyRecent() {
		return storeDAO.getbabyRecent();
	}

	@Override
	public List<StorehomeVO> getbabySatisfaction() {
		return storeDAO.getbabySatisfaction();
	}

	@Override
	public List<StorehomeVO> getbabyPopular() {
		return storeDAO.getbabyPopular();
	}

	@Override
	public List<StorehomeVO> getpetRecent() {
		return storeDAO.getpetRecent();
	}

	@Override
	public List<StorehomeVO> getpetSatisfaction() {
		return storeDAO.getpetSatisfaction();
	}

	@Override
	public List<StorehomeVO> getpetPopular() {
		return storeDAO.getpetPopular();
	}

	@Override
	public MemberVO storemember(String storeIdx) {
		return storeDAO.storemember(storeIdx);
	}

	@Override
	public List<StorehomeVO> storeReview(String storeIdx) {
		return storeDAO.storeReview(storeIdx);
	}

	@Override
	public List<StorehomeVO> getfashionRecent() {
		return storeDAO.getfashionRecent();
	}

	@Override
	public List<StorehomeVO> getfashionSatisfaction() {
		return storeDAO.getfashionSatisfaction();
	}

	@Override
	public List<StorehomeVO> getfashionPopular() {
		return storeDAO.getfashionPopular();
	}

	@Override
	public List<StorehomeVO> bestfood() {
		return storeDAO.bestfood();
	}

	@Override
	public List<StorehomeVO> bestfashion() {
		return storeDAO.bestfashion();
	}

	@Override
	public List<StorehomeVO> bestTect() {
		return storeDAO.bestTect();
	}

	@Override
	public List<StorehomeVO> bestbeauty() {
		return storeDAO.bestbeauty();
	}

	@Override
	public List<StorehomeVO> bestbaby() {
		return storeDAO.bestbaby();
	}

	@Override
	public List<StorehomeVO> bestTrip() {
		return storeDAO.bestTrip();
	}

	@Override
	public List<StorehomeVO> bestpet() {
		return storeDAO.bestpet();
	}

	@Override
	public int reviewIn(StorehomeVO vo) {
		return storeDAO.reviewIn(vo);
	}

	@Override
	public StorehomeVO reviewCnt(String storeIdx) {
		return storeDAO.reviewCnt(storeIdx);
	}

	@Override
	public List<StorehomeVO> getlistPopular1(StorehomeVO category) {
		return storeDAO.getlistPopular1(category);
	}

	@Override
	public List<StorehomeVO> getlistRecent1(StorehomeVO category) {
		return storeDAO.getlistRecent1(category);
	}

	@Override
	public List<StorehomeVO> getlistSatisfaction1(StorehomeVO category) {
		return storeDAO.getlistSatisfaction1(category);
	}

	@Override
	public List<StorehomeVO> getList1(StorehomeVO category) {
		return storeDAO.getList1(category);
	}

	@Override
	public int storeTotal() {
		return storeDAO.storeTotal();
	}

	@Override
	public List<StorehomeVO> qnaList(StorehomeVO vo) {
		return storeDAO.qnaList(vo);
	}

	@Override
	public int qnaInsert(StorehomeVO vo) {
		return storeDAO.qnaInsert(vo);
	}

	@Override
	public int qnaTotal(String idx) {
		return storeDAO.qnaTotal(idx);
	}

	@Override
	public StorehomeVO qnaView(StorehomeVO vo) {
		return storeDAO.qnaView(vo);
	}

	@Override
	public int qnamodify(StorehomeVO vo) {
		return storeDAO.qnamodify(vo);
	}

	@Override
	public int uphit(StorehomeVO vo) {
		return storeDAO.uphit(vo);
	}

	@Override
	public int reInsert(StorehomeVO vo) {
		return storeDAO.reInsert(vo);
	}

	@Override
	public StorehomeVO qnaRe(StorehomeVO vo) {
		return storeDAO.qnaRe(vo);
	}

	@Override
	public int qnaDel(String qnaIdx) {
		return storeDAO.qnaDel(qnaIdx);
	}

	@Override
	public void update(StorehomeVO vo) {
		storeDAO.update(vo);
	}

	@Override
	public int followYN(StorehomeVO vo) {
		return storeDAO.followYN(vo);
	}

	@Override
	public int followUpdete(StorehomeVO vo) {
		return storeDAO.followUpdete(vo);
	}

	@Override
	public int followDelete(StorehomeVO vo) {
		return storeDAO.followDelete(vo);
	}

	@Override
	public int reviewscoreUodate(String vo) {
		return storeDAO.reviewscoreUodate(vo);
	}

	@Override
	public List<StorehomeVO> couponList(StorehomeVO vo) {
		return storeDAO.couponList(vo);
	}

	@Override
	public List<StorehomeVO> myQnaList(StorehomeVO vo) {
		return storeDAO.myQnaList(vo);
	}

}
