package com.abs.mobile.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.sf.json.JSONArray;

import org.buzheng.demo.esm.web.util.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.abs.mobile.domain.TOrder;
import com.abs.mobile.domain.TOrderDetail;
import com.abs.mobile.service.CartService;
import com.abs.mobile.service.OrderService;
import com.abs.util.exception.BusinessException;

@Controller
@RequestMapping("/mobile/order")
public class OrderController extends BaseController {
	
    @Resource
    private CartService cartService;
    @Resource
    private OrderService orderService;
    /**
     * 取得购物车中商品数量
     * @return
     * @throws BusinessException 
     */
    @RequestMapping("/orderSubmit")
    @ResponseBody
    public Result orderSubmit(TOrder order,String orderItems) throws BusinessException {
        JSONArray json = JSONArray.fromObject(orderItems);
        @SuppressWarnings("unchecked")
        List<TOrderDetail> orderDetailList = 
            (List<TOrderDetail>)JSONArray.toList(json, TOrderDetail.class);
        
        Result request = new Result();
        
        Map<String, Object> resultMap = orderService.orderSubmit(order,orderDetailList);
       
        request.setData(resultMap);
        return request;
    }
    
    /**
     * 更新订单为已经支付状态
     * @return
     * @throws BusinessException 
     */
    @RequestMapping("/orderSubmit")
    @ResponseBody
    public Result updOrderToPayed(String orderId,String payId) throws BusinessException {
        
        Result request = new Result();
        
        Map<String, Object> resultMap = orderService.updOrderToPayed(orderId,payId);
        
        request.setData(resultMap);
        return request;
    }
    
}
