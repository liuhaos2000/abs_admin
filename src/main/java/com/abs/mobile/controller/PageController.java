package com.abs.mobile.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.abs.mobile.domain.TItemType;
import com.abs.mobile.service.TypeService;

@Controller
@RequestMapping("/admin/page")
public class PageController {

    @Resource
    private TypeService typeService;

	// lunbo
	@RequestMapping("/lunbo")
	public String lunbo() {
		return "shop/lunbo";
	}

	// index
    @RequestMapping("/order")
    public String order() {
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
