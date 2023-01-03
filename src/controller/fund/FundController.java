package com.makeit.controller.fund;

import java.io.File;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
//import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.makeit.fund.FundService;
import com.makeit.fund.FundVO;
import com.makeit.fund.FundingPage;
import com.makeit.fund.Paging;

//board라는 이름의 Model 객체가 있으면 Session에 저장
// 단, 현재위치(클래스)에서만 유효(현재 위치에서만)
@SessionAttributes("productDetailView") 

//@RequestMapping("/board")
@Controller
public class FundController {
	
	@Autowired
	private FundService fundService;
	
	// 메소드의 정의부에 선언된 @ModelAttribute 는 리턴된 데이터를 View에 전달
	// @ModelAttribute 선언된 메소드는 @RequestMapping 메소드보다 먼저 실행
	// View에 전달이 될 때 설정된 명칭을 사용한다(예 : conditionMap)
	
	public FundController() {
		System.out.println(" =====> FundController() 객체 생성 <===== ");
	}
	
	@RequestMapping("/startMakeIt.do")
	public String startMakeIt (FundVO vo) {
		System.out.println(" =====> startMakeIt - MainPage 로 이동 <===== ");
		System.out.println("그냥 main.jsp 불러오기");
		
		return "main/main";
	}

	//================================================================ All
	// fundingPageAll 로 이동
	@RequestMapping("/fundingPageAll.do")
	public String getBoardListAll(FundVO vo, Model model,@ModelAttribute("page") FundingPage page ) {
		System.out.println(" =====> fundingPageAll 로 이동 <===== ");
		
		List<FundVO> getBoardListAll = FundingPageAll(page);
		
		model.addAttribute("getBoardListAll", getBoardListAll);
		
		System.out.println("getBoardListAll : " + getBoardListAll);
		
		return "fund/fundingPageAll";
	}
		
	
	// fundingPageAllEndDate로 이동
	@RequestMapping("/fundingPageAllEndDate.do")
	public String fundingPageAllEndDate(FundVO vo, Model model,@ModelAttribute("page") FundingPage page ) {
		System.out.println(" =====> fundingPageAllEndDate 로 이동 <===== ");
		
		List<FundVO> fundingPageAllEndDate = FundingPageAllEndDate(page, vo);
		
		model.addAttribute("fundingPageAllEndDate", fundingPageAllEndDate);
		
		System.out.println("fundingPageAllEndDate : " + fundingPageAllEndDate);
		
		return "fund/fundingPageAllEndDate";
	}
	
	// fundingPageAllFundPrice 로 이동
	@RequestMapping("/fundingPageAllFundPrice.do")
	public String fundingPageAllFundPrice(FundVO vo, Model model,@ModelAttribute("page") FundingPage page ) {
		System.out.println(" =====> fundingPageAllFundPrice 로 이동 <===== ");
		
		List<FundVO> fundingPageAllFundPrice = FundingPageAllFundPrice(page, vo);
		
		model.addAttribute("fundingPageAllFundPrice", fundingPageAllFundPrice);
		
		System.out.println("fundingPageAllFundPrice : " + fundingPageAllFundPrice);
		
		return "fund/fundingPageAllFundPrice";
	}
	
	// fundingPageAllRecent 로 이동
	@RequestMapping("/fundingPageAllRecent.do")
	public String fundingPageAllRecent(FundVO vo, Model model,@ModelAttribute("page") FundingPage page ) {
		System.out.println(" =====> fundingPageAllRecent 로 이동 <===== ");
		
		List<FundVO> fundingPageAllRecent = FundingPageAllRecent(page, vo);
		
		model.addAttribute("fundingPageAllRecent", fundingPageAllRecent);
		
		System.out.println("fundingPageAllRecent : " + fundingPageAllRecent);
		
		return "fund/fundingPageAllRecent";
	}
	
	//================================================================ Tech

	// fundingPageTech로 이동
	@RequestMapping("/fundingPageTech.do")
	public String getBoardListTech(FundVO vo, Model model,@ModelAttribute("page") FundingPage page ) {
		System.out.println(" =====> fundingPageTech 로 이동 <===== ");
		
		List<FundVO> getBoardListTech = FundingPageTech(page);
		
		model.addAttribute("getBoardListTech", getBoardListTech);
		
		System.out.println("getBoardListTech : " + getBoardListTech);
		
		return "fund/fundingPageTech";
	}
	
	// fundingPageTechEndDate로 이동
	@RequestMapping("/fundingPageTechEndDate.do")
	public String fundingPageTechEndDate(FundVO vo, Model model,@ModelAttribute("page") FundingPage page, String fundCategory ) {
		System.out.println(" =====> fundingPageTechEndDate 로 이동 <===== ");
		
		List<FundVO> fundingPageTechEndDate = FundingPageTechEndDate(page, fundCategory);
		
		model.addAttribute("fundingPageTechEndDate", fundingPageTechEndDate);
		
		System.out.println("fundingPageTechEndDate : " + fundingPageTechEndDate);
		
		return "fund/fundingPageTechEndDate";
	}
	

