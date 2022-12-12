package com.education.service.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.education.dao.dao.ApprovalDAO;
import com.education.dto.dto.ApprovalDTO;

@Service
public class ApprovalServiceImpl implements ApprovalService{

	@Autowired
	ApprovalDAO approvalDao;
	
	@Override
	public List<ApprovalDTO> approvalList(Map<String, Object> map) throws Exception {
		return approvalDao.approvalList(map);
	}

	@Override
	public ApprovalDTO approvalRead(int bno) throws Exception {
		return approvalDao.approvalRead(bno);
	}

	@Override
	public void approvalWrite(ApprovalDTO dto) throws Exception {
		approvalDao.approvalWrite(dto);
	}

	@Override
	public void approvalUpdate(ApprovalDTO dto) throws Exception {
		approvalDao.approvalUpdate(dto);
	}

	@Override
	public void approvalDelete(int bno) throws Exception {
		approvalDao.approvalDelete(bno);
		
	}

	@Override
	public int maxBno() throws Exception {
		return approvalDao.maxBno();
	}

	
	

	
	
	
	
	
}
