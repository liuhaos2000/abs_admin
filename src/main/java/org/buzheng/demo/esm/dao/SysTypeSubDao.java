package org.buzheng.demo.esm.dao;

import java.util.List;

import org.buzheng.demo.esm.domain.SysTypeSub;
import org.buzheng.demo.esm.domain.SysTypeSubKey;

public interface SysTypeSubDao {
    int deleteByPrimaryKey(SysTypeSubKey key);

    int insert(SysTypeSub record);

    int insertSelective(SysTypeSub record);

    SysTypeSub selectByPrimaryKey(SysTypeSubKey key);

    int updateByPrimaryKeySelective(SysTypeSub record);

    int updateByPrimaryKey(SysTypeSub record);
    
    /**
     * 取得下拉框内容
     */
    List<SysTypeSub> getTypeList(String typeCode);
}