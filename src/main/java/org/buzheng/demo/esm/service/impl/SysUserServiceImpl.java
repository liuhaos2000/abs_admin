package org.buzheng.demo.esm.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.buzheng.demo.esm.App;
import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.buzheng.demo.esm.dao.SysUserDao;
import org.buzheng.demo.esm.domain.SysUser;
import org.buzheng.demo.esm.service.SysUserService;
import org.buzheng.demo.esm.util.AppHelper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import com.abs.util.exception.UserExistsException;

@Service
public class SysUserServiceImpl implements SysUserService {
	
	@Resource
	private SysUserDao sysUserDao;

	@Override
	public void save(SysUser user) throws UserExistsException {
		if (user == null) {
			return;
		}
		
		this.validateUser(user);
		
		if (user.getPassword() == null || "".equals(user.getPassword())){
			user.setPassword(AppHelper.encryptPassword(App.DEFAULT_USER_PASSWORD));
		}
		
		user.setUsername(user.getUsername().trim());
		
		if (this.sysUserDao.countByUsername(user.getUsername()) > 0) {
			throw new UserExistsException("user.username.exists");
		}
		
		this.sysUserDao.save(user);
	}

	@Override
	public void update(SysUser user) {
		if (user == null) {
			return;
		}
		
		this.validateUser(user);
		
		user.setUsername(user.getUsername().trim());
				
		this.sysUserDao.update(user);
	}
	
	private void validateUser(SysUser user) {
		if (user.getUsername() == null || user.getUsername().isEmpty()) {
			throw new IllegalArgumentException("user.username.required");
		}
		
		if (user.getName() == null || user.getName().isEmpty()) {
			throw new IllegalArgumentException("user.name.required");
		}
		
		if (user.getRoleId() == null || user.getRoleId().isEmpty()) {
			throw new IllegalArgumentException("user.role.required");
		}
		
		if (! App.SUPER_ROLE_ID.equals(user.getRoleId())) {
			if (user.getGroupId() == null || user.getGroupId().isEmpty()) {
				throw new IllegalArgumentException("user.group.required");
			}
		}
	}

	@Override
	public void delete(String userId) {
		this.sysUserDao.delete(userId);
	}

	
	@Override
	public SysUser findByUserId(String userId) {
		return this.sysUserDao.findByUserId(userId);
	}

	@Override
	public List<SysUser> findAll() {
		return this.sysUserDao.findAll();
	}

	@Override
	public void updatePassword(String userId, String newPassword) {
		newPassword = AppHelper.encryptPassword(newPassword);
		this.sysUserDao.updatePassword(userId, newPassword);
	}

	@Override
	public void resetPassword(String userId) {
		this.updatePassword(userId, App.DEFAULT_USER_PASSWORD);
	}

	@Override
	public SysUser loadUserByUsernameAndPassword(String username, String password) {
		password = AppHelper.encryptPassword(password);
		
		return this.sysUserDao.loadUserByUsernameAndPassword(username, password);
	}

	@Override
	public Page<SysUser> findPage(PageInfo pageInfo) {
		return this.sysUserDao.findPage(pageInfo);
	}

	@Override
	public Page<SysUser> findPage(Map<String, Object> params, PageInfo pageInfo) {
		
		return this.sysUserDao.findPageByParams(params, pageInfo);
	}

	
	
}
