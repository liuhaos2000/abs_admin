package com.abs.mobile.service.impl;

import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;

import org.buzheng.demo.esm.common.mybatis.PageInfo;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.abs.mobile.dao.TUserMapper;
import com.abs.mobile.domain.TUser;
import com.abs.mobile.service.ShopuserService;

@Service
public class ShopuserServiceImpl implements ShopuserService {

    @Resource
    TUserMapper tUserMapper;

	@Override
	public Page<Map<String, String>> getShopuserList(Map<String, Object> params, PageInfo pageInfo) {
		return tUserMapper.getShopuserList(params, pageInfo);
	}

	@Override
	@Transactional
	public void save(String openId, String lever, String parent) {
		TUser tuser= tUserMapper.selectByPrimaryKey(openId);
		TUser ptuser= tUserMapper.selectByPrimaryKey(parent);
		//更新原数据check
		if("00".equals(tuser.getLever())){
			throw new IllegalArgumentException("shopuser.check.masterlever");
		}
		// 输入Check
		if("00".equals(lever) ||
			"98".equals(lever) ||
			"99".equals(lever)){
			throw new IllegalArgumentException("shopuser.check.lever");
		}
		// 如果更新为02  他的父必须是01
		if("02".equals(lever) && "01".equals(ptuser.getLever())){
		}else if("01".equals(lever) && "00".equals(ptuser.getLever())){
			// 如果更新为01  他的父必须是00
		} else{
			throw new IllegalArgumentException("shopuser.check.leverset");
		}
		// 不能降级
		if("01".equals(tuser.getLever()) && "02".equals(lever)){
			throw new IllegalArgumentException("shopuser.check.leverset.heighttolow");
		}
		
		// Save
		Date date=new Date();
		tuser.setLever(lever);
		tuser.setParent(parent);
		tuser.setuDate(date);
		tuser.setuUser("ADMIN_SHOPUSER");
	}
 
}
