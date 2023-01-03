package com.makeit.controller.member;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.makeit.like.LikeVO;
import com.makeit.member.AdvertisementVO;
import com.makeit.member.MemberService;
import com.makeit.member.MemberVO;

//@Controller
//@RequestMapping("/board")
@RestController //클래스 내의 요청처리 결과가 모두 ResponseBody로 처리됨
public class MemberAjaxController {
	@Autowired
	private MemberService memberService;
	@Autowired
	private MailSendService mailService;

	@RequestMapping("/getmemberId.do")
	public int getmemberId(@RequestBody MemberVO vo) { //@RequestBody post방식 전달데이터 처리
		System.out.println(" =====> BoardAjaxController getmemberId(vo) 실행 <===== ");
		System.out.println("getmemberId() vo : " + vo);
		
		int id = memberService.getmemberId(vo);
		System.out.println(id);
		
		return id;
	}

	@RequestMapping("/loginCheck.do")
	public MemberVO loginCheck(@RequestBody MemberVO vo) { //@RequestBody post방식 전달데이터 처리
		System.out.println(" =====> BoardAjaxController loginCheck(vo) 실행 <===== ");
		System.out.println("loginCheck() vo : " + vo);
		
		MemberVO loginCheck = memberService.loginCheck(vo);
		System.out.println("loginCheck :"+loginCheck);
		
		return loginCheck;
	}
	
	@RequestMapping("/getmemberNickname.do")
	public int getmemberNickname(@RequestBody MemberVO vo) { //@RequestBody post방식 전달데이터 처리
		System.out.println(" =====> BoardAjaxController getmemberNickname(vo) 실행 <===== ");
		System.out.println("getmemberNickname() vo : " + vo);
		
		int nickName = memberService.getmemberNickname(vo);
		System.out.println(nickName);
		
		return nickName;
	}

	@RequestMapping("/getmemberEmail.do")
	public int getmemberEmail(@RequestBody MemberVO vo) { //@RequestBody post방식 전달데이터 처리
		System.out.println(" =====> BoardAjaxController getmemberEmail(vo) 실행 <===== ");
		System.out.println("getmemberEmail() vo : " + vo);
		
		int email = memberService.getmemberEmail(vo);
		System.out.println(email);
		
		return email;
	}

	@RequestMapping("/adCheckUpdate.do")
	public List<AdvertisementVO> adCheckUpdate(@RequestBody AdvertisementVO vo) { //@RequestBody post방식 전달데이터 처리
		System.out.println(" =====> adCheckUpdate(vo) 실행 <===== ");
		System.out.println("adCheckUpdate() vo : " + vo);
		
		memberService.adCheckUpdate(vo);
		List<AdvertisementVO> adminAd = memberService.adminAd();
		System.out.println(adminAd);
		
		return adminAd;
	}

	@RequestMapping("/adCheckUpdate2.do")
	public List<AdvertisementVO> adCheckUpdate2(@RequestBody AdvertisementVO vo) { //@RequestBody post방식 전달데이터 처리
		System.out.println(" =====> adCheckUpdate2(vo) 실행 <===== ");
		System.out.println("adCheckUpdate2() vo : " + vo);
		
		memberService.adCheckUpdate2(vo);
		List<AdvertisementVO> adminAd = memberService.adminAd();
		System.out.println(adminAd);
		
		return adminAd;
	}
	
	@RequestMapping("/getmemberPassword.do")
	public int getmemberPassword(@RequestBody MemberVO vo) { //@RequestBody post방식 전달데이터 처리
		System.out.println(" =====> BoardAjaxController getmemberPassword(vo) 실행 <===== ");
		System.out.println("getmemberPassword() vo : " + vo);
		
		int password = memberService.getmemberPassword(vo);
		System.out.println(password);
		
		return password;
	}
	
	@RequestMapping("/mailCheck.do")
	public String mailCheck(@RequestBody String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		return mailService.joinEmail(email);
	}
	
	@RequestMapping("/adOrderPay.do")
	public String adOrderPay(AdvertisementVO vo, Model model) {
		System.out.println("AdvertisementVO vo : " + vo);
		memberService.adOrderInsert(vo);
		memberService.adCheckUpdate3(vo);
		AdvertisementVO adPayinfo = memberService.adPayinfo(vo);
		System.out.println("adPayinfo : " + adPayinfo);
		model.addAttribute("adPayinfo",adPayinfo);
		return "user/makeitMypage";
	}
	
	//좋아요 
	@RequestMapping("/fundLikeUpdate1.do")
	public int fundLikeUpdate1(@RequestBody LikeVO vo) {
		System.out.println("fundLikeUpdate1 vo :" + vo);
		if(memberService.fundLikeCnt1(vo) == 0) {
			System.out.println(memberService.fundLikeCnt1(vo));
			memberService.fundLikeUpdate1(vo);
			return 1;
		} else if (memberService.fundLikeCnt1(vo) != 0) {
			memberService.fundLikeDelete1(vo);
			return 2;
		}
		return 0;
	}

	@RequestMapping("/bell.do")
	public List<AdvertisementVO> bell(MemberVO vo) {
		System.out.println("memberId :" + vo);
		List<AdvertisementVO> adList = memberService.memberAdList(vo);
		
		return adList;
	}
	
}