	// fundingPageTechFundPrice 로 이동
	@RequestMapping("/fundingPageTechFundPrice.do")
	public String fundingPageTechFundPrice(FundVO vo, Model model,@ModelAttribute("page") FundingPage page, String fundCategory ) {
		System.out.println(" =====> fundingPageTechFundPrice 로 이동 <===== ");
		
		List<FundVO> fundingPageTechFundPrice = FundingPageTechFundPrice(page, fundCategory);
		
		model.addAttribute("fundingPageTechFundPrice", fundingPageTechFundPrice);
		
		System.out.println("fundingPageTechFundPrice : " + fundingPageTechFundPrice);
		
		return "fund/fundingPageTechFundPrice";
	}
	
	
	// fundingPageTechRecent 로 이동
	@RequestMapping("/fundingPageTechRecent.do")
	public String fundingPageTechRecent(FundVO vo, Model model,@ModelAttribute("page") FundingPage page, String fundCategory ) {
		System.out.println(" =====> fundingPageTechRecent 로 이동 <===== ");
		
		List<FundVO> fundingPageTechRecent = FundingPageTechRecent(page, fundCategory);
		
		model.addAttribute("fundingPageTechRecent", fundingPageTechRecent);
		
		System.out.println("fundingPageTechRecent : " + fundingPageTechRecent);
		
		return "fund/fundingPageTechRecent";
	}

	//================================================================ Fashion

	// fundingPageFashion으로 이동
	@RequestMapping("/fundingPageFashion.do")
	public String getBoardListFashion(FundVO vo, Model model,@ModelAttribute("page") FundingPage page ) {
		System.out.println(" =====> getBoardListFashion 로 이동 <===== ");
		
		List<FundVO> getBoardListFashion = FundingPageFashion(page);
		
		model.addAttribute("getBoardListFashion", getBoardListFashion);
		
		System.out.println("getBoardListFashion : " + getBoardListFashion);
		
		return "fund/fundingPageFashion";
	}
	
	// fundingPageFashionEndDate로 이동
	@RequestMapping("/fundingPageFashionEndDate.do")
	public String fundingPageFashionEndDate(FundVO vo, Model model) {
		System.out.println(" =====> fundingPageFashionEndDate 로 이동 <===== ");
		
		List <FundVO> fundingPageFashionEndDate = fundService.fundingPageFashionEndDate(vo);
		
		model.addAttribute("fundingPageFashionEndDate", fundingPageFashionEndDate);
		
		System.out.println("fundingPageFashionEndDate : " + fundingPageFashionEndDate);
		
		return "fund/fundingPageFashionEndDate";
	}
	
	// fundingPageFashionFundPrice 로 이동
	@RequestMapping("/fundingPageFashionFundPrice.do")
	public String fundingPageFashionFundPrice(FundVO vo, Model model) {
		System.out.println(" =====> fundingPageBeautyFundPrice 로 이동 <===== ");
		
		List <FundVO> fundingPageFashionFundPrice = fundService.fundingPageFashionFundPrice(vo);
		
		model.addAttribute("fundingPageFashionFundPrice", fundingPageFashionFundPrice);
		
		System.out.println("fundingPageFashionFundPrice : " + fundingPageFashionFundPrice);
		
		return "fund/fundingPageFashionFundPrice";
	}
	
	// fundingPageFashionRecent 로 이동
	@RequestMapping("/fundingPageFashionRecent.do")
	public String fundingPageFashionRecent(FundVO vo, Model model) {
		System.out.println(" =====> fundingPageFashionRecent 로 이동 <===== ");
		
		List <FundVO> fundingPageFashionRecent = fundService.fundingPageFashionRecent(vo);
		
		model.addAttribute("fundingPageFashionRecent", fundingPageFashionRecent);
		
		System.out.println("fundingPageFashionRecent : " + fundingPageFashionRecent);
		
		return "fund/fundingPageFashionRecent";
	}
	
	//================================================================ Beauty

	// fundingPageBeauty로 이동
	@RequestMapping("/fundingPageBeauty.do")
	public String getBoardListBeauty(FundVO vo, Model model,@ModelAttribute("page") FundingPage page ) {
		System.out.println(" =====> getBoardListBeauty 로 이동 <===== ");
		
		List<FundVO> getBoardListBeauty = FundingPageBeauty(page);
		
		model.addAttribute("getBoardListBeauty", getBoardListBeauty);
		
		System.out.println("getBoardListBeauty : " + getBoardListBeauty);
		
		return "fund/fundingPageBeauty";
	}
	
	// fundingPageBeautyEndDate로 이동
	@RequestMapping("/fundingPageBeautyEndDate.do")
	public String fundingPageBeautyEndDate(FundVO vo, Model model) {
		System.out.println(" =====> fundingPageBeautyEndDate 로 이동 <===== ");
		
		List <FundVO> fundingPageBeautyEndDate = fundService.fundingPageBeautyEndDate(vo);
		
		model.addAttribute("fundingPageBeautyEndDate", fundingPageBeautyEndDate);
		
		System.out.println("fundingPageBeautyEndDate : " + fundingPageBeautyEndDate);
		
		return "fund/fundingPageBeautyEndDate";
	}
	
	// fundingPageBeautyFundPrice 로 이동
	@RequestMapping("/fundingPageBeautyFundPrice.do")
	public String fundingPageBeautyFundPrice(FundVO vo, Model model) {
		System.out.println(" =====> fundingPageBeautyFundPrice 로 이동 <===== ");
		
		List <FundVO> fundingPageBeautyFundPrice = fundService.fundingPageBeautyFundPrice(vo);
		
		model.addAttribute("fundingPageBeautyFundPrice", fundingPageBeautyFundPrice);
		
		System.out.println("fundingPageBeautyFundPrice : " + fundingPageBeautyFundPrice);
		
		return "fund/fundingPageBeautyFundPrice";
	}
	
