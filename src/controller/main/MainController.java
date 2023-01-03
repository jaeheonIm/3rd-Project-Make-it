package com.makeit.controller.main;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.makeit.fund.FundVO;
import com.makeit.main.CSVO;
import com.makeit.main.ChatRoomVO;
import com.makeit.main.MainService;
import com.makeit.main.Paging;
import com.makeit.storehome.StorehomeVO;



@Controller
@SessionAttributes({"memberId","roomNumber","adminId","cPage"})
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	public MainController() {
	}
//========================================Main=================================================//
	//메인페이지 등장!!
	@RequestMapping("/main.do")
	public String mainOpen(@RequestParam(value="",defaultValue = "",required = false)String memberId,Model model) {
		System.out.println("(mainOpen)memberId:"+memberId);		
		List<FundVO> banner =  mainService.getMainBanner();
		List<FundVO> pick =  mainService.getMainPick();
		List<FundVO> ranklist =  mainService.getMainRank();		
		List<StorehomeVO> popularlist =  mainService. getStorePopularity();
		List<FundVO> fundFeed = mainService.getFundReview();
		if(!memberId.equals("")) { //회원에게만 보이는 ........항목
			List<FundVO> likelist = mainService.getMemberLike(memberId);
			model.addAttribute("likelist",likelist);//좋아할~
		}
		List<FundVO> expirelist = mainService.getfundExpire();
		List<FundVO> fundlikelist = mainService.getFundLike();
		List<FundVO> openlist = mainService.getTodayOpen();
		List<FundVO> nextdaylist = mainService.getNextdayOpen();
		Map<String, Object> map = mainService.getMainFollow(memberId);
		model.addAttribute("banner",banner);//배너
		model.addAttribute("picklist",pick);//취향맞춤
		model.addAttribute("ranklist",ranklist);//실시간랭킹
		model.addAttribute("popularlist",popularlist);//스토어추천제품
		model.addAttribute("fundFeed",fundFeed);//피드
		model.addAttribute("expirelist",expirelist);//#마감임박
		model.addAttribute("fundlikelist",fundlikelist);//#좋아한
		model.addAttribute("openlist",openlist);//오늘오픈한
		model.addAttribute("nextdaylist",nextdaylist);//오픈예정인
		model.addAttribute("list",map.get("list"));//팔로우리스트(MemberVO타입)
		model.addAttribute("followfundlist",map.get("followlist"));//팔로우펀딩리스트(FundVO타입)
		model.addAttribute("memberId",memberId);
		return "main/main";
	}
	
	//ajax용 피드가져오기
	@RequestMapping("/mainFeedAjax.do")
	@ResponseBody
	public Map<String, Object> mainFeedAjax(@RequestParam("category") String category) {
		List<Object> feedlist = mainService.mainFeedAjax(category);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("feedlist",feedlist);
		map.put("category",category);
		return map;
	}
	
	//ajax용 실시간 랭킹가져오기
	@RequestMapping("/mainrankAjax.do")
	@ResponseBody
	public Map<String, Object> mainrankAjax(@RequestParam("category") String category) {
		List<Object> ranklist = mainService.mainrankAjax(category);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ranklist",ranklist);
		map.put("category",category);
		return map;
	}
	
	//ajax용 찜하기 여부
	@RequestMapping("/mainFundLikeAjax.do")
	@ResponseBody
	public int mainFundLikeAjax(@RequestParam("fundIdx") String fundIdx,@ModelAttribute("memberId")String memberId) {
		int likeresult = mainService.mainFundLikeAjax(fundIdx,memberId);
		return likeresult;
	}
	
