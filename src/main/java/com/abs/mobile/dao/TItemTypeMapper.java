package com.abs.mobile.dao;

import java.util.List;

import com.abs.mobile.domain.TItemType;

public interface TItemTypeMapper {
    int deleteByPrimaryKey(Integer typeId);

    int insert(TItemType record);

    int insertSelective(TItemType record);

    TItemType selectByPrimaryKey(Integer typeId);

    int updateByPrimaryKeySelective(TItemType record);

    int updateByPrimaryKey(TItemType record);
    
    List<TItemType> getTypePrent();
    
    List<TItemType> getTypeLevel2(String typeId);
}