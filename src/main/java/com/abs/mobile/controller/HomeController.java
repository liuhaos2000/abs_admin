package com.abs.mobile.controller;

import java.util.List;

import javax.annotation.Resource;

import org.buzheng.demo.esm.web.util.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.abs.mobile.domain.TIndexLunbo;
import com.abs.mobile.service.HomeService;

@Controller
@RequestMapping("/mobile/home")
public class HomeController extends BaseController {
	
    @Resource
    private HomeService homeService;
    
    /**
     * 获取轮播数据
     * @return
     */
    @RequestMapping("/getLunBolist")
    @ResponseBody
    public Result getLunBolist() {
        Result request = new Result();
        List<TIndexLunbo> LunboList= homeService.getLunBoList();
        request.setData(LunboList);
        return request;
    }
}
