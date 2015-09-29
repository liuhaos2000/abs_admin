package org.buzheng.demo.esm.service;

import java.util.List;
import java.util.Map;

import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.buzheng.demo.esm.domain.SysType;
import org.buzheng.demo.esm.domain.SysTypeSub;
import org.buzheng.demo.esm.domain.SysUser;
import org.springframework.data.domain.Page;

import com.abs.util.exception.DataExistsException;

public interface SysTypeService {
	
	void save(SysType type, SysUser user) throws DataExistsException;
	void update(SysType type) throws DataExistsException;
	void delete(String typeCode);
	Page<SysType> findPage(PageInfo pageInfo);
	Page<SysType> findPage(Map<String, Object> params, PageInfo pageInfo);
	
	/**
	 * 取得下拉框内容
	 * @param typeId
	 * @return
	 */
	List<SysTypeSub> getTypeList(String typeCode);
	
}
