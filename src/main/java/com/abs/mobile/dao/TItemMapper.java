package com.abs.mobile.dao;

import java.util.List;
import java.util.Map;

import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.springframework.data.domain.Page;

import com.abs.mobile.domain.TItem;

public interface TItemMapper {
    int deleteByPrimaryKey(Integer itemId);

    int insert(TItem record);

    int insertSelective(TItem record);

    TItem selectByPrimaryKey(Integer itemId);

    int updateByPrimaryKeySelective(TItem record);

    int updateByPrimaryKeyWithBLOBs(TItem record);

    int updateByPrimaryKey(TItem record);
    /**
     * Home用
     */
    List<Map<String, String>> getItemTejia();
    /**
     * List用
     */
    Page<Map<String, String>> getItemList(Map<String, Object> pMap,PageInfo pageInfo);
    /**
     * Item用
     */
    List<Map<String, String>> getItemInfo(String itemId,String pictureType);
}