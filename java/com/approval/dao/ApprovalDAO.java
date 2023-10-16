package com.approval.dao;

import java.util.List;
import java.util.Map;

import com.approval.dto.ApprovalDTO;

public interface ApprovalDAO {
	
	// 게시판 리스트 조회
	public List<ApprovalDTO> approvalList(Map<String, Object> map) throws Exception;
	
	// 글 상세보기
	public ApprovalDTO approvalRead(int bno) throws Exception;
	
	// 글 등록
	public void approvalWrite(ApprovalDTO dto) throws Exception;
	
	// 글 수정
	public void approvalUpdate(ApprovalDTO dto) throws Exception;
	
	// 글 삭제
	public void approvalDelete(int bno) throws Exception;
	
	// 다음 글 번호
	public int maxBno() throws Exception;

}