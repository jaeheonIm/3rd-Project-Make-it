package com.makeit.create.impl;


import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

import com.makeit.create.CreateService;
import com.makeit.fund.FundVO;
import com.makeit.member.MemberVO;
import com.makeit.storehome.StorehomeVO;

// @Service : @Component 상속확장 어노테이션
//		비즈니스 로직 처리 서비스 영역에 사용
@Service("createService")
public class CreateServiceImpl implements CreateService  {
	@Autowired //타입이 일치하는 객체(인스턴스) 주입(DI)
	private CreateDAO createDAO;
	
	public CreateServiceImpl() {
		System.out.println(" >> CreateServiceImpl() 객체 생성");
	}
	
	//fundIdx생성
	@Override
	public void newFundIdx(MemberVO vo) {
		createDAO.newFundIdx(vo);
		
	}
	
	//fundIdx가져오기
	@Override
	public FundVO getFundIdx(FundVO fvo) {
		return createDAO.getFundIdx(fvo);
	}
	
	
	@Override
	public void insertReward(List resArr) {
		createDAO.insertReward(resArr);
		
	}

	//기본정보 insert
	@Override
	public void updateInfor(FundVO vo) {
		createDAO.updateInfor(vo);
	}

	//멤버십update
	@Override
	public void saveMembership(FundVO vo) {
		createDAO.saveMembership(vo);
	}



	//메이커 update
	@Override
	public void updateMaker(FundVO vo) {
		createDAO.updateMaker(vo);
	}

	//스토리 update
	@Override
	public void updateStory(FundVO vo) {
		createDAO.updateStory(vo);
		
	}

	//내 펀딩 목록
	@Override
	public List<FundVO> getMyFundList(FundVO vo) {
		return createDAO.getMyFundList(vo);
	}

	//펀딩 현황
	@Override
	public FundVO fundStatus(FundVO vo) {
		return createDAO.fundStatus(vo);
	}

	//이전 펀딩 수정하기
	@Override
	public List<FundVO> fundUpdate(MemberVO vo) {
		return createDAO.fundUpdate(vo);
	}

	//최종 등록 전 idx로 데이터 가져오기
	@Override
	public FundVO getSaveVo(FundVO vo) {
		return createDAO.getSaveVo(vo);
	}
	
	@Override
	public List<FundVO> getSaveOptionVo(FundVO vo) {
		return createDAO.getSaveOptionVo(vo);
	}
	
	//펀딩 최종 등록
	@Override
	public void saveFund(FundVO vo) {
		createDAO.saveFund(vo);
	}

	@Override
	public void saveFundOption(List<FundVO> finalOptionData) {
		createDAO.saveFundOption(finalOptionData);
	}

	@Override
	public FundVO notNullCheck(FundVO fund) {
		return createDAO.notNullCheck(fund);
	}

	@Override
	public List<FundVO> notNullCheckOption(FundVO fund) {
		return createDAO.notNullCheckOption(fund);
	}
	
	//작성중 데이터 불러오기
	@Override
	public FundVO getSaveData(FundVO fund) {
		return createDAO.getSaveData(fund);
	}

	@Override
	public List<FundVO> getSaveOptionData(FundVO fund) {
		return createDAO.getSaveOptionData(fund);
	}

	@Override
	public void deleteReward(FundVO fundVO) {
		createDAO.deleteReward(fundVO);
	}

	//함께할 멤버 이메일 가져오기
	@Override
	public MemberVO checkMemberEmail(FundVO vo) {
		return createDAO.checkMemberEmail(vo);
	}

	@Override
	public int checkMemberEmail2(FundVO vo) {
		return createDAO.checkMemberEmail2(vo);
	}
	
	@Override
	public void updateAuthstatus(FundVO vo) {
		createDAO.updateAuthstatus(vo);
		
	}

	@Override
	public void createAuthkey(FundVO vo) {
		createDAO.createAuthkey(vo);
	}

	//나의 펀딩 - 결제 현황 가져오기
	@Override
	public List<StorehomeVO> fundStatusOrderList(FundVO fund) {
		return createDAO.fundStatusOrderList(fund);
	}
	
	//나의 펀딩 - 멤버 리스트 가져오기
	@Override
	public List<FundVO> fundStatusMemberList(FundVO vo) {
		return createDAO.fundStatusMemberList(vo);
	}

	//멤버 지우기
	@Override
	public void memberDelete(FundVO vo) {
		createDAO.memberDelete(vo);
	}

	@Override
	public String findLikeCnt(FundVO vo) {
		return createDAO.findLikeCnt(vo);
	}

	@Override
	public String findOrderCnt(FundVO vo) {
		return createDAO.findOrderCnt(vo);
	}

	

	

	

	

	
	
	


	

	




	
	



	

	

}
