package com.abs.mobile.service;

import java.util.Map;

import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.springframework.data.domain.Page;

import com.abs.mobile.domain.TUser;

public interface ShopuserService {
	
	/**
	 * 取得列表
	 * @return
	 */
    public Page<Map<String, String>> getShopuserList(Map<String, Object> params,PageInfo pageInfo);
    
	/**
	 * 保存信息
	 * @return
	 */
	public void save(String openId, String lever, String parent);

}
