package com.makeit.controller.create;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.nio.channels.MembershipKey;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import java.util.logging.Logger;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionDefinition;
import org.springframework.transaction.TransactionStatus;
import org.springframework.transaction.support.DefaultTransactionDefinition;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.makeit.create.CreateService;
import com.makeit.create.MailHandler;
import com.makeit.create.TempKey;
import com.makeit.fund.FundVO;
import com.makeit.member.MemberVO;
import com.makeit.storehome.StorehomeVO;

@SessionAttributes("create")
@Controller
public class CreateController {

	@Autowired
	private CreateService createService;
	
	@Autowired
	private DataSourceTransactionManager transactionManager;
	
	@Autowired
	private JavaMailSender fundMailSender;
	
	public CreateController() {
		System.out.println(" >> CreateController()  ");
	}
		
	// fundIdx가져오기
	@RequestMapping("/create_Main.do")
	public String createGoMain(MemberVO mvo, FundVO fvo, HttpSession request, Model model, RedirectAttributes redirect) {
		System.out.println(" >> create_Main.do 실행 ");
		System.out.println("/create_Main.do - FundVO : " + fvo);
		
		MemberVO member = (MemberVO)request.getAttribute("user");
		System.out.println("/create_Main.do - member : " + member);
		
		String fundIdx = fvo.getFundIdx();
		System.out.println("fvo.getFundIdx() : " + fundIdx);
		
		//메인에서 이전 프로젝트 수정 눌렀을때
		if (fundIdx != null) {
			System.out.println("not null");
			System.out.println("수정 눌렀을때 fvo : " + fvo);
			request.setAttribute("fund", fvo);
			return "redirect:/Get_FundIdx.do";
		} else {
			//메인에서 새로 생성할때
			//fundIdx생성
			createService.newFundIdx(member);
			System.out.println("새로 생성 fvo  : " + fvo);
			request.setAttribute("fund", fvo);
			return "redirect:/Get_FundIdx.do";
		}
	}
	
	// 메인 이동
	@RequestMapping("/Get_FundIdx.do")
	public String getFundIdx(FundVO fvo, MemberVO mvo, HttpSession request, Model model, HttpServletRequest request2) {
		System.out.println(" >> Get_FundIdx.do 실행 ");
		System.out.println("/Get_FundIdx.do1 - fvo : " + fvo);

		  FundVO fundvo = (FundVO)request.getAttribute("fund");

	        if( fundvo.getFundIdx() !=null) {

	            //임시저장한 데이터있는가?
				FundVO notNullCheck = createService.notNullCheck(fundvo);
				System.out.println("notNullCheck : " + notNullCheck);
				
				List<FundVO> notNullCheckOption = createService.notNullCheckOption(fundvo);
				System.out.println("notNullCheck : " + notNullCheckOption);
				
				model.addAttribute("notNullCheck", notNullCheck);
				model.addAttribute("notNullCheckOption", notNullCheckOption);
				//프로젝트 새로 생성할때
	        } else {
	        	FundVO fund = createService.getFundIdx(fvo);
				System.out.println("가장 큰 fundIdx : " + fund);
				request.setAttribute("fund", fund);
	        }
		
		return "create/makeProjectMain";
	}
	
	// 요금제 선택 페이지 이동
	@RequestMapping("/create_pricing.do")
	public String createGoPricing(FundVO vo, HttpSession request, Model model) {
		System.out.println(" >> create 요금제 선택 페이지로 이동");
		
		//임시저장된 데이터 있는가?
		FundVO fund = (FundVO)request.getAttribute("fund");
		FundVO getSaveData = createService.getSaveData(fund);
		System.out.println("getSaveData : " + getSaveData);
		
		model.addAttribute("getSaveData", getSaveData);

		return "create/pricing";
	}

	// 요금제 vo받아와서 db에 저장하기
	@RequestMapping(value = "/saveData.do", method = RequestMethod.POST)
	@ResponseBody
	public String saveMembership(@RequestBody FundVO vo, HttpSession request, Model model) throws Exception {
		System.out.println("create_pricing.do - vo : " + vo);
		createService.saveMembership(vo);

		return "redirect:/create_pricing.do";
	}

