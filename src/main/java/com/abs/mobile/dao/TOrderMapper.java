package com.abs.mobile.dao;

import java.util.Map;

import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.springframework.data.domain.Page;

import com.abs.mobile.domain.TOrder;
import com.abs.mobile.domain.TOrderKey;

public interface TOrderMapper {
    int deleteByPrimaryKey(TOrderKey key);

    int insert(TOrder record);

    int insertSelective(TOrder record);

    TOrder selectByPrimaryKey(TOrderKey key);

    int updateByPrimaryKeySelective(TOrder record);

    int updateByPrimaryKey(TOrder record);
    /**
     * 菜番
     * @return
     */
    String getNewOrderId();
    
    /**
     * List用
     */
    Page<Map<String, String>> getOrderList(Map<String, Object> pMap,PageInfo pageInfo);
}