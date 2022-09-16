package com.spopia.infra.modules.code;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CodeDao {

	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.spopia.infra.modules.code.CodeMapper";
	
	public List<Code> selectList(CodeVo vo){ return sqlSession.selectList(namespace + ".selectList", vo); }
	
	public List<Code> selectList() {return sqlSession.selectList(namespace + ".selectList", ""); }

	public int insert(Code dto) {
		return sqlSession.insert(namespace + ".insert", dto);
	}
	
	public Code selectOne(CodeVo vo) {
		return sqlSession.selectOne(namespace + ".selectOne", vo);
	}
	
	public int update(Code dto) {
		return sqlSession.update(namespace + ".update", dto);
	}

	public int uelete(Code dto) {
		return sqlSession.update(namespace + ".uelete", dto);
	}
	
	public int delete(CodeVo vo) {
		return sqlSession.delete(namespace + ".delete", vo);
	}
	
	public int selectOneCount(CodeVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}
}
