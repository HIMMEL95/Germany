package com.spopia.infra.modules.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spopia.infra.common.util.UtilSecurity;

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
	
	public void insert(Member dto) throws Exception {
  	dto.setPwd(UtilSecurity.encryptSha256(dto.getPwd()));
  	dto.setName(dto.getName());
		userInst(dto);
		teamInst(dto);
	}

	/* id 중복관련 */
	@Override
	public int idCheck(Member dto) throws Exception {
		int cnt = dao.idCheck(dto);
		return cnt;
	}

//	login 관련 
	@Override
	public Member loginCheck(Member dto) throws Exception {
		return dao.loginCheck(dto);
	}

	@Override
	public Member xdminLoginCheck(Member dto) throws Exception {
		return dao.xdminLoginCheck(dto);
	}

	/* change Password */
    @Override
    public int pwdUpdt(Member dto) throws Exception {
        return dao.pwdUpdt(dto);
    }	
    
    //find id & pwd
    @Override
    public Member findId(Member dto) throws Exception {
        
        Member id = dao.findId(dto);
        System.out.println("id : " + id.getId());
        
        String myId = id.getId().substring(0, id.getId().length()-3);
        myId += "***";
        
        dto.setId(myId);
        
        return dto;
    }

    @Override
    public int findPwd(Member dto) throws Exception {
        dto.setPwd(UtilSecurity.encryptSha256(dto.getPwd()));
        dao.findPwd(dto);
        return 1;
    }
    
    // naver insert & check 

    @Override
    public Member naverSelectOne(Member dto) throws Exception {
        return dao.naverSelectOne(dto);
    }

    @Override
    public int naverInst(Member dto) throws Exception {
        return dao.naverInst(dto);
    }
    
}
