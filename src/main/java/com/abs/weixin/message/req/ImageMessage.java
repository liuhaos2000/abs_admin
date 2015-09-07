package com.abs.weixin.message.req;

import com.abs.weixin.message.base.BaseReqMessage;

/**
 * ͼƬ��Ϣ
 * 
 * @author zhangzhi
 * @date 2014-04-05
 */
public class ImageMessage extends BaseReqMessage {
	// ͼƬ����
	private String PicUrl;

	public String getPicUrl() {
		return PicUrl;
	}

	public void setPicUrl(String picUrl) {
		PicUrl = picUrl;
	}
}
