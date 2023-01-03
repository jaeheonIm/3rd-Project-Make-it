package com.makeit.controller.store;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.makeit.like.LikeVO;
import com.makeit.storehome.StorehomeService;
import com.makeit.storehome.StorehomeVO;

@RestController
public class StoreJsonController {
	
	@Autowired
	private StorehomeService storeService;
	
	public StoreJsonController() {
	}
	
	//좋아요 
	@RequestMapping("/storeLikeUpdate.do")
	public int storeLikeUpdate(@RequestBody LikeVO vo) {
		if(storeService.findLikeCnt(vo) == 0) {
			storeService.likeUpdete(vo);
			return 1;
		} else if (storeService.findLikeCnt(vo) != 0) {
			storeService.likeDelete(vo);
			return 2;
		}
		return 0;
	}
	
	@RequestMapping("/storefollow.do")
	public int follow(@RequestBody StorehomeVO vo) {
		if(storeService.followYN(vo) == 0) {
			storeService.followUpdete(vo);
			return 1;
		} else if (storeService.followYN(vo) != 0) {
			storeService.followDelete(vo);
			return 2;
		}
		return 0;
	}
	
	//리뷰쓰기 
	@RequestMapping(value = "/reviewIn.do" ,method = RequestMethod.POST)
	public Map<String, Object> reviewIn(StorehomeVO vo) throws IllegalStateException, IOException {
		int insert;
		List<StorehomeVO> list = new ArrayList<StorehomeVO>();
		Map<String, Object> map = new HashMap<String, Object>();
		StorehomeVO cnt = null;
		MultipartFile upload = vo.getUploadFile();
		if(!upload.isEmpty()) {
			upload.transferTo(new File("C:/mystudy/70_Spring/3rd_Project_makeit/src/main/webapp/img/store-img/" + upload.getOriginalFilename()));
			vo.setStoreReviewImg(upload.getOriginalFilename());
			insert = storeService.reviewIn(vo);
			if(insert == 1) {
				int result = storeService.reviewscoreUodate(vo.getStoreIdx());
				System.out.println("result : " + result);
				list = storeService.storeReview(vo.getStoreIdx());
				cnt = storeService.reviewCnt(vo.getStoreIdx());
				map.put("list", list);
				map.put("cnt", cnt);
				System.out.println("map : " + map);
			} else if(insert == 0){
			}
		} else {
			vo.setStoreReviewImg(null);
			insert = storeService.reviewIn(vo);
			if(insert == 1) {
				storeService.reviewscoreUodate(vo.getStoreIdx());
				list = storeService.storeReview(vo.getStoreIdx());
				cnt = storeService.reviewCnt(vo.getStoreIdx());
				map.put("list", list);
				map.put("cnt", cnt);
			} else if(insert == 0){
			}
		}
		return map;
	}
	
	//베스트 카테고리
	//전체
	@RequestMapping("/bestnow.do")
	public List<StorehomeVO> nowall(){
		List<StorehomeVO> nowall = storeService.nowList();
		System.out.println("nowall : " + nowall);
		return nowall;
	}
	//푸드
	@RequestMapping("/bestfood.do")
	public List<StorehomeVO> nowfood(){
		System.out.println("??????????");
		List<StorehomeVO> nowall = storeService.bestfood();
		System.out.println("nowall : " + nowall);
		return nowall;
	}
	//패션ㅁ잡화
	@RequestMapping("/bestfashion.do")
	public List<StorehomeVO> bestfashion(){
		System.out.println("??????????");
		List<StorehomeVO> nowall = storeService.bestfashion();
		System.out.println("nowall : " + nowall);
		return nowall;
	}
	//테크
	@RequestMapping("/bestTect.do")
	public List<StorehomeVO> bestTect(){
		System.out.println("??????????");
		List<StorehomeVO> nowall = storeService.bestTect();
		System.out.println("nowall : " + nowall);
		return nowall;
	}
	//뷰티
	@RequestMapping("/bestbeauty.do")
	public List<StorehomeVO> bestbeauty(){
		System.out.println("??????????");
		List<StorehomeVO> nowall = storeService.bestbeauty();
		System.out.println("nowall : " + nowall);
		return nowall;
	}
	//베이비
	@RequestMapping("/bestbaby.do")
	public List<StorehomeVO> bestbaby(){
		List<StorehomeVO> nowall = storeService.bestbaby();
		return nowall;
	}
	//여행
	@RequestMapping("/bestTrip.do")
	public List<StorehomeVO> bestTrip(){
		List<StorehomeVO> nowall = storeService.bestTrip();
		return nowall;
	}
	//반려동물
	@RequestMapping("/bestpet.do")
	public List<StorehomeVO> bestpet(){
		List<StorehomeVO> nowall = storeService.bestpet();
		return nowall;
	}
	
