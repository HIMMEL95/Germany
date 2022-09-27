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
	
	// Member 관련
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
	
	public int userUpdt(Member dto) {
		return sqlSession.update(namespace + ".userUpdate", dto);
	}
	
	public int userInst(Member dto) {
		return sqlSession.insert(namespace + ".userInsert", dto);
	}
	
	// team 관련
	public int teamInst(Member dto) {
		return sqlSession.insert(namespace + ".teamInsert", dto);
	}
	
	public int teamUpdt(Member dto) {
		return sqlSession.update(namespace + ".teamUpdate", dto);
	}

	/* id 중복 관련 */
	public int idCheck(Member dto) {
		return sqlSession.selectOne(namespace + ".idCheck", dto);
	}
	
//	login 관련
	public Member loginCheck(Member dto) {
		return sqlSession.selectOne(namespace + ".loginCheck", dto);
	}

	public Member xdminLoginCheck(Member dto) {
		return sqlSession.selectOne(namespace + ".xdminLoginCheck", dto);
	}
}
