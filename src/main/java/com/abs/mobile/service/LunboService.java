package com.abs.mobile.service;

import java.util.List;

import com.abs.mobile.domain.TIndexLunbo;

public interface LunboService {
	
	/**
	 * 取得父类型
	 * @return
	 */
	public List<TIndexLunbo> getLunboList();
	
	public void addLunbo(TIndexLunbo tIndexLunbo);
	
	public void updLunbo(TIndexLunbo tIndexLunbo);
	
	public void delLunbo(String groupId);
}
