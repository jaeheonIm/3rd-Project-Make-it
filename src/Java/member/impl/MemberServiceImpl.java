package com.makeit.member.impl;




import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;

import com.makeit.fund.FundVO;
import com.makeit.like.LikeVO;
import com.makeit.member.AdminVO;
import com.makeit.member.AdvertisementVO;
import com.makeit.member.MemberService;
import com.makeit.member.MemberVO;
import com.makeit.storehome.StorehomeVO;

// UserService 구현
@Service("memberService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDAO MemberDAO;
	
	public MemberServiceImpl() {
		System.out.println(" =====> MemberServiceImpl() 객체 생성 <===== ");
	}
	@Override
	public MemberVO getUser(MemberVO vo) {
		
		return MemberDAO.getUser(vo);
	}
	@Override
	public int getmemberId(MemberVO vo) {
		
		return MemberDAO.getmemberId(vo);
	}
	@Override
	public int getmemberNickname(MemberVO vo) {
		
		return MemberDAO.getmemberNickname(vo);
	}
	@Override
	public void insertMember(MemberVO vo) {
		MemberDAO.insertMember(vo);
	}
	@Override
	public MemberVO loginCheck(MemberVO vo) {
		return MemberDAO.loginCheck(vo);
	}
	@Override
	public MemberVO memberLogin(MemberVO vo) {
		return MemberDAO.memberLogin(vo);
	}
	@Override
	public List<FundVO> makeitMypageLike(FundVO vo) {
		return MemberDAO.makeitMypageLike(vo);
	}
	@Override
	public List<StorehomeVO> getStoreLike(StorehomeVO vo1) {
		return MemberDAO.getStoreLike(vo1);
	}
	@Override
	public int getmemberEmail(MemberVO vo) {
		return MemberDAO.getmemberEmail(vo);
	}
	@Override
	public void updateMember(MemberVO vo) {
		MemberDAO.updateMember(vo);
	}
	@Override
	public int getmemberPassword(MemberVO vo) {
		return MemberDAO.getmemberPassword(vo);
	}
	@Override
	public void updatePassword(MemberVO vo) {
		MemberDAO.updatePassword(vo);
	}
	@Override
	public void updateProfile(MemberVO vo) {
		MemberDAO.updateProfile(vo);
	}
	@Override
	public MemberVO getMember(MemberVO vo) {
		return MemberDAO.getMember(vo);
	}
	@Override
	public void deleteMember(MemberVO vo) {
		MemberDAO.deleteMember(vo);
	}
	@Override
	public List<FundVO> getMyfunding(FundVO vo) {
		return MemberDAO.getMyfunding(vo);
	}
	@Override
	public List<StorehomeVO> getMystore(StorehomeVO vo) {
		return MemberDAO.getMystore(vo);
	}
	@Override
	public int getStoreTotalCnt(String memberId) {
		return MemberDAO.getStoreTotalCnt(memberId);
	}
	@Override
	public List<StorehomeVO> getMyStoreList(int begin, int end, String memberId) {
		List<StorehomeVO> list = MemberDAO.getMyStoreList(begin, end, memberId);
		return list;
	}
	@Override
	public int getFundTotalCnt(String memberId) {
		return MemberDAO.getFundTotalCnt(memberId);
	}
	@Override
	public List<FundVO> getMyFundList(int begin, int end, String memberId) {
		List<FundVO> list = MemberDAO.getMyFundList(begin, end, memberId);
		return list;
	}
	
	@Override
	public MemberVO memberEmail(MemberVO vo) {
		return MemberDAO.memberEmail(vo);
	}
	@Override
	public List<AdminVO> getMonthData() {
		return MemberDAO.getMonthData();
	}
	@Override
	public List<AdminVO> getPieData() {
		return MemberDAO.getPieData();
	}
	@Override
	public List<AdminVO> getFundPie() {
		return MemberDAO.getFundPie();
	}
	@Override
	public List<AdminVO> getDailyData() {
		return MemberDAO.getDailyData();
	}
	@Override
	public List<AdminVO> rank() {
		return MemberDAO.rank();
	}
	@Override
	public List<MemberVO> getAdminMember() {
		return MemberDAO.getAdminMember();
	}
	@Override
	public List<MemberVO> getMakerMember() {
		return MemberDAO.getMakerMember();
	}
	@Override
	public List<FundVO> myfundProject(FundVO vo) {
		return MemberDAO.myfundProject(vo);
	}
	
	@Override
	public List<FundVO> myfundingAjax(MemberVO vo) {
		List<FundVO> list = MemberDAO.myfundingAjax(vo);
		return list;
	}
	@Override
	public List<FundVO> myPageFunding(MemberVO vo) {
		return MemberDAO.myPageFunding(vo);
	}
	@Override
	public List<StorehomeVO> myPageStore(MemberVO vo) {
		return MemberDAO.myPageStore(vo);
	}
	@Override
	public void insertMemberCard(MemberVO vo) {
		MemberDAO.insertMemberCard(vo);
	}
	@Override
	public int getAskTotalCnt(String memberId) {
		return MemberDAO.getAskTotalCnt(memberId);
	}
	@Override
	public List<MemberVO> getMyAskList(int begin, int end, String memberId) {
		List<MemberVO> list = MemberDAO.getMyAskList(begin, end, memberId);
		return list;
	}
	@Override
	public int getMyStoreTotalCnt(String memberId) {
		return MemberDAO.getMyStoreTotalCnt(memberId);
	}
	@Override
	public List<StorehomeVO> getMyStoreAll(int begin, int end, String memberId) {
		List<StorehomeVO> list = MemberDAO.getMyStoreAll(begin, end, memberId);
		return list;
	}
	@Override
	public void deleteMypageStore(StorehomeVO vo) {
		MemberDAO.deleteMypageStore(vo);
	}
	@Override
	public void deleteMypageFunding(FundVO vo) {
		MemberDAO.deleteMypageFunding(vo);
	}
	@Override
	public int getMyFundTotalCnt(String memberId) {
		return MemberDAO.getMyFundTotalCnt(memberId);
	}
	@Override
	public List<FundVO> getMyFundAll(int begin, int end, String memberId) {
		List<FundVO> list = MemberDAO.getMyFundAll(begin, end, memberId);
		return list;
	}
	@Override
	public void advertise(AdvertisementVO vo) {
		MemberDAO.advertise(vo);
	}
	@Override
	public List<AdvertisementVO> adminAd() {
		return MemberDAO.adminAd();
	}
	@Override
	public void adCheckUpdate(AdvertisementVO vo) {
		MemberDAO.adCheckUpdate(vo);
	}
	@Override
	public void adCheckUpdate2(AdvertisementVO vo) {
		MemberDAO.adCheckUpdate2(vo);
	}
	@Override
	public int memberFundCnt(MemberVO vo) {
		return MemberDAO.memberFundCnt(vo);
	}
	@Override
	public int memberStoreCnt(MemberVO vo) {
		return MemberDAO.memberStoreCnt(vo);
	}
	@Override
	public List<AdvertisementVO> memberAdList(MemberVO vo) {
		return MemberDAO.memberAdList(vo);
	}
	@Override
	public AdvertisementVO adPay(AdvertisementVO vo) {
		return MemberDAO.adPay(vo);
	}
	@Override
	public void adOrderInsert(AdvertisementVO vo) {
		MemberDAO.adOrderInsert(vo);
	}
	@Override
	public AdvertisementVO adPayinfo(AdvertisementVO vo) {
		return MemberDAO.adPayinfo(vo);
	}
	@Override
	public void adCheckUpdate3(AdvertisementVO vo) {
		MemberDAO.adCheckUpdate3(vo);
	}
	@Override
	public List<AdminVO> getAdMonthData() {
		return MemberDAO.getAdMonthData();
	}
	@Override
	public List<AdminVO> getAdDailyData() {
		return MemberDAO.getAdDailyData();
	}
	@Override
	public List<StorehomeVO> couponStore() {
		return MemberDAO.couponStore();
	}
	@Override
	public void insertCoupon(AdminVO vo) {
		MemberDAO.insertCoupon(vo);
	}
	@Override
	public List<FundVO> couponFund() {
		return MemberDAO.couponFund();
	}
	@Override
	public void insertFundCoupon(AdminVO vo) {
		MemberDAO.insertFundCoupon(vo);
	}
	@Override
	public int myCouponCnt(String memberId) {
		return MemberDAO.myCouponCnt(memberId);
	}
	@Override
	public List<AdminVO> couponTotalList(int begin, int end, String memberId) {
		return MemberDAO.couponTotalList(begin,end,memberId);
	}
	@Override
	public List<AdminVO> myCouponList(int begin, int end, String memberId) {
		return MemberDAO.myCouponList(begin,end,memberId);
	}
	@Override
	public int couponHistoryTotalCnt(String memberId) {
		return MemberDAO.couponHistoryTotalCnt(memberId);
	}
	@Override
	public List<AdminVO> myCouponHistory(int begin, int end, String memberId) {
		return MemberDAO.myCouponHistory(begin,end,memberId);
	}
	@Override
	public void couponDown(String memberId, String couponIdx) {
		MemberDAO.couponDown(memberId,couponIdx);
	}
	@Override
	public int fundLikeCnt1(LikeVO vo) {
		return MemberDAO.fundLikeCnt1(vo);
	}
	@Override
	public void fundLikeUpdate1(LikeVO vo) {
		MemberDAO.fundLikeUpdate1(vo);
	}
	@Override
	public void fundLikeDelete1(LikeVO vo) {
		MemberDAO.fundLikeDelete1(vo);
	}
	@Override
	public int getStoreAskTotalCnt(String memberId) {
		return MemberDAO.getStoreAskTotalCnt(memberId);
	}
	@Override
	public List<MemberVO> getMyStoreAskList(int begin, int end, String memberId) {
		List<MemberVO> list = MemberDAO.getMyStoreAskList(begin, end, memberId);
		return list;
	}
	@Override
	public int couponTotalCnt(String memberId) {
		return MemberDAO.couponTotalCnt(memberId);
	}

}
