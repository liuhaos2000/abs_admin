package com.abs.mobile.dao;

import com.abs.mobile.domain.TItemXiaoliang;

public interface TItemXiaoliangMapper {
    int deleteByPrimaryKey(Integer itemId);

    int insert(TItemXiaoliang record);

    int insertSelective(TItemXiaoliang record);

    TItemXiaoliang selectByPrimaryKey(Integer itemId);

    int updateByPrimaryKeySelective(TItemXiaoliang record);

    int updateByPrimaryKey(TItemXiaoliang record);
}