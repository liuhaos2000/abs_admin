package com.abs.mobile.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.abs.mobile.domain.TItem;
import com.abs.mobile.service.ShopuserService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/admin/shopuser")
@SessionAttributes(App.USER_SESSION_KEY)
public class ShopuserController extends BaseController {

	@Resource
	private ShopuserService shopuserService;

	/**
	 * 
	 * @return
	 */
    /**
     * 获取商品列表
     * @return
     */
    @RequestMapping("/list")
    @ResponseBody
    public Map<String, Object> list(
            @RequestParam(value="page", defaultValue="1") int pageNo, 
            @RequestParam(value="rows", defaultValue="15") int pageSize,
            @RequestParam(value="orderby", defaultValue="lever") String orderby,
            @ModelAttribute(App.USER_SESSION_KEY) SysUser user,
            String searchParentNickname,
            String searchNickname,
            String searchLever) {
        
        int pgno = pageNo > 0 ? pageNo - 1 : pageNo;
        PageInfo pageInfo = new PageInfo(pgno,pageSize,orderby);
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("searchParentNickname", searchParentNickname);
        params.put("searchNickname", searchNickname);
        params.put("searchLever", searchLever);
        Page<Map<String,String>> page = shopuserService.getShopuserList(params, pageInfo);
        
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("total", page.getTotalElements());
        data.put("rows", page.getContent());
        
        return data;
    }
    
    
    /**
     * 保存Item
     * @param itemId
     * @return
     */
    @RequestMapping("/save")
    @ResponseBody
    public Result  itemSave(
    		String openId,
    		String lever,
    		String parent
    		){
    	
        Result result = new Result();
        Map<String, Object> data = new HashMap<String, Object>();
        // service
        shopuserService.save(openId, lever, parent);
        
        result.setData(data);
        return result;
    }
    
    
    
}
