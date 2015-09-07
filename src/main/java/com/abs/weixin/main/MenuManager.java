package com.abs.weixin.main;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.abs.weixin.pojo.AccessToken;
import com.abs.weixin.pojo.Button;
import com.abs.weixin.pojo.CommonButton;
import com.abs.weixin.pojo.ComplexButton;
import com.abs.weixin.pojo.Menu;
import com.abs.weixin.pojo.ViewButton;
import com.abs.weixin.utils.WeiXinIFUtil;
import com.abs.weixin.utils.WeixinConst;

/**
 * 菜单管理器类
 * 
 * @author zhangzhi
 * @date 2014-04-09
 */
public class MenuManager {
	private static Logger log = LoggerFactory.getLogger(MenuManager.class);

	public static void main(String[] args) {
		// 第三方用户唯一凭证
		String appId = WeixinConst.APPID;
		// 第三方用户唯一凭证密钥
		String appSecret = WeixinConst.APPSECRET;

		// 调用接口获取access_token
		AccessToken at = WeiXinIFUtil.getAccessToken(appId, appSecret);

		if (null != at) {
			// 调用接口创建菜单
			int result = WeiXinIFUtil.createMenu(getMenu(), at.getToken());

			// 判断菜单创建结果
			if (0 == result)
				log.info("菜单创建成功！");
			else
				log.info("菜单创建失败，错误码：" + result);
		}
	}

	/**
	 * 组装菜单数据
	 * 
	 * @return
	 */
	private static Menu getMenu() {

        ViewButton btn11 = new ViewButton();
        btn11.setName("进入店铺");
        btn11.setType("view");
        btn11.setUrl("http://qbctest.wicp.net/abs_web/app/mobile/page/toWinXinShop?pageCode=1");
        
        ViewButton btn12 = new ViewButton();
        btn12.setName("商品分类");
        btn12.setType("view");
        btn12.setUrl("http://qbctest.wicp.net/abs_web/app/mobile/page/toWinXinShop?pageCode=2");
        
        CommonButton btn21 = new CommonButton();
        btn21.setName("进入店铺");
        btn21.setType("click");
        btn21.setKey("21");
        
        ViewButton btn22 = new ViewButton();
        btn22.setName("进入店铺");
        btn22.setType("view");
        btn22.setUrl("http://qbctest.wicp.net/abs_web");
        
		ComplexButton mainBtn1 = new ComplexButton();
		mainBtn1.setName("微信小店");
		mainBtn1.setSub_button(new Button[] { btn11,btn12 });

		ComplexButton mainBtn2 = new ComplexButton();
		mainBtn2.setName("我的小店");
		mainBtn2.setSub_button(new Button[] { btn22 });


		/**
		 * 这是公众号xiaoqrobot目前的菜单结构，每个一级菜单都有二级菜单项<br>
		 * 
		 * 在某个一级菜单下没有二级菜单的情况，menu该如何定义呢？<br>
		 * 比如，第三个一级菜单项不是“更多体验”，而直接是“幽默笑话”，那么menu应该这样定义：<br>
		 * menu.setButton(new Button[] { mainBtn1, mainBtn2, btn33 });
		 */
		Menu menu = new Menu();
		menu.setButton(new Button[] { mainBtn2 });

		return menu;
	}
}