	// fundingPageBeautyRecent 로 이동
	@RequestMapping("/fundingPageBeautyRecent.do")
	public String fundingPageBeautyRecent(FundVO vo, Model model) {
		System.out.println(" =====> fundingPageBeautyRecent 로 이동 <===== ");
		
		List <FundVO> fundingPageBeautyRecent = fundService.fundingPageBeautyRecent(vo);
		
		model.addAttribute("fundingPageBeautyRecent", fundingPageBeautyRecent);
		
		System.out.println("fundingPageBeautyRecent : " + fundingPageBeautyRecent);
		
		return "fund/fundingPageBeautyRecent";
	}
	
	//================================================================ Food
	// fundingPageFood로 이동
	@RequestMapping("/fundingPageFood.do")
	public String getBoardListFood(FundVO vo, Model model,@ModelAttribute("page") FundingPage page ) {
		System.out.println(" =====> getBoardListFood 로 이동 <===== ");
		
		List<FundVO> getBoardListFood = FundingPageFood(page);
		
		model.addAttribute("getBoardListFood", getBoardListFood);
		
		System.out.println("getBoardListFood : " + getBoardListFood);
		
		return "fund/fundingPageFood";
	}
	
	// fundingPageFoodEndDate로 이동
	@RequestMapping("/fundingPageFoodEndDate.do")
	public String fundingPageFoodEndDate(FundVO vo, Model model) {
		System.out.println(" =====> fundingPageFoodEndDate 로 이동 <===== ");
		
		List <FundVO> fundingPageFoodEndDate = fundService.fundingPageFoodEndDate(vo);
		
		model.addAttribute("fundingPageFoodEndDate", fundingPageFoodEndDate);
		
		System.out.println("fundingPageFoodEndDate : " + fundingPageFoodEndDate);
		
		return "fund/fundingPageFoodEndDate";
	}
	
	// fundingPageFoodFundPrice 로 이동
	@RequestMapping("/fundingPageFoodFundPrice.do")
	public String fundingPageFoodFundPrice(FundVO vo, Model model) {
		System.out.println(" =====> fundingPageFoodFundPrice 로 이동 <===== ");
		
		List <FundVO> fundingPageFoodFundPrice = fundService.fundingPageFoodFundPrice(vo);
		
		model.addAttribute("fundingPageFoodFundPrice", fundingPageFoodFundPrice);
		
		System.out.println("fundingPageFoodFundPrice : " + fundingPageFoodFundPrice);
		
		return "fund/fundingPageFoodFundPrice";
	}
	
	// fundingPageFoodRecent 로 이동
	@RequestMapping("/fundingPageFoodRecent.do")
	public String fundingPageFoodRecent(FundVO vo, Model model) {
		System.out.println(" =====> fundingPageFoodRecent 로 이동 <===== ");
		
		List <FundVO> fundingPageFoodRecent = fundService.fundingPageFoodRecent(vo);
		
		model.addAttribute("fundingPageFoodRecent", fundingPageFoodRecent);
		
		System.out.println("fundingPageFoodRecent : " + fundingPageFoodRecent);
		
		return "fund/fundingPageFoodRecent";
	}
	
	//================================================================ Travel
	// fundingPageTravel로 이동
	@RequestMapping("/fundingPageTravel.do")
	public String getBoardListTravel(FundVO vo, Model model,@ModelAttribute("page") FundingPage page ) {
		System.out.println(" =====> getBoardListTravel 로 이동 <===== ");
		
		List<FundVO> getBoardListTravel = FundingPageTravel(page);
		
		model.addAttribute("getBoardListTravel", getBoardListTravel);
		
		System.out.println("getBoardListTravel : " + getBoardListTravel);
		
		return "fund/fundingPageTravel";
	}

	// fundingPageTravelEndDate로 이동
	@RequestMapping("/fundingPageTravelEndDate.do")
	public String fundingPageTravelEndDate(FundVO vo, Model model) {
		System.out.println(" =====> fundingPageTravelEndDate 로 이동 <===== ");
		
		List <FundVO> fundingPageTravelEndDate = fundService.fundingPageTravelEndDate(vo);
		
		model.addAttribute("fundingPageTravelEndDate", fundingPageTravelEndDate);
		
		System.out.println("fundingPageTravelEndDate : " + fundingPageTravelEndDate);
		
		return "fund/fundingPageTravelEndDate";
	}
	
	// fundingPageTravelFundPrice 로 이동
	@RequestMapping("/fundingPageTravelFundPrice.do")
	public String fundingPageTravelFundPrice(FundVO vo, Model model) {
		System.out.println(" =====> fundingPageTravelFundPrice 로 이동 <===== ");
		
		List <FundVO> fundingPageTravelFundPrice = fundService.fundingPageTravelFundPrice(vo);
		
		model.addAttribute("fundingPageTravelFundPrice", fundingPageTravelFundPrice);
		
		System.out.println("fundingPageTravelFundPrice : " + fundingPageTravelFundPrice);
		
		return "fund/fundingPageTravelFundPrice";
	}
	
	// fundingPageTravelRecent 로 이동
	@RequestMapping("/fundingPageTravelRecent.do")
	public String fundingPageTravelRecent(FundVO vo, Model model) {
		System.out.println(" =====> fundingPageTravelRecent 로 이동 <===== ");
		
		List <FundVO> fundingPageTravelRecent = fundService.fundingPageTravelRecent(vo);
		
		model.addAttribute("fundingPageTravelRecent", fundingPageTravelRecent);
		
		System.out.println("fundingPageTravelRecent : " + fundingPageTravelRecent);
		
		return "fund/fundingPageTravelRecent";
	}
	
