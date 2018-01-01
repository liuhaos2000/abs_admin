package com.abs.mobile.service;

import java.util.List;
import java.util.Map;

import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.springframework.data.domain.Page;

import com.abs.mobile.domain.TOrderDetail;

public interface OrderService {
	
	/**
	 * 取得订单列表
	 * @return
	 */
    public Page<Map<String, String>> getOrderList(Map<String, Object> params,PageInfo pageInfo);
	/**
	 * 保存物流信息
	 * @return
	 */
    public void wuliuSave(String wuliuGongsi,String wuliuNo,List<TOrderDetail> orderDetailList);
    /**
	 * 保存退货信息
	 * @return
	 */
	public void backItemSave(TOrderDetail orderDetail);
    
}
