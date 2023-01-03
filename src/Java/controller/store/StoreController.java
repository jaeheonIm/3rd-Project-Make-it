package com.makeit.controller.store;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.makeit.like.LikeVO;
import com.makeit.member.MemberVO;
import com.makeit.storehome.StorehomeService;
import com.makeit.storehome.StorehomeVO;

@Controller
@SessionAttributes("store")
public class StoreController {
	
	@Autowired
	private StorehomeService storeService;
	
	public StoreController() {
		System.out.println("StoreController() 객체생성~!~1");
	}
	
	//스토어홈 가기~!
	@GetMapping("/store.do")
	public String getList( Model model, String memberId, String order, StorehomeVO vo){
	
		List<StorehomeVO> getlist = storeService.getList();
		List<LikeVO> like = storeService.findLike(memberId);
		
		model.addAttribute("vo",vo);
		model.addAttribute("memberId",memberId);
		model.addAttribute("bool", like);
		model.addAttribute("getlist", getlist);
		return "store/StoreHome";
	}
	
	//문의
	@GetMapping("/qna.do")
	public String qnaList( Model model, String memberId, StorehomeVO vo, String cPage){
		vo.setTotalRecord(storeService.qnaTotal(vo.getStoreIdx()));
		vo.setTotalPage();
		
		//현재페이지 구하기
		if(cPage != null){
			vo.setNowPage(Integer.parseInt(cPage));
		}
		
		// 3. 현재 페이지 표시할 게시글 시작번호(begin) 끝번호(end) 구하기
		vo.setEnd(vo.getNowPage() * vo.getNumPerPage());
		vo.setBegin(vo.getEnd() - vo.getNumPerPage() + 1);
		
		// 3-1. 끝 번호가 건수보다 많으면 -> 끝번호 = 건수 로 처리
		if (vo.getEnd() > vo.getTotalRecord()) vo.setEnd(vo.getTotalRecord());
		
		
		// ------블록(block) 계산하기 ---------------------------
		// 4. 블록의 시작 페이지, 끝 페이지 구하기 (우리가 쓸 수 있는 것은 현제페이지 번호)
		int nowPage = vo.getNowPage();
		int beginPage = (nowPage - 1) / vo.getNumPerBlock() *vo.getNumPerBlock() + 1;
		vo.setBeginPage(beginPage);
		vo.setEndPage(beginPage + vo.getNumPerBlock() -1);
		
		// 끝페이지(endPage)가 전체 페이지 수 (totalPage)보다 크면 -> 끝페이지 = 전체페이지수
		if (vo.getEndPage() > vo.getTotalPage()) vo.setEndPage(vo.getTotalPage());
		System.out.println(vo);
		List<StorehomeVO> qnaLsit = storeService.qnaList(vo);
		System.out.println(qnaLsit);
		model.addAttribute("vo",vo);
		model.addAttribute("storeIdx",vo.getStoreIdx());
		model.addAttribute("memberId",memberId);
		model.addAttribute("getlist", qnaLsit);
		return "store/storeQna";
	}
	
	//문의 입력폼으로
	@GetMapping("/QnaInsertForm.do")
	public String qnaInsert(StorehomeVO vo, Model model,String memberId){
		System.out.println("vo : " + vo);
		model.addAttribute("vo", vo);
		return "store/storeQnaInsert";
	}
	
	//문의 입력후 문의게시판으로
	@GetMapping("/QnaInsert.do")
	public String qnaInsertOk(StorehomeVO vo, Model model,String memberId){
		
		int resert = storeService.qnaInsert(vo);
		
		model.addAttribute("resert", resert);
		return "redirect:qna.do?memberId=" + vo.getMemberId() + "&storeIdx=" + vo.getStoreIdx();
	}
	
	//문의 상세
	@GetMapping("/qnaView.do")
	public String qnaView(StorehomeVO vo, Model model,String memberId){
		MemberVO storeMem = storeService.storemember(vo.getStoreIdx());
		StorehomeVO re = storeService.qnaRe(vo);
		StorehomeVO view = storeService.qnaView(vo);
		StorehomeVO detail = storeService.detail(vo);
		
		model.addAttribute("detail", detail);
		model.addAttribute("storeMem", storeMem);
		model.addAttribute("re", re);
		model.addAttribute("storeIdx", vo.getStoreIdx());
		model.addAttribute("memberId", memberId);
		model.addAttribute("view", view);
		return "store/storeQnaView";
	}
	
