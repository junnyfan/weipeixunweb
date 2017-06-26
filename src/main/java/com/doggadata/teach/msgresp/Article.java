package com.doggadata.teach.msgresp;

/**
 * 微信公众号图文信息返回字符的基础公共类
 * @author chend
 *
 */
public class Article {
	//标题
	private String Title;
	//描述
	private String Description;
	//图片地址
	private String PicUrl;
	//图文信息访问地址
	private String Url;
	
	public String getTitle() {
		return Title;
	}
	public void setTitle(String title) {
		Title = title;
	}
	public String getDescription() {
		return Description == null ? "" : Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	public String getPicUrl() {
		return PicUrl == null ? "" : PicUrl;
	}
	public void setPicUrl(String picUrl) {
		PicUrl = picUrl;
	}
	public String getUrl() {
		return Url == null ? "" : Url;
	}
	public void setUrl(String url) {
		Url = url;
	}


}
