package com.abs.mobile.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.abs.mobile.service.HuiyuanService;
import com.abs.mobile.service.SessionService;

@Service
public class HuiyuanServiceImpl implements HuiyuanService {
	@Resource
	private SessionService sessionService;
    @Override
    public Map<String, Object> huiyuanInit(String orderId, String payId) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        
        return resultMap;
    }


}
