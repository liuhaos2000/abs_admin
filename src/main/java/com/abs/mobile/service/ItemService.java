package com.abs.mobile.service;

import java.util.List;
import java.util.Map;

import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.springframework.data.domain.Page;

import com.abs.mobile.domain.TItem;

public interface ItemService {
	
	/**
	 * 取得商品列表
	 * @return
	 */
    public Page<Map<String, String>> getItemList(Map<String, Object> params,PageInfo pageInfo);
	/**
	 * 取得商品详细列表
	 * @return
	 */
    public Page<Map<String, String>> getItemDetailList(Map<String, Object> params,PageInfo pageInfo);
	/**
	 * 取得商品图片列表
	 * @return
	 */
    public Page<Map<String, String>> getItemPictureList(Map<String, Object> params,PageInfo pageInfo);
    
    
    
    
    
	/**
	 * 保存商品信息
	 * @return
	 */
    public void itemSave(String changeMod,TItem item,List<Map<String,String>> itemDist1,List<Map<String,String>> itemPist1,String itemId);

}