	//================================================================ Baby

	// fundingPageBaby로 이동
	@RequestMapping("/fundingPageBaby.do")
	public String getBoardListBaby(FundVO vo, Model model,@ModelAttribute("page") FundingPage page ) {
		System.out.println(" =====> getBoardListBaby 로 이동 <===== ");
		
		List<FundVO> getBoardListBaby = FundingPageBaby(page);
		
		model.addAttribute("getBoardListBaby", getBoardListBaby);
		
		System.out.println("getBoardListBaby : " + getBoardListBaby);
		
		return "fund/fundingPageBaby";
	}
	
	// fundingPageBabyEndDate로 이동
	@RequestMapping("/fundingPageBabyEndDate.do")
	public String fundingPageBabyEndDate(FundVO vo, Model model) {
		System.out.println(" =====> fundingPageBabyEndDate 로 이동 <===== ");
		
		List <FundVO> fundingPageBabyEndDate = fundService.fundingPageBabyEndDate(vo);
		
		model.addAttribute("fundingPageBabyEndDate", fundingPageBabyEndDate);
		
		System.out.println("fundingPageBabyEndDate : " + fundingPageBabyEndDate);
		
		return "fund/fundingPageBabyEndDate";
	}
	
	// fundingPageBabyFundPrice 로 이동
	@RequestMapping("/fundingPageBabyFundPrice.do")
	public String fundingPageBabyFundPrice(FundVO vo, Model model) {
		System.out.println(" =====> fundingPageBabyFundPrice 로 이동 <===== ");
		
		List <FundVO> fundingPageBabyFundPrice = fundService.fundingPageBabyFundPrice(vo);
		
		model.addAttribute("fundingPageBabyFundPrice", fundingPageBabyFundPrice);
		
		System.out.println("fundingPageBabyFundPrice : " + fundingPageBabyFundPrice);
		
		return "fund/fundingPageBabyFundPrice";
	}
	
	// fundingPageBabyRecent 로 이동
	@RequestMapping("/fundingPageBabyRecent.do")
	public String fundingPageBabyRecent(FundVO vo, Model model) {
		System.out.println(" =====> fundingPageBabyRecent 로 이동 <===== ");
		
		List <FundVO> fundingPageBabyRecent = fundService.fundingPageBabyRecent(vo);
		
		model.addAttribute("fundingPageBabyRecent", fundingPageBabyRecent);
		
		System.out.println("fundingPageBabyRecent : " + fundingPageBabyRecent);
		
		return "fund/fundingPageBabyRecent";
	}
	
	//================================================================ Animal
	// fundingPageAnimal로 이동
	@RequestMapping("/fundingPageAnimal.do")
	public String getBoardListAnimal(FundVO vo, Model model,@ModelAttribute("page") FundingPage page ) {
		System.out.println(" =====> getBoardListAnimal 로 이동 <===== ");
		
		List<FundVO> getBoardListAnimal = FundingPageAnimal(page);
		
		model.addAttribute("getBoardListAnimal", getBoardListAnimal);
		
		System.out.println("getBoardListAnimal : " + getBoardListAnimal);
		
		return "fund/fundingPageAnimal";
	}
	
	// fundingPageAnimalEndDate로 이동
	@RequestMapping("/fundingPageAnimalEndDate.do")
	public String fundingPageAnimalEndDate(FundVO vo, Model model) {
		System.out.println(" =====> fundingPageAnimalEndDate 로 이동 <===== ");
		
		List <FundVO> fundingPageAnimalEndDate = fundService.fundingPageAnimalEndDate(vo);
		
		model.addAttribute("fundingPageAnimalEndDate", fundingPageAnimalEndDate);
		
		System.out.println("fundingPageAnimalEndDate : " + fundingPageAnimalEndDate);
		
		return "fund/fundingPageAnimalEndDate";
	}
	
	// fundingPageAnimalFundPrice 로 이동
	@RequestMapping("/fundingPageAnimalFundPrice.do")
	public String fundingPageAnimalFundPrice(FundVO vo, Model model) {
		System.out.println(" =====> fundingPageAnimalFundPrice 로 이동 <===== ");
		
		List <FundVO> fundingPageAnimalFundPrice = fundService.fundingPageAnimalFundPrice(vo);
		
		model.addAttribute("fundingPageAnimalFundPrice", fundingPageAnimalFundPrice);
		
		System.out.println("fundingPageAnimalFundPrice : " + fundingPageAnimalFundPrice);
		
		return "fund/fundingPageAnimalFundPrice";
	}
	
	// fundingPageAnimalRecent 로 이동
	@RequestMapping("/fundingPageAnimalRecent.do")
	public String fundingPageAnimalRecent(FundVO vo, Model model) {
		System.out.println(" =====> fundingPageAllRecent 로 이동 <===== ");
		
		List <FundVO> fundingPageAnimalRecent = fundService.fundingPageAnimalRecent(vo);
		
		model.addAttribute("fundingPageAnimalRecent", fundingPageAnimalRecent);
		
		System.out.println("fundingPageAnimalRecent : " + fundingPageAnimalRecent);
		
		return "fund/fundingPageAnimalRecent";
	}
	
	//================================================================

