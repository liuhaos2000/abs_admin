package com.abs.mobile.controller;

import java.util.List;

import javax.annotation.Resource;

import org.buzheng.demo.esm.web.util.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.abs.mobile.domain.TIndexLunbo;
import com.abs.mobile.domain.TItemType;
import com.abs.mobile.service.HomeService;
import com.abs.mobile.service.TypeService;

@Controller
@RequestMapping("/mobile/type")
public class TypeController extends BaseController {
	
    @Resource
    private TypeService typeService;
    
    /**
     * 获取自类型
     * @return
     */
    @RequestMapping("/getSubTypeList")
    @ResponseBody
    public Result getSubTypeList(String typeId) {
        Result request = new Result();
        List<TItemType> typeList= typeService.getTypeLevel2List(typeId);
        request.setData(typeList);
        return request;
    }
}
