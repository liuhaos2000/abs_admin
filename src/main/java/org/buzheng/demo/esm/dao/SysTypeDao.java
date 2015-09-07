package org.buzheng.demo.esm.dao;

import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.buzheng.demo.esm.domain.SysType;
import org.springframework.data.domain.Page;

public interface SysTypeDao {
    int deleteByPrimaryKey(Integer typeCode);

    int insert(SysType record);

    int insertSelective(SysType record);

    SysType selectByPrimaryKey(Integer typeCode);

    int updateByPrimaryKeySelective(SysType record);

    int updateByPrimaryKey(SysType record);
    // 自定义
    /**
     * 翻页
     * @param pageInfo
     * @return
     */
    Page<SysType> findPage(PageInfo pageInfo);

    /**
     * 存在Check
     */
    int countByTypeName(String typeName);
}