	// searchBoardList로 이동
	@RequestMapping("/searchBoardList.do")
	public String searchBoardList(FundVO vo, Model model) {
		System.out.println(" =====> searchBoardList 로 이동 <===== ");
		
		List <FundVO> searchBoardList = fundService.searchBoardList(vo);
		model.addAttribute("searchBoardList", searchBoardList);
		System.out.println("searchBoardList : " + searchBoardList);
		
		return "fund/searchBoardList";
	}
	
	//productDetailView로 이동
	@RequestMapping("/productDetailView.do")
	public String productDetailView (HttpServletRequest request, FundVO vo, Model model) {
		System.out.println(" =====> productDetailView 로 이동 <===== ");
		
		FundVO productDetailView = fundService.productDetailView(vo);
		List<FundVO> fundOptionView = fundService.fundOptionView(vo);
		List<FundVO> couponList = fundService.couponList(vo);

		model.addAttribute("productDetailView", productDetailView);
		model.addAttribute("fundOptionView", fundOptionView);
		model.addAttribute("couponList", couponList);
		
		System.out.println("productDetailView : " + productDetailView);
		System.out.println("fundOptionView : " + fundOptionView);
		System.out.println("couponList : " + couponList);

		if (productDetailView.getFundDetailImg() != null) {
			StringTokenizer st = new StringTokenizer(productDetailView.getFundDetailImg(), ";");
			
			Map<String, String> map = new LinkedHashMap<String, String>();
			Integer i = 0;
			
			while(st.hasMoreTokens()) {
				map.put("img"+i.toString(), st.nextToken());
				i++;
			}
			request.setAttribute("map", map);
			System.out.println("map : " + map);
		}
		
		return "fund/productDetailView";
		
	}
	
	// insertReview 실행
	@RequestMapping(value = "/insertReview.do", method = RequestMethod.POST)
	public String insertReview (FundVO vo, Model model, HttpSession request) throws IllegalStateException, IOException {
		System.out.println(" =====> insertReview 로 이동 <===== ");
		System.out.println("vo: " + vo);
		
		//업로드될 실제 경로
		String uploadPath = request.getServletContext().getRealPath("/img/reviewImg/");
		System.out.println("uploadPath : " + uploadPath);
				
		MultipartFile uploadFile = vo.getUploadFile();
		System.out.println("uploadFile : " + uploadFile);
		
		if (!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			vo.setFundReviewImg(fileName);
			uploadFile.transferTo(
					new File(uploadPath, fileName));
		}
		
		fundService.insertReview(vo);
		return "redirect:getCommentList.do?fundIdx=" + vo.getFundIdx();
		
	}
	
	// deleteReview 실행
	@RequestMapping("/deleteReview.do")
	public String deleteReview (FundVO vo) {
		System.out.println(" =====> deleteReview <===== ");
		System.out.println("댓글 삭제 가즈아~~");
	
		fundService.deleteReview(vo);
		return "redirect:getCommentList.do?fundIdx=" + vo.getFundIdx();
	}
	
	// returnAndCancel 이동
	@RequestMapping("/returnAndCancel.do")
	public String returnAndCancel (FundVO vo) {
		System.out.println(" =====> returnAndCancel 로 이동 <===== ");
		System.out.println("그냥 returnAndCancel.jsp 불러오기");
		
		return "fund/returnAndCancel";
	}
	
	// getSupporter로 이동
	@RequestMapping("/getSupporter.do")
	public String getSupporter(FundVO vo, Model model) {
		System.out.println(" =====> getSupporter 로 이동 <===== ");
		
		FundVO productDetailView = fundService.productDetailView(vo);
		List <FundVO> getSupporter = fundService.getSupporter(vo);
		
		model.addAttribute("productDetailView", productDetailView);
		model.addAttribute("getSupporter", getSupporter);
		
		System.out.println("productDetailView : " + productDetailView);
		System.out.println("getSupporter : " + getSupporter);
		
		return "fund/getSupporter";
	}

	//펀딩 문의글 상세 페이지
	@RequestMapping("/fundingQnaView.do")
	public String fundingQnaView (FundVO vo, Model model) {
		System.out.println("=====> fundingQnaView로 이동 <=====");
		System.out.println("vo : " + vo);
		
		FundVO fundingQnaView = fundService.fundingQnaView(vo);
		FundVO fundingQnaRe = fundService.fundingQnaRe(vo);
		
		model.addAttribute("fundingQnaView", fundingQnaView);
		model.addAttribute("fundingQnaRe", fundingQnaRe);
		
		System.out.println("fundingQnaView: " + fundingQnaView);
		System.out.println("fundingQnaRe: " + fundingQnaRe);
		
		return "fund/fundingQnaView";
		
	}
	
	//펀딩 문의글 상세 페이지
	@RequestMapping("/myQnaView.do")
	public String myQnaView (FundVO vo, Model model) {
		System.out.println("=====> myQnaView로 이동 <=====");
		System.out.println("vo : " + vo);
		
		FundVO myQnaView = fundService.myQnaView(vo);
		FundVO fundingQnaRe = fundService.fundingQnaRe(vo);
		
		model.addAttribute("myQnaView", myQnaView);
		model.addAttribute("fundingQnaRe", fundingQnaRe);
		
		System.out.println("myQnaView: " + myQnaView);
		System.out.println("fundingQnaRe: " + fundingQnaRe);
		
		return "fund/myQnaView";
		
	}
	