	@RequestMapping("/storejson.do")
	public List<StorehomeVO> getList(String order, StorehomeVO vo){
		List<StorehomeVO> getlist = new ArrayList<StorehomeVO>();
		if(order.equals("c")) {
			getlist = storeService.getlistRecent();
		} else if(order.equals("s")) {
			getlist = storeService.getlistSatisfaction();
		} else if(order.equals("p")){
			getlist =  storeService.getlistPopular();
		} else {
			getlist = storeService.getList();
		}
		
		return getlist;
		
	}
	@RequestMapping("/storejson1.do")
	public List<StorehomeVO> storeList(StorehomeVO vo, String order, String cPage){
		
		//데이터 가져오기
		System.out.println("vo : " + vo);
		List<StorehomeVO> getlist = new ArrayList<StorehomeVO>();
		if(order.equals("p")) {
			getlist =  storeService.getlistPopular1(vo);
		} else if(order.equals("c")) {
			getlist = storeService.getlistRecent1(vo);
			return getlist;
		} else if(order.equals("s")) {
			getlist = storeService.getlistSatisfaction1(vo);
			return getlist;
		} else {
			getlist = storeService.getList1(vo);
		}
		return getlist;
		
	}
	
	@RequestMapping("/fashion.do")
	public List<StorehomeVO> fashion(String order){
		if(order == null) {
			List<StorehomeVO> getlist = storeService.getFashionList();
			return getlist;
		} else if(order.equals("c")) {
			List<StorehomeVO> getlist = storeService.getfashionRecent();
			return getlist;
		} else if(order.equals("s")) {
			List<StorehomeVO> getlist = storeService.getfashionSatisfaction();
			return getlist;
		} else {
			List<StorehomeVO> getlist =  storeService.getfashionPopular();
			return getlist;
		}
	}
	@RequestMapping("/food.do")
	public List<StorehomeVO> getFoodList(String order){
		if(order == null) {
			List<StorehomeVO> getlist = storeService.getFoodList();
			return getlist;
		} else if(order.equals("c")) {
			List<StorehomeVO> getlist = storeService.getfoodRecent();
			return getlist;
		} else if(order.equals("s")) {
			List<StorehomeVO> getlist = storeService.getfoodSatisfaction();
			return getlist;
		} else {
			List<StorehomeVO> getlist =  storeService.getfoodPopular();
			return getlist;
		}
	}
	
	@RequestMapping("/tech.do")
	public List<StorehomeVO> getTechList(String order){
		System.out.println("order : " + order);
		if(order == null) {
			List<StorehomeVO> getlist = storeService.getTechList();
			return getlist;
		} else if(order.equals("c")) {
			List<StorehomeVO> getlist = storeService.gettechRecent();
			return getlist;
		} else if(order.equals("s")) {
			List<StorehomeVO> getlist = storeService.gettechSatisfaction();
			return getlist;
		} else {
			List<StorehomeVO> getlist =  storeService.gettechPopular();
			return getlist;
		}
	}
	@RequestMapping("/beauty.do")
	public List<StorehomeVO> getbeautyList(String order){
		
		System.out.println("order : " + order);
		if(order == null) {
			List<StorehomeVO> getlist = storeService.getbeautyList();
			return getlist;
		} else if(order.equals("c")) {
			List<StorehomeVO> getlist = storeService.getbeautyRecent();
			return getlist;
		} else if(order.equals("s")) {
			List<StorehomeVO> getlist = storeService.getbeautySatisfaction();
			return getlist;
		} else {
			List<StorehomeVO> getlist =  storeService.getbeautyPopular();
			return getlist;
		}
	}
	@RequestMapping("/trip.do")
	public List<StorehomeVO> gettripList(String order) {
		System.out.println("order : " + order);
		if (order == null) {
			List<StorehomeVO> getlist = storeService.gettripList();
			System.out.println(getlist);
			return getlist;
		} else if (order.equals("c")) {
			List<StorehomeVO> getlist = storeService.gettripRecent();
			return getlist;
		} else if (order.equals("s")) {
			List<StorehomeVO> getlist = storeService.gettripSatisfaction();
			return getlist;
		} else {
			List<StorehomeVO> getlist = storeService.gettripPopular();
			return getlist;
		}
	}

	@RequestMapping("/baby.do")
	public List<StorehomeVO> getbabyList(String order){
		System.out.println("order : " + order);
		if (order == null) {
			List<StorehomeVO> getlist = storeService.getbabyList();
			return getlist;
		} else if (order.equals("c")) {
			List<StorehomeVO> getlist = storeService.getbabyRecent();
			return getlist;
		} else if (order.equals("s")) {
			List<StorehomeVO> getlist = storeService.getbabySatisfaction();
			return getlist;
		} else {
			List<StorehomeVO> getlist = storeService.getbabyPopular();
			return getlist;
		}
	}
	@RequestMapping("/pet.do")
	public List<StorehomeVO> getpetList(String order){
		if (order == null) {
			List<StorehomeVO> getlist = storeService.getpetList();
			return getlist;
		} else if (order.equals("c")) {
			List<StorehomeVO> getlist = storeService.getpetRecent();
			return getlist;
		} else if (order.equals("s")) {
			List<StorehomeVO> getlist = storeService.getpetSatisfaction();
			return getlist;
		} else {
			List<StorehomeVO> getlist = storeService.getpetPopular();
			return getlist;
		}
	}
	
	@RequestMapping("/orderDtail.do")
	public String orderDtail(@RequestBody StorehomeVO vo, Model model) {
		storeService.orderInsert(vo);
		StorehomeVO orderinfo = storeService.orderinfo(vo);
		model.addAttribute("orderinfo",orderinfo);
		return "store/StoreHome";
		
	}
	
	
}
