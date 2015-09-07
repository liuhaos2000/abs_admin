package com.abs.mobile.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.abs.mobile.dao.TRegionMapper;
import com.abs.mobile.dao.TUserAddressMapper;
import com.abs.mobile.domain.TRegion;
import com.abs.mobile.domain.TUser;
import com.abs.mobile.domain.TUserAddress;
import com.abs.mobile.domain.TUserAddressKey;
import com.abs.mobile.service.SessionService;
import com.abs.mobile.service.UserAdderssService;
import com.abs.util.commom.AbsConst;
import com.abs.util.commom.AbsTool;
import com.abs.util.exception.BusinessException;

@Service
public class UserAddressServiceImpl implements UserAdderssService {

    @Resource
    private TUserAddressMapper tUserAddressMapper;
    @Resource
    private TRegionMapper tRegionMapper;
    @Resource
    private SessionService sessionService;
	/**
	 * 取得一级地址
	 * @param request
	 * @return
	 */
    @Override
	public List<TRegion> getAddressLevel1() {
		return tRegionMapper.getRegion1();
	}
	/**
	 * 取得二级地址
	 * @param request
	 * @return
	 */
	@Override
	public List<TRegion> getAddressLevel2(String parnet) {
		return tRegionMapper.getRegion2(parnet);
	}
	/**
	 * 保存地址（更新/新建）
	 * @throws BusinessException 
	 */
	@Override
	@Transactional
	public Map<String, Object> saveAddress(TUserAddress tUserAddress, String mode) throws BusinessException {
		validateAddress(tUserAddress);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		TUser user =  sessionService.getLoginUser();
		Date date = new Date();
		
		if(AbsConst.MODE_ADD.equals(mode)){
			//tUserAddressMapper
			TUserAddress newAddress = new TUserAddress();
			newAddress.setOpenId(user.getOpenId());
			newAddress.setCountry("1");
			newAddress.setRegionName1(tUserAddress.getRegionName1());
			newAddress.setRegionName2(tUserAddress.getRegionName2());
			newAddress.setRegionName3(tUserAddress.getRegionName3());
			newAddress.setAddressDetail(tUserAddress.getAddressDetail());
			newAddress.setName(tUserAddress.getName());
			newAddress.setTel(tUserAddress.getTel());
			newAddress.setDelFlg(tUserAddress.getDelFlg());
			newAddress.setcUser("ORDER");
			newAddress.setcDate(date);
			newAddress.setuUser("ORDER");
			newAddress.setuDate(date);
			if("1".equals(tUserAddress.getDelFlg())){
				tUserAddressMapper.updAddressMoren(user.getOpenId());
			}
			tUserAddressMapper.insertAddress(newAddress);
			
			List<Map<String, String>> udMap =tUserAddressMapper.getUserAddressInsert(user.getOpenId());
			resultMap.put("udMap", udMap);
			resultMap.put("mode", "ADD");
			
		} else if(AbsConst.MODE_UPD.equals(mode)){
			TUserAddressKey key = new TUserAddressKey();
			key.setOpenId(user.getOpenId());
			key.setAddressId(tUserAddress.getAddressId());
			TUserAddress updAddress = tUserAddressMapper.selectByPrimaryKey(key);
			updAddress.setCountry("1");
			updAddress.setRegionName1(tUserAddress.getRegionName1());
			updAddress.setRegionName2(tUserAddress.getRegionName2());
			updAddress.setRegionName3(tUserAddress.getRegionName3());
			updAddress.setAddressDetail(tUserAddress.getAddressDetail());
			updAddress.setName(tUserAddress.getName());
			updAddress.setTel(tUserAddress.getTel());
			updAddress.setDelFlg(tUserAddress.getDelFlg());
			updAddress.setuUser("ORDER");
			updAddress.setuDate(date);
			if("1".equals(tUserAddress.getDelFlg())){
				tUserAddressMapper.updAddressMoren(user.getOpenId());
			}
			tUserAddressMapper.updateByPrimaryKey(updAddress);
			
			List<Map<String, String>> udMap =tUserAddressMapper.getUserAddressUpdate(user.getOpenId(), 
					                               String.valueOf(tUserAddress.getAddressId()));
			resultMap.put("udMap", udMap);
			resultMap.put("mode", "UPD");
		}
        List<Map<String,String>> uadList = tUserAddressMapper.getUserAddress(user.getOpenId());
        resultMap.put("uadList", uadList);
		return resultMap;
	}
	/**
	 * check
	 * @param tUserAddress
	 * @throws BusinessException 
	 */
	private void validateAddress(TUserAddress tUserAddress) throws BusinessException {
		if(tUserAddress==null||
			StringUtils.isEmpty(tUserAddress.getName())||
			StringUtils.isEmpty(tUserAddress.getTel())||
			StringUtils.isEmpty(tUserAddress.getAddressDetail())||
			StringUtils.isEmpty(tUserAddress.getRegionName1())||
			StringUtils.isEmpty(tUserAddress.getRegionName2())||
			StringUtils.isEmpty(tUserAddress.getRegionName3())){
			throw new BusinessException("useraddress.error");
		}
		if (!AbsTool.checkTel(tUserAddress.getTel())) {
			throw new BusinessException("useraddress.name.required");
		}

	}
    /**
     * 加载要更新的地址
     * @return
     */
	@Override
	public Map<String, Object> loadUpdAdress(String addressid) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		
		TUser user =  sessionService.getLoginUser();
		TUserAddressKey key=new TUserAddressKey();
		key.setOpenId(user.getOpenId());
		key.setAddressId(Integer.valueOf(addressid));
		TUserAddress  tUserAddress  = tUserAddressMapper.selectByPrimaryKey(key);
		resultMap.put("userAddress", tUserAddress);
		
		// 抽取二级三级地址
		List<TRegion> region2 = tRegionMapper.getRegion2(tUserAddress.getRegionName1());
		List<TRegion> region3 = tRegionMapper.getRegion2(tUserAddress.getRegionName2());
		resultMap.put("region2", region2);
		resultMap.put("region3", region3);
		
		return resultMap;
	}
    /**
     * 删除地址
     * @return
     */
	@Override
	public Map<String, Object> deleteAddress(String addressid) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		TUser user =  sessionService.getLoginUser();
		TUserAddressKey key=new TUserAddressKey();
		key.setAddressId(Integer.valueOf(addressid));
		key.setOpenId(user.getOpenId());
		tUserAddressMapper.deleteByPrimaryKey(key);
		// 取得最新数据返回
        List<Map<String,String>> uadList = tUserAddressMapper.getUserAddress(user.getOpenId());
        resultMap.put("uadList", uadList);
		return resultMap;
	}

}
