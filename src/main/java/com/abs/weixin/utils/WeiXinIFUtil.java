package com.abs.weixin.utils;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.ConnectException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import javax.net.ssl.SSLSocketFactory;
import javax.net.ssl.TrustManager;

import org.apache.log4j.Logger;

import com.abs.util.EmojiFilter;
import com.abs.util.Log4jUtil;
import com.abs.weixin.pojo.AccessToken;
import com.abs.weixin.pojo.JsApiTicket;
import com.abs.weixin.pojo.Menu;
import com.abs.weixin.pojo.OpenId;
import com.abs.weixin.pojo.WeixinUserInfo;

import net.sf.json.JSONException;
import net.sf.json.JSONObject;

/**
 * 
 * @author zhangzhi
 * @date 2014-04-05
 */
public class WeiXinIFUtil {

	private static Logger log = Log4jUtil.getLogger();

	// 获取access_token的接口地址（GET） 限200（次/天）
	public static String access_token_url = 
		"https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=APPID&secret=APPSECRET";
	public static String jsapi_ticket_url = 
		"https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token=ACCESS_TOKEN&type=jsapi";
	// 菜单创建（POST） 限100（次/天）
	public static String menu_create_url = 
		"https://api.weixin.qq.com/cgi-bin/menu/create?access_token=ACCESS_TOKEN";
	
	// 获取OpenId
	public static String open_id_url =
		"https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=APPSECRET&code=CODE&grant_type=authorization_code";

	// 获取UserInfo
	public static String user_info_url =
	    "https://api.weixin.qq.com/cgi-bin/user/info?access_token=ACCESS_TOKEN&openid=OPENID";
    // 删除菜单
    public static String menu_del_url =
        "https://api.weixin.qq.com/cgi-bin/menu/delete?access_token=ACCESS_TOKEN";
	/**
	 * 创建菜单
	 * 
	 * @param menu
	 *            菜单实例
	 * @param accessToken
	 *            有效的access_token
	 * @return 0表示成功，其他值表示失败
	 */
	public static int createMenu(Menu menu, String accessToken) {
		int result = 0;

		// 拼装创建菜单的url
		String url = menu_create_url.replace("ACCESS_TOKEN", accessToken);

		// 将菜单对象转换成json字符串
		String jsonMenu = JSONObject.fromObject(menu).toString();
		// 调用接口创建菜单
		JSONObject jsonObject = httpRequest(url, "POST", jsonMenu);


		if (null != jsonObject) {
			if (0 != jsonObject.getInt("errcode")) {
				result = jsonObject.getInt("errcode");
//				log.error("创建菜单失败 errcode:{} errmsg:{}",
//						jsonObject.getInt("errcode"),
//						jsonObject.getString("errmsg"));
			}
		}

		return result;
	}

	/**
	 * 获取access_token
	 * 
	 * @param appid
	 *            凭证
	 * @param appsecret
	 *            密钥
	 * @return
	 */
	public static AccessToken getAccessToken(String appid, String appsecret) {
		AccessToken accessToken = null;

		String requestUrl = access_token_url.replace("APPID", appid).replace(
				"APPSECRET", appsecret);
		JSONObject jsonObject = httpRequest(requestUrl, "GET", null);
		// 如果请求成功
		if (null != jsonObject) {
			try {
				accessToken = new AccessToken();
				accessToken.setToken(jsonObject.getString("access_token"));
				accessToken.setExpiresIn(jsonObject.getInt("expires_in"));
			} catch (JSONException e) {
				accessToken = null;
				System.err.println("ACCESSTOKEN取得失败");
			}
		}
		return accessToken;
	}
	/**
	 * 获取access_token
	 * 
	 * @param appid
	 *            凭证
	 * @param appsecret
	 *            密钥
	 * @return
	 */
	public static JsApiTicket getJsApiTicket(String accessToken) {
		JsApiTicket jsApiTicket = null;

		String requestUrl = jsapi_ticket_url.replace("ACCESS_TOKEN", accessToken);
		JSONObject jsonObject = httpRequest(requestUrl, "GET", null);
		// 如果请求成功
		if (null != jsonObject) {
			try {
				jsApiTicket = new JsApiTicket();
				jsApiTicket.setTicket(jsonObject.getString("ticket"));
				jsApiTicket.setExpiresIn(jsonObject.getInt("expires_in"));
			} catch (JSONException e) {
				jsApiTicket = null;
				System.err.println("JSAPI_TICKET取得失败");
			}
		}
		return jsApiTicket;
	}

	
	/**
	 * 获取OpenId
	 * 
	 * @param appid
	 *            凭证
	 * @param appsecret
	 *            密钥
	 * @param code          
	 *            CODE
	 * @return
	 */
	public static OpenId getOpenId(String code) {
		OpenId openId = null;

		String requestUrl = open_id_url.replace("APPID",WeixinConst.APPID).replace(
				"APPSECRET",WeixinConst.APPSECRET).replace("CODE", code);
		JSONObject jsonObject = httpRequest(requestUrl, "GET", null);
		// 如果请求成功
		if (null != jsonObject) {
			try {
				openId = new OpenId();
				openId.setAccess_token(jsonObject.getString("access_token"));
				openId.setExpires_in(jsonObject.getInt("expires_in"));
				openId.setRefresh_token(jsonObject.getString("refresh_token"));
				openId.setOpenid(jsonObject.getString("openid"));
				openId.setScope(jsonObject.getString("scope"));
			} catch (JSONException e) {
				openId = null;
				// 获取失败
//				log.error("获取OpenId失败 errcode:{} errmsg:{}",
//						jsonObject.getInt("errcode"),
//						jsonObject.getString("errmsg"));
			}
		}
		return openId;
	}
	
