package com.abs.weixin.utils;

/**
 * 常量定义
 * 
 * @author Liu
 * @date 2014-04-05
 */
public class WeixinConst {

	public static final String TOKEN = "abs_web_ruihegouwu";

	public static final String APPID = "wx9e5e703df0bcd7c7";

	public static final String APPSECRET = "562cbd9ff4298c150b78da63e34a2d89";

	public static final String SEVERPATH = "http://qbctest.wicp.net/";

	public static String AUTHORIZE_URL = "https://open.weixin.qq.com/connect/oauth2/authorize?appid=APPID&redirect_uri=REDIRECT_URI&response_type=code&scope=snsapi_base&state=STATE#wechat_redirect";
	// 统一下单
	public static String UNIFIEDORDER="https://api.mch.weixin.qq.com/pay/unifiedorder";
	
	// 受理商ID，身份标识
	public static String MCHID = "1261114101";
	// 商户支付密钥Key。审核通过后，在微信发送的邮件中查看
	public static String KEY = "zaq12wsxzaq12wsxzaq12wsxzaq12wsx";
	// 异步回调地址
	public static String NOTIFY_URL = "http://qbctest.wicp.net/abs_web/app/mobile/pay/notify";
	
	
	
	// 重定向地址
	public static String REDIRECT_URL = "http://XXXXXXXXXXXXXXXXXXX/callWeiXinPay";

	// web回调地址
	public static String WEB_NOTIFY_URL = "http://XXXXXXXXXXXXXXXXXXXXXXXXX/weixinPay_notify";
	
}