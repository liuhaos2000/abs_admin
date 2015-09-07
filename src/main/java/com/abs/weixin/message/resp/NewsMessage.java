package com.abs.weixin.message.resp;

import java.util.List;

import com.abs.weixin.message.base.BaseRespMessage;
import com.abs.weixin.message.model.Article;

/**
 * �ı���Ϣ
 * 
 * @author zhangzhi
 * @date 2014-04-05
 */
public class NewsMessage extends BaseRespMessage {
	// ͼ����Ϣ��������Ϊ10������
	private int ArticleCount;
	// ����ͼ����Ϣ��Ϣ��Ĭ�ϵ�һ��itemΪ��ͼ
	private List<Article> Articles;

	public int getArticleCount() {
		return ArticleCount;
	}

	public void setArticleCount(int articleCount) {
		ArticleCount = articleCount;
	}

	public List<Article> getArticles() {
		return Articles;
	}

	public void setArticles(List<Article> articles) {
		Articles = articles;
	}
}