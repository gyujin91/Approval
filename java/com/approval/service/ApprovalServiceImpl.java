package com.approval.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.approval.dao.ApprovalDAO;
import com.approval.dto.ApprovalDTO;

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
	public void ApprovalUpdate(ApprovalDTO dto) throws Exception {
		approvalDao.approvalUpdate(dto);
		
	}

	@Override
	public void ApprovalDelete(int bno) throws Exception {
		approvalDao.approvalDelete(bno);
		
	}

	@Override
	public int maxBno() throws Exception {
		return approvalDao.maxBno();
	}

	
}
