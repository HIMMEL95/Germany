package com.spopia.infra.modules.codegroup;

import java.util.List;

public interface CodeGroupService {

	public List<CodeGroup> selectList(CodeGroupVo vo) throws Exception; 
}
