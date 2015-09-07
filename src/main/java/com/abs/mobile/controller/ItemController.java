package com.abs.mobile.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.buzheng.demo.esm.web.util.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.abs.mobile.service.ItemService;

@Controller
@RequestMapping("/mobile/item")
public class ItemController extends BaseController {
	
    @Resource
    private ItemService itemService;
    
    /**
     * 获取商品销售价格
     * @return
     */
    @RequestMapping("/getItemSalePrice")
    @ResponseBody
    public Result getItemList(String itemId,String guige,String yanse) {
    	Result result = new Result();
    	Map<String,String> map = itemService.getItemPrice(itemId, guige, yanse);
    	result.setData(map);
        return result;
    }
}
