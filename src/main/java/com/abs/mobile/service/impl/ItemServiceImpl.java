package com.abs.mobile.service.impl;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.abs.mobile.dao.TItemDetailMapper;
import com.abs.mobile.dao.TItemMapper;
import com.abs.mobile.dao.TItemPictureMapper;
import com.abs.mobile.dao.TItemXiaoliangMapper;
import com.abs.mobile.domain.TItem;
import com.abs.mobile.domain.TItemDetail;
import com.abs.mobile.domain.TItemDetailKey;
import com.abs.mobile.domain.TItemPicture;
import com.abs.mobile.domain.TItemPictureKey;
import com.abs.mobile.domain.TItemXiaoliang;
import com.abs.mobile.service.ItemService;
import com.abs.util.commom.ObjUtil;

@Service
public class ItemServiceImpl implements ItemService {

    @Resource
    TItemMapper tItemMapper;
    @Resource
    TItemDetailMapper tItemDetailMapper;
    @Resource
    TItemPictureMapper tItemPictureMapper;
    @Resource
    TItemXiaoliangMapper tItemXiaoliangMapper;

    /**
     * 获取item列表
     */
	@Override
	public Page<Map<String, String>> getItemList(Map<String, Object> params, PageInfo pageInfo) {
		return tItemMapper.getItemList(params, pageInfo);
	}
    /**
     * 获取item明细列表
     */
	@Override
	public Page<Map<String, String>> getItemDetailList(Map<String, Object> params, PageInfo pageInfo) {
		return tItemDetailMapper.getItemDetailList(params, pageInfo);
	}
    /**
     * 获取item图片列表
     */
	@Override
	public Page<Map<String, String>> getItemPictureList(Map<String, Object> params, PageInfo pageInfo) {
		return tItemPictureMapper.getItemPictureList(params, pageInfo);
	}
	
