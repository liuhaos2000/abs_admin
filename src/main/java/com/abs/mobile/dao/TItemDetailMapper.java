package com.abs.mobile.dao;

import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.springframework.data.domain.Page;

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
     * List用 明细
     */
    Page<Map<String, String>> getItemDetailList(@Param("param1")Map<String, Object> param1,PageInfo pageInfo);
}