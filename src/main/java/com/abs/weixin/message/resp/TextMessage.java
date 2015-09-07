package com.abs.weixin.message.resp;

import com.abs.weixin.message.base.BaseRespMessage;

/**
 * �ı���Ϣ
 * 
 * @author zhangzhi
 * @date 2014-04-09
 */
public class TextMessage extends BaseRespMessage {
	// �ظ�����Ϣ����
	private String Content;

	public String getContent() {
		return Content;
	}

	public void setContent(String content) {
		Content = content;
	}
}