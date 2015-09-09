package com.abs.mobile.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.buzheng.demo.esm.App;
import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.buzheng.demo.esm.domain.SysUser;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.abs.mobile.service.OrderService;

@Controller
@RequestMapping("/admin/order")
public class OrderController extends BaseController {
	
    @Resource
    private OrderService orderService;
	
    /**
     * 取得购物车中商品数量
     * @return
     */
    @RequestMapping("/list")
    @ResponseBody
    public Map<String, Object> list(
            @RequestParam(value="page", defaultValue="1") int pageNo, 
            @RequestParam(value="rows", defaultValue="20") int pageSize,
            @RequestParam(value="orderby", defaultValue="xiaoliang asc") String orderby,
            @ModelAttribute(App.USER_SESSION_KEY) SysUser user) {
        
        int pgno = pageNo > 0 ? pageNo - 1 : pageNo;
        PageInfo pageInfo = new PageInfo(pgno,pageSize,orderby);
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("userId", user.getUserId());
        Page<Map<String,String>> page = orderService.getOrderList(params, pageInfo);
        
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("total", page.getTotalElements());
        data.put("rows", page.getContent());
        
        return data;
    }
    
}
