package com.abs.mobile.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

import com.abs.mobile.dao.TItemDetailMapper;
import com.abs.mobile.dao.TItemMapper;
import com.abs.mobile.dao.TItemPictureMapper;
import com.abs.mobile.dao.TItemPingjiaMapper;
import com.abs.mobile.dao.TItemXiaoliangMapper;
import com.abs.mobile.domain.TItem;
import com.abs.mobile.domain.TItemDetail;
import com.abs.mobile.domain.TItemPicture;
import com.abs.mobile.domain.TItemXiaoliang;
import com.abs.mobile.service.ItemService;
import com.abs.mobile.service.SessionService;
import com.abs.util.commom.AbsTool;

@Service
public class ItemServiceImpl implements ItemService {

	@Resource
	private TItemMapper tItemMapper;
	@Resource
	private TItemPictureMapper tItemPictureMapper;
	@Resource
	private TItemDetailMapper tItemDetailMapper;
	@Resource
	private TItemPingjiaMapper tItemPingjiaMapper;
	@Resource
	private TItemXiaoliangMapper tItemXiaoliangMapper;
	@Resource
	private SessionService sessionService;

	@Override
	public Map<String, Object> getItem(String itemId) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		// 商品基本信息取得
		List<Map<String, String>>  mapList = tItemMapper.getItemInfo(itemId, "3");
		if(mapList.size()<1){
			return null;
		}
		Map<String, String> itemMap = mapList.get(0); 
		resultMap.put("item", itemMap);
		// 产品参数转换
		String itemParm = itemMap.get("parm");
		resultMap.put("itemParm", AbsTool.changeItemParm(itemParm));
		// 取得商品图片
		List<TItemPicture> tupianList = tItemPictureMapper.getItemPictures(itemId,"2");
		resultMap.put("tupianList", tupianList);
		List<TItemPicture> tupianList3 = tItemPictureMapper.getItemPictures(itemId,"3");
		resultMap.put("tupianList3", tupianList3);

		// 取得详细信息
		List<TItemDetail> itemDetail = tItemDetailMapper.getItemDetail(itemId);
		resultMap.put("itemDetail", itemDetail);
		Map<String, String> mmPrice = tItemDetailMapper.getItemPriceFromTo(itemId);
		resultMap.put("mmPrice", mmPrice);
		
		// 取得型号
		List<Map<String, String>> xinghao = tItemDetailMapper.getItemXinghao(itemId);
		// 取得颜色
		List<Map<String, String>> yanse = tItemDetailMapper.getItemYanse(itemId);
		resultMap.put("xinghao", xinghao);
		resultMap.put("yanse", yanse);
		
		// 取得评价信息
		PageInfo pageInfo = new PageInfo(0, 10, "pingjia_date desc");
		Page<Map<String,String>> page = tItemPingjiaMapper.getPingjia(itemId, pageInfo);
		List<Map<String,String>> TItemPingjia = page.getContent();
		Long pingjiaTotle = page.getTotalElements();
		resultMap.put("TItemPingjia", TItemPingjia);
		resultMap.put("pingjiaTotle", pingjiaTotle);

		// List<TItemPingjia> list= tItemPingjiaMapper.getPingjia(itemId);
		// 销量信息
		TItemXiaoliang xiaoliang = tItemXiaoliangMapper.selectByPrimaryKey(Integer.valueOf(itemId));
		resultMap.put("xiaoliang", xiaoliang);
		
		// JSAPI 签名信息
		resultMap.put("signInfo", sessionService.getSignInfo("/mobile/page/item"));
	
		return resultMap;
	}

    /**
     * 获取单个商品价格
     * @param itemId
     * @param guige
     * @param yanse
     * @return
     */
    @Override
    public Map<String, String> getItemPrice(String itemId, String guige, String yanse) {
        return tItemDetailMapper.getItemSalePrice(itemId, guige, yanse);
    }

    @Override
    public Map<String, String> getItemPriceAll(String itemId) {
        // TODO Auto-generated method stub
        return null;
    }



}
