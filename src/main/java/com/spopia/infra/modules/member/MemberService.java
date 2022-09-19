package com.spopia.infra.modules.member;

import java.util.List;

public interface MemberService {

	public List<Member> selectList(MemberVo vo) throws Exception;
	public List<Member> selectList1() throws Exception;
	public List<Member> selectList() throws Exception;
	public Member selectOne(MemberVo vo) throws Exception;
	public int update(Member dto) throws Exception;
	public int selectOneCount(MemberVo vo) throws Exception;
}
