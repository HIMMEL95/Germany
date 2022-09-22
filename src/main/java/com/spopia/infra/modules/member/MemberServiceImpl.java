package com.spopia.infra.modules.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDao dao;

	/* member 관련 */
	@Override
	public List<Member> selectList1() throws Exception {
		return dao.selectList1();
	}

	@Override
	public int selectOneCount(MemberVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}

	@Override
	public List<Member> selectList(MemberVo vo) throws Exception {
		return dao.selectList(vo);
	}

	@Override
	public List<Member> selectList() throws Exception {
		return dao.selectList();
	}
	
	@Override
	public Member selectOne(MemberVo vo) throws Exception {
		return dao.selectOne(vo);
	}

	@Override
	public int userUpdt(Member dto) throws Exception {
		return dao.userUpdt(dto);
	}
	
	@Override
	public int userInst(Member dto) throws Exception {
		return dao.userInst(dto);
	}
	
	/* team 관련 */
	@Override
	public int teamInst(Member dto) throws Exception {
		return dao.teamInst(dto);
	}
	
	@Override
	public int teamUpdt(Member dto) throws Exception {
		return dao.teamUpdt(dto);
	}

	public void update(Member dto) throws Exception {
		System.out.println(dto.getSeq());
		userUpdt(dto);
		System.out.println(dto.getSeq());
		teamUpdt(dto);
	}

	/* id 중복관련 */
	@Override
	public int idCheck(String id) throws Exception {
		int cnt = dao.idCheck(id);
		System.out.println("cnt : " + id);
		return cnt;
	}
}