	//문의 수정폼
	@GetMapping("/qnamodify.do")
	public String qnamodify(StorehomeVO vo, Model model,String memberId){
		StorehomeVO view = storeService.qnaView(vo);
		
		model.addAttribute("memberId", memberId);
		model.addAttribute("view", view);
		model.addAttribute("vo", vo);
		return "store/storeQnaModify";
	}
	
	//문의 수정하고 문의리스트로
	@GetMapping("/Qnaupdate.do")
	public String Qnaupdate(StorehomeVO vo, Model model,String memberId){
		int result = storeService.qnamodify(vo);
		
		return "redirect:qna.do?memberId=" + memberId + "&storeIdx="+vo.getStoreIdx();
	}
	
	//문의 삭제고 문의리스트로
	@GetMapping("/qnaDel.do")
	public String qnaDel(StorehomeVO vo, Model model,String memberId){
		int result = storeService.qnaDel(vo.getQnaIdx());
		
		return "redirect:qna.do?memberId=" + memberId + "&storeIdx="+vo.getStoreIdx();
	}
	
	//문의 답글입력
	@GetMapping("/reInsert.do")
	public String reInsert(StorehomeVO vo, Model model,String memberId){
		int result = storeService.reInsert(vo);
		storeService.update(vo);
		
		return "redirect:qna.do?memberId=" + memberId + "&storeIdx="+vo.getStoreIdx();
	}
	
	
	//베스트로 가기
	@GetMapping("/best.do")
	public String bestHome(StorehomeVO vo, Model model,String memberId){
		List<StorehomeVO> getlist = storeService.nowList();
		List<LikeVO> like = storeService.findLike(memberId);
		model.addAttribute("bool", like);
		model.addAttribute("getlist", getlist);
		model.addAttribute("memberId", memberId);
		return "store/best";
	}
	
	//상세페이지로 가기
	@GetMapping("/detail.do")
	public String detail(StorehomeVO vo, Model model, String memberId){
		StorehomeVO detail = storeService.detail(vo);
		List<LikeVO> like = storeService.findLike(memberId);
		List<StorehomeVO> option = storeService.storeOption(vo.getStoreIdx());
		MemberVO memeber = storeService.member(memberId);
		MemberVO storeMem = storeService.storemember(vo.getStoreIdx());
		List<StorehomeVO> review = storeService.storeReview(vo.getStoreIdx());
		StorehomeVO cnt = storeService.reviewCnt(vo.getStoreIdx());
		vo.setFollowerId(vo.getMemberId());
		vo.setFollowingId(storeMem.getMemberId());
		int follow = storeService.followYN(vo);
		System.out.println("vo : " + vo);
		System.out.println("option : " + option);
		
		model.addAttribute("follow", follow);
		model.addAttribute("cnt", cnt);
		model.addAttribute("review", review);
		model.addAttribute("storeMem", storeMem);
		model.addAttribute("memberId", memberId);
		model.addAttribute("memeber", memeber);
		model.addAttribute("option", option);
		model.addAttribute("like", like);
		model.addAttribute("detail", detail);
		return "store/detail";
	}
	
	//결제페이지에 회원정보, 옵션 불러오기
	@PostMapping("/order.do")
	public String order(StorehomeVO vo, Model model, String memberId){
		StorehomeVO detail = storeService.detail(vo);
		MemberVO member = storeService.member(memberId);
		StorehomeVO option = storeService.storeOrder(vo.getStoreOption());
		List<StorehomeVO> coupon = storeService.couponList(vo);
		System.out.println("option : " +option );
		System.out.println("detail : " +detail );
		
		model.addAttribute("coupon", coupon);
		model.addAttribute("detail", detail);
		model.addAttribute("option", option);
		model.addAttribute("member", member);
		
		return "store/order";
	}
	
	//결제 내역 인서트
	@GetMapping("/orderDtail.do")
	public String orderDtail(StorehomeVO vo, Model model) {
		storeService.orderInsert(vo);
	
		return "";
	}
	
	//결제후 페이지 이동~
	@GetMapping("/orderok.do")
	public String orderok(StorehomeVO vo, Model model) {
		StorehomeVO orderinfo = storeService.orderinfo(vo);
		model.addAttribute("orderinfo",orderinfo);
		return "store/orderok";
	}
	
	//내가쓴 문의
	@GetMapping("/myQnaList.do")
	public String myQnaList(StorehomeVO vo, Model model) {
		List<StorehomeVO> list = storeService.myQnaList(vo);
		
		
		model.addAttribute("memberId",vo.getMemberId());
		model.addAttribute("storeIdx",vo.getStoreIdx());
		model.addAttribute("getlist",list);
		return "store/storeQna";
	}
	
	
	
	
}
