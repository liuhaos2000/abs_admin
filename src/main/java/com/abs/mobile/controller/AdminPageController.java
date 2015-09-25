package com.abs.mobile.controller;

import java.util.List;

import javax.annotation.Resource;

import org.buzheng.demo.esm.domain.SysTypeSub;
import org.buzheng.demo.esm.service.SysTypeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.abs.mobile.domain.TItemType;
import com.abs.mobile.service.OrderService;
import com.abs.mobile.service.TypeService;

@Controller
@RequestMapping("/admin/page")
public class AdminPageController {
    
    @Resource
    private OrderService orderService;
    @Resource
    private TypeService typeService;
    @Resource
    private SysTypeService sysTypeService;

	// lunbo
	@RequestMapping("/lunbo")
	public String lunbo() {
		return "shop/lunbo";
	}

	// order
    @RequestMapping("/order")
    public String order(ModelMap map) {
        //订单列表初始化
        List<SysTypeSub> orderStatusList = sysTypeService.getTypeList("1");
        map.put("orderStatusList", orderStatusList);
        return "order/order";
    }

    // type
    @RequestMapping("/type")
    public String toType(ModelMap map) {
        List<TItemType> typeList=typeService.getTypePrentList();
        map.put("typeList", typeList);
        return "mobile/type";
    }
}
