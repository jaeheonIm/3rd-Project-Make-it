package com.makeit.controller.fund;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.makeit.fund.FundService;
import com.makeit.fund.FundVO;
import com.makeit.storehome.StorehomeVO;

//@Controller
//@RequestMapping("/board")
@RestController //클래스 내의 요청처리 결과가 모두 ResponseBody로 처리됨
public class FundAjaxController {
	@Autowired
	private FundService fundService;
	
	
	public FundAjaxController() {
		System.out.println(" =====> FundAjaxController() 객체생성 <===== ");
	}

	//펀딩 목록 페이지 좋아요
	@RequestMapping("/fundLikeUpdate.do")
	   public int fundLikeUpdate(@RequestBody FundVO vo) {
	      System.out.println("fundLikeUpdate vo :" + vo);
	      if(fundService.fundLikeCnt(vo) == 0) {
	         fundService.fundLikeUpdate(vo);
	         return 1;
	      } else if (fundService.fundLikeCnt(vo) != 0) {
	    	  fundService.fundLikeDelete(vo);
	         return 2;
	      }
	      return 0;
	   }
		
	//펀딩 목록 페이지 좋아요
		@RequestMapping("/fundDetailViewLike.do")
		   public int fundDetailViewLike(@RequestBody FundVO vo) {
		      System.out.println("fundDetailViewLike vo :" + vo);
		      if(fundService.fundDetailViewLikeCnt(vo) == 0) {
		         fundService.fundDetailViewLikeInsert(vo);
		         return 1;
		      } else if (fundService.fundLikeCnt(vo) != 0) {
		    	  fundService.fundDetailViewLikeDelete(vo);
		         return 2;
		      }
		      return 0;
		   }
	
	//팔로우
	@RequestMapping("/fundFollow.do")
	public int follow(@RequestBody FundVO vo) {
		if(fundService.fundDetailFollowCnt(vo) == 0) {
			fundService.insertDetailFollow(vo);
			return 1;
		} else if (fundService.fundDetailFollowCnt(vo) != 0) {
			fundService.deleteDetailFollow(vo);
			return 2;
		}
		return 0;
	}
	
	
}