//========================================Notice=================================================//
	//공지사항 첫페이지 등장!!
	@RequestMapping("/notice.do")
	public String notice(Model model, @ModelAttribute("page")Paging page,@RequestParam(value="",defaultValue = "",required = false)String memberId) {
		System.out.println("memberId:"+memberId);
		List<CSVO> list = paging(page,"total","");
		model.addAttribute("list",list);
		model.addAttribute("noticeCnt",mainService.getNoticeCategoryCnt("NOTICE"));
		model.addAttribute("eventCnt",mainService.getNoticeCategoryCnt("EVENT"));
		model.addAttribute("cPage",page.getcPage());
		model.addAttribute("memberId", memberId);
		return "main/notice";
	}
	//공지사항 NOTICE 
	@RequestMapping("/notice_NOTICE.do")
	public String notice_NOTICE(Model model, @ModelAttribute("page")Paging page,@RequestParam String category,@ModelAttribute("memberId") String memberId) {
		System.out.println("memberId:"+memberId);
		List<CSVO> list = paging(page,"NOTICE","");
		model.addAttribute("list",list);
		model.addAttribute("noticeCnt",mainService.getNoticeCategoryCnt("NOTICE"));
		model.addAttribute("eventCnt",mainService.getNoticeCategoryCnt("EVENT"));
		model.addAttribute("cPage",page.getcPage());
		return "main/notice_NOTICE";
	}
	//공지사항 EVENT 
	@RequestMapping("/notice_EVENT.do")
	public String notice_EVENT(Model model, @ModelAttribute("page")Paging page,@RequestParam String category,@ModelAttribute("memberId") String memberId) {
		System.out.println("memberId:"+memberId);
		List<CSVO> list = paging(page,"EVENT","");
		model.addAttribute("list",list);
		model.addAttribute("noticeCnt",mainService.getNoticeCategoryCnt("NOTICE"));
		model.addAttribute("eventCnt",mainService.getNoticeCategoryCnt("EVENT"));
		model.addAttribute("cPage",page.getcPage());
		return "main/notice_EVENT";
	}

	//검색 출력(ajax)
	@RequestMapping("/titleSearch.do")
	@ResponseBody
	public Map<String, Object> titleSearch(@RequestParam("search")String searchword,@ModelAttribute("page")Paging page) {
		List<CSVO> list = paging(page,"total",searchword);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list",list);
		map.put("page",page);
		map.put("searchword",searchword);
		return map;
	}	
	//게시글 상세보기
	@RequestMapping("/notice_detail.do")
	public String noticeDetail(@RequestParam("csIdx")int idx, Model model,@ModelAttribute("memberId")String memberId,@ModelAttribute("cPage")String cPage,
			@RequestParam(value="",defaultValue = "",required = false)String category) {
		Map<String, Object> map = mainService.noticeDetail(idx);
		System.out.println("memberId:"+memberId);
		int result = mainService.heartYNCnt(idx,memberId);
		model.addAttribute("result",result);
		model.addAttribute("vo",map.get("vo"));
		model.addAttribute("imgArr",map.get("imgArr"));
		model.addAttribute("csIdx",idx);
		model.addAttribute("cPage",cPage);
		model.addAttribute("category",category);
		return "main/notice_detail";
	}
	//게시글에 하트('좋아요')기능
	@RequestMapping("/heartUpdate.do")
	@ResponseBody
	public Map<String, Object> heartUpdate(@RequestParam("csIdx")int csIdx,@ModelAttribute("memberId")String memberId) {

		Map<String, Object> map=new HashMap<String, Object>();
		if(memberId.equals("")) {
			map.put("memberId",memberId);
			return map;
		}else {
			map = mainService.heartYN(csIdx,memberId);
			map.put("memberId",memberId);
			return map;
		}
	}
	
	
	//paging 처리 공통함수
	public List<CSVO> paging(Paging page,String category, String searchword){
		if(category.equals("total")) {
			if(searchword.equals("")) {
			page.setTotalRecord(mainService.getNoticeTotalCnt());
			page.setTotalPage();
			}else {
				page.setTotalRecord(mainService.getSearchwordTotalCnt(searchword));
				page.setTotalPage();		
			}
		}else {
			page.setTotalRecord(mainService.getNoticeCategoryCnt(category));
			page.setTotalPage();
		}
		if(page.getcPage()!=0) {
			page.setNowPage(page.getcPage());
		}
		page.setEnd(page.getNowPage() * page.getNumPerPage());
		page.setBegin(page.getEnd() - page.getNumPerPage() + 1);
		
		if (page.getEnd()>page.getTotalRecord()) {
			page.setEnd(page.getTotalRecord());
		}
		int nowPage = page.getNowPage();
		int beginPage = (nowPage -1) / page.getNumPerBlock() * page.getNumPerBlock() + 1;
		page.setBeginPage(beginPage);
		page.setEndPage(beginPage + page.getNumPerBlock() -1);

		if(page.getEndPage() > page.getTotalPage()) {
			page.setEndPage(page.getTotalPage());
		}
		if(category.equals("total")) {
			if(searchword.equals("")) {
				List<CSVO> list = mainService.getNoticeList(page.getBegin(), page.getEnd());
				return list;
			}else {
				List<CSVO> list = mainService.getSearchList(page.getBegin(), page.getEnd(),searchword);
				return list;
			}
		}else {
			List<CSVO> list = mainService.getNoticeCategoryList(page.getBegin(), page.getEnd(),category);			
			return list;
		}
	}
