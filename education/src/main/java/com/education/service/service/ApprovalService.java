package com.education.service.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.education.dto.dto.ApprovalDTO;

public interface ApprovalService {
	
	public List<ApprovalDTO> approvalList(Map<String, Object> map) throws Exception;
	
	public ApprovalDTO approvalRead(int bno) throws Exception;
	
	public void approvalWrite(ApprovalDTO dto) throws Exception;
	
	// 글 수정
	public void approvalUpdate(ApprovalDTO dto) throws Exception;
			
	// 글 삭제
	public void approvalDelete(int bno) throws Exception;
	
	public int maxBno() throws Exception;
	
}
