package com.spopia.infra.modules.member;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {
	
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.spopia.infra.modules.member.MemberMapper";
	
	public List<Member> selectList(MemberVo vo) {
		return sqlSession.selectList(namespace+".selectList", vo);
	}
	
	public List<Member> selectList1() {
		return sqlSession.selectList(namespace+".selectList1", "");
	}
	
	public int selectOneCount(MemberVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}
	
	public List<Member> selectList() {
		return sqlSession.selectList(namespace+".selectList", "");
	}
	
	public Member selectOne(MemberVo vo) {
		return sqlSession.selectOne(namespace + ".selectOne", vo);
	}
	
	public int update(Member dto) {
		return sqlSession.update(namespace + ".update", dto);
	}

}