	// 기본 정보 페이지 이동
	@RequestMapping("/create_infor.do")
	public String createGoBasicInfor(FundVO vo, HttpSession request, Model model) {
		System.out.println(" >> create 기본정보 페이지로 이동");
		
		//임시저장된 데이터 있는가?
		FundVO fund = (FundVO)request.getAttribute("fund");
		FundVO getSaveData = createService.getSaveData(fund);
		System.out.println("getSaveData : " + getSaveData);
		
		model.addAttribute("getSaveData", getSaveData);
		
		return "create/infor";
	}

	// 기본정보 update
	@RequestMapping(value = "/updateInfor.do", method = RequestMethod.POST)
	public String insertInfor(FundVO vo, HttpSession request) throws Exception {
		System.out.println(">>>>> 컨트롤러 - insertInfor");
		System.out.println("updateInfor vo1 : " + vo); //form값 받아옴
		
		//업로드될 실제 경로
		String uploadPath = request.getServletContext().getRealPath("/img/fundingMainImg/");
		System.out.println("uploadPath : " + uploadPath);
		
		MultipartFile uploadFile = vo.getUploadFile();
		//String fileRoot = "c:/mystudy/70_Spring/3rd_Project_makeit/src/main/webapp/img/fundingMainImg/";
		
		
		if (uploadFile == null) {
			System.out.println("::: 기본정보- 메인 이미지  uploadFile 파라미터가 전달되지 않았을때~");
		} else if (!uploadFile.isEmpty()) {
			String uploadname = vo.getFundIdx()+"_Main_"+uploadFile.getOriginalFilename();
			System.out.println("::: 메인사진 - 저장된 파일명 : " + uploadname);
			
			vo.setFundMainImg(uploadname);
			uploadFile.transferTo(new File(uploadPath, uploadname));
		}
		createService.updateInfor(vo);

		return "redirect:/create_infor.do";
	}

	// 스토리 이동
	@RequestMapping("/create_story.do")
	public String createGoStory(FundVO vo, HttpSession request, Model model) {
		System.out.println(" >> create 스토리 페이지로 이동");

		FundVO fund = (FundVO)request.getAttribute("fund");
		FundVO getSaveData = createService.getSaveData(fund);
		System.out.println("getSaveData : " + getSaveData);
		
		model.addAttribute("getSaveData", getSaveData);
		
		return "create/story";
	}

	// 스토리 update
	@ResponseBody
	@RequestMapping(value = "/file-upload.do", method = RequestMethod.POST)
	public String fileUpload(FundVO vo,
			@RequestParam("article_file") List<MultipartFile> multipartFile
			, HttpServletRequest request, HttpSession request2) {
		String result = "";
		
		//업로드될 실제 경로
		String uploadPath = request.getServletContext().getRealPath("/img/fundingStoryImg/");
		System.out.println("스토리 uploadPath : " + uploadPath);
		
		String fundDetailImg = "";
		try {
			// 파일이 있을때 탄다.
			if(multipartFile.size() > 0 && !multipartFile.get(0).getOriginalFilename().equals("")) {
				for(MultipartFile file:multipartFile) {
					String uploadname = vo.getFundIdx()+"_Story_"+file.getOriginalFilename();
					System.out.println("스토리 사진 저장 이름: " + uploadname);
					File targetFile = new File(uploadPath, uploadname);	
					try {
						InputStream fileStream = file.getInputStream();
						FileUtils.copyInputStreamToFile(fileStream, targetFile); //파일 저장
						 fundDetailImg = fundDetailImg + uploadname + ";" ; 
						
						vo.setFundDetailImg(fundDetailImg);
						System.out.println("vo1 : " + vo);
						
					} catch (Exception e) {
						//파일삭제
						FileUtils.deleteQuietly(targetFile);//저장된 현재 파일 삭제
						e.printStackTrace();
						break;
					}
				}
				createService.updateStory(vo);
				System.out.println("스토리 1");
				result = "Y";
				return result;
			}
			// 파일 아무것도 첨부 안했을때 탄다.
			else
				System.out.println("스토리 2");
				result = "N";
				return result;
		}catch(Exception e){
			e.printStackTrace();
		}
		return result;
	}
	
