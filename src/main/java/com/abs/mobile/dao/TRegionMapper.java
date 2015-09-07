package com.abs.mobile.dao;

import java.util.List;

import com.abs.mobile.domain.TRegion;

public interface TRegionMapper {
    int deleteByPrimaryKey(Short regionId);

    int insert(TRegion record);

    int insertSelective(TRegion record);

    TRegion selectByPrimaryKey(Short regionId);

    int updateByPrimaryKeySelective(TRegion record);

    int updateByPrimaryKey(TRegion record);
    /**
     * 取地址一级，二级，三级
     * @return
     */
    List<TRegion> getRegion1();
    /**
     * 取地址二级，三级
     * @return
     */
    List<TRegion> getRegion2(String parent);
}