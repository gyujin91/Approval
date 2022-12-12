package com.education.service.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.education.dto.dto.MemberDTO;

public interface MemberService {

	Map<String, Object> loginCheck(String userid);
	
	
}
