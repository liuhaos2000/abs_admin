package com.abs.weixin.message.req;

import com.abs.weixin.message.base.BaseReqMessage;


/**
 * �ı���Ϣ
 * @author zhangzhi
 * @date 2014/04/05
 */
public class TextMessage extends BaseReqMessage {
	// ��Ϣ����
	private String Content;

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}
}
