package com.approval.dao;

import java.util.List;
import java.util.Map;

import com.approval.dto.ApprovalDTO;

public interface ApprovalDAO {
	
	// �Խ��� ����Ʈ ��ȸ
	public List<ApprovalDTO> approvalList(Map<String, Object> map) throws Exception;
	
	// �� �󼼺���
	public ApprovalDTO approvalRead(int bno) throws Exception;
	
	// �� ���
	public void approvalWrite(ApprovalDTO dto) throws Exception;
	
	// �� ����
	public void approvalUpdate(ApprovalDTO dto) throws Exception;
	
	// �� ����
	public void approvalDelete(int bno) throws Exception;
	
	// ���� �� ��ȣ
	public int maxBno() throws Exception;

}