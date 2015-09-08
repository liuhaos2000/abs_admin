package com.abs.mobile.controller;

import java.util.List;
import java.util.Map;

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

	// index
	@RequestMapping("/lunbo")
	public String toIndex() {
		return "shop/lunbo";
	}
    // home
    // type
    @RequestMapping("/type")
    public String toType(ModelMap map) {
        List<TItemType> typeList=typeService.getTypePrentList();
        map.put("typeList", typeList);
        return "mobile/type";
    }
}
