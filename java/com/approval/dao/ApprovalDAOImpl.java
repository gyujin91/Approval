package com.approval.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.approval.dto.ApprovalDTO;

@Repository
public class ApprovalDAOImpl implements ApprovalDAO{
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<ApprovalDTO> approvalList(Map<String, Object> map) throws Exception {
		return sqlSession.selectList("approval.approvalList", map);
	}

	@Override
	public ApprovalDTO approvalRead(int bno) throws Exception {
		return sqlSession.selectOne("approval.approvalRead", bno);
	}

	@Override
	public void approvalWrite(ApprovalDTO dto) throws Exception {
		sqlSession.insert("approval.approvalWrite", dto);
	}

	@Override
	public void approvalUpdate(ApprovalDTO dto) throws Exception {
		sqlSession.update("approval.approvalUpdate", dto);
		
	}

	@Override
	public void approvalDelete(int bno) throws Exception {
		sqlSession.delete("approval.approvalDelete", bno);
	}

	@Override
	public int maxBno() throws Exception {
		return sqlSession.selectOne("approval.maxBno");
	}

	
	
}
