package com.spopia.infra.modules.main;

import java.util.List;

public interface MainService {

	public List<Main> articleList() throws Exception;
	public List<Main> gamList() throws Exception;
}