	/**
	 * 获取OpenId
	 * 
	 * @param appid
	 *            凭证
	 * @param appsecret
	 *            密钥
	 * @param code          
	 *            CODE
	 * @return
	 */
	public static WeixinUserInfo getUserinfo(String accessToken,String openId) {
		WeixinUserInfo UserInfo = null;

		String requestUrl = user_info_url.replace("ACCESS_TOKEN",accessToken).replace(
				"OPENID",openId);
		JSONObject jsonObject = httpRequest(requestUrl, "GET", null);
		// 如果请求成功
		if (null != jsonObject) {
			try {
				
				UserInfo = new WeixinUserInfo();
				UserInfo.setSubscribe(jsonObject.getString("subscribe"));
                UserInfo.setOpenid(jsonObject.getString("openid"));
                if ("1".equals(jsonObject.getString("subscribe"))) {
                    UserInfo.setNickname(EmojiFilter.filterEmoji(jsonObject
                            .getString("nickname")));
                    log.debug("nickname-----------:" + UserInfo.getNickname());
                    UserInfo.setSex(jsonObject.getString("sex"));
                    UserInfo.setLanguage(jsonObject.getString("language"));
                    UserInfo.setCity(jsonObject.getString("city"));
                    UserInfo.setProvince(jsonObject.getString("province"));
                    UserInfo.setCountry(jsonObject.getString("country"));
                    UserInfo.setHeadimgurl(jsonObject.getString("headimgurl"));
                    UserInfo.setSubscribe_time(jsonObject
                            .getString("subscribe_time"));
                }
				return UserInfo;
				
			} catch (JSONException e) {
				openId = null;
				log.debug("getUserinfo-------Err----");
				// 获取失败
				log.debug(jsonObject.getInt("errcode")+" MSG:"+jsonObject.getString("errmsg"));
			}
		}
		log.debug("nickname-----userinfo no data---");
		return UserInfo;
	}
	/**
	 * 发起https请求并获取结果
	 * 
	 * @param requestUrl
	 *            请求地址
	 * @param requestMethod
	 *            请求方式（GET、POST）
	 * @param outputStr
	 *            提交的数据
	 * @return JSONObject(通过JSONObject.get(key)的方式获取json对象的属性值)
	 */
	public static JSONObject httpRequest(String requestUrl,
			String requestMethod, String outputStr) {
        log.debug("------------>httpRequest---Start:"+requestUrl);
		JSONObject jsonObject = null;
		StringBuffer buffer = new StringBuffer();
		try {
			// 创建SSLContext对象，并使用我们指定的信任管理器初始化
			TrustManager[] tm = { new WeiXinX509TrustManager() };
			SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
			sslContext.init(null, tm, new java.security.SecureRandom());
			// 从上述SSLContext对象中得到SSLSocketFactory对象
			SSLSocketFactory ssf = sslContext.getSocketFactory();

			URL url = new URL(requestUrl);
			HttpsURLConnection httpUrlConn = (HttpsURLConnection) url
					.openConnection();
			httpUrlConn.setSSLSocketFactory(ssf);

			httpUrlConn.setDoOutput(true);
			httpUrlConn.setDoInput(true);
			httpUrlConn.setUseCaches(false);
			// 设置请求方式（GET/POST）
			httpUrlConn.setRequestMethod(requestMethod);

			if ("GET".equalsIgnoreCase(requestMethod))
				httpUrlConn.connect();

			// 当有数据需要提交时
			if (null != outputStr) {
				OutputStream outputStream = httpUrlConn.getOutputStream();
				// 注意编码格式，防止中文乱码
				outputStream.write(outputStr.getBytes("UTF-8"));
				outputStream.close();
			}

			// 将返回的输入流转换成字符串
			InputStream inputStream = httpUrlConn.getInputStream();
			InputStreamReader inputStreamReader = new InputStreamReader(
					inputStream, "utf-8");
			BufferedReader bufferedReader = new BufferedReader(
					inputStreamReader);

			String str = null;
			while ((str = bufferedReader.readLine()) != null) {
				buffer.append(str);
			}
			bufferedReader.close();
			inputStreamReader.close();
			// 释放资源
			inputStream.close();
			inputStream = null;
			httpUrlConn.disconnect();
			jsonObject = JSONObject.fromObject(buffer.toString());
		} catch (ConnectException ce) {
			log.error("Weixin server connection timed out.",ce);
			log.debug("-----err1------>httpRequest---end:"+requestUrl);
		} catch (Exception e) {
			log.error("https request error:{}", e);
			log.debug("-------err2----->httpRequest---end:"+requestUrl);
		}
        log.debug("------------>httpRequest---end:"+requestUrl);
		return jsonObject;
	}
	
