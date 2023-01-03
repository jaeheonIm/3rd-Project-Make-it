package com.makeit.controller.member;

import java.io.File;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.makeit.create.CreateService;
import com.makeit.fund.FundVO;
import com.makeit.main.Paging;
import com.makeit.member.AdminVO;
import com.makeit.member.AdvertisementVO;
import com.makeit.member.MemberService;
import com.makeit.member.MemberVO;
import com.makeit.storehome.StorehomeVO;

//@RequestMapping 클래스 선언부 사용시
// 모든 메소드 요청경로의 부모(root) 경로로 추가됨
//@RequestMapping("/user")
@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private CreateService createService;
	
	@RequestMapping(value = "/insertMember.do", method = RequestMethod.POST)
	public String insertMember(MemberVO vo, HttpSession request) throws IllegalStateException, IOException {
		System.out.println("insertMember : " + vo);

		String uploadPath = request.getServletContext().getRealPath("/img/user-img/");
		
		MultipartFile uploadPicture = vo.getUploadPicture();

		if (!uploadPicture.isEmpty()) {
			String fileName = uploadPicture.getOriginalFilename();
			vo.setMemberPicture(fileName);
			uploadPicture.transferTo(
					new File(uploadPath, fileName));
		}
		memberService.insertMember(vo);
		System.out.println("vo set 하고난 후" + vo);

		return "user/loginForm";
	}

	@RequestMapping("/updateMember.do")
	public String updateMember(MemberVO vo, HttpSession session) {

		memberService.updateMember(vo);

		MemberVO user = memberService.getMember(vo);
		session.setAttribute("user", user);
		System.out.println("user : " + user);

		return "redirect:makeitMypage.do?memberId=" + user.getMemberId();
	}

	@RequestMapping("/updatePassword.do")
	public String updatePassword(MemberVO vo, HttpSession session) {

		memberService.updatePassword(vo);

		MemberVO user = memberService.getMember(vo);
		session.setAttribute("user", user);
		System.out.println("user : " + user);

		return "redirect:logout.do";
	}

	@RequestMapping("/updateProfile.do")
	public String updateProfile(MemberVO vo, HttpSession session, HttpSession request) throws IllegalStateException, IOException {
		
		String uploadPath = request.getServletContext().getRealPath("/img/user-img/");
		
		MultipartFile uploadPicture = vo.getUploadPicture();

		if (!uploadPicture.isEmpty()) {
			String fileName = uploadPicture.getOriginalFilename();
			vo.setMemberPicture(fileName);
			uploadPicture.transferTo(
					new File(uploadPath, fileName));
		}
		memberService.updateProfile(vo);

		MemberVO user = memberService.getMember(vo);
		session.setAttribute("user", user);
		System.out.println("user : " + user);

		return "redirect:makeitMypage.do?memberId=" + user.getMemberId();
	}

	@RequestMapping("/makeitMemberDelete.do")
	public String makeitMemberDelete(MemberVO vo) {

		vo.setMemberNickname("disable");
		System.out.println(vo);
		memberService.deleteMember(vo);

		return "redirect:logout.do";
	}

	@RequestMapping("/memberMyfunding.do")
	public String memberMyfunding(String memberId, @ModelAttribute("page")Paging page, Model model) {

		System.out.println("memberId : " + memberId);
		System.out.println("page : " + page);
		List<FundVO> list = fundPaging(page, memberId);
		System.out.println("list : " + list);
		model.addAttribute("Myfunding",list);

		return "user/memberMyfunding";
	}

	@RequestMapping("/memberMystore.do")
	public String memberMystore(String memberId, @ModelAttribute("page")Paging page, Model model) {

		System.out.println("memberId : " + memberId);
		System.out.println("page : " + page);
		List<StorehomeVO> list = paging(page, memberId);
		System.out.println("list : " + list);
		model.addAttribute("Mystore",list);

		return "user/memberMystore";
	}
	
	@RequestMapping("/memberMyAsk.do")
	public String memberMyAsk(String memberId, @ModelAttribute("page")Paging page, Model model) {
		
		System.out.println("memberId : " + memberId);
		System.out.println("page : " + page);
		List<MemberVO> list = AskPaging(page, memberId);
		System.out.println("list : " + list);
		model.addAttribute("MyAsk",list);
		
		return "user/memberMyAsk";
	}

	@RequestMapping("/memberMyStoreAsk.do")
	public String memberMyStoreAsk(String memberId, @ModelAttribute("page")Paging page, Model model) {
		
		System.out.println("memberId : " + memberId);
		System.out.println("page : " + page);
		List<MemberVO> list = storeAskPaging(page, memberId);
		System.out.println("list : " + list);
		model.addAttribute("MyAsk",list);
		
		return "user/memberMyStoreAsk";
	}
	
	@RequestMapping("/storeMyList.do")
	public String storeMyList(String memberId, @ModelAttribute("page")Paging page, Model model) {
		
		System.out.println("memberId : " + memberId);
		System.out.println("page : " + page);
		List<StorehomeVO> list = storeMyListPaging(page, memberId);
		System.out.println("list : " + list);
		model.addAttribute("storeMyList",list);
		
		return "user/storeMyList";
	}
	
	@RequestMapping("/fundMyList.do")
	public String fundMyList(String memberId, @ModelAttribute("page")Paging page, Model model) {
		
		System.out.println("memberId : " + memberId);
		System.out.println("page : " + page);
		List<FundVO> list = fundMyListPaging(page, memberId);
		System.out.println("list : " + list);
		model.addAttribute("fundMyList",list);
		
		return "user/fundMyList";
	}
	
	// paging
	public List<StorehomeVO> paging(Paging page, String memberId) {
		page.setTotalRecord(memberService.getStoreTotalCnt(memberId));
		page.setTotalPage();
		
		if (page.getcPage() != 0) {
			page.setNowPage(page.getcPage());
			System.out.println("page.getNowPage():"+page.getNowPage());
		}
		page.setEnd(page.getNowPage() * page.getNumPerPage());
		page.setBegin(page.getEnd() - page.getNumPerPage() + 1);

		if (page.getEnd() > page.getTotalRecord()) {
			page.setEnd(page.getTotalRecord());
		}
		int nowPage = page.getNowPage();
		int beginPage = (nowPage - 1) / page.getNumPerBlock() * page.getNumPerBlock() + 1;
		page.setBeginPage(beginPage);
		page.setEndPage(beginPage + page.getNumPerBlock() - 1);

		if (page.getEndPage() > page.getTotalPage()) {
			page.setEndPage(page.getTotalPage());
		}
		List<StorehomeVO> list = memberService.getMyStoreList(page.getBegin(), page.getEnd(), memberId);
		return list;
	}
	
	public List<FundVO> fundPaging(Paging page, String memberId) {
		page.setTotalRecord(memberService.getFundTotalCnt(memberId));
		page.setTotalPage();
		
		if (page.getcPage() != 0) {
			page.setNowPage(page.getcPage());
			System.out.println("page.getNowPage():"+page.getNowPage());
		}
		page.setEnd(page.getNowPage() * page.getNumPerPage());
		page.setBegin(page.getEnd() - page.getNumPerPage() + 1);
		
		if (page.getEnd() > page.getTotalRecord()) {
			page.setEnd(page.getTotalRecord());
		}
		int nowPage = page.getNowPage();
		int beginPage = (nowPage - 1) / page.getNumPerBlock() * page.getNumPerBlock() + 1;
		page.setBeginPage(beginPage);
		page.setEndPage(beginPage + page.getNumPerBlock() - 1);
		
		if (page.getEndPage() > page.getTotalPage()) {
			page.setEndPage(page.getTotalPage());
		}
		List<FundVO> list = memberService.getMyFundList(page.getBegin(), page.getEnd(), memberId);
		return list;
	}
	
	public List<MemberVO> AskPaging(Paging page, String memberId) {
		page.setTotalRecord(memberService.getAskTotalCnt(memberId));
		page.setTotalPage();
		
		if (page.getcPage() != 0) {
			page.setNowPage(page.getcPage());
			System.out.println("page.getNowPage():"+page.getNowPage());
		}
		page.setEnd(page.getNowPage() * page.getNumPerPage());
		page.setBegin(page.getEnd() - page.getNumPerPage() + 1);
		
		if (page.getEnd() > page.getTotalRecord()) {
			page.setEnd(page.getTotalRecord());
		}
		int nowPage = page.getNowPage();
		int beginPage = (nowPage - 1) / page.getNumPerBlock() * page.getNumPerBlock() + 1;
		page.setBeginPage(beginPage);
		page.setEndPage(beginPage + page.getNumPerBlock() - 1);
		
		if (page.getEndPage() > page.getTotalPage()) {
			page.setEndPage(page.getTotalPage());
		}
		List<MemberVO> list = memberService.getMyAskList(page.getBegin(), page.getEnd(), memberId);
		return list;
	}

	public List<MemberVO> storeAskPaging(Paging page, String memberId) {
		page.setTotalRecord(memberService.getStoreAskTotalCnt(memberId));
		page.setTotalPage();
		
		if (page.getcPage() != 0) {
			page.setNowPage(page.getcPage());
			System.out.println("page.getNowPage():"+page.getNowPage());
		}
		page.setEnd(page.getNowPage() * page.getNumPerPage());
		page.setBegin(page.getEnd() - page.getNumPerPage() + 1);
		
		if (page.getEnd() > page.getTotalRecord()) {
			page.setEnd(page.getTotalRecord());
		}
		int nowPage = page.getNowPage();
		int beginPage = (nowPage - 1) / page.getNumPerBlock() * page.getNumPerBlock() + 1;
		page.setBeginPage(beginPage);
		page.setEndPage(beginPage + page.getNumPerBlock() - 1);
		
		if (page.getEndPage() > page.getTotalPage()) {
			page.setEndPage(page.getTotalPage());
		}
		List<MemberVO> list = memberService.getMyStoreAskList(page.getBegin(), page.getEnd(), memberId);
		return list;
	}
	
	public List<StorehomeVO> storeMyListPaging(Paging page, String memberId) {
		page.setTotalRecord(memberService.getMyStoreTotalCnt(memberId));
		page.setTotalPage();
		
		if (page.getcPage() != 0) {
			page.setNowPage(page.getcPage());
			System.out.println("page.getNowPage():"+page.getNowPage());
		}
		page.setEnd(page.getNowPage() * page.getNumPerPage());
		page.setBegin(page.getEnd() - page.getNumPerPage() + 1);
		
		if (page.getEnd() > page.getTotalRecord()) {
			page.setEnd(page.getTotalRecord());
		}
		int nowPage = page.getNowPage();
		int beginPage = (nowPage - 1) / page.getNumPerBlock() * page.getNumPerBlock() + 1;
		page.setBeginPage(beginPage);
		page.setEndPage(beginPage + page.getNumPerBlock() - 1);
		
		if (page.getEndPage() > page.getTotalPage()) {
			page.setEndPage(page.getTotalPage());
		}
		List<StorehomeVO> list = memberService.getMyStoreAll(page.getBegin(), page.getEnd(), memberId);
		return list;
	}
	
	public List<FundVO> fundMyListPaging(Paging page, String memberId) {
		page.setTotalRecord(memberService.getMyFundTotalCnt(memberId));
		page.setTotalPage();
		
		if (page.getcPage() != 0) {
			page.setNowPage(page.getcPage());
			System.out.println("page.getNowPage():"+page.getNowPage());
		}
		page.setEnd(page.getNowPage() * page.getNumPerPage());
		page.setBegin(page.getEnd() - page.getNumPerPage() + 1);
		
		if (page.getEnd() > page.getTotalRecord()) {
			page.setEnd(page.getTotalRecord());
		}
		int nowPage = page.getNowPage();
		int beginPage = (nowPage - 1) / page.getNumPerBlock() * page.getNumPerBlock() + 1;
		page.setBeginPage(beginPage);
		page.setEndPage(beginPage + page.getNumPerBlock() - 1);
		
		if (page.getEndPage() > page.getTotalPage()) {
			page.setEndPage(page.getTotalPage());
		}
		List<FundVO> list = memberService.getMyFundAll(page.getBegin(), page.getEnd(), memberId);
		return list;
	}
	
	@RequestMapping("/admin.do")
	public String admin(Model model) {
		
		List<AdminVO> getMonth = memberService.getMonthData();
		List<AdminVO> getDaily = memberService.getDailyData();
		List<AdminVO> getPie = memberService.getPieData();
		List<AdminVO> getFundPie = memberService.getFundPie();
		List<AdminVO> rank = memberService.rank();
		model.addAttribute("getMonth", getMonth);
		model.addAttribute("getDaily", getDaily);
		model.addAttribute("getPie", getPie);
		model.addAttribute("getFundPie", getFundPie);
		model.addAttribute("rank", rank);
		
		return "admin/adminPage";
	}
	
	@RequestMapping("/adminMember.do")
	public String adminMember(Model model) {
		
		List<MemberVO> getAdminMember = memberService.getAdminMember();
		model.addAttribute("getAdminMember", getAdminMember); //일반유저
		
		return "admin/adminMember";
	}
	
	@RequestMapping("/adminMakerMember.do")
	public String adminMakerMember(Model model) {
		
		List<MemberVO> getMakerMember = memberService.getMakerMember();
		model.addAttribute("getMakerMember", getMakerMember); //메이커유저
		
		return "admin/adminMakerMember";
	}

	@RequestMapping("/adminCoupon.do")
	public String adminCoupon(Model model) {
		
		List<StorehomeVO> couponStore = memberService.couponStore();
		model.addAttribute("couponStore", couponStore);
		
		return "admin/adminCoupon";
	}

	@RequestMapping("/adminFundCoupon.do")
	public String adminFundCoupon(Model model) {
		
		List<FundVO> couponFund = memberService.couponFund();
		model.addAttribute("couponFund", couponFund);
		
		return "admin/adminFundCoupon";
	}

	@RequestMapping("/insertCoupon.do")
	public String insertCoupon(AdminVO vo) {
		
		memberService.insertCoupon(vo);
		
		return "redirect:adminCoupon.do";
	}

	@RequestMapping("/insertFundCoupon.do")
	public String insertFundCoupon(AdminVO vo) {
		
		memberService.insertFundCoupon(vo);
		
		return "redirect:adminFundCoupon.do";
	}

	@RequestMapping("/deleteMypageStore.do")
	public String deleteMypageStore(StorehomeVO vo) {
		
		memberService.deleteMypageStore(vo);
		
		return "redirect:memberMystore.do?memberId=" + vo.getMemberId() + "";
	}

	@RequestMapping("/deleteMypageFunding.do")
	public String deleteMypageFunding(FundVO vo) {
		
		memberService.deleteMypageFunding(vo);
		
		return "redirect:memberMyfunding.do?memberId=" + vo.getMemberId() + "";
	}
	
	@RequestMapping("/makeitAdvertisementPay.do")
	public String makeitAdvertisementPay(String memberId, @ModelAttribute("page")Paging page, Model model) {
		
		System.out.println("memberId : " + memberId);
		System.out.println("page : " + page);
		List<FundVO> list = fundMyListPaging(page, memberId);
		System.out.println("list : " + list);
		model.addAttribute("fundMyList",list);
			
		return "user/makeitAdvertisementPay";
	}
	
	@RequestMapping("/makeitMypageCoupon.do")
	public String makeitMypageCoupon(Model model, @ModelAttribute("page")Paging page, String memberId) {
		
		List<AdminVO> list = CouponPaging(page , "");
		model.addAttribute("couponList",list);
		model.addAttribute("couponTotalCnt",memberService.couponTotalCnt(memberId));
		model.addAttribute("myCouponCnt",memberService.myCouponCnt(memberId));
		model.addAttribute("couponHistoryTotalCnt",memberService.couponHistoryTotalCnt(memberId));
		
		return "user/makeitMypageCoupon";
	}

	@RequestMapping("/myPageCouponList.do")
	@ResponseBody
	public Map<String, Object> myPageCouponList(@ModelAttribute("page")Paging page){
		List<AdminVO> list = CouponPaging(page ,"");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list",list);
		map.put("page",page);
		return map;
	}
	
	@RequestMapping("/myCoupon.do")
	@ResponseBody
	public Map<String, Object> myCoupon(@RequestParam("memberId") String memberId,@ModelAttribute("page")Paging page) {
		List<AdminVO> list = CouponPaging(page,memberId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list",list);
		map.put("memberId", memberId);
		map.put("page",page);
		System.out.println(map);
		return map;
	}

	@RequestMapping("/myCouponHistory.do")
	@ResponseBody
	public Map<String, Object> myCouponHistory(@RequestParam("memberId") String memberId,@ModelAttribute("page")Paging page) {
		List<AdminVO> list = historyPaging(page,memberId);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list",list);
		map.put("memberId", memberId);
		map.put("page",page);
		return map;
	}
	

	@RequestMapping("/couponDownload.do")
	@ResponseBody
	public Map<String, Object> couponDownload(@RequestParam("memberId") String memberId,@ModelAttribute("page")Paging page, @RequestParam("couponIdx") String couponIdx) {
		memberService.couponDown(memberId, couponIdx);
		List<AdminVO> list = CouponPaging(page ,"");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list",list);
		map.put("memberId", memberId);
		map.put("page",page);
		map.put("myCouponCnt",memberService.myCouponCnt(memberId));
		map.put("couponTotalCnt",memberService.couponTotalCnt(memberId));
		map.put("couponHistoryTotalCnt",memberService.couponHistoryTotalCnt(memberId));
		System.out.println(map);
		return map;
	}
	
	public List<AdminVO> CouponPaging(Paging page, String memberId) {
		if (memberId.equals("")) {
			page.setTotalRecord(memberService.couponTotalCnt(memberId));
			page.setTotalPage();
		} else {
			page.setTotalRecord(memberService.myCouponCnt(memberId));
			page.setTotalPage();
		}
		if (page.getcPage() != 0) {
			page.setNowPage(page.getcPage());
			System.out.println("page.getNowPage():"+page.getNowPage());
		}
		page.setEnd(page.getNowPage() * page.getNumPerPage());
		page.setBegin(page.getEnd() - page.getNumPerPage() + 1);
		
		if (page.getEnd() > page.getTotalRecord()) {
			page.setEnd(page.getTotalRecord());
		}
		int nowPage = page.getNowPage();
		int beginPage = (nowPage - 1) / page.getNumPerBlock() * page.getNumPerBlock() + 1;
		page.setBeginPage(beginPage);
		page.setEndPage(beginPage + page.getNumPerBlock() - 1);
		
		if (page.getEndPage() > page.getTotalPage()) {
			page.setEndPage(page.getTotalPage());
		}
		if(memberId.equals("")) {
			List<AdminVO> list = memberService.couponTotalList(page.getBegin(), page.getEnd(), memberId);
			return list;
		}
		List<AdminVO> list = memberService.myCouponList(page.getBegin(), page.getEnd(), memberId);
		return list;
	}
	
	public List<AdminVO> historyPaging(Paging page, String memberId) {
		page.setTotalRecord(memberService.couponHistoryTotalCnt(memberId));
		page.setTotalPage();
		
		if (page.getcPage() != 0) {
			page.setNowPage(page.getcPage());
			System.out.println("page.getNowPage():"+page.getNowPage());
		}
		page.setEnd(page.getNowPage() * page.getNumPerPage());
		page.setBegin(page.getEnd() - page.getNumPerPage() + 1);
		
		if (page.getEnd() > page.getTotalRecord()) {
			page.setEnd(page.getTotalRecord());
		}
		int nowPage = page.getNowPage();
		int beginPage = (nowPage - 1) / page.getNumPerBlock() * page.getNumPerBlock() + 1;
		page.setBeginPage(beginPage);
		page.setEndPage(beginPage + page.getNumPerBlock() - 1);
		
		if (page.getEndPage() > page.getTotalPage()) {
			page.setEndPage(page.getTotalPage());
		}
		List<AdminVO> list = memberService.myCouponHistory(page.getBegin(), page.getEnd(), memberId);
		return list;
	}
	
	
	@RequestMapping("/memberFindId.do")
	public String memberfindId() {
		return "user/memberFindId";
	}

	@RequestMapping("/memberFindPwd.do")
	public String memberFindPwd() {
		return "user/memberFindPwd";
	}
	
	@RequestMapping("/memberDelete.do")
	public String memberDelete() {
		return "user/memberDelete";
	}

	@RequestMapping("/makeitAdvertisement.do")
	public String makeitAdverisement(FundVO vo, Model model) {
		
		List<FundVO> list = memberService.myfundProject(vo);
		model.addAttribute("myfundProject", list);
		
		return "user/makeitAdvertisement";
	}

	@RequestMapping("/advertise.do")
	public String advertise(AdvertisementVO vo) {
		
		memberService.advertise(vo);
		
		return "redirect:makeitMypage.do";
	}

	
	@RequestMapping("/makeitMemberUpdate.do")
	public String makeitMemberUpdate() {
		return "user/makeitMemberUpdate";
	}

	@RequestMapping("/memberBasicUpdate.do")
	public String memberBasicUpdate() {
		return "user/memberBasicUpdate";
	}

	@RequestMapping("/memberPasswordUpdate.do")
	public String memberPasswordUpdate() {
		return "user/memberPasswordUpdate";
	}

	@RequestMapping("/memberProfileUpdate.do")
	public String memberProfileUpdate() {
		return "user/memberProfileUpdate";
	}

	@RequestMapping("/makeitMypageLike.do")
	public String makeitMypageLike(FundVO vo, StorehomeVO vo1, Model model) {
		System.out.println("vo : " + vo);
		System.out.println("vo1 : " + vo1);

		List<StorehomeVO> getStoreLike = memberService.getStoreLike(vo1);
		List<FundVO> getfundLike = memberService.makeitMypageLike(vo);
		model.addAttribute("getfundLike", getfundLike);
		model.addAttribute("getStoreLike", getStoreLike);

		return "user/makeitMypageLike";
	}

	@RequestMapping(value = "/insertMemberCard.do", method = RequestMethod.POST)
	public String insertMemberCard(MemberVO vo) {
		
		memberService.insertMemberCard(vo);
		
		return "user/makeitMypage";
	}
	
	@RequestMapping("/makeitAdvertisementAsk.do")
	public String makeitAdvertisementAsk() {
		return "user/makeitAdvertisementAsk";
	}

	@RequestMapping("/loginForm.do")
	public String loginForm(HttpSession session) {
		
		session.invalidate();
		
		return "user/loginForm";
	}

	@RequestMapping("/makeitMypage.do")
	public String makeitMypage(MemberVO vo, Model model) {
		
		List<FundVO> fundList = memberService.myPageFunding(vo);
		List<StorehomeVO> storeList = memberService.myPageStore(vo); 
		int memberFundCnt = memberService.memberFundCnt(vo);
		int memberStoreCnt = memberService.memberStoreCnt(vo);
		int memberFundAskCnt = memberService.getAskTotalCnt(vo.getMemberId());
		int memberStoreAskCnt = memberService.getStoreAskTotalCnt(vo.getMemberId());
		
		List<AdvertisementVO> adList = memberService.memberAdList(vo);
		
		model.addAttribute("fundList", fundList);
		model.addAttribute("storeList", storeList);
		model.addAttribute("memberFundCnt", memberFundCnt);
		model.addAttribute("memberStoreCnt", memberStoreCnt);
		model.addAttribute("memberFundAskCnt", memberFundAskCnt);
		model.addAttribute("memberStoreAskCnt", memberStoreAskCnt);
		model.addAttribute("adList", adList);
		
		return "user/makeitMypage";
	}

	@RequestMapping("/insertMemberForm.do")
	public String insertMemberForm() {
		return "user/insertMemberForm";
	}

	@RequestMapping("/adPay.do")
	public String adPay(AdvertisementVO vo, Model model) {
		
		AdvertisementVO adp = memberService.adPay(vo);
		model.addAttribute("adp", adp);
		System.out.println("adp:"+adp);
		return "user/adPay";
	}

	@RequestMapping("/mypageGo.do")
	public String mypageGo(MemberVO vo, Model model) {
		
		List<FundVO> fundList = memberService.myPageFunding(vo);
		List<StorehomeVO> storeList = memberService.myPageStore(vo); 
		int memberFundCnt = memberService.memberFundCnt(vo);
		int memberStoreCnt = memberService.memberStoreCnt(vo);
		int memberFundAskCnt = memberService.getAskTotalCnt(vo.getMemberId());
		int memberStoreAskCnt = memberService.getStoreAskTotalCnt(vo.getMemberId());
		
		model.addAttribute("fundList", fundList);
		model.addAttribute("storeList", storeList);
		model.addAttribute("memberFundCnt", memberFundCnt);
		model.addAttribute("memberStoreCnt", memberStoreCnt);
		model.addAttribute("memberFundAskCnt", memberFundAskCnt);
		model.addAttribute("memberStoreAskCnt", memberStoreAskCnt);
		
		return "user/makeitMypage";
	}

	@RequestMapping(value = "/memberLogin.do", method = RequestMethod.POST)
	public String memberLogin(MemberVO vo, HttpSession request, Model model) {
		MemberVO user = memberService.memberLogin(vo);
		
		List<FundVO> fundList = memberService.myPageFunding(vo);
		List<StorehomeVO> storeList = memberService.myPageStore(vo); 
		int memberFundCnt = memberService.memberFundCnt(vo);
		int memberStoreCnt = memberService.memberStoreCnt(vo);
		int memberFundAskCnt = memberService.getAskTotalCnt(vo.getMemberId());
		int memberStoreAskCnt = memberService.getStoreAskTotalCnt(vo.getMemberId());
		/* List<AdvertisementVO> adList = memberService.memberAdList(vo); */
		
		//---지영 코드 시작
		List<FundVO> list = createService.fundUpdate(vo);
		System.out.println("list : " + list);
		request.setAttribute("fundUpdate", list);
		//---지영 코드 끝
		
		request.setAttribute("user", user);
		model.addAttribute("fundList", fundList);
		model.addAttribute("storeList", storeList);
		model.addAttribute("memberFundCnt", memberFundCnt);
		model.addAttribute("memberStoreCnt", memberStoreCnt);
		model.addAttribute("memberFundAskCnt", memberFundAskCnt);
		model.addAttribute("memberStoreAskCnt", memberStoreAskCnt);
		/* model.addAttribute("adList", adList); */
		
		if (vo.getMemberId().equalsIgnoreCase("admin")) {
			
			List<AdminVO> getMonth = memberService.getMonthData();
			List<AdminVO> getDaily = memberService.getDailyData();
			List<AdminVO> getPie = memberService.getPieData();
			List<AdminVO> getFundPie = memberService.getFundPie();
			List<AdminVO> rank = memberService.rank();
			model.addAttribute("getMonth", getMonth);
			model.addAttribute("getDaily", getDaily);
			model.addAttribute("getPie", getPie);
			model.addAttribute("getFundPie", getFundPie);
			model.addAttribute("rank", rank);
			
			return "admin/adminPage";
		}
		
		return "redirect:main.do?memberId=" + vo.getMemberId();
	}
	
	@RequestMapping("/adminAd.do")
	public String adminAd(Model model) {
		
		List<AdvertisementVO> adminAd = memberService.adminAd();
		List<AdminVO> getAdMonth = memberService.getAdMonthData();
		List<AdminVO> getAdDaily = memberService.getAdDailyData();
		model.addAttribute("adminAd", adminAd);
		model.addAttribute("getAdMonth", getAdMonth);
		model.addAttribute("getAdDaily", getAdDaily);
		
		return "admin/adminAd";
	}

	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		System.out.println(">> 로그아웃 처리");
		// 1. 세션 초기화(세션 객체 무효화)
		session.invalidate();

		return "user/loginForm";
	}

	
	 //결제후 페이지 이동~
	@RequestMapping("/adPayok.do") public String orderok(AdvertisementVO vo, Model model) { 
		 System.out.println("orderdtail vo : " + vo); 
		 AdvertisementVO adPayinfo = memberService.adPayinfo(vo);
	  
		 System.out.println("adPayinfo : " + adPayinfo);
		 model.addAttribute("adPayinfo",adPayinfo);
		 System.out.println("~~~~~~~~~~~~~"); 
		 return "user/adPayok"; 
	}
	 
	
}
