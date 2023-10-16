package com.approval.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.approval.dao.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDAO memberDao;
	
	@Autowired
	HttpSession session;
	
	@Autowired
	BCryptPasswordEncoder pwdEncoder;

	@Override
	public Map<String, Object> loginCheck(String userId) {
		// TODO Auto-generated method stub
		return memberDao.loginCheck(userId);
	}

	


	
}