//========================================Q&A===================================================//
	//Q&A 첫페이지 등장!!
	@RequestMapping("/Mainqna.do")
	public String qnaOpen(@RequestParam(value="",defaultValue = "",required = false)String memberId, Model model) {
		System.out.println("(mainOpen)memberId:"+memberId);		
		model.addAttribute("memberId",memberId);
		return "main/qna";
	}
	
	@Autowired
	private JavaMailSenderImpl mailSender;

	//이메일로 문의하기
	@RequestMapping(value="/mail.do", produces="text/html; charset=UTF-8")
	@ResponseBody
    public String sendMail(ChatRoomVO chatvo,@ModelAttribute("memberId")String memberId) throws IllegalStateException, IOException{		
		String msg = "";
		try {
        	MimeMessage message = mailSender.createMimeMessage();
        	MimeMessageHelper helper = new MimeMessageHelper(message,true, "UTF-8");
        	helper.setTo(chatvo.getFromemail()); //관리자에게보내기(=관리자메일)
        	if(memberId.equals("")) {
        		helper.setReplyTo(new InternetAddress(chatvo.getEmail(),chatvo.getName(), "UTF-8")); // 답장받을 주소
        	}else {
        		helper.setReplyTo(new InternetAddress(chatvo.getEmail(),chatvo.getName()+"&"+memberId, "UTF-8")); // 답장받을 주소
        	}
        	helper.setSubject(chatvo.getTitle());
			helper.setText(chatvo.getMessage());
			MultipartFile fileupload = chatvo.getFileupload();
			if(fileupload == null) {
			}else if(!fileupload.isEmpty()) {
				String fileName = fileupload.getOriginalFilename();
				fileupload.transferTo(new File("C:MyStudy/temp/"+fileName));
				FileSystemResource file = new FileSystemResource((new File("C:MyStudy/temp/"+fileName)));
				helper.addAttachment(fileName, file);			
			}			
			mailSender.send(message);

			msg +="<script> alert('문의사항이 등록되었습니다. 2-3일 이후에 답변 이메일을 확인하세요.'); location.href=\"Mainqna.do?memberId="+memberId+"\"</script>";
		} catch (MessagingException e) {
			msg +="<script>alert('문의사항 등록에 실패하였습니다.다시 시도해 주세요.'); location.href=\"Mainqna.do?memberId="+memberId+"\"</script>";
			e.printStackTrace();
		}
		return msg;
	}

	//채팅창으로 가기(고객용)
	@RequestMapping("/chat_go_client.do")
	public String chat(Model model,@ModelAttribute("memberId")String memberId ) {
		int num = mainService.chatNumberSearch(memberId);
		model.addAttribute("roomNumber", String.valueOf(num));
		return "main/chat_go_client";
	}
	//채팅창으로 가기(상담사용)
	@RequestMapping("/chat_go_adm.do")
	public String chat_adm(Model model,@RequestParam HashMap<String, Object> params ) {

		List<String> conversation = mainService.getconversation(params.get("roomNumber"));
		model.addAttribute("roomName", params.get("roomName"));
		model.addAttribute("roomNumber", params.get("roomNumber"));
		model.addAttribute("conversation", conversation);
		return "main/chat_go_adm";
	}
	
	//상담목록(관리자페이지)으로 가기 
	@RequestMapping("/adminChat.do")
	public String adminChat(Model model) {
		return "main/adminChat";
	}
	//상담원채팅방 강제종료
	@RequestMapping("/adminChatDelete.do")
	public String adminChatDelete(@RequestParam String roomNumber, Model model) {
		mainService.deleteChatRoom(roomNumber);
		return "redirect:adminChat.do";
	}
	//방정보가져오기
	@RequestMapping("/getRoom.do")
	@ResponseBody 
	public List<ChatRoomVO> getRoom(@RequestParam HashMap<Object, Object> params){
		List<ChatRoomVO> list = mainService.getChatRoomList();
		return list;
	}



