package com.spopia.infra.modules.code;

import java.util.List;

import com.spopia.infra.modules.codegroup.CodeGroup;

public interface CodeService {
	public List<Code> selectList(CodeVo vo) throws Exception;
	public int insert(Code dto) throws Exception;
}
