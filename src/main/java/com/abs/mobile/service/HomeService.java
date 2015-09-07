package com.abs.mobile.service;

import java.util.List;
import java.util.Map;

import com.abs.mobile.domain.TIndexLunbo;

public interface HomeService {
	
	/**
	 * 取得轮播数据
	 * @param request
	 * @return
	 */
	public List<TIndexLunbo> getLunBoList();
	
    /**
     * 取得商品
     * @param request
     * @return
     */
    public Map<String, Object> getItem();
}
