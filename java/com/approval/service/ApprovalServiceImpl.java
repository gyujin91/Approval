package com.approval.service;

import java.util.HashMap;
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

	@Override
	public Map<String, Object> page(Map<String, Object> map1) throws Exception {
		
		int count = approvalDao.total(map1);
		int PAGE_SCALE = Integer.parseInt(map1.get("listSize").toString());
		int curPage = Integer.parseInt(map1.get("pageNo").toString());
		int BLOCK_SCALE = 5;
		
		int totPage = (int) Math.ceil(count*1.0 / PAGE_SCALE);
		
		int totBlock = (int)Math.ceil(totPage / BLOCK_SCALE);
		
		// *현재 페이지가 몇번째 페이지 블록에 속하는지 계산
        int curBlock = (int)Math.ceil((curPage-1) / BLOCK_SCALE)+1;
        // *현재 페이지 블록의 시작, 끝 번호 계산
        int blockBegin = (curBlock-1)*BLOCK_SCALE+1;
        // 페이지 블록의 끝번호
        int blockEnd = blockBegin+BLOCK_SCALE-1;
        // *마지막 블록이 범위를 초과하지 않도록 계산
        if(blockEnd > totPage) blockEnd = totPage;
        // *이전을 눌렀을 때 이동할 페이지 번호
        int prevPage = (curPage == 1)? 1:(curBlock-1)*BLOCK_SCALE;
        // *다음을 눌렀을 때 이동할 페이지 번호
        int nextPage = curBlock > totBlock ? (curBlock*BLOCK_SCALE) : (curBlock*BLOCK_SCALE)+1;
        // 마지막 페이지가 범위를 초과하지 않도록 처리
        if(nextPage >= totPage) nextPage = totPage;
		
		Map<String, Object> pageMap = new HashMap<String, Object>();
		pageMap.put("count", count);
		pageMap.put("PAGE_SCALE", PAGE_SCALE);
		pageMap.put("curPage", curPage);
		pageMap.put("BLOCK_SCALE", BLOCK_SCALE);
		pageMap.put("totPage", totPage);
		pageMap.put("totBlock", totBlock);
		pageMap.put("curBlock", curBlock);
		pageMap.put("blockBegin", blockBegin);
		pageMap.put("blockEnd", blockEnd);
		pageMap.put("prevPage", prevPage);
		pageMap.put("nextPage", nextPage);
		
		return pageMap;
	}

	
}
