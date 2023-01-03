package com.makeit.member.impl;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.makeit.fund.FundVO;
import com.makeit.like.LikeVO;
import com.makeit.member.AdminVO;
import com.makeit.member.AdvertisementVO;
import com.makeit.member.MemberVO;
import com.makeit.storehome.StorehomeVO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public MemberDAO() {
		System.out.println(" =====> MemberDAO(MyBatis) 객체 생성 <===== ");
	}
	
	// id, password 가 일치하는 데이터 조회
	public MemberVO getUser(MemberVO vo) {
		System.out.println(" =====> MyBatis 사용 MemberUser() 실행 <===== ");
		return mybatis.selectOne("memberDAO.getUser", vo);
	}
	
	public int getmemberId(MemberVO vo) {
		System.out.println(" =====> MyBatis 사용 getmemberId() 실행 <===== ");
		return mybatis.selectOne("memberDAO.getmemberId", vo);
	}
	
	public int getmemberNickname(MemberVO vo) {
		System.out.println(" =====> MyBatis 사용 getmemberNickname() 실행 <===== ");
		return mybatis.selectOne("memberDAO.getmemberNickname", vo);
	}
	
	public void insertMember(MemberVO vo) {
		mybatis.insert("memberDAO.insertMember", vo);
	}

	public MemberVO loginCheck(MemberVO vo) {
		return mybatis.selectOne("memberDAO.loginCheck", vo);
	}

	public MemberVO memberLogin(MemberVO vo) {
		return mybatis.selectOne("memberDAO.memberLogin", vo);
	}

	public List<FundVO> makeitMypageLike(FundVO vo) {
		return mybatis.selectList("memberDAO.makeitMypageLike", vo);
	}

	public List<StorehomeVO> getStoreLike(StorehomeVO vo1) {
		return mybatis.selectList("memberDAO.getStoreLike", vo1);
	}

	public int getmemberEmail(MemberVO vo) {
		return mybatis.selectOne("memberDAO.getmemberEmail", vo);
	}

	public void updateMember(MemberVO vo) {
		mybatis.update("memberDAO.updateMember", vo);
	}

	public int getmemberPassword(MemberVO vo) {
		return mybatis.selectOne("memberDAO.getmemberPassword", vo);
	}

	public void updatePassword(MemberVO vo) {
		mybatis.update("memberDAO.updatePassword", vo);
	}

	public void updateProfile(MemberVO vo) {
		mybatis.update("memberDAO.updateProfile", vo);
	}

	public MemberVO getMember(MemberVO vo) {
		return mybatis.selectOne("memberDAO.getMember", vo);
	}

	public void deleteMember(MemberVO vo) {
		mybatis.update("memberDAO.deleteMember", vo);
	}

	public List<FundVO> getMyfunding(FundVO vo) {
		return mybatis.selectList("memberDAO.getMyfunding", vo);
	}

	public List<StorehomeVO> getMystore(StorehomeVO vo) {
		return mybatis.selectList("memberDAO.getMystore", vo);
	}

	public int getStoreTotalCnt(String memberId) {
		return mybatis.selectOne("memberDAO.getStoreTotalCnt", memberId);
	}

	public List<StorehomeVO> getMyStoreList(int begin, int end, String memberId) {
		Map<String, Object> map = new HashMap<String,  Object>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("memberId", memberId);
		List<StorehomeVO> list = mybatis.selectList("memberDAO.getMyStoreList",map);
		return list;
	}

	public int getFundTotalCnt(String memberId) {
		return mybatis.selectOne("memberDAO.getFundTotalCnt", memberId);
	}

	public List<FundVO> getMyFundList(int begin, int end, String memberId) {
		Map<String, Object> map = new HashMap<String,  Object>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("memberId", memberId);
		List<FundVO> list = mybatis.selectList("memberDAO.getMyFundList",map);
		return list;
	}
	
	public MemberVO memberEmail(MemberVO vo) {
		return mybatis.selectOne("memberDAO.memberEmail", vo);
	}

	public List<AdminVO> getMonthData() {
		return mybatis.selectList("memberDAO.getMonthData");
	}

	public List<AdminVO> getPieData() {
		return mybatis.selectList("memberDAO.getPieData");
	}

	public List<AdminVO> getFundPie() {
		return mybatis.selectList("memberDAO.getFundPie");
	}

	public List<AdminVO> getDailyData() {
		return mybatis.selectList("memberDAO.getDailyData");
	}

	public List<AdminVO> rank() {
		return mybatis.selectList("memberDAO.rank");
	}

	public List<MemberVO> getAdminMember() {
		return mybatis.selectList("memberDAO.getAdminMember");
	}

	public List<MemberVO> getMakerMember() {
		return mybatis.selectList("memberDAO.getMakerMember");
	}

	public List<FundVO> myfundProject(FundVO vo) {
		return mybatis.selectList("memberDAO.myfundProject", vo);
	}
	
	public List<FundVO> myfundingAjax(MemberVO vo) {
		return mybatis.selectList("memberDAO.myfundingAjax", vo);
	}

	public List<FundVO> myPageFunding(MemberVO vo) {
		return mybatis.selectList("memberDAO.myPageFunding", vo);
	}

	public List<StorehomeVO> myPageStore(MemberVO vo) {
		return mybatis.selectList("memberDAO.myPageStore", vo);
	}

	public void insertMemberCard(MemberVO vo) {
		mybatis.insert("memberDAO.insertMemberCard", vo);
	}

	public int getAskTotalCnt(String memberId) {
		return mybatis.selectOne("memberDAO.getAskTotalCnt", memberId);
	}

	public List<MemberVO> getMyAskList(int begin, int end, String memberId) {
		Map<String, Object> map = new HashMap<String,  Object>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("memberId", memberId);
		List<MemberVO> list = mybatis.selectList("memberDAO.getMyAskList",map);
		return list;
	}

	public int getMyStoreTotalCnt(String memberId) {
		return mybatis.selectOne("memberDAO.getMyStoreTotalCnt", memberId);
	}

	public List<StorehomeVO> getMyStoreAll(int begin, int end, String memberId) {
		Map<String, Object> map = new HashMap<String,  Object>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("memberId", memberId);
		List<StorehomeVO> list = mybatis.selectList("memberDAO.getMyStoreAll",map);
		return list;
	}

	public void deleteMypageStore(StorehomeVO vo) {
		mybatis.delete("memberDAO.deleteMypageStore", vo);
	}

	public void deleteMypageFunding(FundVO vo) {
		mybatis.delete("memberDAO.deleteMypageFunding", vo);
	}

	public int getMyFundTotalCnt(String memberId) {
		return mybatis.selectOne("memberDAO.getMyFundTotalCnt", memberId);
	}

	public List<FundVO> getMyFundAll(int begin, int end, String memberId) {
		Map<String, Object> map = new HashMap<String,  Object>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("memberId", memberId);
		List<FundVO> list = mybatis.selectList("memberDAO.getMyFundAll",map);
		return list;
	}

	public void advertise(AdvertisementVO vo) {
		mybatis.insert("memberDAO.advertise", vo);
	}

	public List<AdvertisementVO> adminAd() {
		return mybatis.selectList("memberDAO.adminAd");
	}

	public void adCheckUpdate(AdvertisementVO vo) {
		mybatis.update("memberDAO.adCheckUpdate", vo);
	}

	public void adCheckUpdate2(AdvertisementVO vo) {
		mybatis.update("memberDAO.adCheckUpdate2", vo);
	}

	public int memberFundCnt(MemberVO vo) {
		return mybatis.selectOne("memberDAO.memberFundCnt", vo);
	}

	public int memberStoreCnt(MemberVO vo) {
		return mybatis.selectOne("memberDAO.memberStoreCnt", vo);
	}

	public List<AdvertisementVO> memberAdList(MemberVO vo) {
		return mybatis.selectList("memberDAO.memberAdList", vo);
	}

	public AdvertisementVO adPay(AdvertisementVO vo) {
		return mybatis.selectOne("memberDAO.adPay", vo);
	}

	public void adOrderInsert(AdvertisementVO vo) {
		mybatis.insert("memberDAO.adOrderInsert", vo);
	}

	public AdvertisementVO adPayinfo(AdvertisementVO vo) {
		return mybatis.selectOne("memberDAO.adPayinfo", vo);
	}

	public void adCheckUpdate3(AdvertisementVO vo) {
		mybatis.update("memberDAO.adCheckUpdate3", vo);
	}

	public List<AdminVO> getAdMonthData() {
		return mybatis.selectList("memberDAO.getAdMonthData");
	}

	public List<AdminVO> getAdDailyData() {
		return mybatis.selectList("memberDAO.getAdDailyData");
	}

	public List<StorehomeVO> couponStore() {
		return mybatis.selectList("memberDAO.couponStore");
	}

	public void insertCoupon(AdminVO vo) {
		mybatis.insert("memberDAO.insertCoupon", vo);
	}

	public List<FundVO> couponFund() {
		return mybatis.selectList("memberDAO.couponFund");
	}

	public void insertFundCoupon(AdminVO vo) {
		mybatis.insert("memberDAO.insertFundCoupon", vo);
	}

	public int couponTotalCnt(String memberId) {
		return mybatis.selectOne("memberDAO.couponTotalCnt");
	}

	public int myCouponCnt(String memberId) {
		return mybatis.selectOne("memberDAO.myCouponCnt", memberId);
	}

	public List<AdminVO> couponTotalList(int begin, int end, String memberId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("memberId", memberId);
		return mybatis.selectList("memberDAO.couponTotalList", map);
	}

	public List<AdminVO> myCouponList(int begin, int end, String memberId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("memberId", memberId);
		return mybatis.selectList("memberDAO.myCouponList", map);
	}

	public int couponHistoryTotalCnt(String memberId) {
		return mybatis.selectOne("memberDAO.couponHistoryTotalCnt", memberId);
	}

	public List<AdminVO> myCouponHistory(int begin, int end, String memberId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("memberId", memberId);
		return mybatis.selectList("memberDAO.myCouponHistory", map);
	}

	public void couponDown(String memberId, String couponIdx) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("couponIdx", couponIdx);
		mybatis.insert("memberDAO.couponDown", map);
	}

	public int fundLikeCnt1(LikeVO vo) {
		return mybatis.selectOne("memberDAO.fundLikeCnt1", vo);
	}

	public void fundLikeUpdate1(LikeVO vo) {
		mybatis.update("memberDAO.fundLikeUpdate1", vo);
	}

	public void fundLikeDelete1(LikeVO vo) {
		mybatis.delete("memberDAO.fundLikeDelete1", vo);
	}

	public int getStoreAskTotalCnt(String memberId) {
		return mybatis.selectOne("memberDAO.getStoreAskTotalCnt", memberId);
	}

	public List<MemberVO> getMyStoreAskList(int begin, int end, String memberId) {
		Map<String, Object> map = new HashMap<String,  Object>();
		map.put("begin", begin);
		map.put("end", end);
		map.put("memberId", memberId);
		List<MemberVO> list = mybatis.selectList("memberDAO.getMyStoreAskList",map);
		return list;
	}

}
