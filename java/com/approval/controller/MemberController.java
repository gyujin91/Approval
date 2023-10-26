package com.approval.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.approval.dto.ApprovalDTO;
import com.approval.service.ApprovalService;
import com.approval.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	// 객체 주입
	@Autowired
	MemberService memberService;
	
	@Autowired
	ApprovalService approvalService;
	
	@Autowired
	HttpSession session;
	
	@Inject
	SqlSession sqlSession;
	
	@Autowired
	BCryptPasswordEncoder pwdEncoder;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
		
	// 로그인
	@RequestMapping(value="loginCheck.do", method = RequestMethod.POST)
	public String loginCheck(Model model, @RequestParam String userId, @RequestParam String userPw){
		Map<String, Object> loginMap = memberService.loginCheck(userId);
		String url = ""; 
		
		if(loginMap == null) {
			model.addAttribute("loginCheck", "useridFail");
			url = "home";
		} else if(!userPw.equals(loginMap.get("USERPW").toString())) {
			model.addAttribute("loginCheck", "userpwFail");
			url = "home"; 
		} else {
			session.setAttribute("loginMap", loginMap);
			url = "redirect:/member/approvalList.do";
		}
		return url;
	}
	
	// 로그아웃
	@RequestMapping(value="logOut.do")
	public String logOut(HttpSession session) throws Exception {
		// 세션 날리고 로그아웃
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 결재 게시판 출력
	@RequestMapping(value="approvalList.do")
	public String approvalList(Model model, @RequestParam Map<String, Object> map, @RequestParam Map<String, Object> map1, HttpSession session, HttpServletRequest request) throws Exception {
		map.put("loginMap", session.getAttribute("loginMap"));
		
		if(map.get("loginMap") != null) {
			if(map1.isEmpty()) {
				map1.put("pageNo", 1);
				map1.put("listSize", 10);
			}
			List<ApprovalDTO> approvalList = approvalService.approvalList(map);
			Map<String, Object> pageMap = approvalService.page(map1);
			
			model.addAttribute("approvalList", approvalList);
			model.addAttribute("loginMap", map);
			model.addAttribute("pageMap", pageMap);
			model.addAttribute("searchType", request.getParameter("searchType") == null ? "select" : request.getParameter("searchType"));
			model.addAttribute("searchType2", request.getParameter("searchType2") == null? "select" : request.getParameter("searchType2"));
			
			System.out.println("request.getParameter(\"searchType\") :: " + request.getParameter("searchType"));
			System.out.println("request.getParameter(\"searchType2\") :: " + request.getParameter("searchType2"));
		}
		return "approval/approvalList";
	}
	
	// ajax(비동기)
	@RequestMapping("searchAjax.do")
	public String searchAjax(Model model, @RequestParam Map<String, Object> map, @RequestParam Map<String, Object> map1, HttpServletRequest request) throws Exception {
		List<ApprovalDTO> approvalList = approvalService.approvalList(map);
		Map<String, Object> pageMap = approvalService.page(map1);
		
		model.addAttribute("approvalList", approvalList);
		model.addAttribute("map", map);
		model.addAttribute("pageMap", pageMap);
		model.addAttribute("searchType", request.getParameter("searchType") == null ? "select" : request.getParameter("searchType"));
		model.addAttribute("searchType2", request.getParameter("searchType2") == null? "select" : request.getParameter("searchType2"));
		return "approval/searchAjax";
	}
	
	// 게시판 등록 / 상세보기 폼 이동
	@RequestMapping(value="writeForm.do")
	public String approvalWrite(Model model, Map<String, Object> map) throws Exception {
		int bnum = approvalService.maxBno();
		map.put("bnum", String.valueOf(bnum));
		model.addAttribute("bnum", bnum);
		return "approval/approvalWriteForm";
	}
	
	// 게시판 등록 
	@RequestMapping(value="approvalWrite.do")
	public String approvalWriteForm(Model model, ApprovalDTO dto) throws Exception {
		System.out.println(1);
		System.out.println("dto :: " + dto.toString());
		approvalService.approvalWrite(dto);
		System.out.println(2);
		return "redirect:approvalList.do";
	}
	
	// 게시판 상세보기
	@RequestMapping(value="approvalRead.do", method = RequestMethod.GET)
	public String approvalRead(@RequestParam int bno, Model model) throws Exception {
		ApprovalDTO dto = approvalService.approvalRead(bno);
		model.addAttribute("dto", dto);
		return "approval/approvalWriteForm";
	}
	
	// 게시판 수정
	@RequestMapping(value="approvalUpdate.do")
	public String approvalUpdate(ApprovalDTO dto) throws Exception {
		approvalService.ApprovalUpdate(dto);
		return "redirect:approvalList.do";
	}
	
	// 게시판 삭제
	@RequestMapping(value="approvalDelete.do")
	public String approvalDelete(@RequestParam int bno) throws Exception {
		approvalService.ApprovalDelete(bno);
		return "redirect:approvalList.do";
	}
	
	
	
}