	/**
	 * 发起https请求并获取结果
	 * 
	 * @param requestUrl
	 *            请求地址
	 * @param requestMethod
	 *            请求方式（GET、POST）
	 * @param outputStr
	 *            提交的数据
	 * @return Map(通过JSONObject.get(key)的方式获取json对象的属性值)
	 */
	public static Map<String,String> httpRequestXML(String requestUrl,
			String requestMethod, String outputStr) {
        log.debug("------------>httpRequest---Start:"+requestUrl);
        Map<String,String> resultMap = null;
		StringBuffer buffer = new StringBuffer();
		try {
			// 创建SSLContext对象，并使用我们指定的信任管理器初始化
			TrustManager[] tm = { new WeiXinX509TrustManager() };
			SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
			sslContext.init(null, tm, new java.security.SecureRandom());
			// 从上述SSLContext对象中得到SSLSocketFactory对象
			SSLSocketFactory ssf = sslContext.getSocketFactory();

			URL url = new URL(requestUrl);
			HttpsURLConnection httpUrlConn = (HttpsURLConnection) url
					.openConnection();
			httpUrlConn.setSSLSocketFactory(ssf);

			httpUrlConn.setDoOutput(true);
			httpUrlConn.setDoInput(true);
			httpUrlConn.setUseCaches(false);
			// 设置请求方式（GET/POST）
			httpUrlConn.setRequestMethod(requestMethod);

			if ("GET".equalsIgnoreCase(requestMethod))
				httpUrlConn.connect();

			// 当有数据需要提交时
			if (null != outputStr) {
				OutputStream outputStream = httpUrlConn.getOutputStream();
				// 注意编码格式，防止中文乱码
				outputStream.write(outputStr.getBytes("UTF-8"));
				outputStream.close();
			}

			// 将返回的输入流转换成字符串
			InputStream inputStream = httpUrlConn.getInputStream();
			InputStreamReader inputStreamReader = new InputStreamReader(
					inputStream, "utf-8");
			BufferedReader bufferedReader = new BufferedReader(
					inputStreamReader);

			String str = null;
			while ((str = bufferedReader.readLine()) != null) {
				buffer.append(str);
			}
			bufferedReader.close();
			inputStreamReader.close();
			// 释放资源
			inputStream.close();
			inputStream = null;
			httpUrlConn.disconnect();
			resultMap = XmlConverUtil.xmltoMap(buffer.toString());
		} catch (ConnectException ce) {
			log.error("Weixin server connection timed out.",ce);
			log.debug("-----err1------>httpRequest---end:"+requestUrl);
		} catch (Exception e) {
			log.error("https request error:{}", e);
			log.debug("-------err2----->httpRequest---end:"+requestUrl);
		}
        log.debug("------------>httpRequest---end:"+requestUrl);
		return resultMap;
	}
}
