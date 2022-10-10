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
	public List<Game> mainList(GameVo vo) throws Exception {
		return dao.mainList(vo);
	}
	
	/* select Test */
	@Override
	public List<Game> gameList(Game dto) throws Exception {
	    return dao.abroad(dto);
	}

	@Override
  public List<Game> abroad(Game dto) throws Exception {
      return dao.abroad(dto);
  }

  @Override
  public List<Game> event(Game dto) throws Exception {
      return dao.event(dto);
  }

  @Override
  public List<Game> league(Game dto) throws Exception {
      return dao.league(dto);
  }

  @Override
  public List<Game> teamName(Game dto) throws Exception {
      return dao.teamName(dto);
  }

	@Override
	public List<Game> stadium(Game dto) throws Exception {
		return dao.stadium(dto);
	}
}
