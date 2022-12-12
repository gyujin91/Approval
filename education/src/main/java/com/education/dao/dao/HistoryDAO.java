package com.education.dao.dao;

import java.util.List;
import java.util.Map;

import com.education.dto.dto.ApprovalDTO;
import com.education.dto.dto.HistoryDTO;

public interface HistoryDAO {
	
	public List<HistoryDTO> historyList(int appr_seq);
	
	public void historyInsert(HistoryDTO hdto);
}
