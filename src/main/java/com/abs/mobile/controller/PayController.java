package com.abs.mobile.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.SortedMap;
import java.util.TreeMap;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.abs.mobile.domain.TUser;
import com.abs.mobile.service.CartService;
import com.abs.mobile.service.SessionService;
import com.abs.weixin.pojo.PayParm;
import com.abs.weixin.utils.WeiXinIFUtil;
import com.abs.weixin.utils.MessageUtil;
import com.abs.weixin.utils.Sign;
import com.abs.weixin.utils.WeixinConst;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/mobile/pay")
public class PayController {
	
    @Resource
    private SessionService sessionService;
    
    /**
     * 统一下单 接口
     * @param itemId
     * @param map
     * @return
     */
    @RequestMapping("/unifiedorder")
    public String unifiedorder(String itemId,ModelMap map,HttpServletRequest result) {
    	TUser user =sessionService.getLoginUser();
    	String nonce_str = Sign.create_nonce_str();
    	nonce_str = nonce_str.substring(0, 32);
    	// 先做签名
    	SortedMap<String, String> packageParams = new TreeMap<String, String>();
    	
    	packageParams.put("appid", WeixinConst.APPID);
    	packageParams.put("mch_id", WeixinConst.MCHID);
    	packageParams.put("nonce_str", nonce_str);
    	// TODO 商品描述，商户订单号,金额  暂定TEST
    	packageParams.put("body", "雅斯兰黛");
    	packageParams.put("out_trade_no", "201508220000003");
    	packageParams.put("total_fee", "100");
    	packageParams.put("spbill_create_ip", "192.168.1.1");
    	packageParams.put("spbill_create_ip", result.getRemoteAddr());
    	packageParams.put("notify_url", WeixinConst.NOTIFY_URL);
    	packageParams.put("trade_type", "JSAPI");
    	packageParams.put("openid", user.getOpenId());
    	
    	String sign = Sign.createPaySign(packageParams);
    	
    	// 做成XML
    	PayParm payParm = new PayParm();
    	payParm.setAppid(WeixinConst.APPID);
    	payParm.setMch_id(WeixinConst.MCHID);
    	payParm.setNonce_str(nonce_str);
    	payParm.setSign(sign);
    	
    	// TODO 商品描述，商户订单号,金额  暂定TEST
    	payParm.setBody("雅斯兰黛");
    	payParm.setOut_trade_no("201508220000003");
    	payParm.setTotal_fee("100");

    	payParm.setSpbill_create_ip("192.168.1.1");
    	payParm.setSpbill_create_ip(result.getRemoteAddr());
    	payParm.setNotify_url(WeixinConst.NOTIFY_URL);
    	payParm.setTrade_type("JSAPI");
    	payParm.setOpenid(user.getOpenId());
    	
    	String xmlParm = MessageUtil.payParmToXml(payParm);
    	xmlParm = xmlParm.replaceAll("__", "_");
    	
    	Map<String,String> rMap = WeiXinIFUtil.httpRequestXML(WeixinConst.UNIFIEDORDER, "GET", xmlParm);
    	
    	String packageid = "prepay_id="+rMap.get("prepay_id");
    	SortedMap<String, String> parm = new TreeMap<String, String>();
    	parm.put("appId", WeixinConst.APPID);
    	parm.put("timeStamp", Sign.create_timestamp());
    	parm.put("nonceStr", nonce_str);
    	parm.put("package", packageid);
    	parm.put("signType", "MD5");
    	// 支付信息生产
    	String sign2 = Sign.createPaySign(parm);
    	parm.put("sign", sign2);
    	
    	Map<String, Object> resultMap =  new HashMap<String, Object>();
        
    	resultMap.put("appId", parm.get("appId"));
    	resultMap.put("timeStamp", parm.get("timeStamp"));
    	resultMap.put("nonceStr", parm.get("nonceStr"));
    	resultMap.put("prepay_id", parm.get("package"));
    	resultMap.put("signType", parm.get("signType"));
    	resultMap.put("sign", parm.get("sign"));
        
    	resultMap.put("IPD", result.getRemoteAddr());
  
        // JSAPI 签名信息
     	resultMap.put("signInfo", sessionService.getSignInfo("/mobile/pay/unifiedorder"));
     	
        map.put("resultFlg", true);
        map.put("result", resultMap);
        return "mobile/pay";
    }
    @RequestMapping("/dopay")
    public String dopay(String itemId,ModelMap map,HttpServletRequest result) {
		return itemId;
    }
    
    @RequestMapping("/notify")
    public String notify(String itemId,ModelMap map,HttpServletRequest result) {
		return itemId;
    }
}
