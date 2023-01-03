package com.makeit.storehome.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.makeit.like.LikeVO;
import com.makeit.member.MemberVO;
import com.makeit.storehome.StorehomeVO;

@Repository
public class StorehomeDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public StorehomeDAO() {
	}
	
	public List<StorehomeVO> getList() {
		return mybatis.selectList("StoreDAO.getList");
	}

	public int likeUpdete(LikeVO vo) {
		return mybatis.update("StoreDAO.likeUpdete", vo);
	}

	public void likeDelete(LikeVO vo) {
		mybatis.delete("StoreDAO.likeDelete", vo);
	}

	public int findLikeCnt(LikeVO vo) {
		return mybatis.selectOne("StoreDAO.findLikeCnt", vo);
	}
	
	public List<LikeVO> findLike(String memberId) {
		return mybatis.selectList("StoreDAO.findLike", memberId);
	}
	//푸드리스트
	public List<StorehomeVO> getFoodList() {
		return mybatis.selectList("StoreDAO.getFoodList");
	}

	public List<StorehomeVO> fashion() {
		return mybatis.selectList("StoreDAO.fashion");
	}
	
	public List<StorehomeVO> getTechList() {
		return mybatis.selectList("StoreDAO.tech");
	}

	public List<StorehomeVO> getbeautyList() {
		return mybatis.selectList("StoreDAO.beauty");
	}

	public List<StorehomeVO> gettripList() {
		return mybatis.selectList("StoreDAO.trip");
	}

	public List<StorehomeVO> getbabyList() {
		return mybatis.selectList("StoreDAO.baby");
	}

	public List<StorehomeVO> getpetList() {
		return mybatis.selectList("StoreDAO.pet");
	}
	public StorehomeVO detail(StorehomeVO vo) {
		return mybatis.selectOne("StoreDAO.detail", vo);
	}

	public MemberVO member(String memberId) {
		return mybatis.selectOne("StoreDAO.member", memberId);
	}

	public List<StorehomeVO> storeOption(String storeIdx) {
		System.out.println("!!!!!!");
		return mybatis.selectList("StoreDAO.storeOption", storeIdx);
	}

	public StorehomeVO storeOrder(String storeOtion) {
		return mybatis.selectOne("StoreDAO.storeOrder", storeOtion);
	}

	public StorehomeVO orderinfo(StorehomeVO vo) {
		return mybatis.selectOne("StoreDAO.orderinfo", vo);
	}

	public void orderInsert(StorehomeVO vo) {
		mybatis.insert("StoreDAO.orderInsert", vo);
		
	}


	public List<StorehomeVO> nowList() {
		return mybatis.selectList("StoreDAO.nowList");
	}

	public List<StorehomeVO> myorder(StorehomeVO vo) {
		return mybatis.selectList("StoreDAO.myorder", vo);
	}

	public List<StorehomeVO> getlistPopular() { //1
		return mybatis.selectList("StoreDAO.getlistPopular");
	}

	public List<StorehomeVO> getlistRecent() {//2
		return mybatis.selectList("StoreDAO.getlistRecent");
	}

	public List<StorehomeVO> getlistSatisfaction() {//3
		return mybatis.selectList("StoreDAO.getlistSatisfaction");
	}

	public List<StorehomeVO> getfoodPopular() {
		return mybatis.selectList("StoreDAO.getfoodPopular");
	}

	public List<StorehomeVO> getfoodRecent() {
		return mybatis.selectList("StoreDAO.getfoodRecent");
	}

	public List<StorehomeVO> getfoodSatisfaction() {
		return mybatis.selectList("StoreDAO.getfoodSatisfaction");
	}

	public List<StorehomeVO> gettechRecent() {
		return mybatis.selectList("StoreDAO.gettechRecent");
	}

	public List<StorehomeVO> gettechSatisfaction() {
		return mybatis.selectList("StoreDAO.gettechSatisfaction");
	}

	public List<StorehomeVO> gettechPopular() {
		return mybatis.selectList("StoreDAO.gettechPopular");
	}

	public List<StorehomeVO> getbeautyRecent() {
		return mybatis.selectList("StoreDAO.getbeautyRecent");
	}

	public List<StorehomeVO> getbeautySatisfaction() {
		return mybatis.selectList("StoreDAO.getbeautySatisfaction");
	}

	public List<StorehomeVO> getbeautyPopular() {
		return mybatis.selectList("StoreDAO.getbeautyPopular");
	}

	public List<StorehomeVO> gettripRecent() {
		return mybatis.selectList("StoreDAO.gettripRecent");
	}

	public List<StorehomeVO> gettripPopular() {
		return mybatis.selectList("StoreDAO.gettripPopular");
	}

	public List<StorehomeVO> gettripSatisfaction() {
		return mybatis.selectList("StoreDAO.gettripSatisfaction");
	}

	public List<StorehomeVO> getbabyRecent() {
		return mybatis.selectList("StoreDAO.getbabyRecent");
	}

	public List<StorehomeVO> getbabySatisfaction() {
		return mybatis.selectList("StoreDAO.getbabySatisfaction");
	}

	public List<StorehomeVO> getbabyPopular() {
		return mybatis.selectList("StoreDAO.getbabyPopular");
	}

	public List<StorehomeVO> getpetRecent() {
		return mybatis.selectList("StoreDAO.getpetRecent");
	}

	public List<StorehomeVO> getpetSatisfaction() {
		return mybatis.selectList("StoreDAO.getpetSatisfaction");
	}

	public List<StorehomeVO> getpetPopular() {
		return mybatis.selectList("StoreDAO.getpetPopular");
	}

	public MemberVO storemember(String storeIdx) {
		return mybatis.selectOne("StoreDAO.storemember",storeIdx);
	}

	public List<StorehomeVO> storeReview(String storeIdx) {
		return mybatis.selectList("StoreDAO.storeReview", storeIdx);
	}

	public List<StorehomeVO> getfashionRecent() {
		return mybatis.selectList("StoreDAO.getfashionRecent");
	}

	public List<StorehomeVO> getfashionSatisfaction() {
		return mybatis.selectList("StoreDAO.getfashionSatisfaction");
	}

	public List<StorehomeVO> getfashionPopular() {
		return mybatis.selectList("StoreDAO.getfashionPopular");
	}

	public List<StorehomeVO> bestfood() {
		return mybatis.selectList("StoreDAO.bestfood");
	}

	public List<StorehomeVO> bestfashion() {
		return mybatis.selectList("StoreDAO.bestfashion");
	}

	public List<StorehomeVO> bestTect() {
		return mybatis.selectList("StoreDAO.bestTect");
	}

	public List<StorehomeVO> bestbeauty() {
		return mybatis.selectList("StoreDAO.bestbeauty");
	}

	public List<StorehomeVO> bestbaby() {
		return mybatis.selectList("StoreDAO.bestbaby");
	}

	public List<StorehomeVO> bestTrip() {
		return mybatis.selectList("StoreDAO.bestTrip");
	}

	public List<StorehomeVO> bestpet() {
		return mybatis.selectList("StoreDAO.bestpet");
	}

	public int reviewIn(StorehomeVO vo) {
		return mybatis.insert("StoreDAO.reviewIn", vo);
	}

	public StorehomeVO reviewCnt(String storeIdx) {
		return mybatis.selectOne("StoreDAO.reviewCnt", storeIdx);
	}

	public List<StorehomeVO> getlistPopular1(StorehomeVO category) {
		return mybatis.selectList("StoreDAO.getlistPopular1", category);
	}

	public List<StorehomeVO> getlistRecent1(StorehomeVO category) {
		return mybatis.selectList("StoreDAO.getlistRecent1", category);
	}

	public List<StorehomeVO> getlistSatisfaction1(StorehomeVO category) {
		return mybatis.selectList("StoreDAO.getlistSatisfaction1", category);
	}

	public List<StorehomeVO> getList1(StorehomeVO category) {
		return mybatis.selectList("StoreDAO.getList1", category);
	}

	public int storeTotal() {
		return mybatis.selectOne("StoreDAO.storeTotal");
	}

	public List<StorehomeVO> qnaList(StorehomeVO vo) {
		return mybatis.selectList("StoreDAO.qnaList", vo);
	}

	public int qnaInsert(StorehomeVO vo) {
		return mybatis.insert("StoreDAO.qnaInsert", vo);
	}

	public int qnaTotal(String idx) {
		return mybatis.selectOne("StoreDAO.qnaTotal", idx);
	}

	public StorehomeVO qnaView(StorehomeVO vo) {
		return mybatis.selectOne("StoreDAO.qnaView" ,vo);
	}

	public int qnamodify(StorehomeVO vo) {
		return mybatis.update("StoreDAO.qnamodify" ,vo);
	}
	
	public int uphit(StorehomeVO vo) {
		return mybatis.update("StoreDAO.uphit" ,vo);
	}

	public int reInsert(StorehomeVO vo) {
		return mybatis.update("StoreDAO.reInsert" ,vo);
	}

	public StorehomeVO qnaRe(StorehomeVO vo) {
		return mybatis.selectOne("StoreDAO.qnaRe" ,vo);
	}

	public int qnaDel(String qnaIdx) {
		return mybatis.delete("StoreDAO.qnaDel" ,qnaIdx);
	}

	public void update(StorehomeVO vo) {
		mybatis.update("StoreDAO.update", vo);
	}

	public int followYN(StorehomeVO vo) {
		return mybatis.selectOne("StoreDAO.followYN", vo);
	}

	public int followUpdete(StorehomeVO vo) {
		return mybatis.update("StoreDAO.followUpdete", vo);
	}

	public int followDelete(StorehomeVO vo) {
		return mybatis.delete("StoreDAO.followDelete", vo);
	}

	public int reviewscoreUodate(String vo) {
		return mybatis.update("StoreDAO.reviewscoreUodate", vo);
	}

	public List<StorehomeVO> couponList(StorehomeVO vo) {
		return mybatis.selectList("StoreDAO.couponList", vo);
	}

	public List<StorehomeVO> myQnaList(StorehomeVO vo) {
		return mybatis.selectList("StoreDAO.myQnaList", vo);
	}

}
