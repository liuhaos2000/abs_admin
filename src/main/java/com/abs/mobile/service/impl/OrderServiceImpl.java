package com.abs.mobile.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.abs.mobile.dao.TOrderDetailMapper;
import com.abs.mobile.dao.TOrderMapper;
import com.abs.mobile.domain.TOrder;
import com.abs.mobile.domain.TOrderDetail;
import com.abs.mobile.domain.TOrderDetailKey;
import com.abs.mobile.service.OrderService;
import com.abs.util.commom.AbsConst;

@Service
public class OrderServiceImpl implements OrderService {

    @Resource
    TOrderMapper tOrderMapper;
    @Resource
    TOrderDetailMapper tOrderDetailMapper;
    /**
     * 获取订单
     */
    @Override
    public Page<Map<String, String>> getOrderList(Map<String, Object> params,
            PageInfo pageInfo) {
        return tOrderMapper.getOrderList(params, pageInfo);
    }

	@Override
	@Transactional
	public void wuliuSave(String wuliuGongsi, String wuliuNo, List<TOrderDetail> orderDetailList) {
		Date date=new Date();
		for(TOrderDetail odd :orderDetailList){
			TOrderDetailKey key=new TOrderDetailKey();
			key.setOrderId(odd.getOrderId());
			key.setItemId(odd.getItemId());
			key.setItemGuige(odd.getItemGuige());
			key.setItemYanse(odd.getItemYanse());
			key.setTuihuoFlg(odd.getTuihuoFlg());
			TOrderDetail tOrderDetail = tOrderDetailMapper.selectByPrimaryKey(key);
			tOrderDetail.setGongsiId(wuliuGongsi);
			tOrderDetail.setWuliuCode(wuliuNo);
			tOrderDetail.setStatus(AbsConst.ORDER_SENDED);
			tOrderDetail.setuDate(date);
			tOrderDetail.setuUser("ADMIN_SAVE_WULIU");
			tOrderDetailMapper.updateByPrimaryKey(tOrderDetail);
		}
		// 如果子订单全部更新成已经发货，那么主订单也更新发货。
		Map<String, Object> param1=new HashMap<String, Object>() ;
		param1.put("orderId", (Object)orderDetailList.get(0).getOrderId());
		List<Map<String, String>> lst = tOrderMapper.getOrderList(param1);
		// true 要更新主订单
		boolean flg = true;
		for(Map<String, String> map:lst){
			// 不是退货的明细已经发货
			if(!AbsConst.ORDER_SENDED.equals(map.get("sub_status")) &&
					"0".equals(map.get("tuihuo_flg"))){
				flg=false;
			}
		}
		if(flg){
			//更新主订单
			TOrder order = tOrderMapper.selectByPrimaryKey(orderDetailList.get(0).getOrderId());
			order.setStatus(AbsConst.ORDER_SENDED);
			order.setuDate(date);
			order.setuUser("ADMIN_SAVE_WULIU");
			tOrderMapper.updateByPrimaryKey(order);
		}else{
			//不更新主订单,啥也不做
		}
	}

