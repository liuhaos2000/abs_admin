package com.abs.weixin.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.abs.mobile.service.UserInfoAuthorizeService;
import com.abs.util.Log4jUtil;
import com.abs.weixin.message.model.Article;
import com.abs.weixin.message.resp.NewsMessage;
import com.abs.weixin.message.resp.TextMessage;
import com.abs.weixin.utils.MessageUtil;
import com.abs.weixin.utils.WeixinConst;

/**
 * 核心服务类
 * 
 * @author zhangzhi
 * @date 2014-04-05
 */
public class CoreService {
	/**
	 * 处理微信发来的请求
	 * 
	 * @param request
	 * @param servletContext 
	 * @return
	 */
	public static String processRequest(HttpServletRequest request) {
		String respMessage = null;
		try {
			// 默认返回的文本消息内容
			String respContent = null;

			// xml请求解析
			Map<String, String> requestMap = MessageUtil.parseXml(request);

			// 发送方帐号（open_id）
			String fromUserName = requestMap.get("FromUserName");
			// 公众帐号
			String toUserName = requestMap.get("ToUserName");
			// 消息类型
			String msgType = requestMap.get("MsgType");

			// 回复文本消息
			TextMessage textMessage = new TextMessage();
			textMessage.setToUserName(fromUserName);
			textMessage.setFromUserName(toUserName);
			textMessage.setCreateTime(new Date().getTime());
			textMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_TEXT);
			textMessage.setFuncFlag(0);

			// 文本消息
			if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_TEXT)) {
				try {
					// 接收用户发送的文本消息内容
					String content = requestMap.get("Content");
					if ("统计".equals(content)) {
						//ApplicationContext act = new ClassPathXmlApplicationContext(
//								new String[] { "applicationContext.xml", "applicationContext-module.xml" });
//						// C203BLogic c203BLogic = (C203BLogic) act
//						// .getBean("c203Blogic");
//						respContent = "";
//						((ClassPathXmlApplicationContext) act).close();
					}
				} catch (Exception e) {
					Logger log = Log4jUtil.getLogger();
					log.error("guanzhu", e);
				}
			}
			// 图片消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_IMAGE)) {
				// respContent = "您发送的是图片消息！";
			}
			// 地理位置消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LOCATION)) {
				// respContent = "您发送的是地理位置消息！";
			}
			// 链接消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_LINK)) {
				// respContent = "您发送的是链接消息！";
			}
			// 音频消息
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_VOICE)) {
				// respContent = "您发送的是音频消息！";
			}
			// 事件推送
			else if (msgType.equals(MessageUtil.REQ_MESSAGE_TYPE_EVENT)) {
				// 事件类型
				String eventType = requestMap.get("Event");
				// 订阅
				if (eventType.equals(MessageUtil.EVENT_TYPE_SUBSCRIBE)) {

					try {
						// 更新推荐人的金额
						AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext();
						ctx.scan("com.abs.mobile.service.*");
						ctx.scan("com.abs.mobile.dao.*");
						ctx.refresh();
						// 此 处也可以使用ctx.getBean("testServiceImpl")
						UserInfoAuthorizeService userInfoAuthorizeService =
									ctx.getBean(UserInfoAuthorizeService.class);
						userInfoAuthorizeService.executeGetUserAllInfo(fromUserName);
						respContent = "谢谢您的关注！成功！";
					} catch (Exception e) {
						respContent = "谢谢您的关注！失败！";
						Logger log = Log4jUtil.getLogger();
						log.error("CCCCCCCCCCC-guanzhu", e);
					}

					// 图文消息
					// 创建图文消息
					// NewsMessage newsMessage = new NewsMessage();
					// newsMessage.setToUserName(fromUserName);
					// newsMessage.setFromUserName(toUserName);
					// newsMessage.setCreateTime(new Date().getTime());
					// newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
					// newsMessage.setFuncFlag(0);
					// List<Article> articleList = new ArrayList<Article>();
					// Article article1 = new Article();
					// article1.setTitle("来自屈原老家的粽子，正在免费抢！");
					// article1.setDescription("");
					// article1.setPicUrl("https://mmbiz.qlogo.cn/mmbiz/KhS1pHWb35KyfDDbicChvZeXEvwWssePRcpfiaFoCSRR3ZbOR9ZymOGa1pxvjGzuLDl5bU5ibb6NabXK3FskTKqvA/0");
					// article1.setUrl(WeixinConst.SEVERPATH +
					// "h1/h10101.do?h101From.huodongId=6");
					//
					// Article article2 = new Article();
					// article2.setTitle("来了，坐。");
					// article2.setDescription("");
					// article2.setPicUrl("https://mmbiz.qlogo.cn/mmbiz/KhS1pHWb35KyfDDbicChvZeXEvwWssePRkp9N9ulan1DaJSro8yNbbm2S1jHbHpS94XbLnGGDt9qoeYcKiayUbSA/0");
					// article2.setUrl("http://mp.weixin.qq.com/s?__biz=MzA4MjUxNzQwNA==&mid=200242757&idx=2&sn=fc729b468d66dec6d3f05ba4d228cccc#rd");
					//
					// Article article3 = new Article();
					// article3.setTitle("小鸡寻米记");
					// article3.setDescription("");
					// article3.setPicUrl("https://mmbiz.qlogo.cn/mmbiz/KhS1pHWb35KyfDDbicChvZeXEvwWssePRqjaFXURb0f6ia0Hiap6VzMhsD34A51GrcFj0ibQKWTy7DoF2drtHPILbQ/0");
					// article3.setUrl("http://mp.weixin.qq.com/s?__biz=MzA4MjUxNzQwNA==&mid=200242757&idx=3&sn=c70a95aefb7b427a83fda6b90686650f#rd");
					//
					// articleList.add(article1);
					// articleList.add(article2);
					// articleList.add(article3);
					// newsMessage.setArticleCount(articleList.size());
					// newsMessage.setArticles(articleList);
					// respMessage = MessageUtil.newsMessageToXml(newsMessage);
					// return respMessage;

				}
				// 取消订阅
				else if (eventType.equals(MessageUtil.EVENT_TYPE_UNSUBSCRIBE)) {
					try {
						// 删除用户
					} catch (Exception e) {
						Logger log = Log4jUtil.getLogger();
						log.error("CCCCCCCCCC-quxiao", e);
					}
				}
				// 扫描带参数二维码
				else if (eventType.equals(MessageUtil.EVENT_TYPE_SCAN)) {
					// TODO 处理扫描带参数二维码事件
				}
				// 上报地理位置
				else if (eventType.equals(MessageUtil.EVENT_TYPE_LOCATION)) {

				}
				// 自定义菜单点击事件
				else if (eventType.equals(MessageUtil.EVENT_TYPE_CLICK)) {
					// 事件KEY值，与创建自定义菜单时指定的KEY值对应
					String eventKey = requestMap.get("EventKey");

					if (eventKey.equals("52")) {
						// 创建图文消息
						NewsMessage newsMessage = new NewsMessage();
						newsMessage.setToUserName(fromUserName);
						newsMessage.setFromUserName(toUserName);
						newsMessage.setCreateTime(new Date().getTime());
						newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
						newsMessage.setFuncFlag(0);
						List<Article> articleList = new ArrayList<Article>();
						Article article1 = new Article();
						article1.setTitle("粽子有话说");
						article1.setDescription("");
						article1.setPicUrl(
								"https://mmbiz.qlogo.cn/mmbiz/KhS1pHWb35Iu1sqf1nhricgfQTId8y5ibic39x2wnKVkrnziaI0UG5w8kasIdicNXxtcuVPicPE94henaUBPNYeYPXKA/0");
						article1.setUrl(
								"http://mp.weixin.qq.com/s?__biz=MzA4MjUxNzQwNA==&mid=200256462&idx=1&sn=288f4efeb59d63c490b3bb6747f3dbe3#rd");

						Article article2 = new Article();
						article2.setTitle("市面上流通的粽子，你敢吃吗？");
						article2.setDescription("");
						article2.setPicUrl(
								"https://mmbiz.qlogo.cn/mmbiz/KhS1pHWb35Iu1sqf1nhricgfQTId8y5ibic59DXPF6xAlibrUoTOc1D8XnsOveib7r0vncC9SWcia9M2WORavYicfyfFw/0");
						article2.setUrl(
								"http://mp.weixin.qq.com/s?__biz=MzA4MjUxNzQwNA==&mid=200256462&idx=2&sn=619eabcebada6f5b710d82b6e41afb0c#rd");

						Article article3 = new Article();
						article3.setTitle("黑虎泉");
						article3.setDescription("");
						article3.setPicUrl(
								"https://mmbiz.qlogo.cn/mmbiz/KhS1pHWb35Iu1sqf1nhricgfQTId8y5ibic52GLm2zd7GBe8UiaRQkibppD1q6mIbocG1oJPFSE1TPqBYWUiahXqXn3Q/0");
						article3.setUrl(
								"http://mp.weixin.qq.com/s?__biz=MzA4MjUxNzQwNA==&mid=200256462&idx=3&sn=e9c8226dd8179d65290d79e55219f68a#rd");

						articleList.add(article1);
						articleList.add(article2);
						articleList.add(article3);
						newsMessage.setArticleCount(articleList.size());
						newsMessage.setArticles(articleList);
						respMessage = MessageUtil.newsMessageToXml(newsMessage);
						return respMessage;
					} else if (eventKey.equals("53")) {
						// 创建图文消息
						NewsMessage newsMessage = new NewsMessage();
						newsMessage.setToUserName(fromUserName);
						newsMessage.setFromUserName(toUserName);
						newsMessage.setCreateTime(new Date().getTime());
						newsMessage.setMsgType(MessageUtil.RESP_MESSAGE_TYPE_NEWS);
						newsMessage.setFuncFlag(0);
						List<Article> articleList = new ArrayList<Article>();
						Article article1 = new Article();
						article1.setTitle("小帮寻米记");
						article1.setDescription("");
						article1.setPicUrl(
								"https://mmbiz.qlogo.cn/mmbiz/KhS1pHWb35Iu1sqf1nhricgfQTId8y5ibicu7QwmMXC6JNYxEiaQldN3TicyaicibbzQza3gyDkVEHygbnicSCCWLn1VQg/0");
						article1.setUrl(
								"http://mp.weixin.qq.com/s?__biz=MzA4MjUxNzQwNA==&mid=200256334&idx=1&sn=edbdd8ccbdd4f357e485bf5ff038969c#rd");

						Article article2 = new Article();
						article2.setTitle("小帮寻米记 二");
						article2.setDescription("");
						article2.setPicUrl(
								"https://mmbiz.qlogo.cn/mmbiz/KhS1pHWb35Iu1sqf1nhricgfQTId8y5ibicu7QwmMXC6JNYxEiaQldN3TicyaicibbzQza3gyDkVEHygbnicSCCWLn1VQg/0");
						article2.setUrl(
								"http://mp.weixin.qq.com/s?__biz=MzA4MjUxNzQwNA==&mid=200256334&idx=2&sn=0841cd428a35c338d5f60171b09de23b#rd");

						articleList.add(article1);
						articleList.add(article2);

						newsMessage.setArticleCount(articleList.size());
						newsMessage.setArticles(articleList);
						respMessage = MessageUtil.newsMessageToXml(newsMessage);
						return respMessage;
					}

					// else if (eventKey.equals("13")) {
					// respContent = "13菜单项被点击！";
					// } else if (eventKey.equals("14")) {
					// respContent = "14菜单项被点击！";
					// } else if (eventKey.equals("21")) {
					// respContent = "21菜单项被点击！";
					// } else if (eventKey.equals("22")) {
					// respContent = "22菜单项被点击！";
					// } else if (eventKey.equals("23")) {
					// respContent = "23菜单项被点击！";
					// } else if (eventKey.equals("24")) {
					// respContent = "24菜单项被点击！";
					// } else if (eventKey.equals("25")) {
					// respContent = "25菜单项被点击！";
					// } else if (eventKey.equals("31")) {
					// respContent = "31菜单项被点击！";
					// } else if (eventKey.equals("32")) {
					// respContent = "32菜单项被点击！";
					// } else if (eventKey.equals("33")) {
					// respContent = "33菜单项被点击！";
					// }
				}
			}

			textMessage.setContent(respContent);
			respMessage = MessageUtil.textMessageToXml(textMessage);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return respMessage;
	}
}