	// 옵션 페이지 이동
	@RequestMapping("/create_reward.do")
	public String createGoReward(FundVO vo, HttpSession request, Model model) {
		System.out.println(" >> create 리워드 페이지로 이동");
		
		//저장된 데이터 있는가?
		FundVO fund = (FundVO)request.getAttribute("fund");
		List<FundVO> getSaveOptionData = createService.getSaveOptionData(fund);
		System.out.println("getSaveOptionData : " + getSaveOptionData);
		
		model.addAttribute("getSaveOptionData", getSaveOptionData);

		return "create/reward";
	}
	
	//옵션 저장
	@PostMapping(value = "/url.do")
	public String jsonList(@RequestParam Map params, HttpSession request) throws Exception {
	    String json = params.get("resArr").toString();
	    ObjectMapper mapper = new ObjectMapper();
	    List<FundVO> resArr = mapper.readValue(json, new TypeReference<ArrayList<FundVO>>(){});
	    System.out.println("resArr : " + resArr);
	    
	    FundVO fund = (FundVO)request.getAttribute("fund");
	    System.out.println("fund :  " + fund);
	    
	    createService.deleteReward(fund);
	    
	    System.out.println("resArr.size() : " + resArr.size());
	    if (resArr.size() > 0 ) {
		    createService.insertReward(resArr);
	    }
		return "redirect:/create_reward.do";
	}

	@RequestMapping("/create_maker.do")
	public String createMaker(FundVO vo, HttpSession request, Model model) {
		System.out.println(" >> create 메이커 페이지로 이동");
		
		//임시저장된 데이터 있는가?
		FundVO fund = (FundVO)request.getAttribute("fund");
		FundVO getSaveData = createService.getSaveData(fund);
		System.out.println("getSaveData : " + getSaveData);
		
		model.addAttribute("getSaveData", getSaveData);

		return "create/maker";
	}
	
	//멤버로 추가할 이메일이 가입된 이메일인지 & 이미 추가한 이메일인지 확인 -ajax
	@ResponseBody
	@RequestMapping(value = "/checkMemberEmail.do", method = RequestMethod.POST)
	public String checkMemberEmail(FundVO vo, HttpSession request) throws IllegalStateException, IOException {
		System.out.println(">>>>> 컨트롤러 - checkMemberEmail");
		System.out.println("vo : " + vo);
		String result = "N";
		
		MemberVO mvo = createService.checkMemberEmail(vo);
		int resultCnt = createService.checkMemberEmail2(vo);
		System.out.println("resultCnt : " + resultCnt);
		System.out.println("mvo : " + mvo);
		
		if(mvo.getMemberEmail() != null && resultCnt == 0) 
			result = "Y";
		
		return result;
	}
	
	// 메이커 update
	@RequestMapping(value = "/updateMaker.do", method = RequestMethod.POST)
	public String updateMaker(FundVO vo, HttpSession request) throws IllegalStateException, IOException {
		System.out.println(">>>>> 컨트롤러 - updateMaker");
		System.out.println("vo : " + vo);
		
		//업로드될 실제 경로
		String uploadPath = request.getServletContext().getRealPath("/img/makerImg/");
		System.out.println("uploadPath : " + uploadPath);
		//String fileRoot = "c:/mystudy/70_Spring/3rd_Project_makeit/src/main/webapp/img/makerImg/";
		MultipartFile uploadFile = vo.getUploadFile();

		if (uploadFile == null) {
			System.out.println("::: 메이커 등록 - 메인 이미지  uploadFile 파라미터가 전달되지 않았을때~");
		} else if (!uploadFile.isEmpty()) {
			String uploadname = vo.getFundIdx()+"_Maker_"+uploadFile.getOriginalFilename();
			System.out.println("::: 메이커 사진 저장된 파일명 : " + uploadname);

			vo.setFundMakerImg(uploadname);
			uploadFile.transferTo(new File(uploadPath, uploadname));
		}
		createService.updateMaker(vo);
	
		System.out.println("리턴?");
		return "redirect:/create_maker.do";
	}
	
		//미리보기할 데이터 불러오기 -ajax
		@ResponseBody
		@RequestMapping(value = "/preview.do", method = RequestMethod.POST)
		public String preview(FundVO vo, HttpSession request) throws IllegalStateException, IOException{
			System.out.println(">> 미리보기할 데이터 불러오기");
			System.out.println("vo : " + vo); 
			String result = "N";
			
			//1. 미리보기 할 데이터 불러오기
			FundVO finalData = createService.getSaveVo(vo);
			System.out.println("finalData : " + finalData);
			List<FundVO> finalOptionData = createService.getSaveOptionVo(finalData); 
			System.out.println("finalOptionData : " + finalOptionData);
			
			//2. 세션저장
			request.setAttribute("previewData", finalData);
			request.setAttribute("previewOptionData", finalOptionData);
			
			if(finalData.getFundTitle() != null) 
				result = "Y";
			
			return result;
		}
		
