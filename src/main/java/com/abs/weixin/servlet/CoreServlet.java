package com.abs.weixin.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.abs.weixin.service.CoreService;
import com.abs.weixin.utils.SignUtil;

/**
 * 核心请求处理类
 * 
 * @author zhangzhi
 * @date 2014-04-05
 */
public class CoreServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7179094332573830289L;

	/**
	 * 确认请求来自微信服务器
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 将请求、响应的编码均设置为UTF-8（防止中文乱码）
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		//=================
		 ServletContext servletContext = this.getServletContext();  
	        WebApplicationContext context =   
	                WebApplicationContextUtils.getWebApplicationContext(servletContext);
	        WebApplicationContext context1 = RequestContextUtils.getWebApplicationContext(request);
	        //=================

		// 调用核心业务类接收消息、处理消息
		String respMessage = CoreService.processRequest(request);

		if (null != respMessage && !"".equals(respMessage)) {
			// 响应消息
			PrintWriter out = response.getWriter();
			out.print(respMessage);
			out.close();  
		}
	}
}
