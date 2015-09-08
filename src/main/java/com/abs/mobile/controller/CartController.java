package com.abs.mobile.controller;

import javax.annotation.Resource;

import org.buzheng.demo.esm.web.util.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/mobile/cart")
public class CartController extends BaseController {
	
    @Resource
    //private CartService cartService;
	
    /**
     * 取得购物车中商品数量
     * @return
     */
    @RequestMapping("/getCount")
    @ResponseBody
    public Result getCount() {
        Result request = new Result();
        //request.setData(cartService.getCount());
        return request;
    }
    
}