	@Override
	public void backItemSave(TOrderDetail orderDetail) {
		Date date = new Date();
		// 退货后，原订单，以及退货订单全部关闭。 
		
		if("0".equals(orderDetail.getTuihuoFlg())){
			// 插入退货数据
			TOrderDetailKey key=new TOrderDetailKey();
			key.setOrderId(orderDetail.getOrderId());
			key.setItemId(orderDetail.getItemId());
			key.setItemGuige(orderDetail.getItemGuige());
			key.setItemYanse(orderDetail.getItemYanse());
			key.setTuihuoFlg(orderDetail.getTuihuoFlg());
			TOrderDetail newOrderDetail = tOrderDetailMapper.selectByPrimaryKey(key);
			
			newOrderDetail.setTuihuoFlg("1");
			newOrderDetail.setPrice(orderDetail.getPrice());
			newOrderDetail.setCost(orderDetail.getCost());
			newOrderDetail.setLv00Lirun(orderDetail.getLv00Lirun());
			newOrderDetail.setLv01Lirun(orderDetail.getLv01Lirun());
			newOrderDetail.setLv02Lirun(orderDetail.getLv02Lirun());
			
			newOrderDetail.setGongsiId(orderDetail.getGongsiId());
			newOrderDetail.setWuliuCode(orderDetail.getWuliuCode());
			
			newOrderDetail.setStatus(AbsConst.ORDER_CLOSE);
			newOrderDetail.setcDate(date);
			newOrderDetail.setcUser("ADMIN_SAVE_BACKITEM");
			newOrderDetail.setuDate(date);
			newOrderDetail.setuUser("ADMIN_SAVE_BACKITEM");
			tOrderDetailMapper.insert(newOrderDetail);
			
			// 更新
			TOrderDetail uOrderDetail = tOrderDetailMapper.selectByPrimaryKey(key);
			uOrderDetail.setStatus(AbsConst.ORDER_CLOSE);
			uOrderDetail.setuDate(date);
			uOrderDetail.setuUser("ADMIN_SAVE_BACKITEM");
			tOrderDetailMapper.updateByPrimaryKey(uOrderDetail);
			
		}else if("1".equals(orderDetail.getTuihuoFlg())) {
			// 更新已经退货的数据
			TOrderDetailKey key=new TOrderDetailKey();
			key.setOrderId(orderDetail.getOrderId());
			key.setItemId(orderDetail.getItemId());
			key.setItemGuige(orderDetail.getItemGuige());
			key.setItemYanse(orderDetail.getItemYanse());
			key.setTuihuoFlg(orderDetail.getTuihuoFlg());
			TOrderDetail tOrderDetail = tOrderDetailMapper.selectByPrimaryKey(key);
			
			tOrderDetail.setPrice(orderDetail.getPrice());
			tOrderDetail.setCost(orderDetail.getCost());
			tOrderDetail.setLv00Lirun(orderDetail.getLv00Lirun());
			tOrderDetail.setLv01Lirun(orderDetail.getLv01Lirun());
			tOrderDetail.setLv02Lirun(orderDetail.getLv02Lirun());
			
			tOrderDetail.setGongsiId(orderDetail.getGongsiId());
			tOrderDetail.setWuliuCode(orderDetail.getWuliuCode());
			
			tOrderDetail.setStatus(AbsConst.ORDER_CLOSE);
			tOrderDetail.setuDate(date);
			tOrderDetail.setuUser("ADMIN_SAVE_BACKITEM");
			tOrderDetailMapper.updateByPrimaryKey(tOrderDetail);
			
			
		}else {
			//TODO 积分，优惠券
		}
		
		// 如果子订单全部更新成已经发货，那么主订单也更新发货。
		Map<String, Object> param1=new HashMap<String, Object>() ;
		param1.put("orderId", orderDetail.getOrderId());
		List<Map<String, String>> lst = tOrderMapper.getOrderList(param1);
		// true 要更新主订单
		boolean flg = true;
		for(Map<String, String> map:lst){
			// 不是退货的明细已经发货
			if(!AbsConst.ORDER_CLOSE.equals(map.get("sub_status")) &&
					"0".equals(map.get("tuihuo_flg"))){
				flg=false;
			}
		}
		if(flg){
			//更新主订单
			TOrder order = tOrderMapper.selectByPrimaryKey(orderDetail.getOrderId());
			order.setStatus(AbsConst.ORDER_CLOSE);
			order.setuDate(date);
			order.setuUser("ADMIN_SAVE_BACKITEM");
			tOrderMapper.updateByPrimaryKey(order);
		}else{
			//不更新主订单,啥也不做
		}
		

		
		
		
		
		
		
		
		

		
		
	}
}
