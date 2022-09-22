package com.spopia.infra.modules.member;

import java.util.List;

public interface MemberService {

	/* Member 관련 */
	public List<Member> selectList(MemberVo vo) throws Exception;
	public List<Member> selectList1() throws Exception;
	public List<Member> selectList() throws Exception;
	public Member selectOne(MemberVo vo) throws Exception;
	public int selectOneCount(MemberVo vo) throws Exception;
	public int userInst(Member dto) throws Exception;
	public int userUpdt(Member dto) throws Exception;
	
	/* team 관련 */
	public int teamUpdt(Member dto) throws Exception;
	public int teamInst(Member dto) throws Exception;
	
	/* id 중복 관련 */
	public int idCheck(String id) throws Exception;
	
}
