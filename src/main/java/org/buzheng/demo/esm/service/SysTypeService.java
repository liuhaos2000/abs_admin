package org.buzheng.demo.esm.service;

import java.util.List;
import java.util.Map;

import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.buzheng.demo.esm.domain.SysType;
import org.buzheng.demo.esm.domain.SysUser;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.abs.util.exception.DataExistsException;

public interface SysTypeService {
	
	/**
	 * 保存用户
	 * @param user
	 * @param user 
	 * @throws UserExistsException 用户名存在
	 * @throws IllegalArgumentException
	 */
	void save(SysType type, SysUser user) throws DataExistsException;
	
	/**
	 * 保存用户
	 * @param user
	 * @throws DataExistsException 
	 * @throws UserExistsException 用户名存在
	 */
	void update(SysType type) throws DataExistsException;
	
	void delete(String typeCode);
	
	Page<SysType> findPage(PageInfo pageInfo);
	
	Page<SysType> findPage(Map<String, Object> params, PageInfo pageInfo);
	
}
