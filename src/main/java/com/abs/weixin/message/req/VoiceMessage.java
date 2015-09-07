package com.abs.weixin.message.req;

import com.abs.weixin.message.base.BaseReqMessage;

/**
 * ��Ƶ��Ϣ
 * 
 * @author zhangzhi
 * @date 2014-04-05
 */
public class VoiceMessage extends BaseReqMessage {
	// ý��ID
	private String MediaId;
	// ������ʽ
	private String Format;

	public String getMediaId() {
		return MediaId;
	}

	public void setMediaId(String mediaId) {
		MediaId = mediaId;
	}

	public String getFormat() {
		return Format;
	}

	public void setFormat(String format) {
		Format = format;
	}
}
