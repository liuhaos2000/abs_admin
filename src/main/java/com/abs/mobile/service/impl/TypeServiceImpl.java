package com.abs.mobile.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.abs.mobile.dao.TItemTypeMapper;
import com.abs.mobile.domain.TItemType;
import com.abs.mobile.service.TypeService;

@Service
public class TypeServiceImpl implements TypeService {

    @Resource
    TItemTypeMapper tItemTypeMapper;
    
    /**
     * 取得父类型
     * @return
     */
    @Override
    public List<TItemType> getTypePrentList() {
        return tItemTypeMapper.getTypePrent();
    }
    
    /**
     * 取得子类型
     * @param typeId
     * @return
     */
    @Override
    public List<TItemType> getTypeLevel2List(String typeId) {
        return tItemTypeMapper.getTypeLevel2(typeId);
    }

}
