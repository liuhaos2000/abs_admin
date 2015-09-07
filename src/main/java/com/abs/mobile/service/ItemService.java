package com.abs.mobile.service;

import java.util.Map;

public interface ItemService {
	
	/**
	 * 取得商品
	 * @return
	 */
	public  Map<String, Object> getItem(String itemId);
	 /**
     * 获取单个商品价格
     * @param itemId
     * @param guige
     * @param yanse
     * @return
     */
    public Map<String, String> getItemPrice(String itemId,String guige,String yanse);
    /**
    * 获取商品价格
    * @param itemId
    * @param guige
    * @param yanse
    * @return
    */
   public Map<String, String> getItemPriceAll(String itemId);

}
