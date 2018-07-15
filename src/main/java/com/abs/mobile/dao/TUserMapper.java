package com.abs.mobile.dao;

import java.util.List;
import java.util.Map;

import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.springframework.data.domain.Page;

import com.abs.mobile.domain.TUser;

public interface TUserMapper {
    int deleteByPrimaryKey(String openId);

    int insert(TUser record);

    int insertSelective(TUser record);

    TUser selectByPrimaryKey(String openId);

    int updateByPrimaryKeySelective(TUser record);

    int updateByPrimaryKey(TUser record);
    
    /**
     * 选取所有VIP用户,下拉框用
     */
    List<Map<String, String>> getVipUserList();
    /**
     * List用
     */
    Page<Map<String, String>> getShopuserList(Map<String, Object> pMap,PageInfo pageInfo);
}