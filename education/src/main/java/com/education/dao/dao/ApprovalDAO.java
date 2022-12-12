package com.education.dao.dao;

import java.util.List;
import java.util.Map;

import com.education.dto.BoardDTO;
import com.education.dto.dto.ApprovalDTO;

public interface ApprovalDAO {

	public List<ApprovalDTO> approvalList(Map<String, Object> map) throws Exception;
	
	// 글 상세보기
	public ApprovalDTO approvalRead(int bno) throws Exception;
		
	// 글 등록
	public void approvalWrite(ApprovalDTO dto) throws Exception;
	
	// 글 수정
	public void approvalUpdate(ApprovalDTO dto) throws Exception;
		
	// 글 삭제
	public void approvalDelete(int bno) throws Exception;
	
	public int maxBno() throws Exception;
	
}
