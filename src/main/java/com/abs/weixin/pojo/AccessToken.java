package com.abs.weixin.pojo;

/**
 * ΢��ͨ�ýӿ�ƾ֤
 * 
 * @author zhangzhi
 * @date 2014-04-05
 */
public class AccessToken {
	// ��ȡ����ƾ֤
	private String token;
	// ƾ֤��Чʱ�䣬��λ����
	private int expiresIn;

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public int getExpiresIn() {
		return expiresIn;
	}

	public void setExpiresIn(int expiresIn) {
		this.expiresIn = expiresIn;
	}
}