	@Override
	@Transactional
	public void itemSave(String changeMod, TItem item, List<Map<String,String>> itemDist1, List<Map<String,String>> itemPist1,String itemId,String xiaoliang) {
		//mod 1 新建   2更新
		if("1".equals(changeMod)){
			itemAdd(item,itemDist1,itemPist1,xiaoliang);
		}else if("2".equals(changeMod)){
			itemUpd(item,itemDist1,itemPist1,new Integer(itemId),xiaoliang);
		}
	}
	private void itemAdd(TItem item, List<Map<String,String>> itemDist1, List<Map<String,String>> itemPist1,String xiaoliang){
		Date date=new Date();
		// tiem
		Integer itemId=new Integer(tItemMapper.getNewItemId());
		item.setItemId(itemId);
		// 
		item.setOwner(item.getManufacturer());
		
		item.setDelFlg("0");
		
		item.setcDate(date);
		item.setcUser("NEW_ITEM");
		item.setuDate(date);
		item.setuUser("NEW_ITEM");
		tItemMapper.insert(item);
		// item 明细
		for(Map<String,String> itemDetailMap:itemDist1){
			if(!("D".equals((String)itemDetailMap.get("updFlg")))){
				Integer guige=new Integer(tItemMapper.getNewItemGuige(itemId));
				TItemDetail tItemDetail = new TItemDetail();
				tItemDetail.setItemId(itemId);
				tItemDetail.setItemGuige(guige);
				tItemDetail.setGuigeText((String)itemDetailMap.get("guige_text"));
				tItemDetail.setItemYanse(0);
				
				tItemDetail.setShuliang(new Integer(ObjUtil.ObjCheck(itemDetailMap.get("shuliang"))));
				tItemDetail.setPrice(new BigDecimal(ObjUtil.ObjCheck(itemDetailMap.get("price"))));
				tItemDetail.setPriceHuiyuan(new BigDecimal(ObjUtil.ObjCheck(itemDetailMap.get("price"))));
				tItemDetail.setPriceHuodong(new BigDecimal(ObjUtil.ObjCheck(itemDetailMap.get("price"))));
				tItemDetail.setZhongliang(new BigDecimal(ObjUtil.ObjCheck(itemDetailMap.get("zhongliang"))));
				tItemDetail.setCost(new BigDecimal(ObjUtil.ObjCheck(itemDetailMap.get("cost"))));
				tItemDetail.setLv00Lirun(new BigDecimal(ObjUtil.ObjCheck(itemDetailMap.get("lv00_lirun"))));
				tItemDetail.setLv01Lirun(new BigDecimal(ObjUtil.ObjCheck(itemDetailMap.get("lv01_lirun"))));
				tItemDetail.setLv02Lirun(new BigDecimal(ObjUtil.ObjCheck(itemDetailMap.get("lv02_lirun"))));
				
				tItemDetail.setDelFlg((String)itemDetailMap.get("del_flg"));
			
				tItemDetail.setcDate(date);
				tItemDetail.setcUser("NEW_ITEM");
				tItemDetail.setuUser("NEW_ITEM");
				tItemDetail.setuDate(date);
				tItemDetailMapper.insert(tItemDetail);
			}
		}
		// item 图片
		for(Map<String,String> itemPictureMap:itemPist1){
			if(!("D".equals((String)itemPictureMap.get("updFlg")))){
				
				Integer pId=new Integer(tItemMapper.getNewPictureId(itemId));
				TItemPicture itemPicture = new TItemPicture();
				itemPicture.setItemId(itemId);
				itemPicture.setPictureId(pId);
				itemPicture.setPictureText(null);
				itemPicture.setPictureType((String)itemPictureMap.get("picture_type"));
				itemPicture.setPath((String)itemPictureMap.get("path"));
				itemPicture.setDelFlg("0");
				
				itemPicture.setcDate(date);
				itemPicture.setcUser("NEW_ITEM");
				itemPicture.setuUser("NEW_ITEM");
				itemPicture.setuDate(date);
				
				tItemPictureMapper.insert(itemPicture);
			}
		}
		// 销量
		
		TItemXiaoliang record=new TItemXiaoliang();
		record.setItemId(itemId);
		record.setXiaoliang(new Integer(xiaoliang));
		tItemXiaoliangMapper.insert(record);
	}
	private void itemUpd(TItem item, List<Map<String,String>> itemDist1, List<Map<String,String>> itemPist1,Integer itemId,String xiaoliang){
		Date date=new Date();
		//1 更新Item
		TItem tItem = tItemMapper.selectByPrimaryKey(itemId);
		tItem.setItemName(item.getItemName());
		tItem.setManufacturer(item.getManufacturer());
		tItem.setOwnerOpenId(item.getOwnerOpenId());
		tItem.setOwner(item.getManufacturer());
		tItem.setType(item.getType());
		tItem.setFapiaoTitle(item.getFapiaoTitle());
		tItem.setShouhouMiaoshu(item.getShouhouMiaoshu());
		tItem.setWuliuId(item.getWuliuId());
		tItem.setFromArea(item.getFromArea());
		tItem.setBaoyouFlg(item.getBaoyouFlg());
		tItem.setShangjiaFlg(item.getShangjiaFlg());
		
		tItem.setFrendText(item.getFrendText());
		tItem.setFrendTitle(item.getFrendTitle());
		tItem.setParm(item.getParm());
		tItem.setFuText(item.getFuText());
		
		tItem.setuDate(date);
		tItem.setuUser("UPD_ITEM");
		tItemMapper.updateByPrimaryKeyWithBLOBs(tItem);
		
		//2 明细更新
		for(Map<String,String> itemDetailMap:itemDist1){
			if(("A".equals((String)itemDetailMap.get("updFlg")))){
				Integer guige=new Integer(tItemMapper.getNewItemGuige(itemId));
				TItemDetail tItemDetail = new TItemDetail();
				tItemDetail.setItemId(itemId);
				tItemDetail.setItemGuige(guige);
				tItemDetail.setGuigeText((String)itemDetailMap.get("guige_text"));
				tItemDetail.setItemYanse(0);
				
				tItemDetail.setShuliang(new Integer(ObjUtil.ObjCheck(itemDetailMap.get("shuliang"))));
				tItemDetail.setPrice(new BigDecimal(ObjUtil.ObjCheck(itemDetailMap.get("price"))));
				tItemDetail.setPriceHuiyuan(new BigDecimal(ObjUtil.ObjCheck(itemDetailMap.get("price"))));
				tItemDetail.setPriceHuodong(new BigDecimal(ObjUtil.ObjCheck(itemDetailMap.get("price"))));
				tItemDetail.setZhongliang(new BigDecimal(ObjUtil.ObjCheck(itemDetailMap.get("zhongliang"))));
				tItemDetail.setCost(new BigDecimal(ObjUtil.ObjCheck(itemDetailMap.get("cost"))));
				tItemDetail.setLv00Lirun(new BigDecimal(ObjUtil.ObjCheck(itemDetailMap.get("lv00_lirun"))));
				tItemDetail.setLv01Lirun(new BigDecimal(ObjUtil.ObjCheck(itemDetailMap.get("lv01_lirun"))));
				tItemDetail.setLv02Lirun(new BigDecimal(ObjUtil.ObjCheck(itemDetailMap.get("lv02_lirun"))));
				
				tItemDetail.setDelFlg((String)itemDetailMap.get("del_flg"));
			
				tItemDetail.setcDate(date);
				tItemDetail.setcUser("NEW_ITEM");
				tItemDetail.setuUser("NEW_ITEM");
				tItemDetail.setuDate(date);
				tItemDetailMapper.insert(tItemDetail);
			}else if("U".equals((String)itemDetailMap.get("updFlg"))){
				TItemDetailKey key=new TItemDetailKey();
				key.setItemId(itemId);
				key.setItemGuige(new Integer(ObjUtil.ObjCheck(itemDetailMap.get("item_guige"))));
				key.setItemYanse(new Integer(ObjUtil.ObjCheck(itemDetailMap.get("item_yanse"))));
				TItemDetail tItemDetail = tItemDetailMapper.selectByPrimaryKey(key);
				
				tItemDetail.setGuigeText((String)itemDetailMap.get("guige_text"));
				tItemDetail.setShuliang(new Integer(ObjUtil.ObjCheck(itemDetailMap.get("shuliang"))));
				tItemDetail.setPrice(new BigDecimal(ObjUtil.ObjCheck(itemDetailMap.get("price"))));
				tItemDetail.setPriceHuiyuan(new BigDecimal(ObjUtil.ObjCheck(itemDetailMap.get("price"))));
				tItemDetail.setPriceHuodong(new BigDecimal(ObjUtil.ObjCheck(itemDetailMap.get("price"))));
				tItemDetail.setZhongliang(new BigDecimal(ObjUtil.ObjCheck(itemDetailMap.get("zhongliang"))));
				tItemDetail.setCost(new BigDecimal(ObjUtil.ObjCheck(itemDetailMap.get("cost"))));
				tItemDetail.setLv00Lirun(new BigDecimal(ObjUtil.ObjCheck(itemDetailMap.get("lv00_lirun"))));
				tItemDetail.setLv01Lirun(new BigDecimal(ObjUtil.ObjCheck(itemDetailMap.get("lv01_lirun"))));
				tItemDetail.setLv02Lirun(new BigDecimal(ObjUtil.ObjCheck(itemDetailMap.get("lv02_lirun"))));
				tItemDetail.setDelFlg((String)itemDetailMap.get("del_flg"));
				
				tItemDetail.setuUser("DLT_ITEM");
				tItemDetail.setuDate(date);
				tItemDetailMapper.updateByPrimaryKey(tItemDetail);
			}
		}
		//3 图片
		for(Map<String,String> itemPictureMap:itemPist1){
			if("A".equals((String)itemPictureMap.get("updFlg"))){
				
				Integer pId=new Integer(tItemMapper.getNewPictureId(itemId));
				TItemPicture itemPicture = new TItemPicture();
				itemPicture.setItemId(itemId);
				itemPicture.setPictureId(pId);
				itemPicture.setPictureText((String)itemPictureMap.get("picture_text"));
				itemPicture.setPictureType((String)itemPictureMap.get("picture_type"));
				itemPicture.setPath((String)itemPictureMap.get("path"));
				itemPicture.setDelFlg("0");
				
				itemPicture.setcDate(date);
				itemPicture.setcUser("NEW_ITEM");
				itemPicture.setuUser("NEW_ITEM");
				itemPicture.setuDate(date);
				
				tItemPictureMapper.insert(itemPicture);
			}else if("U".equals((String)itemPictureMap.get("updFlg"))){
				TItemPictureKey key=new TItemPictureKey();
				key.setItemId(itemId);
				key.setPictureId(new Integer(ObjUtil.ObjCheck(itemPictureMap.get("picture_id"))));
				TItemPicture tItemPicture = tItemPictureMapper.selectByPrimaryKey(key);
				
				tItemPicture.setPictureText((String)itemPictureMap.get("picture_text"));
				tItemPicture.setPictureType((String)itemPictureMap.get("picture_type"));
				tItemPicture.setPath((String)itemPictureMap.get("path"));
				tItemPicture.setDelFlg("0");
				
				tItemPicture.setuUser("UPD_ITEM");
				tItemPicture.setuDate(date);
				
				tItemPictureMapper.updateByPrimaryKey(tItemPicture);
				
			}else if("D".equals((String)itemPictureMap.get("updFlg"))){
				TItemPictureKey key=new TItemPictureKey();
				key.setItemId(itemId);
				key.setPictureId(new Integer(ObjUtil.ObjCheck(itemPictureMap.get("picture_id"))));
				tItemPictureMapper.deleteByPrimaryKey(key);
			}
		}
		
		// 销量
		TItemXiaoliang tItemXiaoliang=tItemXiaoliangMapper.selectByPrimaryKey(itemId);
		tItemXiaoliang.setXiaoliang(new Integer(xiaoliang));
		tItemXiaoliangMapper.updateByPrimaryKey(tItemXiaoliang);
	}
}
