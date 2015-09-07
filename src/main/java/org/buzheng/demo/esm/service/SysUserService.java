package org.buzheng.demo.esm.service;

import java.util.List;
import java.util.Map;

import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.buzheng.demo.esm.domain.SysUser;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.abs.util.exception.UserExistsException;

public interface SysUserService {
	
	/**
	 * 保存用户
	 * @param user
	 * @throws UserExistsException 用户名存在
	 * @throws IllegalArgumentException
	 */
	void save(SysUser user) throws UserExistsException;
	
	/**
	 * 保存用户
	 * @param user
	 * @throws UserExistsException 用户名存在
	 */
	void update(SysUser user);
	
	void delete(String userId);
	
	SysUser findByUserId(String userId);
	
	List<SysUser> findAll();
	
	Page<SysUser> findPage(PageInfo pageInfo);
	
	Page<SysUser> findPage(Map<String, Object> params, PageInfo pageInfo);
	
	void updatePassword(String userId, String newPassword);
	
	void resetPassword(String userId);
	
	SysUser loadUserByUsernameAndPassword(String username, String password);
}
