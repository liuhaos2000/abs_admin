package com.abs.mobile.controller;

import javax.annotation.Resource;

import org.buzheng.demo.esm.web.util.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.abs.mobile.service.CartService;
import com.abs.mobile.service.ItemService;

@Controller
@RequestMapping("/mobile/cart")
public class CartController extends BaseController {
	
    @Resource
    private CartService cartService;
	
    /**
     * 取得购物车中商品数量
     * @return
     */
    @RequestMapping("/getCount")
    @ResponseBody
    public Result getCount() {
        Result request = new Result();
        request.setData(cartService.getCount());
        return request;
    }
    
    /**
     * 取得购物车中商品数量
     * @return
     */
    @RequestMapping("/addItem")
    @ResponseBody
    public Result addItem(String itemId,String xinghao,
    				String yanse,String shuliang) {
        Result request = new Result();
        cartService.addItem(itemId, xinghao, yanse, shuliang);
        return request;
    }
    
    /**
     * 删除
     * @return
     */
    @RequestMapping("/delItemFromCart")
    @ResponseBody
    public Result delItemFromCart(String itemId,String guige,
    				String yanse) {
        Result request = new Result();
        cartService.delItemFromCart(itemId, guige, yanse);
        return request;
    }
}
