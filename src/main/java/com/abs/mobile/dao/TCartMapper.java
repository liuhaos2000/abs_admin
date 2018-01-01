package com.abs.mobile.dao;

import java.util.List;
import java.util.Map;

import com.abs.mobile.domain.TCart;
import com.abs.mobile.domain.TCartKey;

public interface TCartMapper {
    int deleteByPrimaryKey(TCartKey key);

    int insert(TCart record);

    int insertSelective(TCart record);

    TCart selectByPrimaryKey(TCartKey key);

    int updateByPrimaryKeySelective(TCart record);

    int updateByPrimaryKey(TCart record);
    
    /**
     * 取件数
     * @param openId
     * @return
     */
    long getCount(String openId);
    /**
     * 取得购车商品信息
     * @param openId
     * @return
     */
    List<Map<String, String>> getItemFromCart(String openId);
    /**
     * 取得购车商品信息(带运费)
     * @param openId
     * @return
     */
    List<Map<String, Object>> getItemFromCartWhitYoufei(String openId,String toArea);
    /**
     * 取得购车商品总价
     * @param openId
     * @return
     */
    Map<String, String> getItemFromCartTotalPrice(String openId,String toArea);
    /**
     * 取得购车商品邮费总价
     * @param openId
     * @return
     */
    Map<String, String> getItemFromCartTotalYoufei(String openId,String toArea);
}