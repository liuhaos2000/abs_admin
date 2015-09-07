package com.abs.mobile.service;

import java.util.List;

import com.abs.mobile.domain.TItemType;

public interface TypeService {
	
	/**
	 * 取得父类型
	 * @return
	 */
	public List<TItemType> getTypePrentList();
	
    /**
     * 取得子类型
     * @param typeId
     * @return
     */
    public List<TItemType> getTypeLevel2List(String typeId);
}
