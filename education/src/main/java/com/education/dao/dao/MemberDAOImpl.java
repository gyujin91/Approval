package com.education.dao.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.education.dto.BoardDTO;
import com.education.dto.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	//객체 주입
	@Autowired
	SqlSession sqlSession;

	@Override
	public Map<String, Object> loginCheck(String userid) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.loginCheck", userid);
	}


	
	
	
	
	
}
