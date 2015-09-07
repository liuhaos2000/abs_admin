package com.abs.mobile.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.buzheng.demo.esm.web.util.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.abs.mobile.domain.TRegion;
import com.abs.mobile.domain.TUserAddress;
import com.abs.mobile.service.UserAdderssService;
import com.abs.util.exception.BusinessException;

@Controller
@RequestMapping("/mobile/useradress")
public class UserAdressController extends BaseController {
	
    @Resource
    private UserAdderssService userAdderssService;
    
    /**
     * 取得一级地址
     * @return
     */
    @RequestMapping("/getAddressLevel1")
    @ResponseBody
    public Result getAddressLevel1() {
        Result request = new Result();
        List<TRegion> regionList= userAdderssService.getAddressLevel1();
        request.setData(regionList);
        return request;
    }
    /**
     * 取得二三级地址
     * @return
     */
    @RequestMapping("/getAddressLevel2")
    @ResponseBody
    public Result getAddressLevel2(String parent) {
        Result request = new Result();
        List<TRegion> regionList= userAdderssService.getAddressLevel2(parent);
        request.setData(regionList);
        return request;
    }
    /**
     * 保存地址
     * @return
     * @throws BusinessException 
     */
    @RequestMapping("/saveAddress")
    @ResponseBody
    public Result saveAddress(TUserAddress tUserAddress, String mode) throws BusinessException {
        Result request = new Result();
        Map<String,Object> resultMap = 
        		userAdderssService.saveAddress(tUserAddress,mode);
        request.setData(resultMap);
        return request;
    }
    /**
     * 加载要更新的地址
     * @return
     */
    @RequestMapping("/loadUpdAdress")
    @ResponseBody
    public Result loadUpdAdress(String addressid) {
        Result request = new Result();
        Map<String,Object> resultMap = 
        		userAdderssService.loadUpdAdress(addressid);
        request.setData(resultMap);
        return request;
    }
    
    /**
     * 删除地址
     * @return
     * @throws BusinessException 
     */
    @RequestMapping("/deleteAddress")
    @ResponseBody
    public Result deleteAddress(String addressid) {
        Result request = new Result();
        Map<String,Object> resultMap = userAdderssService.deleteAddress(addressid);
        request.setData(resultMap);
        return request;
    }
}
