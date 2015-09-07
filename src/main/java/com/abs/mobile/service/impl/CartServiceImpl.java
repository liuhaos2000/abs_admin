package com.abs.mobile.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.abs.mobile.dao.TCartMapper;
import com.abs.mobile.domain.TCart;
import com.abs.mobile.domain.TCartKey;
import com.abs.mobile.domain.TUser;
import com.abs.mobile.service.CartService;
import com.abs.mobile.service.SessionService;

@Service
public class CartServiceImpl implements CartService {
	@Resource
	private TCartMapper tCartMapper;
	@Resource
	private SessionService sessionService;

	/**
	 * 添加购物车
	 */
	@Override
	public int addItem(String itemId, String xinghao, String yanse, String shuliang) {

		int result = 0;
		// 获取OpenId
		TUser user = sessionService.getLoginUser();

		TCartKey TCartKey = new TCartKey();
		TCartKey.setItemId(Integer.valueOf(itemId));
		TCartKey.setItemGuige(Integer.valueOf(xinghao));
		TCartKey.setItemYanse(Integer.valueOf(yanse));
		TCartKey.setOpenId(user.getOpenId());

		TCart cart = tCartMapper.selectByPrimaryKey(TCartKey);
		Date date = new Date();
		// 不存在
		if (cart == null) {
			cart = new TCart();
			cart.setOpenId(user.getOpenId());
			cart.setItemId(Integer.valueOf(itemId));
			cart.setItemGuige(Integer.valueOf(xinghao));
			cart.setItemYanse(Integer.valueOf(yanse));
			cart.setShuliang(Integer.valueOf(shuliang));
			cart.setDelFlg("0");

			cart.setcDate(date);
			cart.setcUser("ADDCART_NEW");
			cart.setuDate(date);
			cart.setuUser("ADDCART_NEW");
			result = tCartMapper.insert(cart);

		} else {
			cart.setShuliang(Integer.valueOf(shuliang));
			cart.setuDate(date);
			cart.setuUser("ADDCART_UPD");
			result = tCartMapper.updateByPrimaryKey(cart);
		}

		return result;
	}

	@Override
	public int getCount() {
		TUser user = sessionService.getLoginUser();
		int count = (int)tCartMapper.getCount(user.getOpenId());
		return count;
	}

	/**
	 * 取得购物车商品
	 */
    @Override
    public Map<String, Object> getCartItem() {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        
        TUser user = sessionService.getLoginUser();
        List<Map<String, String>> list = tCartMapper.getItemFromCart(user.getOpenId());
        resultMap.put("itemList", list);
        
        return resultMap;
    }

    /**
     * 删除购物车商品
     */
    @Override
    public int delItemFromCart(String itemId, String guige, String yanse) {
    	TUser user = sessionService.getLoginUser();
    	TCartKey key = new TCartKey();
    	key.setItemId(Integer.valueOf(itemId));
    	key.setItemGuige(Integer.valueOf(guige));
    	key.setItemYanse(Integer.valueOf(yanse));
    	key.setOpenId(user.getOpenId());
    	return tCartMapper.deleteByPrimaryKey(key);
    }

}
