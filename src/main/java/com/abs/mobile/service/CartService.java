package com.abs.mobile.service;

import java.util.Map;

public interface CartService {
	/**
	 * 添加购物车
	 * @return
	 */
	public  int addItem(String itemId,String xinghao,
			String yanse,String shuliang);
	/**
	 * 取得购物车数量
	 * @return
	 */
	public  int getCount();
	/**
	 * 取得购物车数据
	 * @return
	 */
    public Map<String, Object> getCartItem();
    /**
     * 取得购物车数据
     * @return
     */
    public int delItemFromCart(String itemId,String guige,String yanse);
}
