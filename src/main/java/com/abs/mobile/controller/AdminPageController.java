package com.abs.mobile.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.buzheng.demo.esm.domain.SysTypeSub;
import org.buzheng.demo.esm.service.SysTypeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.abs.mobile.dao.TItemMapper;
import com.abs.mobile.dao.TOrderMapper;
import com.abs.mobile.dao.TRegionMapper;
import com.abs.mobile.dao.TUserMapper;
import com.abs.mobile.dao.TWuliuGongsiMapper;
import com.abs.mobile.domain.TItemType;
import com.abs.mobile.service.OrderService;
import com.abs.mobile.service.TypeService;
import com.abs.util.commom.AbsConstMap;

@Controller
@RequestMapping("/admin/page")
public class AdminPageController {
    
    @Resource
    private OrderService orderService;
    @Resource
    private TypeService typeService;
    @Resource
    private SysTypeService sysTypeService;
    @Resource
    private TItemMapper tItemMapper; 
    @Resource
    private TWuliuGongsiMapper tWuliuGongsiMapper; 
    @Resource
    private TRegionMapper tRegionMapper; 
    @Resource
    private TUserMapper tUserMapper; 
    
    
    
	// lunbo
	@RequestMapping("/lunbo")
	public String lunbo() {
		return "shop/lunbo";
	}

	// order
    @RequestMapping("/order")
    public String order(ModelMap map) {
        //订单列表初始化
    	//List<Map<String, String>> aa = iItemMapper.getOnwerList();
    	map.put("onwerList", tItemMapper.getOnwerList());
    	map.put("wuliuGongsiList", tWuliuGongsiMapper.getWuliuGongsiList());
        map.put("orderStatusMap", AbsConstMap.ORDER_STATUS);
        return "order/order";
    }

    // type
    @RequestMapping("/type")
    public String toType(ModelMap map) {
        List<TItemType> typeList=typeService.getTypePrentList();
        map.put("typeList", typeList);
        return "mobile/type";
    }
    
    @RequestMapping("/item")
    public String toItem(ModelMap map) {
    	map.put("onwerList", tItemMapper.getOnwerList());
    	map.put("wuliuGongsiList", tWuliuGongsiMapper.getWuliuGongsiList());
    	map.put("typeList", AbsConstMap.ITEM_TYPE);
    	map.put("areaList",tRegionMapper.getRegion1());
    	map.put("baoyouFlg",AbsConstMap.BAOYOU_FLG);
    	map.put("shangjiaFlg",AbsConstMap.SHANGJIA_FLG);
    	map.put("pictureType",AbsConstMap.PICTURE_TYPE);
    	map.put("vipUserList",tUserMapper.getVipUserList());
    	
        return "item/item";
    }
}
