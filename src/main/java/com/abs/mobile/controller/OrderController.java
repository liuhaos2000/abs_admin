package com.abs.mobile.controller;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.buzheng.demo.esm.App;
import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.buzheng.demo.esm.domain.SysUser;
import org.buzheng.demo.esm.web.util.Result;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.abs.mobile.domain.TOrderDetail;
import com.abs.mobile.service.OrderService;
import com.abs.mobile.service.SessionService;
import com.abs.mobile.util.OrderListViewExcel;
import com.abs.util.commom.AbsConst;
import com.abs.util.commom.AbsTool;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/admin/order")
@SessionAttributes(App.USER_SESSION_KEY)
public class OrderController extends BaseController {
	
    @Resource
    private OrderService orderService;
    @Resource
    private SessionService sessionService;
    
    
    /**
     * 取得购物车中商品数量
     * @return
     */
    @RequestMapping("/list")
    @ResponseBody
    public Map<String, Object> list(
            @RequestParam(value="page", defaultValue="1") int pageNo, 
            @RequestParam(value="rows", defaultValue="15") int pageSize,
            @RequestParam(value="orderby", defaultValue="order_id  desc,from_name,item_name") String orderby,
            @ModelAttribute(App.USER_SESSION_KEY) SysUser user,
            String orderStatus,
            String orderDateFrom,
            String orderDateTo,
            String tel,
            String orderId,
            String ownerOpenId) {
        
        int pgno = pageNo > 0 ? pageNo - 1 : pageNo;
        PageInfo pageInfo = new PageInfo(pgno,pageSize,orderby);
        Map<String, Object> params = new HashMap<String, Object>();
        // 管理员的场合
        params.put("orderStatus", orderStatus);
        params.put("orderDateFrom", AbsTool.stringToTimestamp(orderDateFrom+AbsConst.TIEM_MIN));
        params.put("orderDateTo", AbsTool.stringToTimestamp(orderDateTo+AbsConst.TIME_MAX));
        params.put("tel", tel);
        params.put("orderId", orderId);
        params.put("ownerOpenId", ownerOpenId);
        //保存检索条件 START
        sessionService.getSession().setAttribute("admin_order_list_params", params);
        sessionService.getSession().setAttribute("admin_order_list_orderby", orderby);
        //保存检索条件 E N D
        Page<Map<String,String>> page = orderService.getOrderList(params, pageInfo);
        
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("total", page.getTotalElements());
        data.put("rows", page.getContent());
        
        return data;
    }
    
    /**
     * 取得EXCEL
     * @return
     */
    @RequestMapping("/getExcel")
    public ModelAndView  getExcel(
            @RequestParam(value="page", defaultValue="1") int pageNo, 
            @RequestParam(value="rows", defaultValue="999") int pageSize,
            @RequestParam(value="orderby", defaultValue="order_id desc,order_date desc") String orderby,
            @ModelAttribute(App.USER_SESSION_KEY) SysUser user) {
        
    	// 取得检索条件 START
    	Map<String, Object> params = (Map<String, Object>)sessionService.getSession().getAttribute("admin_order_list_params");
        String orderbySession=(String)sessionService.getSession().getAttribute("admin_order_list_orderby");
    	// 取得检索条件 END
        PageInfo pageInfo=null;
        int pgno = pageNo > 0 ? pageNo - 1 : pageNo;
    	if(StringUtils.isEmpty(orderbySession)){
    		pageInfo = new PageInfo(pgno,pageSize,orderby);
    	}else{
    		pageInfo = new PageInfo(pgno,pageSize,orderbySession);
    	}
        
    	if (params==null){
    		params = new HashMap<String, Object>();
    	}
        
        Page<Map<String,String>> page = orderService.getOrderList(params, pageInfo);
        
        Map model = new HashMap();         
        model.put("orderList", page.getContent());              
        return new ModelAndView(new OrderListViewExcel(), model);  
    }
    
    
    @RequestMapping("/wuliuSave")
    @ResponseBody
    public Result  wuliuSave(String wuliuGongsi,String wuliuNo,String orderItems) {
    	
        JSONArray json = JSONArray.fromObject(orderItems);
        @SuppressWarnings("unchecked")
        List<TOrderDetail> orderDetailList = 
            (List<TOrderDetail>)JSONArray.toList(json, TOrderDetail.class);
    	
        orderService.wuliuSave(wuliuGongsi, wuliuNo, orderDetailList);
        
		return new Result();
        
    }

    @RequestMapping("/backItemSave")
    @ResponseBody
    public Result  backItemSave(String orderId,
    		String itemId,
    		String itemGuige,
    		String itemYanse,
    		String tuihuoFlg,
    		String price,
    		String cost,
    		String lv00Lirun,
    		String lv01Lirun,
    		String lv02Lirun,
    		String gongsiId,
    		String wuliuCode
    		) {
    	
    	TOrderDetail orderDetail1 = new TOrderDetail();
    	orderDetail1.setOrderId(orderId);
    	orderDetail1.setItemId(new Integer(itemId));
    	orderDetail1.setItemGuige(new Integer(itemGuige));
    	orderDetail1.setItemYanse(new Integer(itemYanse));
    	orderDetail1.setTuihuoFlg(tuihuoFlg);
    	orderDetail1.setPrice(new BigDecimal(price));
    	orderDetail1.setCost(new BigDecimal(cost));
    	orderDetail1.setLv00Lirun(new BigDecimal(lv00Lirun));
    	orderDetail1.setLv01Lirun(new BigDecimal(lv01Lirun));
    	orderDetail1.setLv02Lirun(new BigDecimal(lv02Lirun));
    	orderDetail1.setGongsiId(gongsiId);
    	orderDetail1.setWuliuCode(wuliuCode);
    	
        orderService.backItemSave(orderDetail1);
        
		return new Result();
        
    }
    
}
