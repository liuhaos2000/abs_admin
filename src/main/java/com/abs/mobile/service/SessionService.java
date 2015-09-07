package com.abs.mobile.service;

import java.util.Map;

import com.abs.mobile.domain.TUser;

public interface SessionService {
	
	/**
	 * 获取Session中的User
	 */
	public TUser getLoginUser();
	/**
	 * 设置Session中的User
	 */
	public void setLoginUser(TUser user);
	/**
	 * 获取微信JS用的 签名信息
	 */
	public Map<String, String> getSignInfo(String requestmap);
	   /**
     * 获取微信JS用的 签名信息
     */
	public String getUserIp();
}
