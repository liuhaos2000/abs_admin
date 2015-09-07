package com.abs.mobile.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.abs.mobile.service.UserInfoAuthorizeService;
import com.abs.mobile.service.WXCoreService;
import com.abs.weixin.service.CoreService;
import com.abs.weixin.utils.SignUtil;

@Controller
public class WXCoreController {

	@Resource
	private WXCoreService wXCoreService;
	/**
	 * 验证服务器 GET
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/coreServlet",method=RequestMethod.GET)
	public void coreServlet(HttpServletRequest request,HttpServletResponse response) throws IOException {
	    
		// 微信加密签名
		String signature = request.getParameter("signature");
		// 时间戳
		String timestamp = request.getParameter("timestamp");
		// 随机数
		String nonce = request.getParameter("nonce");
		// 随机字符串
		String echostr = request.getParameter("echostr");

		PrintWriter out = response.getWriter();
		// 通过检验signature对请求进行校验，若校验成功则原样返回echostr，表示接入成功，否则接入失败
		if (SignUtil.checkSignature(signature, timestamp, nonce)) {
			out.print(echostr);
		}
		out.close();
		out = null;
	}
	/**
	 * 验证服务器 POST
	 * @param request
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/coreServlet",method=RequestMethod.POST)
	public void coreServletPost(HttpServletRequest request,HttpServletResponse response) throws IOException {
	    
		// 将请求、响应的编码均设置为UTF-8（防止中文乱码）
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		// 调用核心业务类接收消息、处理消息
		String respMessage = wXCoreService.processRequest(request);

		if (null != respMessage && !"".equals(respMessage)) {
			// 响应消息
			PrintWriter out = response.getWriter();
			out.print(respMessage);
			out.close();  
		}
	}
	
}
