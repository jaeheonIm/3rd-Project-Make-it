package com.makeit.member;

import java.util.List;

import com.makeit.fund.FundVO;
import com.makeit.like.LikeVO;
import com.makeit.storehome.StorehomeVO;

public interface MemberService {
	MemberVO getUser(MemberVO vo);
	void insertMember(MemberVO vo);
	void updateMember(MemberVO vo); 
	int getmemberId(MemberVO vo);
	int getmemberNickname(MemberVO vo);
	MemberVO loginCheck(MemberVO vo);
	MemberVO memberLogin(MemberVO vo);
	List<FundVO> makeitMypageLike(FundVO vo);
	List<StorehomeVO> getStoreLike(StorehomeVO vo1);
	int getmemberEmail(MemberVO vo);
	int getmemberPassword(MemberVO vo);
	void updatePassword(MemberVO vo);
	void updateProfile(MemberVO vo);
	MemberVO getMember(MemberVO vo);
	void deleteMember(MemberVO vo);
	List<FundVO> getMyfunding(FundVO vo);
	List<StorehomeVO> getMystore(StorehomeVO vo);
	int getStoreTotalCnt(String memberId);
	int getFundTotalCnt(String memberId);
	List<StorehomeVO> getMyStoreList(int begin, int end, String memberId);
	List<FundVO> getMyFundList(int begin, int end, String memberId);
	MemberVO memberEmail(MemberVO vo);
	List<AdminVO> getMonthData();
	List<AdminVO> getPieData();
	List<AdminVO> getFundPie();
	List<AdminVO> getDailyData();
	List<AdminVO> rank();
	List<MemberVO> getAdminMember();
	List<MemberVO> getMakerMember();
	List<FundVO> myfundProject(FundVO vo);
	List<FundVO> myfundingAjax(MemberVO vo);
	List<FundVO> myPageFunding(MemberVO vo);
	List<StorehomeVO> myPageStore(MemberVO vo);
	void insertMemberCard(MemberVO vo);
	int getAskTotalCnt(String memberId);
	List<MemberVO> getMyAskList(int begin, int end, String memberId);
	int getMyStoreTotalCnt(String memberId);
	List<StorehomeVO> getMyStoreAll(int begin, int end, String memberId);
	void deleteMypageStore(StorehomeVO vo);
	void deleteMypageFunding(FundVO vo);
	int getMyFundTotalCnt(String memberId);
	List<FundVO> getMyFundAll(int begin, int end, String memberId);
	void advertise(AdvertisementVO vo);
	List<AdvertisementVO> adminAd();
	void adCheckUpdate(AdvertisementVO vo);
	void adCheckUpdate2(AdvertisementVO vo);
	int memberFundCnt(MemberVO vo);
	int memberStoreCnt(MemberVO vo);
	List<AdvertisementVO> memberAdList(MemberVO vo);
	AdvertisementVO adPay(AdvertisementVO vo);
	void adOrderInsert(AdvertisementVO vo);
	AdvertisementVO adPayinfo(AdvertisementVO vo);
	void adCheckUpdate3(AdvertisementVO vo);
	List<AdminVO> getAdMonthData();
	List<AdminVO> getAdDailyData();
	List<StorehomeVO> couponStore();
	void insertCoupon(AdminVO vo);
	List<FundVO> couponFund();
	void insertFundCoupon(AdminVO vo);
	int couponTotalCnt(String memberId);
	int myCouponCnt(String memberId);
	List<AdminVO> couponTotalList(int begin, int end, String memberId);
	List<AdminVO> myCouponList(int begin, int end, String memberId);
	int couponHistoryTotalCnt(String memberId);
	List<AdminVO> myCouponHistory(int begin, int end, String memberId);
	void couponDown(String memberId, String couponIdx);
	int fundLikeCnt1(LikeVO vo);
	void fundLikeUpdate1(LikeVO vo);
	void fundLikeDelete1(LikeVO vo);
	int getStoreAskTotalCnt(String memberId);
	List<MemberVO> getMyStoreAskList(int begin, int end, String memberId);
}
