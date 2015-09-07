package com.abs.mobile.service;

public interface UserInfoAuthorizeService {
	
	/**
	 * 从微信获取用户信息，并放入Session
	 * @param code
	 */
	public void executeGetUserInfo(String code);
	
	/**
	 * 对于关注用户，从微信取得用户所有信息
	 * @param code
	 */
	public void executeGetUserAllInfo(String openId);
	
}
