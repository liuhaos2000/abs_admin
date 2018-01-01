package com.abs.mobile.service;

import com.abs.mobile.domain.TUser;
import javax.servlet.http.HttpSession;

import org.buzheng.demo.esm.domain.SysUser;

public interface SessionService {
	
	/**
	 * 获取Session中的User
	 */
	public SysUser getLoginUser();
	/**
	 * 设置Session中的User
	 */
	public void setLoginUser(SysUser user);
	   /**
     * 获取微信JS用的 签名信息
     */
	public String getUserIp();
	
	
	public HttpSession getSession();
}
