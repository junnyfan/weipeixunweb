package com.doggadata.teach.pojo;

/**
 * 微信token认证实体类
 * @author chend
 *
 */
public class AccessToken {
	private String token;

	private int expiresIn;

	public String getToken() {
		return token;
	}

	public void setToken(String token) {
		this.token = token;
	}

	public int getExpiresIn() {
		return expiresIn;
	}

	public void setExpiresIn(int expiresIn) {
		this.expiresIn = expiresIn;
	}

}
