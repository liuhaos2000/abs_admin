package com.abs.mobile.dao;

import java.util.List;
import java.util.Map;

import com.abs.mobile.domain.TUserAddress;
import com.abs.mobile.domain.TUserAddressKey;

public interface TUserAddressMapper {
    int deleteByPrimaryKey(TUserAddressKey key);

    int insert(TUserAddress record);

    int insertSelective(TUserAddress record);

    TUserAddress selectByPrimaryKey(TUserAddressKey key);

    int updateByPrimaryKeySelective(TUserAddress record);

    int updateByPrimaryKey(TUserAddress record);
    /**
     * 取得用户地址，默认的地址排第一
     * @param key
     * @return
     */
    List<Map<String,String>> getUserAddress(String openId);
    /**
     * 插入用户地址
     * @param key
     * @return
     */
    int insertAddress(TUserAddress record);
    /**
     * 取消所有默认地址
     * @param key
     * @return
     */
    int updAddressMoren(String openId);
    
    /**
     * 取得刚插入的数据
     * @param key
     * @return
     */
    List<Map<String,String>> getUserAddressInsert(String openId);
    /**
     * 取得刚更新的数据
     * @param key
     * @return
     */
    List<Map<String,String>> getUserAddressUpdate(String openId,String addressId);
}