		//미리보기 창 띄우기
		@RequestMapping("/previewOpen.do")
		public String previewOpen() {
			return "create/preview";
		}
		
	
	//펀딩 페이지에 최종 등록
	@RequestMapping("/getSaveVo.do")
	public String getSaveVo(FundVO vo, HttpSession request) throws MessagingException, UnsupportedEncodingException {
		System.out.println(">> 최종 vo idx 불러오기");
		System.out.println("vo : " + vo);

		//최종 등록 전 데이터 불러오기
		FundVO finalData = createService.getSaveVo(vo); 
		System.out.println("finalData : " + finalData);
		List<FundVO> finalOptionData = createService.getSaveOptionVo(finalData); 
		System.out.println("finalOptionData : " + finalOptionData);
		
		//추가한 멤버 있다면 메일 보내기
		String fundIdx = finalData.getFundIdx();
		String email = finalData.getFundTeamMember();
		System.out.println("fundIdx : " + fundIdx + ", email : " + email);
		
		//"aaa@gmail.com, bbb@gmail.com" 을 콤마로 잘라 list에 넣기
		
		if (email != null ) {
			ArrayList<String> list = new ArrayList<>(Arrays.asList(email.split("\\s*,\\s*")));
			for(int i=0; i<list.size(); i++){
				vo.setFundTeamMember(list.get(i)); //list.get(0) : aaa@gmail.com
				vo.setFundIdx(fundIdx);
				
				String key = new TempKey().getKey(10, false);
				System.out.println("key : " + key);
				vo.setAuthkey(key);
				
				System.out.println("이메일 : " + list.get(i));
				MailHandler sendMail = new MailHandler(fundMailSender);
		        
		        sendMail.setSubject("[메이크잇] 새로운 펀딩 프로젝트의 멤버로 초대해요.]");
		        sendMail.setText(new StringBuffer().append("<h2>메이크잇의 새로운 펀딩 프로젝트의 멤버로 초대해요.</h2>")
		        	
		        	//fundIdx와 email이 일치하는 데이터만 컨트롤러 emailConfirm.do으로 이동
		            .append("<a style='font-size:17px;' href='http://localhost:8081/biz/emailConfirm.do?fundIdx="+fundIdx+"&email=")
		            .append(list.get(i)).append("&key=").append(key)
		            .append("' target='_blenk'>수락하시려면 이곳을 눌러주세요</a>").toString());
		        sendMail.setFrom("hong221208@gmail.com", "메이크잇");
		        sendMail.setTo(list.get(i));
		        sendMail.send();
		        
		        System.out.println("메일보내기 끝");
		        
		      //db에 멤버 이름, 이메일, fundIdx, 상태 저장
		        createService.createAuthkey(vo);
			}
		}
		//최종등록
		createService.saveFund(finalData);
		createService.saveFundOption(finalOptionData);
		
        return "redirect:/fundingPageAll.do";
		
	}
	
	/**************************************************/
	//내펀딩 리스트 
	@RequestMapping("/getMyFundList.do")
	public String getBoardList(FundVO vo, HttpSession request) {
		System.out.println(">> 내 펀딩 목록 보여주기");
		System.out.println("vo : " + vo);

		List<FundVO> list = createService.getMyFundList(vo);
		System.out.println("list : " + list);
		
		request.setAttribute("myFundList", list);
		
		return "create/myfunding";
	}
	