	//펀딩 문의글에 대한 답글 가져오기
	@RequestMapping("/fundingQnaRe.do")
	public String fundingQnaRe (FundVO vo, Model model) {
		System.out.println("=====> fundingQnaView로 이동 <=====");
		System.out.println("vo : " + vo);
		
		FundVO fundingQnaRe = fundService.fundingQnaRe(vo);
		
		model.addAttribute("fundingQnaRe", fundingQnaRe);
		
		System.out.println("fundingQnaRe: " + fundingQnaRe);
		
		return "fund/fundingQnaView";
		
	}
	
	//펀딩 문의글 폼으로 이동
	@RequestMapping("/fundingQnaInsertForm.do")
	public String fundingQnaInsertForm (FundVO vo, Model model) {
		System.out.println("=====> fundingQnaInsertForm 로 이동<=====");
		System.out.println("vo : " + vo);
		
		FundVO fundingQnaInsertForm = fundService.fundingQnaInsertForm(vo);
		
		model.addAttribute("fundingQnaInsertForm", fundingQnaInsertForm);
		
		System.out.println("fundingQnaInsertForm: " + fundingQnaInsertForm);
		
		return "fund/fundingQnaInsertForm";
				
	}
	
	//펀딩 문의글 입력
	@RequestMapping("/fundingQnaInsert.do")
	public String fundingQnaInsert (FundVO vo, Model model) {
		System.out.println("=====> fundingQnaInsert 로 이동<=====");
		System.out.println("vo : " + vo);
		
		fundService.fundingQnaInsert(vo);
		
		System.out.println("fundingQnaInsert : " + vo);
		
		return "redirect:fundingQnaList.do?fundIdx=" + vo.getFundIdx();
					
		}
	
	// deleteQnA 실행
	@RequestMapping("/deleteQnA.do")
	public String deleteQnA (FundVO vo) {
		System.out.println("vo : " + vo);
		System.out.println(" =====> deleteQnA <===== ");
		System.out.println("문의글 삭제 가즈아~~");
	
		fundService.deleteQnA(vo);
		
		return "redirect:fundingQnaList.do?fundIdx=" + vo.getFundIdx();
	}

	//펀딩 문의글 수정 입력폼 이동
	@RequestMapping("/fundingQnaUpdateForm.do")
	public String fundingQnaUpdateForm (FundVO vo, Model model) {
		System.out.println("=====> fundingQnaUpdateForm 로 이동<=====");
		System.out.println("vo : " + vo);
		
		FundVO fundingQnaUpdateForm = fundService.fundingQnaUpdateForm(vo);
		
		model.addAttribute("fundingQnaUpdateForm", fundingQnaUpdateForm);
		
		System.out.println("fundingQnaUpdateForm: " + fundingQnaUpdateForm);
		
		return "fund/fundingQnaUpdateForm";
	}
	
	//펀딩 문의글 수정 입력
	@RequestMapping("/fundingQnaUpdate.do")
	public String fundingQnaUpdate (FundVO vo) {
		System.out.println("=====> fundingQnaUpdate 로 이동<=====");
		System.out.println("vo : " + vo);
		
		fundService.fundingQnaUpdate(vo);

		return "redirect:fundingQnaList.do?fundIdx=" + vo.getFundIdx();
	}
	
	// insertReview 실행
	@RequestMapping("/insertQnaRe.do")
	public String insertQnaRe (FundVO vo)  {
		System.out.println(" =====> insertQnaRe 로 이동 <===== ");
		System.out.println("vo : " + vo);
		
		fundService.insertQnaRe(vo);
		fundService.statusChange(vo);
		
		System.out.println("insertQnaRe : " + vo);
		System.out.println("statusChange : " + vo);
		
		return "redirect:fundingQnaView.do?fundQnaIdx=" + vo.getFundQnaIdx();
		}
	
	// getCommentList로 이동
	@RequestMapping("/getCommentList.do")
	public String getCommentList(String fundIdx, FundVO vo, Model model, @ModelAttribute("page") Paging page ) {
		System.out.println(" =====> getCommentList 로 이동 <===== ");
		
		System.out.println("fundIdx : " + fundIdx);
		System.out.println("cpage : " + page);
		
		FundVO productDetailView = fundService.productDetailView(vo);
		List<FundVO> getCommentList = paging(page, fundIdx);
		
		model.addAttribute("productDetailView", productDetailView);
		model.addAttribute("getCommentList", getCommentList);
		
		System.out.println("productDetailView : " + productDetailView);
		System.out.println("getCommentList : " + getCommentList);

		return "fund/getCommentList";
	}
	
	//펀딩 QnA 목록 불러오기
	@RequestMapping("/fundingQnaList.do")
	public String fundingQnaList(String fundIdx, FundVO vo, Model model, @ModelAttribute("page") Paging page ) {
		System.out.println(" =====> fundingQnA 로 이동 <===== ");
		
		System.out.println("fundIdx : " + fundIdx);
		System.out.println("cpage : " + page);
		
		FundVO productDetailView = fundService.productDetailView(vo);
		List<FundVO> fundingQnaList = Qpaging(page, fundIdx);
		
		model.addAttribute("productDetailView", productDetailView);
		model.addAttribute("fundingQnaList", fundingQnaList);
		
		System.out.println("productDetailView : " + productDetailView);
		System.out.println("fundingQnaList : " + fundingQnaList);
		
		return "fund/fundingQnaList";
	}
	
