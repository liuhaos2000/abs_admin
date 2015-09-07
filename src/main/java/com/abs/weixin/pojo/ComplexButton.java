package com.abs.weixin.pojo;

/**
 * ���Ӱ�ť������ť��
 * 
 * @author zhangzhi
 * @date 2014-04-05
 */
public class ComplexButton extends Button {
	private Button[] sub_button;

	public Button[] getSub_button() {
		return sub_button;
	}

	public void setSub_button(Button[] sub_button) {
		this.sub_button = sub_button;
	}
}