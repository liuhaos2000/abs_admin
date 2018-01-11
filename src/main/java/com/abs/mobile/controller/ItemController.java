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

import com.abs.mobile.dao.TItemDetailMapper;
import com.abs.mobile.dao.TItemMapper;
import com.abs.mobile.dao.TItemXiaoliangMapper;
import com.abs.mobile.domain.TItem;
import com.abs.mobile.domain.TItemXiaoliang;
import com.abs.mobile.service.ItemService;
import com.abs.mobile.service.SessionService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
@RequestMapping("/admin/item")
@SessionAttributes(App.USER_SESSION_KEY)
public class ItemController extends BaseController {
	
    @Resource
    private ItemService itemService;
    @Resource
    private TItemMapper iItemMapper;
    @Resource
    private TItemXiaoliangMapper iItemXiaoliangMapper;
    @Resource
    private TItemDetailMapper tItemDetailMapper;
    @Resource
    private SessionService sessionService;
    
    /**
     * 获取商品列表
     * @return
     */
    @RequestMapping("/list")
    @ResponseBody
    public Map<String, Object> list(
            @RequestParam(value="page", defaultValue="1") int pageNo, 
            @RequestParam(value="rows", defaultValue="15") int pageSize,
            @RequestParam(value="orderby", defaultValue="item_id  desc") String orderby,
            @ModelAttribute(App.USER_SESSION_KEY) SysUser user,
            String searchItemName,
            String searchOwnerOpenId) {
        
        int pgno = pageNo > 0 ? pageNo - 1 : pageNo;
        PageInfo pageInfo = new PageInfo(pgno,pageSize,orderby);
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("searchItemName", searchItemName);
        params.put("searchOwnerOpenId", searchOwnerOpenId);
        Page<Map<String,String>> page = itemService.getItemList(params, pageInfo);
        
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("total", page.getTotalElements());
        data.put("rows", page.getContent());
        
        return data;
    }
    
    @RequestMapping("/getOneItem")
    @ResponseBody
    public Result  getOneItem(Integer itemId){
        Result result = new Result();
        Map<String, Object> data = new HashMap<String, Object>();
        TItem tItem = iItemMapper.selectByPrimaryKey(itemId);
        TItemXiaoliang tItemXiaoliang = iItemXiaoliangMapper.selectByPrimaryKey(itemId);
        data.put("tItem", tItem);
        data.put("tItemXiaoliang", tItemXiaoliang);
        result.setData(data);
        return result;
    }
    
    
    /**
     * 获取商品详细列表
     * @return
     */
    @RequestMapping("/getItemDetailList")
    @ResponseBody
    public Map<String, Object> getItemDetailList(
            @RequestParam(value="page", defaultValue="1") int pageNo, 
            @RequestParam(value="rows", defaultValue="15") int pageSize,
            @RequestParam(value="orderby", defaultValue="item_id  desc") String orderby,
            Integer itemId) {
        
        int pgno = pageNo > 0 ? pageNo - 1 : pageNo;
        PageInfo pageInfo = new PageInfo(pgno,pageSize,orderby);
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("itemId", itemId);
        Page<Map<String,String>> page = itemService.getItemDetailList(params, pageInfo);
        
        
        Map<String, Object> data = new HashMap<String, Object>();
        data.put("total", page.getTotalElements());
        data.put("rows", page.getContent());
        
        return data;
    }
    /**
     * 获取商品图片列表
     * @return
     */
    @RequestMapping("/getItemPictureList")
    @ResponseBody
    public Map<String, Object> getItemPictureList(
            @RequestParam(value="page", defaultValue="1") int pageNo, 
            @RequestParam(value="rows", defaultValue="15") int pageSize,
            @RequestParam(value="orderby", defaultValue="picture_type,picture_id") String orderby,
            Integer itemId) {
        
        int pgno = pageNo > 0 ? pageNo - 1 : pageNo;
        PageInfo pageInfo = new PageInfo(pgno,pageSize,orderby);
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("itemId", itemId);
        Page<Map<String,String>> page = itemService.getItemPictureList(params, pageInfo);
        
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
    @RequestMapping("/itemSave")
    @ResponseBody
    public Result  itemSave(String changeMod,
    		String itemData,
    		String futext,
    		String itemDetailData,
    		String itemPictureData,
    		String itemId,
    		String xiaoliang
    		){
    	
    	JSONObject jsonObject=JSONObject.fromObject(itemData);
    	TItem item=(TItem)JSONObject.toBean(jsonObject, TItem.class);
    	
    	List<Map<String,String>> itemDist1=(List<Map<String,String>>)JSONArray.toList(JSONArray.fromObject(itemDetailData), HashMap.class);
    	List<Map<String,String>> itemPlist1=(List<Map<String,String>>)JSONArray.toList(JSONArray.fromObject(itemPictureData), HashMap.class);
    	
    	String fuText=null;
    	try {
    		fuText=URLDecoder.decode(futext, "utf-8");
    		item.setFuText(fuText);
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        Result result = new Result();
        Map<String, Object> data = new HashMap<String, Object>();
        // service
        itemService.itemSave(changeMod, item, itemDist1, itemPlist1, itemId,xiaoliang);
        
//        TItem tItem = iItemMapper.selectByPrimaryKey(itemId);
//        data.put("tItem", tItem);
        result.setData(data);
        return result;
    }
}
