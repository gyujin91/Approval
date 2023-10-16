package com.approval.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {

	//∞¥√º ¡÷¿‘
	@Autowired
	SqlSession sqlSession;

	@Override
	public Map<String, Object> loginCheck(String userId) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.loginCheck", userId);
	}

	
}
