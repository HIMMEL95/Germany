package com.spopia.infra.modules.member;

import java.util.List;

public interface MemberService {

	/* Member 관련 */
	public List<Member> selectList(MemberVo vo) throws Exception;
	public List<Member> selectList1() throws Exception;
	public List<Member> selectList() throws Exception;
	public Member selectOne(MemberVo vo) throws Exception;
	public Member naverSelectOne(MemberVo vo) throws Exception;
	public int selectOneCount(MemberVo vo) throws Exception;
	public int userInst(Member dto) throws Exception;
	public int userUpdt(Member dto) throws Exception;
	
	/* team 관련 */
	public int teamUpdt(Member dto) throws Exception;
	public int teamInst(Member dto) throws Exception;
	
	/* id 중복 관련 */
	public int idCheck(Member dto) throws Exception;
	
//	login 관련 
	public Member loginCheck(Member dto) throws Exception;
	public Member xdminLoginCheck(Member dto) throws Exception;
	
    /* change Password */
	public int pwdUpdt(Member dto) throws Exception;
	
	/* findId & pwd */
	public Member findId(Member dto) throws Exception;
    public int findPwd(Member dto) throws Exception;

    // naver insert & check
    public Member naverSelectOne(Member dto) throws Exception;
    public int naverInst(Member dto) throws Exception;
}