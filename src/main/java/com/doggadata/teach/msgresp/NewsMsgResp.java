package com.doggadata.teach.msgresp;

import java.util.List;



public class NewsMsgResp extends BaseMsgResp {
	private int ArticleCount;
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
