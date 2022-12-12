package com.education.dao.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.education.dto.dto.ApprovalDTO;
import com.education.dto.dto.HistoryDTO;

@Repository
public class HistoryDAOImpl implements HistoryDAO {

	@Autowired
	SqlSession sqlSession;
	
	@Override
	public List<HistoryDTO> historyList(int appr_seq) {
		return sqlSession.selectList("history.historyList", appr_seq);
	}

	@Override
	public void historyInsert(HistoryDTO hdto) {
		sqlSession.insert("history.historyInsert", hdto);
		
	}

	
	
}
