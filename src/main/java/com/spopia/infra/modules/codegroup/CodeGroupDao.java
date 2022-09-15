package com.spopia.infra.modules.codegroup;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CodeGroupDao {
	
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.spopia.infra.modules.codegroup.CodeGroupMapper";
	
	public List<CodeGroup> selectList(CodeGroupVo vo){ return sqlSession.selectList(namespace + ".selectList", vo); }
	public List<CodeGroup> selectList(){ return sqlSession.selectList(namespace + ".selectList", ""); }

	public int insert(CodeGroup dto) {
		return sqlSession.insert(namespace + ".insert", dto);
	}
	
	public CodeGroup selectOne(CodeGroupVo vo) {
		return sqlSession.selectOne(namespace + ".selectOne", vo);
	}
	
	public int update(CodeGroup dto) {
		return sqlSession.update(namespace + ".update", dto);
	}

	public int uelete(CodeGroup dto) {
		return sqlSession.update(namespace + ".uelete", dto);
	}
	
	public int delete(CodeGroupVo vo) {
		return sqlSession.delete(namespace + ".delete", vo);
	}

	/* pagination 관련 */
	public int count() {
		return sqlSession.selectOne(namespace + ".getCnt");
	}
	
	public List<CodeGroup> selectGroup(PagingVo vo) {
		return sqlSession.selectList(namespace + ".countList", vo);
	}
} 