	//펀딩 나의 QnA 목록 불러오기
	@RequestMapping("/fundMyQnaList.do")
	public String fundMyQnaList(String fundIdx, String memberId, FundVO vo, Model model, @ModelAttribute("page") Paging page ) {
		System.out.println(" =====> fundMyQnaList 로 이동 <===== ");
		
		System.out.println("fundIdx : " + fundIdx);
		System.out.println("memberId : " + memberId);
		System.out.println("cpage : " + page);
		
		FundVO productDetailView = fundService.productDetailView(vo);
		List<FundVO> fundMyQnaList = MQpaging(page, fundIdx, memberId);
		
		model.addAttribute("productDetailView", productDetailView);
		model.addAttribute("fundMyQnaList", fundMyQnaList);
		
		System.out.println("productDetailView : " + productDetailView);
		System.out.println("fundMyQnaList : " + fundMyQnaList);
		
		return "fund/myQnaList";
	}
	
	//리워드 펀딩 페이지로 이동
	@RequestMapping("/rewardFunding.do")
	public String rewardFunding (FundVO vo, Model model) {
		System.out.println(" =====> rewardFunding 로 이동 <===== ");
		System.out.println("vo : " + vo);
		
		FundVO rewardFunding = fundService.rewardFunding(vo);
		List<FundVO> couponList = fundService.couponList(vo);
		
		model.addAttribute("rewardFunding", rewardFunding);
		model.addAttribute("couponList", couponList);
		
		System.out.println("rewardFunding : " + rewardFunding);
		System.out.println("couponList : " + couponList);
		
		return "fund/rewardFunding";
	}

	// rewardInsert 실행
	@RequestMapping("/rewardInsert.do")
	public String rewardInsert (FundVO vo)  {
		System.out.println(" =====> rewardInsert 로 이동 <===== ");
		System.out.println("vo : " + vo);
		
		fundService.fundPriceUpdate(vo);
		fundService.insertSupporter(vo);
		fundService.rewardInsert(vo);
		fundService.couponCheck(vo);

		
		System.out.println("rewardInsert : " + vo);
		System.out.println("couponCheck : " + vo);
		System.out.println("fundPriceUpdate : " + vo);
		System.out.println("fundPriceUpdate : " + vo);
		System.out.println("supporterPriceUpdate : " + vo);
		
		return "redirect:memberMyfunding.do?memberId=" + vo.getMemberId();
		}
	
	// rewardInsert 실행
	@RequestMapping("/rewardInsertNoCoupon.do")
	public String rewardInsertNoCoupon (FundVO vo)  {
		System.out.println(" =====> rewardInsertNoCoupon 로 이동 <===== ");
		System.out.println("vo : " + vo);
		
		fundService.fundPriceUpdate(vo);
		fundService.insertSupporter(vo);
		fundService.rewardInsert(vo);

		System.out.println("rewardInsert : " + vo);
		System.out.println("fundPriceUpdate : " + vo);
		System.out.println("insertSupporter : " + vo);
		System.out.println("supporterPriceUpdate : " + vo);
		
		return "redirect:memberMyfunding.do?memberId=" + vo.getMemberId();
		}
	
	//==================================================== 전체, 카테고리별 전체
	
	// FundingPageAll 페이징 처리
	public List<FundVO> FundingPageAll(FundingPage page) {
		page.setTotalRecord(fundService.getBoardListAllCnt());
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
		List<FundVO> list = fundService.getBoardListAll(page.getBegin(), page.getEnd());
		return list;
	}
	
	// FundingPageAllEndDate 페이징 처리
	public List<FundVO> FundingPageAllEndDate(FundingPage page, FundVO vo) {
		page.setTotalRecord(fundService.fundingPageAllEndDateCnt());
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
		List<FundVO> list = fundService.fundingPageAllEndDate(page.getBegin(), page.getEnd(), vo);
		return list;
	}
	
	// FundingPageAllEndDate 페이징 처리
	public List<FundVO> FundingPageAllFundPrice(FundingPage page, FundVO vo) {
		page.setTotalRecord(fundService.fundingPageAllFundPriceCnt());
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
		List<FundVO> list = fundService.fundingPageAllFundPrice(page.getBegin(), page.getEnd(), vo);
		return list;
	}
	
	// FundingPageAllEndDate 페이징 처리
	public List<FundVO> FundingPageAllRecent(FundingPage page, FundVO vo) {
		page.setTotalRecord(fundService.fundingPageAllRecentCnt());
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
		List<FundVO> list = fundService.fundingPageAllRecent(page.getBegin(), page.getEnd(), vo);
		return list;
	}
		
	//테크 -----------------------------------------------------------------------------------------------------------------------
	// FundingPageTech 페이징 처리
	public List<FundVO> FundingPageTech(FundingPage page) {
		page.setTotalRecord(fundService.getBoardListTechCnt());
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
		List<FundVO> list = fundService.getBoardListTech(page.getBegin(), page.getEnd());
		return list;
	}
	
	// FundingPageTechEndDate 페이징 처리
	public List<FundVO> FundingPageTechEndDate(FundingPage page, String fundCategory) {
		page.setTotalRecord(fundService.fundingPageTechEndDateCnt(fundCategory));
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
		List<FundVO> list = fundService.fundingPageTechEndDate(page.getBegin(), page.getEnd(), fundCategory);
		return list;
	}
	
	// FundingPageTechFundPrice 페이징 처리
	public List<FundVO> FundingPageTechFundPrice(FundingPage page, String fundCategory) {
		page.setTotalRecord(fundService.fundingPageTechFundPriceCnt(fundCategory));
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
		List<FundVO> list = fundService.fundingPageTechFundPrice(page.getBegin(), page.getEnd(), fundCategory);
		return list;
	}
	
