package com.doggadata.teach.msgresp;
/**
 * 微信公众号消息接收的基础公共类
 * @author chend
 *
 */
public class BaseMsgResp {
	//接收者
	private String ToUserName;
	//发送者
	private String FromUserName;
	//创建时间
	private long CreateTime;
	//消息类型，文本、图文、图片、音频、视频
	private String MsgType;
	//private int FuncFlag;

	public String getToUserName() {
		return ToUserName;
	}

	public void setToUserName(String toUserName) {
		ToUserName = toUserName;
	}

	public String getFromUserName() {
		return FromUserName;
	}

	public void setFromUserName(String fromUserName) {
		FromUserName = fromUserName;
	}

	public long getCreateTime() {
		return CreateTime;
	}

	public void setCreateTime(long createTime) {
		CreateTime = createTime;
	}

	public String getMsgType() {
		return MsgType;
	}

	public void setMsgType(String msgType) {
		MsgType = msgType;
	}


}
