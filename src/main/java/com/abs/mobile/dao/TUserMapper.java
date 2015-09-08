package com.abs.mobile.dao;

import com.abs.mobile.domain.TUser;

public interface TUserMapper {
    int deleteByPrimaryKey(String openId);

    int insert(TUser record);

    int insertSelective(TUser record);

    TUser selectByPrimaryKey(String openId);

    int updateByPrimaryKeySelective(TUser record);

    int updateByPrimaryKey(TUser record);
}