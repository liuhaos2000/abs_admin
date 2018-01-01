package com.abs.mobile.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.springframework.data.domain.Page;

import com.abs.mobile.domain.TOrder;
import com.abs.mobile.domain.TOrderKey;

public interface TOrderMapper {
    int deleteByPrimaryKey(String orderId);

    int insert(TOrder record);

    int insertSelective(TOrder record);

    TOrder selectByPrimaryKey(String orderId);

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
    /**
     * List用
     */
    List<Map<String, String>> getOrderList(@Param("param1")Map<String, Object> param1);
}