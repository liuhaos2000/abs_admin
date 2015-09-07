package com.abs.mobile.service;

import java.util.List;
import java.util.Map;

import com.abs.mobile.domain.TRegion;
import com.abs.mobile.domain.TUserAddress;
import com.abs.util.exception.BusinessException;

public interface UserAdderssService {
	
	/**
	 * 取得一级地址
	 * @param request
	 * @return
	 */
	public List<TRegion> getAddressLevel1();
	/**
	 * 取得二级地址
	 * @param request
	 * @return
	 */
	public List<TRegion> getAddressLevel2(String region1);
	/**
	 * 保存用户地址
	 * @param request
	 * @return
	 * @throws BusinessException 
	 */
	public Map<String, Object> saveAddress(TUserAddress tUserAddress, String mode) throws BusinessException;
    /**
     * 加载要更新的地址
     * @return
     */
	public Map<String, Object> loadUpdAdress(String addressid);
    /**
     * 删除地址
     * @return
     */
	public Map<String, Object> deleteAddress(String addressid);
}
