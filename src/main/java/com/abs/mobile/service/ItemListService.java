package com.abs.mobile.service;

import java.util.Map;

import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.springframework.data.domain.Page;

public interface ItemListService {
	
	/**
	 * 取得商品列表
	 * @param request
	 * @return
	 */
	public Page<Map<String, String>> getItemList(Map<String, Object> params,PageInfo pageInfo);

}
