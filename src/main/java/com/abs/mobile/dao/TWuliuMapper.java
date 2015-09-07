package com.abs.mobile.dao;

import com.abs.mobile.domain.TWuliu;

public interface TWuliuMapper {
    int deleteByPrimaryKey(Integer wuliuId);

    int insert(TWuliu record);

    int insertSelective(TWuliu record);

    TWuliu selectByPrimaryKey(Integer wuliuId);

    int updateByPrimaryKeySelective(TWuliu record);

    int updateByPrimaryKey(TWuliu record);
}