package com.abs.mobile.dao;

import java.util.List;
import java.util.Map;

import com.abs.mobile.domain.TWuliuGongsi;

public interface TWuliuGongsiMapper {
    int deleteByPrimaryKey(String gongsiId);

    int insert(TWuliuGongsi record);

    int insertSelective(TWuliuGongsi record);

    TWuliuGongsi selectByPrimaryKey(String gongsiId);

    int updateByPrimaryKeySelective(TWuliuGongsi record);

    int updateByPrimaryKey(TWuliuGongsi record);
    
    /**
     * 下拉框用
     */
    List<Map<String, String>> getWuliuGongsiList();
    
}