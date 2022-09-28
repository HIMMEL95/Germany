package com.spopia.infra.modules.game;

import java.util.List;

public interface GameService {
	public List<Game> selectList() throws Exception;
	public List<Game> selectList(GameVo vo) throws Exception;
	public List<Game> selectList1() throws Exception;
	
	public int insert(Game dto) throws Exception; 
	public Game selectOne(GameVo vo) throws Exception;
	
	public int update(Game dto) throws Exception;
	public int uelete(Game dto) throws Exception;
	public int delete(GameVo vo) throws Exception;
	public int selectOneCount(GameVo vo) throws Exception;
	
	/* mainList */
	public List<Game> mainList() throws Exception;
	
}
