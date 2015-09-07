package com.abs.mobile.dao;

import com.abs.mobile.domain.TOrderDetail;
import com.abs.mobile.domain.TOrderDetailKey;

public interface TOrderDetailMapper {
    int deleteByPrimaryKey(TOrderDetailKey key);

    int insert(TOrderDetail record);

    int insertSelective(TOrderDetail record);

    TOrderDetail selectByPrimaryKey(TOrderDetailKey key);

    int updateByPrimaryKeySelective(TOrderDetail record);

    int updateByPrimaryKey(TOrderDetail record);
}