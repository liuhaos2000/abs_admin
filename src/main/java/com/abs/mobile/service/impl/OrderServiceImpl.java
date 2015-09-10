package com.abs.mobile.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.abs.mobile.dao.TOrderMapper;
import com.abs.mobile.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

    @Resource
    TOrderMapper tOrderMapper;
 
    /**
     * 获取订单
     */
    @Override
    public Page<Map<String, String>> getOrderList(Map<String, Object> params,
            PageInfo pageInfo) {
        return tOrderMapper.getOrderList(params, pageInfo);
    }


    


    

}
