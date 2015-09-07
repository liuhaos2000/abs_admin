package com.abs.weixin.pojo;

import java.util.Date;

/**
 * ΢��ͨ�ýӿ�ƾ֤
 * 
 * @author zhangzhi
 * @date 2014-04-05
 */
public class AccessTokenApp {
	// ֤
	private String token;
	// 时间
	private Date datetime;
	
    public String getToken() {
        return token;
    }
    public void setToken(String token) {
        this.token = token;
    }
    public Date getDatetime() {
        return datetime;
    }
    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }


}