package com.approval.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
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

import com.approval.dto.ApprovalDTO;
import com.approval.service.ApprovalService;
import com.approval.service.MemberService;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	// ��ü ����
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
		
	// �α���
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
			url = "redirect:approvalList.do";
		}
		return url;
	}
	
	// �α׾ƿ�
	@RequestMapping(value="logOut.do")
	public String logOut(HttpSession session) throws Exception {
		// ���� ������ �α׾ƿ�
		session.invalidate();
		
		return "redirect:/";
	}
	
	// ���� �Խ��� ���
	@RequestMapping(value="approvalList.do")
	public String approvalList(Model model, @RequestParam Map<String, Object> map, HttpSession session) throws Exception {
		map.put("loginMap", session.getAttribute("loginMap"));
		
		if(map.get("loginMap") != null) {
			List<ApprovalDTO> approvalList = approvalService.approvalList(map);
			
			model.addAttribute("approvalList", approvalList);
			model.addAttribute("loginMap", map);
		}
		return "approval/approvalList";
	}
	
	// ajax(�񵿱�)
	@RequestMapping("searchAjax.do")
	public String searchAjax(Model model, @RequestParam Map<String, Object> map) throws Exception {
		List<ApprovalDTO> approvalList = approvalService.approvalList(map);
		model.addAttribute("approvalList", approvalList);
		model.addAttribute("map", map);
		return "approval/searchAjax";
	}
	
	// �Խ��� ��� / �󼼺��� �� �̵�
	@RequestMapping(value="writeForm.do")
	public String approvalWrite(Model model, Map<String, Object> map) throws Exception {
		int bnum = approvalService.maxBno();
		map.put("bnum", String.valueOf(bnum));
		model.addAttribute("bnum", bnum);
		return "approval/approvalWriteForm";
	}
	
	// �Խ��� ��� 
	@RequestMapping(value="approvalWrite.do")
	public String approvalWriteForm(Model model, ApprovalDTO dto) throws Exception {
		approvalService.approvalWrite(dto);
		return "redirect:approvalList.do";
	}
	
	// �Խ��� �󼼺���
	@RequestMapping(value="approvalRead.do", method = RequestMethod.GET)
	public String approvalRead(@RequestParam int bno, Model model) throws Exception {
		ApprovalDTO dto = approvalService.approvalRead(bno);
		model.addAttribute("dto", dto);
		return "approval/approvalWriteForm";
	}
	
	// �Խ��� ����
	@RequestMapping(value="approvalUpdate.do")
	public String approvalUpdate(ApprovalDTO dto) throws Exception {
		approvalService.ApprovalUpdate(dto);
		return "redirect:approvalList.do";
	}
	
	// �Խ��� ����
	@RequestMapping(value="approvalDelete.do")
	public String approvalDelete(@RequestParam int bno) throws Exception {
		approvalService.ApprovalDelete(bno);
		return "redirect:approvalList.do";
	}
	
}
