package com.spopia.infra.modules.game;

import java.util.List;

import com.spopia.infra.modules.comment.Comment;
import com.spopia.infra.modules.comment.CommentVo;

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
	public List<Game> mainList(GameVo vo) throws Exception;
	
	/* select test */
	public List<Game> gameList(Game dto) throws Exception;
  public List<Game> abroad(Game dto) throws Exception;
  public List<Game> event(Game dto) throws Exception;
  public List<Game> league(Game dto) throws Exception;
  public List<Game> teamName(Game dto) throws Exception;
  public List<Game> stadium(Game dto) throws Exception;	
  
//  game comment
  public List<Comment> gameComment(CommentVo vo) throws Exception;
  public int gameCommentCount(CommentVo vo) throws Exception;
}
