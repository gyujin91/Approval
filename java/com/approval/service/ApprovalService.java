package com.approval.service;

import java.util.List;
import java.util.Map;

import com.approval.dto.ApprovalDTO;

public interface ApprovalService {
	
	// �Խ��� �� ��ȸ
	public List<ApprovalDTO> approvalList(Map<String, Object> map) throws Exception;
	
	// �� �󼼺���
	public ApprovalDTO approvalRead(int bno) throws Exception;
	
	// �� ���
	public void approvalWrite(ApprovalDTO dto) throws Exception; 
	
	// �� ����
	public void ApprovalUpdate(ApprovalDTO dto) throws Exception;
	
	// �� ����
	public void ApprovalDelete(int bno) throws Exception;
	
	// ���� �� ��ȣ
	public int maxBno() throws Exception;
}
