package com.makeit.create.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.makeit.fund.FundVO;
import com.makeit.member.MemberVO;
import com.makeit.storehome.StorehomeVO;

@Repository
public class CreateDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	
	public CreateDAO() {
		System.out.println(" =====> CreateDAO(MyBatis) 객체 생성 <===== ");
	}
	
	//fundIdx생성
	public void newFundIdx(MemberVO vo) {
		System.out.println("===> MyBatis 사용 newFundIdx() 실행");
		mybatis.insert("createDAO.newFundIdx", vo);
	}
	
	//fundIdx값 가져오기
	public FundVO getFundIdx(FundVO vo) {
		System.out.println("===> MyBatis 사용 getFundIdx() 실행");
		return mybatis.selectOne("createDAO.getFundIdx", vo);
	}
	
	//기본정보 임시테이블에 UPDATE
	public void updateInfor(FundVO vo) {
		System.out.println("===> MyBatis 사용 updateInfor() 실행");
		mybatis.update("createDAO.updateInfor", vo);
	}

	public void saveMembership(FundVO vo) {
		System.out.println("===> MyBatis 사용 saveMembership() 실행");
		mybatis.insert("createDAO.saveMembership", vo);
		
	}

	//리워드 임시테이블에 update
	public void insertReward(List resArr) {
		System.out.println("===> MyBatis 사용 insertReward() 실행");
		mybatis.insert("createDAO.insertReward", resArr);
		
	}

	public void updateMaker(FundVO vo) {
		System.out.println("===> MyBatis 사용 updateMaker() 실행");
		mybatis.update("createDAO.updateMaker", vo);
		
	}

	public void updateStory(FundVO vo) {
		System.out.println("===> MyBatis 사용 updateStory() 실행");
		mybatis.update("createDAO.updateStory", vo);
		
	}

	public List<FundVO> getMyFundList(FundVO vo) {
		System.out.println("===> MyBatis 사용  getMyFundList(vo) 실행");
		return mybatis.selectList("createDAO.getMyFundList", vo);
	}

	public FundVO fundStatus(FundVO vo) {
		System.out.println("===> MyBatis 사용  fundStatus(vo) 실행");
		return mybatis.selectOne("createDAO.fundStatus", vo);
	}

	public List<FundVO> fundUpdate(MemberVO vo) {
		System.out.println("===> MyBatis 사용  fundUpdate(vo) 실행");
		return mybatis.selectList("createDAO.fundUpdate", vo);
	}
	

	//최종 등록할 데이터 가져오기
	public FundVO getSaveVo(FundVO vo) {
		System.out.println("===> MyBatis 사용  getSaveVo(vo) 실행");
		return mybatis.selectOne("createDAO.getSaveVo", vo);
	}

	public List<FundVO> getSaveOptionVo(FundVO vo) {
		System.out.println("===> MyBatis 사용  getSaveOptionVo(vo) 실행");
		return mybatis.selectList("createDAO.getSaveOptionVo", vo);
	}
	
	//펀딩 최종 등록
	public void saveFund(FundVO vo) {
		System.out.println("===> MyBatis 사용  saveFund(vo) 실행");
		mybatis.insert("createDAO.saveFund", vo);
	}

	public void saveFundOption(List<FundVO> vo) {
		System.out.println("===> MyBatis 사용  saveFundOption(vo) 실행");
		mybatis.insert("createDAO.saveFundOption", vo);
	}
	
	public FundVO notNullCheck(FundVO vo) {
		System.out.println("===> MyBatis 사용  notNullCheck(vo) 실행");
		return mybatis.selectOne("createDAO.notNullCheck", vo);
	}

	public List<FundVO> notNullCheckOption(FundVO vo) {
		System.out.println("===> MyBatis 사용  notNullCheckOption(vo) 실행");
		return mybatis.selectList("createDAO.notNullCheckOption", vo);
	}
	
	//작성중 데이터 불러오기
	public FundVO getSaveData(FundVO vo) {
		System.out.println("===> MyBatis 사용  getSaveData(vo) 실행");
		return mybatis.selectOne("createDAO.getSaveData", vo);
		
	}

	public List<FundVO> getSaveOptionData(FundVO vo) {
		System.out.println("===> MyBatis 사용  getSaveOptionData(vo) 실행");
		return mybatis.selectList("createDAO.getSaveOptionData", vo);
	}

	public void deleteReward(FundVO vo) {
		System.out.println("===> MyBatis 사용  deleteReward(vo) 실행");
		mybatis.delete("createDAO.deleteReward", vo);
		
	}

	 public MemberVO checkMemberEmail(FundVO vo) {
		 System.out.println("===> MyBatis 사용  checkMemberEmail(vo) 실행"); 
		 return mybatis.selectOne("createDAO.checkMemberEmail", vo);
	 }
	 
	 public int checkMemberEmail2(FundVO vo) {
		System.out.println("===> MyBatis 사용  checkMemberEmail2(vo) 실행"); 
		return mybatis.selectOne("createDAO.checkMemberEmail2", vo);
	}


	public void updateAuthstatus(FundVO vo) {
		System.out.println("===> MyBatis 사용  updateAuthstatus(email) 실행"); 
		mybatis.update("createDAO.updateAuthstatus", vo);
		
	}

	public void createAuthkey(FundVO vo) {
		 System.out.println("===> MyBatis 사용  createAuthkey() 실행"); 
		 System.out.println("vo : " + vo);
		  mybatis.insert("createDAO.createAuthkey", vo);
	}

	public List<StorehomeVO> fundStatusOrderList(FundVO fund) {
		System.out.println("===> MyBatis 사용  fundStatusOrderList(fund) 실행");
		return mybatis.selectList("createDAO.fundStatusOrderList", fund);
	}
	
	public List<FundVO> fundStatusMemberList(FundVO vo) {
		return mybatis.selectList("createDAO.fundStatusMemberList", vo);
	}

	public void memberDelete(FundVO vo) {
		System.out.println("===> MyBatis 사용  memberDelete(vo) 실행");
		mybatis.delete("createDAO.memberDelete", vo);
	}

	public String findLikeCnt(FundVO vo) {
		System.out.println("===> MyBatis 사용  findLikeCnt(vo) 실행");
		return mybatis.selectOne("createDAO.findLikeCnt", vo);
	}

	public String findOrderCnt(FundVO vo) {
		System.out.println("===> MyBatis 사용  findOrderCnt(vo) 실행");
		return mybatis.selectOne("createDAO.findOrderCnt", vo);
	}


	

	

	
	 

	

	

	


	

	
	
	
}
