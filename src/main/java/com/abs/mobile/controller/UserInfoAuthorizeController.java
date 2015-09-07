package com.abs.mobile.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.abs.mobile.service.UserInfoAuthorizeService;

@Controller
@RequestMapping("/mobile/authorize")
public class UserInfoAuthorizeController {

	@Resource
	private UserInfoAuthorizeService userInfoAuthorizeService;
	/**
	 * 获取用户信息，放入Session
	 * @param code 
	 * @param state
	 * @param request
	 * @param map
	 * @return
	 */
	@RequestMapping("/base")
	public String base(String code,String state,HttpServletRequest request, ModelMap map) {
	    
        //转换
        try {
            state = URLDecoder.decode(state, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
	
        userInfoAuthorizeService.executeGetUserInfo(code);
        
		return "redirect:" + state;
	}
 
}