	/**************************************************/
	//펀딩 현황
	@RequestMapping("/fundStatus.do")
	public String pundStatus(FundVO vo, StorehomeVO svo, HttpSession request) {
		System.out.println(">> 펀딩 현황");
		FundVO fund;
		if (vo.getFundTitle() != null) {
			request.setAttribute("fundTitle", vo);
		} else {
			vo = (FundVO)request.getAttribute("fundTitle");
		}
		fund = createService.fundStatus(vo);
		System.out.println("펀딩현황 fund : " + fund);
		request.setAttribute("fundStatus", fund);
		
		//결제 현황 가져오기
		List<StorehomeVO> orderList = createService.fundStatusOrderList(fund);
		request.setAttribute("orderList", orderList);
		
		//멤버 목록 가져오기
		List<FundVO> memberList = createService.fundStatusMemberList(fund);
		request.setAttribute("myFundMemberList", memberList);
		return "create/fundStatus";
	}
	
	
	//좋아요 수, 결제 후원자 수
	@ResponseBody
	@RequestMapping(value = "/likeOrderCnt.do", method = RequestMethod.POST)
	public Map<String, String> findLikeCnt(FundVO vo) throws IllegalStateException, IOException {
		System.out.println("jyLikeCnt vo : " + vo);
		String likeCnt = createService.findLikeCnt(vo);
		String orderCnt = createService.findOrderCnt(vo);
		
		System.out.println("좋아요 개수 : " + likeCnt);
		System.out.println("결제 후원자 수 : " + orderCnt);
		
		Map<String, String> map = new HashMap<>();
		map.put("likeCnt",likeCnt);
		map.put("orderCnt",orderCnt);
		return map;
	}
	
	
	//멤버 삭제하기 - ajax
	@ResponseBody
	@RequestMapping(value = "/memberDelete.do", method = RequestMethod.POST)
	public void memberDelete(FundVO vo, HttpSession request) throws IllegalStateException, IOException {
		System.out.println("getFundTeamMember : " + vo);
		createService.memberDelete(vo);
	}
	
	//추가한 멤버에게 메일 보내기
	@ResponseBody
	@RequestMapping(value="/memberPlus.do", method = RequestMethod.POST)
    public void fundSendMail(FundVO vo, HttpSession request) throws Exception {
		System.out.println("memberPlus.do 컨트롤러");
    	
        String email = vo.getFundTeamMember();
        String fundIdx = vo.getFundIdx();
        System.out.println("email : " + email + " & fundIdx : " + fundIdx);
        ArrayList<String> list = new ArrayList<>(Arrays.asList(email.split("\\s*,\\s*")));
        
        if (email != null ) {
			for(int i=0; i<list.size(); i++){
		        //vo에 저장
				vo.setFundTeamMember(list.get(i));
				vo.setFundIdx(fundIdx);
				
				//이메일에 표시하기 위해 초대한 회원 아이디 불러오기
		        MemberVO memberId = (MemberVO)request.getAttribute("user");
		        String senderId = memberId.getMemberId();
		        
				//인증키 생성
				String key = new TempKey().getKey(10, false);
				System.out.println("key : " + key);
				
				System.out.println("이메일 : " + list.get(i));
				MailHandler sendMail = new MailHandler(fundMailSender);
		        
		        sendMail.setSubject("[메이크잇] 새로운 펀딩 프로젝트의 멤버로 초대해요.]");
		        sendMail.setText(new StringBuffer().append("<h2>" + senderId +"님이 메이크잇의 새로운 펀딩 프로젝트의 멤버로 초대해요.</h2>")
		        	//fundIdx와 email이 일치하는 데이터만 컨트롤러 emailConfirm.do으로 이동
		            .append("<a style='font-size:17px;' href='http://localhost:8081/biz/emailConfirm.do?fundIdx="+fundIdx+"&email=")
		            .append(list.get(i)).append("&key=").append(key)
		            .append("' target='_blenk'>수락하시려면 이곳을 눌러주세요</a>").toString());
		        sendMail.setFrom("hong221208@gmail.com", "메이크잇");
		        sendMail.setTo(list.get(i));
		        sendMail.send();
		        
		        System.out.println("메일보내기 끝");
		        
		        //db에 멤버 이름, 이메일, fundIdx, 상태 저장
		        createService.createAuthkey(vo);
			}
		}
        
      }
	
	
	// 이메일 인증 확인하면 나오는 경로
	  @RequestMapping(value = "/emailConfirm.do", method = RequestMethod.GET)
	  public String emailConfirm(String email, String fundIdx,FundVO vo, Model model) throws Exception {
	      // authstatus 권한 상태 '멤버 등록'으로 변경
		  vo.setFundTeamMember(email);
		  vo.setFundIdx(fundIdx);
		  createService.updateAuthstatus(vo);

	      model.addAttribute("email", email);

	      System.out.println("email : " + email);
	      return "create/emailConfirm";
	  }
	

  	
}
