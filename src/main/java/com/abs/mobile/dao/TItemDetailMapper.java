package com.abs.mobile.dao;

import java.util.List;
import java.util.Map;

import com.abs.mobile.domain.TItemDetail;
import com.abs.mobile.domain.TItemDetailKey;

public interface TItemDetailMapper {
    int deleteByPrimaryKey(TItemDetailKey key);

    int insert(TItemDetail record);

    int insertSelective(TItemDetail record);

    TItemDetail selectByPrimaryKey(TItemDetailKey key);

    int updateByPrimaryKeySelective(TItemDetail record);

    int updateByPrimaryKey(TItemDetail record);
    /**
     * 取得明细
     * @param itemId
     * @return
     */
    List<TItemDetail> getItemDetail(String itemId);
    /**
     * 取得商品型号
     * @param itemId
     * @return
     */
    List<Map<String, String>> getItemXinghao(String itemId);
    /**
     * 取得颜色
     * @param itemId
     * @return
     */
    List<Map<String, String>> getItemYanse(String itemId);
    /**
     * 取得单品销售价格
     * 
     */
    Map<String, String> getItemSalePrice(String itemId,String guige,String yanse);
    /**
     * 取得商品所有价格（FROM-TO）
     * 
     */
    Map<String, String> getItemPriceFromTo(String itemId);
}