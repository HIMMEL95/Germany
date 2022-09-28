package com.spopia.infra.modules.game;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GameServiceImpl implements GameService{

	@Autowired
	GameDao dao;
	
	@Override
	public List<Game> selectList() throws Exception {
		return dao.selectList();
	}

	@Override
	public List<Game> selectList(GameVo vo) throws Exception {
		return dao.selectList(vo);
	}
	
	@Override
	public List<Game> selectList1() throws Exception {
		return dao.selectList();
	}
	
	@Override
	public int selectOneCount(GameVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}
	
	@Override
	public int insert(Game dto) throws Exception {
		return dao.insert(dto);
	}
	
	@Override
	public Game selectOne(GameVo vo) throws Exception {
		return dao.selectOne(vo);
	}
	
	@Override
	public int update(Game dto) throws Exception {
		return dao.update(dto);
	}

	@Override
	public int uelete(Game dto) throws Exception {
		return dao.uelete(dto);
	}

	@Override
	public int delete(GameVo vo) throws Exception {
		return dao.delete(vo);
	}

	/* mainList */
	@Override
	public List<Game> mainList() throws Exception {
		return dao.mainList();
	}
	
}
