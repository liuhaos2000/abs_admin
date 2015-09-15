package com.abs.mobile.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
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
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.abs.mobile.domain.TUser;
import com.abs.mobile.service.OrderService;
import com.abs.mobile.util.ViewExcel;
import com.abs.mobile.util.ViewPDF;

@Controller
@RequestMapping("/admin/order")
@SessionAttributes(App.USER_SESSION_KEY)
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
            @RequestParam(value="orderby", defaultValue="order_date desc") String orderby,
            @ModelAttribute(App.USER_SESSION_KEY) SysUser user) {
        
        int pgno = pageNo > 0 ? pageNo - 1 : pageNo;
        PageInfo pageInfo = new PageInfo(pgno,pageSize,orderby);
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("owner", user.getUsername());
        Page<Map<String,String>> page = orderService.getOrderList(params, pageInfo);
        
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("total", page.getTotalElements());
        data.put("rows", page.getContent());
        
        return data;
    }
    

    /**
     * 取得PDF
     * @return
     */
    @RequestMapping("/getPdf")
    public ModelAndView  getPdf(
            @RequestParam(value="page", defaultValue="1") int pageNo, 
            @RequestParam(value="rows", defaultValue="20") int pageSize,
            @RequestParam(value="orderby", defaultValue="order_date desc") String orderby,
            @ModelAttribute(App.USER_SESSION_KEY) SysUser user) {
        
        Map model = new HashMap();         
        model.put("list", getStudents());              
        return new ModelAndView(new ViewPDF(), model);  
    }
    /**
     * 取得EXCEL
     * @return
     */
    @RequestMapping("/getExcel")
    public ModelAndView  getExcel(
            @RequestParam(value="page", defaultValue="1") int pageNo, 
            @RequestParam(value="rows", defaultValue="999") int pageSize,
            @RequestParam(value="orderby", defaultValue="order_date desc") String orderby,
            @ModelAttribute(App.USER_SESSION_KEY) SysUser user) {
        
        int pgno = pageNo > 0 ? pageNo - 1 : pageNo;
        PageInfo pageInfo = new PageInfo(pgno,pageSize,orderby);
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("owner", user.getUsername());
        Page<Map<String,String>> page = orderService.getOrderList(params, pageInfo);
        
        
        Map model = new HashMap();         
        model.put("orderList", page.getContent());              
        return new ModelAndView(new ViewExcel(), model);  
    }
    
    /**
     * TODO
     * @return
     */
    private List getStudents(){  
        List stuList = new ArrayList();  
        // 构造数据  
        TUser tuser = new TUser();
        tuser.setNickname("AAAA1");
        tuser.setCity("cq");
        
        TUser tuser1 = new TUser();
        tuser1.setNickname("AAAA2");
        tuser1.setCity("cq2");
        
        TUser tuser2 = new TUser();
        tuser2.setNickname("AAAA3");
        tuser2.setCity("cq3");
        
        stuList.add(tuser);  
        stuList.add(tuser1);  
        stuList.add(tuser2);  
        return stuList;  
    }  
}
