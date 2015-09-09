package com.abs.mobile.service;

import java.util.Map;

import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.springframework.data.domain.Page;

public interface OrderService {
	
	/**
	 * 取得订单列表
	 * @return
	 */
    public Page<Map<String, String>> getOrderList(Map<String, Object> params,PageInfo pageInfo);
	
}