	// FundingPageTechRecent 페이징 처리
	public List<FundVO> FundingPageTechRecent(FundingPage page, String fundCategory) {
		page.setTotalRecord(fundService.fundingPageTechRecentCnt(fundCategory));
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
		List<FundVO> list = fundService.fundingPageTechRecent(page.getBegin(), page.getEnd(), fundCategory);
		return list;
	}
		
	
	//-------------------------------------------------------------------------------------------------------------------------------------------------------
	
	// FundingPageAnimal 페이징 처리
	public List<FundVO> FundingPageAnimal(FundingPage page) {
		page.setTotalRecord(fundService.getBoardListAnimalCnt());
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
		List<FundVO> list = fundService.getBoardListAnimal(page.getBegin(), page.getEnd());
		return list;
	}
		
	// FundingPageFashion 페이징 처리
	public List<FundVO> FundingPageFashion(FundingPage page) {
		page.setTotalRecord(fundService.getBoardListFashionCnt());
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
		List<FundVO> list = fundService.getBoardListFashion(page.getBegin(), page.getEnd());
		return list;
	}
		
	// FundingPageBeauty 페이징 처리
	public List<FundVO> FundingPageBeauty(FundingPage page) {
		page.setTotalRecord(fundService.getBoardListBeautyCnt());
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
		List<FundVO> list = fundService.getBoardListBeauty(page.getBegin(), page.getEnd());
		return list;
	}
		
	// FundingPageFood 페이징 처리
	public List<FundVO> FundingPageFood(FundingPage page) {
		page.setTotalRecord(fundService.getBoardListFoodCnt());
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
		List<FundVO> list = fundService.getBoardListFood(page.getBegin(), page.getEnd());
		return list;
	}
		
	// FundingPageTravel 페이징 처리
	public List<FundVO> FundingPageTravel(FundingPage page) {
		page.setTotalRecord(fundService.getBoardListTravelCnt());
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
		List<FundVO> list = fundService.getBoardListTravel(page.getBegin(), page.getEnd());
		return list;
	}
	
	// FundingPageBaby 페이징 처리
	public List<FundVO> FundingPageBaby(FundingPage page) {
		page.setTotalRecord(fundService.getBoardListBabyCnt());
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
		List<FundVO> list = fundService.getBoardListBaby(page.getBegin(), page.getEnd());
		return list;
	}
			
//==============================================================리뷰, Q&A
	// 리뷰 페이지 paging
		public List<FundVO> paging(Paging page, String fundIdx) {
			page.setTotalRecord(fundService.getCommentListCnt(fundIdx));
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
			List<FundVO> list = fundService.getCommentList(page.getBegin(), page.getEnd(), fundIdx);
			return list;
		}
		
		// 문의 페이지 paging
		public List<FundVO> Qpaging(Paging Qpage, String fundIdx) {
			Qpage.setTotalRecord(fundService.fundingQnaCnt(fundIdx));
			Qpage.setTotalPage();
			
			if (Qpage.getcPage() != 0) {
				Qpage.setNowPage(Qpage.getcPage());
				System.out.println("page.getNowPage():"+Qpage.getNowPage());
			}
			Qpage.setEnd(Qpage.getNowPage() * Qpage.getNumPerPage());
			Qpage.setBegin(Qpage.getEnd() - Qpage.getNumPerPage() + 1);

			if (Qpage.getEnd() > Qpage.getTotalRecord()) {
				Qpage.setEnd(Qpage.getTotalRecord());
			}
			int nowPage = Qpage.getNowPage();
			int beginPage = (nowPage - 1) / Qpage.getNumPerBlock() * Qpage.getNumPerBlock() + 1;
			Qpage.setBeginPage(beginPage);
			Qpage.setEndPage(beginPage + Qpage.getNumPerBlock() - 1);

			if (Qpage.getEndPage() > Qpage.getTotalPage()) {
				Qpage.setEndPage(Qpage.getTotalPage());
			}
			List<FundVO> list = fundService.fundingQnaList(Qpage.getBegin(), Qpage.getEnd(), fundIdx);
			return list;
		}
		
		// 나의 문의 페이지 paging
		public List<FundVO> MQpaging(Paging MQpage,String fundIdx, String memberId) {
			MQpage.setTotalRecord(fundService.myQnaListCnt(fundIdx, memberId));
			MQpage.setTotalPage();
			
			if (MQpage.getcPage() != 0) {
				MQpage.setNowPage(MQpage.getcPage());
				System.out.println("page.getNowPage():"+MQpage.getNowPage());
			}
			MQpage.setEnd(MQpage.getNowPage() * MQpage.getNumPerPage());
			MQpage.setBegin(MQpage.getEnd() - MQpage.getNumPerPage() + 1);

			if (MQpage.getEnd() > MQpage.getTotalRecord()) {
				MQpage.setEnd(MQpage.getTotalRecord());
			}
			int nowPage = MQpage.getNowPage();
			int beginPage = (nowPage - 1) / MQpage.getNumPerBlock() * MQpage.getNumPerBlock() + 1;
			MQpage.setBeginPage(beginPage);
			MQpage.setEndPage(beginPage + MQpage.getNumPerBlock() - 1);

			if (MQpage.getEndPage() > MQpage.getTotalPage()) {
				MQpage.setEndPage(MQpage.getTotalPage());
			}
			List<FundVO> list = fundService.fundMyQnaList(MQpage.getBegin(), MQpage.getEnd(), memberId, fundIdx);
			return list;
		}

}
