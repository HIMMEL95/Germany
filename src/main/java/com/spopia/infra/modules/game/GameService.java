package com.spopia.infra.modules.game;

import java.util.List;

public interface GameService {
	public List<Game> selectList() throws Exception;
	public List<Game> selectList(GameVo vo) throws Exception;
	public int insert(Game dto) throws Exception; 
	public Game selectOne(GameVo vo) throws Exception;
}
