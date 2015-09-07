package com.abs.mobile.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.abs.mobile.dao.TIndexLunboMapper;
import com.abs.mobile.dao.TItemMapper;
import com.abs.mobile.domain.TIndexLunbo;
import com.abs.mobile.service.HomeService;

@Service
public class HomeServiceImpl implements HomeService {

    @Resource
    private TIndexLunboMapper tIndexLunboMapper;
    @Resource
    private TItemMapper tItemMapper;
    /**
     * 获取轮播数据
     */
    @Override
    public List<TIndexLunbo> getLunBoList() {
        return tIndexLunboMapper.getLunboList();
    }
    
    /**
     * 取得商品
     */
    @Override
    public Map<String, Object> getItem() {
        
        List<Map<String, String>> itemList = tItemMapper.getItemTejia();
        Map<String, Object> group = new HashMap<String, Object>();
        group.put("HDFLG_5", itemList);
       
        return group;
    }



}