//========================================Follow=================================================//	
	//팔로우 첫페이지 등장!!
	@RequestMapping("/follow.do")
	public String followOpen(Model model,@RequestParam("memberId")String memberId ) {
		Map<String, Object>  map =  mainService.getFollowMemberList(memberId);
		model.addAttribute("memberlist",map.get("memberlist"));
		model.addAttribute("followinglist",map.get("followinglist"));
		model.addAttribute("memberId", memberId);
		return "main/follow";
	}
	//ajax 팔로우 추가 및 삭제
	@RequestMapping("/mainfollow.do")
	@ResponseBody
	public int followAdd(String followmemberId,@ModelAttribute("memberId")String memberId) {
		int result =  mainService.followAdd(followmemberId,memberId);
		return result;
	}
//========================================Profile===============================================//	
	//프로필 첫페이지 등장!!
	@RequestMapping("/profile.do")
	public String profileOpen(@RequestParam("profileId")String profileId,Model model,@ModelAttribute("memberId")String memberId) {
		Paging paging = new Paging();
		Map<String, Object> map = mainService.getProfileInfo(profileId,memberId);		
		model.addAttribute("profilevo",map.get("profilevo"));
		model.addAttribute("fundlist",map.get("fundlist"));
		model.addAttribute("following",map.get("following"));
		model.addAttribute("follower",map.get("follower"));
		model.addAttribute("fundcnt",map.get("fundcnt"));
		model.addAttribute("followinglist",map.get("followinglist"));
		model.addAttribute("paging", paging);
		return "main/profile";
	}
	
	//ajax 더보기 페이징 처리
	@RequestMapping("/profileMoreAjax.do")
	@ResponseBody
	public List<FundVO> profileMoreAjax(String profileid, String category) {
		List<FundVO> fundlist =  mainService.getFundList(profileid,category);
		return fundlist;
	}
	
	//ajax 항목이동 
	@RequestMapping("/profileColumAjax.do")
	@ResponseBody
	public Map<String, Object> profileColumAjax(String profileid,String category) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<FundVO> fundlist =  mainService.profileColumAjax(profileid,category);
		Paging page;
		map.put("paging",new Paging());
		map.put("fundlist",fundlist);
		return map;
	}
	
	
//========================================Feed=================================================//	
	
	//피드 첫페이지 등장!!
	@RequestMapping("/feed.do")
	public String feedOpen(@RequestParam(value="",defaultValue = "",required = false)String memberId,Model model) {
		Paging page = new Paging();
		String category = "FUND";
		Map<String, Object> map = mainService.getFeedList(memberId,category);
		model.addAttribute("flist",map.get("list"));
		model.addAttribute("mlist",map.get("memberlist"));
		model.addAttribute("memberId",memberId);
		model.addAttribute("followinglist",map.get("followinglist"));
		return "main/feed";
	}
	
	//ajax 피드가져오기
	@RequestMapping("/ajaxFundFeed.do")
	@ResponseBody
	public Map<String, Object> ajaxFundFeed(@ModelAttribute("memberId")String memberId,String category) {
		Map<String, Object> map = mainService.getFeedList(memberId,category);
		map.put("category", category);
		return map;
	}

}
