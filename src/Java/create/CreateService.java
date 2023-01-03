package com.makeit.create;

import java.util.List;
import com.makeit.fund.FundVO;
import com.makeit.member.MemberVO;
import com.makeit.storehome.StorehomeVO;

public interface CreateService {

	void newFundIdx(MemberVO vo);
	
	void saveMembership(FundVO vo);
	
	void updateInfor(FundVO vo);
	
	void updateStory(FundVO vo);

	void insertReward(List resArr);

	void updateMaker(FundVO vo);

	FundVO getFundIdx(FundVO fvo);

	List<FundVO> getMyFundList(FundVO vo);

	FundVO fundStatus(FundVO vo);

	List<FundVO> fundUpdate(MemberVO vo);

	FundVO getSaveVo(FundVO vo);
	
	List<FundVO> getSaveOptionVo(FundVO vo);
	
	void saveFund(FundVO vo);

	void saveFundOption(List<FundVO> finalOptionData);

	FundVO notNullCheck(FundVO fund);

	List<FundVO> notNullCheckOption(FundVO fund);

	FundVO getSaveData(FundVO fund);

	List<FundVO> getSaveOptionData(FundVO fund);

	void deleteReward(FundVO fundVO);

	MemberVO checkMemberEmail(FundVO vo);
	
	int checkMemberEmail2(FundVO vo);

	// 디비에 authkey저장
	void createAuthkey(FundVO vo);
	
	 // authstatus 1로 변경
	 void updateAuthstatus(FundVO vo);

	 //나의 펀딩 - 결제현황 가져오기
	 List<StorehomeVO> fundStatusOrderList(FundVO fund);
	 
	 //나의 펀딩 - 멤버 리스트 가져오기
	 List<FundVO> fundStatusMemberList(FundVO fund);

	void memberDelete(FundVO vo);

	String findLikeCnt(FundVO vo);

	String findOrderCnt(FundVO vo);


	

	


	
	


	

	

	

	

	

	

	

	

}
