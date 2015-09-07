package org.buzheng.demo.esm.dao;

import java.util.List;
import java.util.Map;

import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.buzheng.demo.esm.domain.SysUser;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

public interface SysUserDao {

	void save(SysUser user);
	
	void update(SysUser user);
	
	void delete(String userId);
	
	SysUser findByUserId(String userId);
	
	List<SysUser> findAll();
	
	Page<SysUser> findPage(PageInfo pageInfo);
	
	Page<SysUser> findPageByParams(Map<String, Object> params, PageInfo pageInfo);
	
	int countByUsername(String username);
	
	void updateRoleNull(String roleId);
	
	void updatePassword(String userId, String password);
	
	SysUser loadUserByUsernameAndPassword(String username, String password);
}
