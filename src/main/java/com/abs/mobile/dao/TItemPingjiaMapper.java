package com.abs.mobile.dao;

import java.util.List;
import java.util.Map;

import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.springframework.data.domain.Page;

import com.abs.mobile.domain.TItemPingjia;
import com.abs.mobile.domain.TItemPingjiaKey;

public interface TItemPingjiaMapper {
    int deleteByPrimaryKey(TItemPingjiaKey key);

    int insert(TItemPingjia record);

    int insertSelective(TItemPingjia record);

    TItemPingjia selectByPrimaryKey(TItemPingjiaKey key);

    int updateByPrimaryKeySelective(TItemPingjia record);

    int updateByPrimaryKey(TItemPingjia record);
    /**
     * 取得评价
     */
    Page<Map<String,String>> getPingjia(String itemId,PageInfo pageInfo);
    /**
     * 取得评价
     */
    List<TItemPingjia> getPingjia(String itemId);
}