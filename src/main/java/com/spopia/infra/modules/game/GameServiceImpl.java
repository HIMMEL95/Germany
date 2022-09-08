package com.spopia.infra.modules.game;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GameServiceImpl {

	@Autowired
	GameDao dao;
	
	public List<Game> selectList() throws Exception {
		return dao.selectList();
	}
}
