package com.abs.weixin.message.resp;

import com.abs.weixin.message.base.BaseRespMessage;
import com.abs.weixin.message.model.Music;

/**
 * ������Ϣ
 * 
 * @author zhangzhi
 * @param <Music>
 * @date 2014-04-05
 */
public class MusicMessage extends BaseRespMessage {
	// ����
	private Music Music;

	public Music getMusic() {
		return Music;
	}

	public void setMusic(Music music) {
		Music = music;
	}
}