package com.abs.mobile.batch;

import org.springframework.stereotype.Service;

import com.abs.util.commom.AbsConst;
import com.abs.weixin.pojo.AccessToken;
import com.abs.weixin.pojo.JsApiTicket;
import com.abs.weixin.utils.WeiXinIFUtil;
import com.abs.weixin.utils.WeixinConst;

@Service
public class AccessTokenBatch  {

	   public void job1() {  
             System.out.println("AccessTokenBatch : get acess token");
		     AccessToken accessToken = WeiXinIFUtil.getAccessToken(
             WeixinConst.APPID, WeixinConst.APPSECRET);
		     System.out.println(accessToken.getToken());
		     AbsConst.access_token = accessToken.getToken();
		     JsApiTicket jsApiTicket = WeiXinIFUtil.getJsApiTicket(accessToken.getToken());
		     AbsConst.jsapi_ticket=jsApiTicket.getTicket();
	    }  
 
}
