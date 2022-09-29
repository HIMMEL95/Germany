package com.spopia.infra.modules.main;

import java.util.List;

public interface MainService {

	public List<Main> articleList(MainVo vo) throws Exception;
	public List<Main> gamList(MainVo vo) throws Exception;
	
	public Main articleSelectOne(MainVo vo) throws Exception;
	public Main gameSelectOne(MainVo vo) throws Exception;
}
